@implementation DCIMImageWriter

- (BOOL)saveImageJobToDisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int16 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  const __CFData *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  CGImageSource *v29;
  CGImageSource *v30;
  CGImage *ImageAtIndex;
  uint64_t v32;
  void *v33;
  const __CFDictionary *v34;
  CGImageSourceRef v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFData *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  char v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFData *v72;
  void *v73;
  void *v74;
  DCIMImageWriter *v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const __CFDictionary *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint8_t buf[4];
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("AssetPathFromType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = self;
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AssetPathFromType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    -[DCIMImageWriter _cameraAssetExtensionForType:](self, "_cameraAssetExtensionForType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("PhotoDestinationPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "pathExtension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("DestinationAssetUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCIMImageWriter uniqueIncomingPathForAssetWithUUID:andExtension:isPhotoStream:](DCIMImageWriter, "uniqueIncomingPathForAssetWithUUID:andExtension:isPhotoStream:", v11, v8, 0);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v101 = incomingDirectoryPath_homeDirectory;
      _os_log_impl(&dword_199DF7000, v14, OS_LOG_TYPE_ERROR, "saveImageJobToDisk incomingDirectoryPath_homeDirectory %@", buf, 0xCu);
    }

    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v101 = incomingDirectoryPath;
      _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_ERROR, "saveImageJobToDisk incomingDirectoryPath %@", buf, 0xCu);
    }

    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("DestinationAssetUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v101 = (uint64_t)v17;
      _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_ERROR, "saveImageJobToDisk [job objectForKey:kPLImageWriterDestinationAssetUUID] %@", buf, 0xCu);

    }
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v101 = (uint64_t)v8;
      _os_log_impl(&dword_199DF7000, v18, OS_LOG_TYPE_ERROR, "saveImageJobToDisk extension %@", buf, 0xCu);
    }

    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v101 = v12;
      _os_log_impl(&dword_199DF7000, v19, OS_LOG_TYPE_ERROR, "saveImageJobToDisk photoFilePath %@", buf, 0xCu);
    }

    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v101 = (uint64_t)v86;
      _os_log_impl(&dword_199DF7000, v20, OS_LOG_TYPE_ERROR, "saveImageJobToDisk photoFileURL %@", buf, 0xCu);
    }

  }
  v21 = +[PLValidatedSavedAssetType maskForPhotoBoothAsset](PLValidatedSavedAssetType, "maskForPhotoBoothAsset");
  objc_msgSend(v4, "objectForKey:", CFSTR("kPLImageWriterSavedAssetTypeKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = PLValidatedSavedAssetTypeApplies(v21, (__int16)objc_msgSend(v22, "integerValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("EXIFProperties"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = *MEMORY[0x1E0CBCF70];
  objc_msgSend(v23, "objectForKeyedSubscript:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = *MEMORY[0x1E0C89C78];
  objc_msgSend(v80, "objectForKey:");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ImageData"));
  v24 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ImageOrientation"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", PLImageOrientationFromImageProperties(v23));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
  }
  v89 = v4;
  v27 = objc_msgSend(v4, "objectForKey:", CFSTR("PreviewImageRef"));
  v93 = 0;
  if (v27 && v25)
  {
    -[objc_class imageWithCGImage:scale:orientation:](NSClassFromString((NSString *)CFSTR("UIImage")), "imageWithCGImage:scale:orientation:", v27, 0, 1.0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v92 = 0;
  if (v24 && v25)
  {
    v28 = (int)objc_msgSend(v25, "intValue");
    v29 = CGImageSourceCreateWithData(v24, 0);
    if (v29)
    {
      v30 = v29;
      if (CGImageSourceGetCount(v29))
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v30, 0, 0);
      else
        ImageAtIndex = 0;
      CFRelease(v30);
    }
    else
    {
      ImageAtIndex = 0;
    }
    -[objc_class imageWithCGImage:scale:orientation:](NSClassFromString((NSString *)CFSTR("UIImage")), "imageWithCGImage:scale:orientation:", ImageAtIndex, v28, 1.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(ImageAtIndex);
  }
  v90 = v23;
  buf[0] = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Type"));
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
  {
    v98 = *MEMORY[0x1E0CBD2A8];
    v99 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
    v34 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
  v82 = v34;
  v35 = CGImageSourceCreateWithData(v24, v34);
  v96 = 0;
  v97 = 0;
  v94 = 0;
  v95 = 0;
  +[DCIMImageWriter writeableDataForImage:previewImage:imageData:imageUTIType:imageSource:exifProperties:imageOrientation:thumbnailDataOut:imageUTITypeOut:exifPropertiesOut:isJPEGOut:imageDataOut:](DCIMImageWriter, "writeableDataForImage:previewImage:imageData:imageUTIType:imageSource:exifProperties:imageOrientation:thumbnailDataOut:imageUTITypeOut:exifPropertiesOut:isJPEGOut:imageDataOut:", v92, v93, v24, v33, v35, v23, (int)objc_msgSend(v25, "intValue"), &v97, &v96, &v95, buf, &v94);
  v84 = v97;
  v91 = v96;
  v88 = v95;
  v36 = v94;
  if (v35)
    CFRelease(v35);
  v83 = (void *)v12;
  v81 = v25;
  if (objc_msgSend(v36, "length") && v91)
  {
    if (buf[0])
    {
      if (v77)
      {
        v37 = v88;
        v38 = (void *)MEMORY[0x19AEC2E4C]();
        v39 = (void *)objc_msgSend(v37, "mutableCopy");
        if (!v39)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v88 = v39;
        objc_msgSend(v39, "objectForKey:", CFSTR("{IPTC}"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v40, "mutableCopy");

        if (!v41)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "setObject:forKey:", v41, CFSTR("{IPTC}"));
        }
        objc_msgSend(v41, "objectForKey:", CFSTR("Keywords"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v42, "mutableCopy");

        if (!v43)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKey:", v43, CFSTR("Keywords"));
        }
        v44 = v8;
        if ((objc_msgSend(v43, "containsObject:", CFSTR("Photo Booth")) & 1) == 0)
          objc_msgSend(v43, "addObject:", CFSTR("Photo Booth"));

        objc_autoreleasePoolPop(v38);
      }
      else
      {
        v44 = v8;
      }
      v54 = v86;
      -[DCIMImageWriter _writeJPEGToURL:withData:thumbnail:properties:duringBurst:](v76, "_writeJPEGToURL:withData:thumbnail:properties:duringBurst:", v86, v36, v84);
    }
    else
    {
      +[DCIMImageWriter preferredFileExtensionForType:](DCIMImageWriter, "preferredFileExtensionForType:", v91);
      v56 = objc_claimAutoreleasedReturnValue();

      v54 = v86;
      objc_msgSend(v86, "pathExtension");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "isEqualToString:", v56);

      if ((v58 & 1) == 0)
      {
        objc_msgSend(v86, "URLByDeletingPathExtension");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "URLByAppendingPathExtension:", v56);
        v60 = objc_claimAutoreleasedReturnValue();

        v54 = (void *)v60;
      }
      objc_msgSend(v36, "writeToURL:atomically:", v54, 0);
      v44 = (void *)v56;
    }
    +[PLFileSystemPersistence filesystemPersistenceBatchItemForFileAtURL:](PLFileSystemPersistence, "filesystemPersistenceBatchItemForFileAtURL:", v54);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v89;
    if (v45)
    {
      objc_msgSend(v89, "objectForKey:", CFSTR("AssetWriterID"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        objc_msgSend(v89, "objectForKey:", CFSTR("AssetWriterID"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setString:forKey:", v62, CFSTR("com.apple.assetsd.creatorBundleID"));

      }
      objc_msgSend(v89, "objectForKey:", CFSTR("AssetWriterDisplayName"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v63)
      {
        objc_msgSend(v89, "objectForKey:", CFSTR("AssetWriterDisplayName"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setString:forKey:", v64, CFSTR("com.apple.assetsd.importedByDisplayName"));

      }
      objc_msgSend(v89, "objectForKey:", CFSTR("OriginalAssetUUID"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (v65)
      {
        objc_msgSend(v89, "objectForKey:", CFSTR("OriginalAssetUUID"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setUUIDString:forKey:", v66, CFSTR("com.apple.assetsd.originalAssetUUID"));

      }
      v67 = v44;
      objc_msgSend(v90, "objectForKeyedSubscript:", v79);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKey:", v78);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
        objc_msgSend(v45, "setUUIDString:forKey:", v69, CFSTR("com.apple.assetsd.avalanche.UUID"));
      objc_msgSend(v89, "objectForKey:", CFSTR("kPLImageWriterCameraAdjustmentData"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
        objc_msgSend(v45, "setData:forKey:", v70, CFSTR("com.apple.assetsd.inProgress.cameraAdjustmentsData"));
      objc_msgSend(v45, "persist");

      v44 = v67;
    }
    v87 = v36;
    v71 = v33;
    v72 = v24;
    objc_msgSend(v89, "objectForKey:", CFSTR("Date"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
      objc_msgSend(v54, "setResourceValue:forKey:error:", v50, *MEMORY[0x1E0C998E8], 0);
    objc_msgSend(v89, "objectForKey:", CFSTR("callStack"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
      NSLog((NSString *)CFSTR("##### SAVE to %@, uti %@, extension %@"), v54, v91, v44);
    v8 = v44;
    objc_msgSend(v54, "path");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setObject:forKey:", v74, CFSTR("PhotoSourcePath"));

    objc_msgSend(v89, "setObject:forKey:", v91, CFSTR("Type"));
    v55 = v88;
    if (v88)
      objc_msgSend(v89, "setObject:forKey:", v88, CFSTR("EXIFProperties"));
    v52 = v80;
    v53 = v72;
    v33 = v71;
    v36 = v87;
  }
  else
  {
    PLServicesLocalizedFrameworkString(CFSTR("ENCODING_FAILED"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (objc_class *)MEMORY[0x1E0C99D80];
    v47 = v89;
    v48 = v89;
    v49 = [v46 alloc];
    v50 = (void *)objc_msgSend(v49, "initWithObjectsAndKeys:", v45, *MEMORY[0x1E0CB2D50], 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos"), 12, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setObject:forKey:", v51, CFSTR("DCIMWriter Error"));

    v52 = v80;
    v53 = v24;
    v54 = v86;
    v55 = v88;
  }

  return 1;
}

- (id)_cameraAssetExtensionForType:(signed __int16)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_1E3768458[(unsigned __int16)a3];
}

- (BOOL)writeJPEGToURL:(id)a3 withData:(id)a4 thumbnail:(id)a5 properties:(id)a6
{
  return -[DCIMImageWriter _writeJPEGToURL:withData:thumbnail:properties:duringBurst:](self, "_writeJPEGToURL:withData:thumbnail:properties:duringBurst:", a3, a4, a5, a6, 0);
}

- (BOOL)_writeJPEGToURL:(id)a3 withData:(id)a4 thumbnail:(id)a5 properties:(id)a6 duringBurst:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  __CFWriteStream *v14;
  __CFWriteStream *v15;
  const __CFData *v16;
  const __CFData *v17;
  char v18;
  UInt8 buffer[4];
  CFRange v21;

  v7 = a7;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = CFWriteStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFURLRef)a3);
  if (v14)
  {
    v15 = v14;
    if (CFWriteStreamOpen(v14))
    {
      v16 = (const __CFData *)CFWriteStreamCopyProperty(v15, CFSTR("_kCFStreamPropertyFileNativeHandle"));
      if (v16)
      {
        v17 = v16;
        *(_DWORD *)buffer = 0;
        v21.location = 0;
        v21.length = 4;
        CFDataGetBytes(v16, v21, buffer);
        fcntl(*(int *)buffer, 48, 1);
        fcntl(*(int *)buffer, 62, 1);
        if (v7)
          fcntl(*(int *)buffer, 82, 1);
        CFRelease(v17);
      }
      v18 = CGImageWriteEXIFJPEGWithMetadata();
      CFWriteStreamClose(v15);
    }
    else
    {
      v18 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int)copyPrimaryFormatImageData:(id)a3 toURL:(id)a4 properties:(id)a5
{
  return PFFigCopyImageDataWithProperties();
}

+ (id)sharedDCIMWriter
{
  pl_dispatch_once(&sharedDCIMWriter_onceToken, &__block_literal_global_81);
  return (id)sharedDCIMWriter_sharedDCIMWriter;
}

+ (void)writeableDataForImageData:(id)a3 imageUTIType:(id)a4 imageSource:(CGImageSource *)a5 thumbnailDataOut:(id *)a6 imageUTITypeOut:(id *)a7 exifPropertiesOut:(id *)a8 imageDataOut:(id *)a9
{
  objc_msgSend(a1, "writeableDataForImage:previewImage:imageData:imageUTIType:imageSource:exifProperties:imageOrientation:thumbnailDataOut:imageUTITypeOut:exifPropertiesOut:isJPEGOut:imageDataOut:", 0, 0, a3, a4, a5, 0, 0, a6, a7, a8, 0, a9);
}

+ (void)writeableDataForImage:(id)a3 previewImage:(id)a4 imageData:(id)a5 imageUTIType:(id)a6 imageSource:(CGImageSource *)a7 exifProperties:(id)a8 imageOrientation:(int64_t)a9 thumbnailDataOut:(id *)a10 imageUTITypeOut:(id *)a11 exifPropertiesOut:(id *)a12 isJPEGOut:(BOOL *)a13 imageDataOut:(id *)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  CGImage *ImageAtIndex;
  BOOL v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id *v32;
  void *v33;
  int v34;
  id v35;
  _BOOL4 v36;
  int v37;
  id v38;
  const __CFDictionary *v39;
  const __CFDictionary *v40;
  id v41;
  void *v42;
  const __CFNumber *Value;
  const __CFNumber *v44;
  void *v45;
  void *v46;
  void *v47;
  int64_t v48;
  void *v49;
  uint64_t v50;
  int v51;
  int v52;
  double v53;
  double v54;
  int v55;
  float v56;
  int v57;
  void *v58;
  void *v59;
  const __CFDictionary *v60;
  const __CFData *v61;
  CGImageSource *v62;
  CGImageSource *v63;
  CGImageRef ImageByRemovingBlackBarsFromPreviewImage;
  CGImage *v65;
  void *v66;
  __CFData *v67;
  __CFString *v68;
  CGImageDestination *v69;
  __CFData *v70;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  _BOOL4 v80;
  int v81;
  const __CFDictionary *v82;
  id v83;
  void *v84;
  int v85;
  unsigned int v86;
  char v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t valuePtr;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a8;
  if (v20)
    v24 = v20;
  else
    v24 = v19;
  ImageAtIndex = (CGImage *)objc_msgSend(objc_retainAutorelease(v24), "CGImage");
  valuePtr = 0;
  if (v19)
    v26 = 1;
  else
    v26 = v21 == 0;
  v27 = !v26;
  v89 = v19;
  if (v26)
  {
    if (!v19)
    {
      v28 = 1;
      goto LABEL_22;
    }
    v30 = objc_msgSend(v19, "imageOrientation");
    if ((unint64_t)(v30 - 1) > 2)
    {
      v28 = 3;
      if (v22)
        goto LABEL_22;
    }
    else
    {
      v28 = dword_199EB0814[v30 - 1];
      if (v22)
        goto LABEL_22;
    }
    CGImageGetUTType((CGImageRef)objc_msgSend(objc_retainAutorelease(v19), "CGImage"));
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 1;
    if (v22 || !a7)
      goto LABEL_22;
    CGImageSourceGetType(a7);
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (id)v29;
LABEL_22:
  v86 = v28;
  v90 = v21;
  v88 = v22;
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id *)MEMORY[0x1E0CEC530];
  if (v31)
  {
    v33 = v31;
    v34 = objc_msgSend(v31, "isEqual:", *MEMORY[0x1E0CEC570]);
    v35 = *v32;
  }
  else
  {
    v35 = (id)*MEMORY[0x1E0CEC530];
    v34 = 0;
    v33 = v35;
  }
  v87 = objc_msgSend(v33, "isEqual:", v35);
  v36 = 0;
  if (ImageAtIndex)
    v37 = 0;
  else
    v37 = v27;
  if (!a7 || !v37)
  {
    v49 = v90;
    goto LABEL_68;
  }
  v38 = objc_alloc(MEMORY[0x1E0C99D80]);
  v39 = (const __CFDictionary *)objc_msgSend(v38, "initWithObjectsAndKeys:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CBD140], 0);
  v40 = CGImageSourceCopyPropertiesAtIndex(a7, 0, v39);
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v42 = v41;
  if (v40)
  {
    v82 = v39;
    v83 = v41;
    Value = (const __CFNumber *)CFDictionaryGetValue(v40, (const void *)*MEMORY[0x1E0CBD048]);
    v44 = (const __CFNumber *)CFDictionaryGetValue(v40, (const void *)*MEMORY[0x1E0CBD040]);
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v40);
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0CBCB50]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKey:", *MEMORY[0x1E0CBD1D8]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v46, "intValue");

    objc_msgSend(v45, "objectForKey:", *MEMORY[0x1E0CBD1E0]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v47, "intValue");

    if (Value && v44)
    {
      CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
      CFNumberGetValue(v44, kCFNumberIntType, &valuePtr);
    }
    pl_dispatch_once(&PLPhysicalDeviceIsIPad___onceToken, &__block_literal_global);
    if (PLPhysicalDeviceIsIPad___isIPad)
      v48 = +[PLAssetFormatsCore wildcatStackFormat](PLAssetFormatsCore, "wildcatStackFormat");
    else
      v48 = 3039;
    v52 = valuePtr;
    v51 = HIDWORD(valuePtr);
    +[PLAssetFormatsCore sizeForFormat:](PLAssetFormatsCore, "sizeForFormat:", v48);
    if (v52 <= v51)
      v55 = v51;
    else
      v55 = v52;
    if (v53 < v54)
      v53 = v54;
    v56 = floor(log2((double)(int)((double)v55 / v53)));
    v57 = (int)exp2f(v56);
    if (v57 >= 32)
      v57 = 32;
    if (v57 <= 1)
      v50 = 1;
    else
      v50 = v57;
    CFRelease(v40);

    v39 = v82;
    v42 = v83;
    LODWORD(v40) = v81;
    if (v34)
      goto LABEL_53;
  }
  else
  {
    v85 = 0;
    v50 = 1;
    if (v34)
    {
LABEL_53:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 72);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setObject:forKey:", v58, *MEMORY[0x1E0CBD1F8]);

    }
  }
  if ((_DWORD)v50 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v50);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKey:", v59, *MEMORY[0x1E0CBD290]);

  }
  v49 = v90;
  if (!a14 && (int)v40 >= 1 && v85 >= 1)
  {
    pl_dispatch_once(&PLPhysicalDeviceIsIPad___onceToken, &__block_literal_global);
    if (!PLPhysicalDeviceIsIPad___isIPad)
    {
      v84 = v42;
      v60 = v39;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v90), "bytes") + v40, v85, 0);
      v61 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v62 = CGImageSourceCreateWithData(v61, 0);
      if (v62)
      {
        v63 = v62;
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v62, 0, 0);
        CFRelease(v63);
        if (ImageAtIndex)
        {
          ImageByRemovingBlackBarsFromPreviewImage = createImageByRemovingBlackBarsFromPreviewImage(ImageAtIndex, SHIDWORD(valuePtr), valuePtr);
          if (ImageByRemovingBlackBarsFromPreviewImage)
          {
            v65 = ImageByRemovingBlackBarsFromPreviewImage;
            CGImageRelease(ImageAtIndex);
            ImageAtIndex = v65;
          }

          v39 = v60;
          v66 = v84;
          goto LABEL_67;
        }
      }

      v39 = v60;
      v42 = v84;
    }
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a7, 0, (CFDictionaryRef)v42);
  v66 = v42;
LABEL_67:
  v36 = ImageAtIndex != 0;

LABEL_68:
  if (a14)
  {
    if (v49)
    {
      v67 = v49;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v67 = (__CFData *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "identifier");
      v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v69 = CGImageDestinationCreateWithData(v67, v68, 1uLL, 0);

      if (v69)
      {
        CGImageDestinationAddImage(v69, ImageAtIndex, 0);
        if (!CGImageDestinationFinalize(v69))
        {

          v67 = 0;
        }
        CFRelease(v69);
      }
    }
    v70 = objc_retainAutorelease(v67);
    *a14 = v70;

  }
  if (!v23)
  {
    v71 = objc_alloc(MEMORY[0x1E0CB37E8]);
    if (v86 - 2 > 2)
      v72 = 6;
    else
      v72 = dword_199EB083C[v86 - 2];
    v73 = (void *)objc_msgSend(v71, "initWithInt:", v72);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    PLAddTIFFDPIPropertiesToDictionary(v74);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v73, *MEMORY[0x1E0CBCFF0], v74, *MEMORY[0x1E0CBD090], 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a10)
  {
    v75 = (uint64_t)ImageAtIndex;
    if (!v36)
    {
      v76 = v20;
      if (!v20)
        v76 = v89;
      v75 = objc_msgSend(objc_retainAutorelease(v76), "CGImage");
    }
    if ((unint64_t)(a9 - 1) > 6)
      v77 = 0;
    else
      v77 = qword_199EB0928[a9 - 1];
    v78 = (void *)objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("UIImage"))), "initWithCGImage:scale:orientation:", v75, v77, 1.0);
    v79 = PLCreateImageWithFormatFromImage(v78, 0, 3039, 0, 0);
    *a10 = (id)DCIM_newJPEGRepresentationWithPLImage(v79, 0.899999976);

  }
  if (a11)
  {
    objc_msgSend(v33, "identifier");
    *a11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a12)
    *a12 = objc_retainAutorelease(v23);
  if (a13)
    *a13 = v87;
  if (ImageAtIndex)
    v80 = v36;
  else
    v80 = 0;
  if (v80)
    CFAutorelease(ImageAtIndex);

}

+ (signed)savedAssetTypeForCameraCapturedAsset
{
  return +[PLValidatedSavedAssetType savedAssetTypeForCameraAsset](PLValidatedSavedAssetType, "savedAssetTypeForCameraAsset");
}

+ (signed)savedAssetTypeForPhotoBoothAsset
{
  return +[PLValidatedSavedAssetType savedAssetTypeForPhotoBoothAsset](PLValidatedSavedAssetType, "savedAssetTypeForPhotoBoothAsset");
}

+ (id)incomingDirectoryPath
{
  pl_dispatch_once(&incomingDirectoryPath_onceToken, &__block_literal_global_20);
  return (id)incomingDirectoryPath;
}

+ (id)incomingDirectoryPathForPhotoStream
{
  void *v2;

  pl_dispatch_once(&incomingDirectoryPathForPhotoStream_onceToken, &__block_literal_global_24);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", incomingDirectoryPathForPhotoStream_incomingDirectory, 1, 0, 0);

  return (id)incomingDirectoryPathForPhotoStream_incomingDirectory;
}

+ (id)uniqueIncomingPathForAssetWithUUID:(id)a3 andExtension:(id)a4 isPhotoStream:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    +[PLUUIDString string](PLUUIDString, "string");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  if (a5)
    +[DCIMImageWriter incomingDirectoryPathForPhotoStream](DCIMImageWriter, "incomingDirectoryPathForPhotoStream");
  else
    +[DCIMImageWriter incomingDirectoryPath](DCIMImageWriter, "incomingDirectoryPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.f%@%@"), CFAbsoluteTimeGetCurrent() * 100.0, CFSTR("__"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v12, "stringByAppendingPathExtension:", v8);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }

  return v12;
}

+ (id)filteredVideoPathForRecordedLivePhotoVideoPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("FILTERED"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)recordedVideoPathForFilteredLivePhotoVideoPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(a1, "isLivePhotoFilteredVideoPath:", v4))
  {
    objc_msgSend(v4, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByAppendingPathExtension:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isLivePhotoFilteredVideoPath:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("FILTERED"));
  return (char)v3;
}

+ (id)preferredFileExtensionForType:(id)a3
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEC600]) & 1) != 0)
  {
    v4 = CFSTR("TIF");
  }
  else if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEC580]) & 1) != 0)
  {
    v4 = CFSTR("PNG");
  }
  else if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEC4F8]) & 1) != 0)
  {
    v4 = CFSTR("GIF");
  }
  else if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEC530]) & 1) != 0)
  {
    v4 = CFSTR("JPG");
  }
  else
  {
    objc_msgSend(v3, "preferredFilenameExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "uppercaseString");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = CFSTR("JPG");
    }

  }
  return v4;
}

+ (id)defaultFileExtensionForAssetType:(signed __int16)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_1E3768440[(unsigned __int16)a3];
}

void __54__DCIMImageWriter_incomingDirectoryPathForPhotoStream__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  NSHomeDirectory();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Media/PhotoStreamsData/.MISC/Incoming"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)incomingDirectoryPathForPhotoStream_incomingDirectory;
  incomingDirectoryPathForPhotoStream_incomingDirectory = v1;

}

void __40__DCIMImageWriter_incomingDirectoryPath__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  NSHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)incomingDirectoryPath_homeDirectory;
  incomingDirectoryPath_homeDirectory = v1;

  objc_msgSend((id)incomingDirectoryPath_homeDirectory, "stringByAppendingPathComponent:", CFSTR("Media/DCIM/.MISC/Incoming"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)incomingDirectoryPath;
  incomingDirectoryPath = v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", incomingDirectoryPath);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", incomingDirectoryPath, 1, 0, 0);

  }
}

void __35__DCIMImageWriter_sharedDCIMWriter__block_invoke()
{
  DCIMImageWriter *v0;
  void *v1;

  v0 = objc_alloc_init(DCIMImageWriter);
  v1 = (void *)sharedDCIMWriter_sharedDCIMWriter;
  sharedDCIMWriter_sharedDCIMWriter = (uint64_t)v0;

}

@end
