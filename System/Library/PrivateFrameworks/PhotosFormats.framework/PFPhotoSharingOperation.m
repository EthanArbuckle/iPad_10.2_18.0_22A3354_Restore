@implementation PFPhotoSharingOperation

- (PFPhotoSharingOperation)initWithImageURL:(id)a3 adjustmentData:(id)a4
{
  id v6;
  id v7;
  PFPhotoSharingOperation *v8;
  PFPhotoSharingOperation *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *externalIsolation;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PFPhotoSharingOperation;
  v8 = -[PFPhotoSharingOperation init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PFPhotoSharingOperation _setImageURL:](v8, "_setImageURL:", v6);
    -[PFPhotoSharingOperation _setAdjustments:](v9, "_setAdjustments:", v7);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.PFPhotoSharingOperation.isolationQueue", v10);
    externalIsolation = v9->_externalIsolation;
    v9->_externalIsolation = (OS_dispatch_queue *)v11;

  }
  return v9;
}

- (void)main
{
  const __CFURL *v3;
  NSObject *externalIsolation;
  CGImageSource *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  const __CFURL *v16;
  const __CFURL *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  char v22;
  NSObject *v23;
  const __CFURL *v24;
  id v25;
  __CFString *v26;
  const __CFURL *v27;
  void *v28;
  const __CFURL *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  const __CFURL *v39;
  const __CFURL *v40;
  CGImage *ImageAtIndex;
  size_t PrimaryImageIndex;
  const __CFURL *v43;
  void *v44;
  int v45;
  CFDictionaryRef v46;
  void *v47;
  CGImageDestinationRef idst;
  CGImageDestination *idsta;
  CGImageSource *isrc;
  _QWORD v51[5];
  id v52;
  const __CFURL *v53;
  char v54;
  _QWORD block[16];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  uint8_t buf[4];
  const __CFURL *v113;
  __int16 v114;
  const __CFURL *v115;
  __int16 v116;
  void *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  -[PFPhotoSharingOperation imageURL](self, "imageURL");
  v3 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v106 = 0;
  v107 = &v106;
  v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__4423;
  v110 = __Block_byref_object_dispose__4424;
  v111 = 0;
  v100 = 0;
  v101 = &v100;
  v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__4423;
  v104 = __Block_byref_object_dispose__4424;
  v105 = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__4423;
  v98 = __Block_byref_object_dispose__4424;
  v99 = 0;
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__4423;
  v92 = __Block_byref_object_dispose__4424;
  v93 = 0;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__4423;
  v86 = __Block_byref_object_dispose__4424;
  v87 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__4423;
  v80 = __Block_byref_object_dispose__4424;
  v81 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PFPhotoSharingOperation_main__block_invoke;
  block[3] = &unk_1E45A2DD0;
  block[4] = self;
  block[5] = &v106;
  block[6] = &v100;
  block[7] = &v94;
  block[8] = &v88;
  block[9] = &v82;
  block[10] = &v76;
  block[11] = &v72;
  block[12] = &v68;
  block[13] = &v64;
  block[14] = &v60;
  block[15] = &v56;
  dispatch_sync(externalIsolation, block);
  if (!v3 || !v107[5] || !v77[5])
  {
    objc_msgSend((id)objc_opt_class(), "operationErrorWithCode:withDescription:", 2, CFSTR("Image URL, filename or output directory is missing. ImageURL: %@, filename: %@, outputDirectory: %@"), v3, v107[5], v77[5]);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_26:
    v20 = (void *)v21;
    v7 = 0;
    v6 = 0;
    v16 = 0;
    v22 = 0;
    goto LABEL_27;
  }
  v5 = CGImageSourceCreateWithURL(v3, 0);
  isrc = v5;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v113 = v3;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFPhotoSharingOperation] Could not create imageSource from image URL: %@", buf, 0xCu);
    }
    objc_msgSend((id)objc_opt_class(), "operationErrorWithCode:withDescription:", 3, CFSTR("Could not create imageSource from image URL: %@"), v3);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  +[PFUniformTypeUtilities typeWithIdentifier:](PFUniformTypeUtilities, "typeWithIdentifier:", CGImageSourceGetType(v5));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v113 = v3;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Could not determine the UTI type for file: %{public}@. Falling back to JPG.", buf, 0xCu);
    }
    v7 = (id)*MEMORY[0x1E0CEC530];
  }
  v8 = objc_opt_class();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend((id)v8, "outputSupportedForTypeIdentifier:", v9);

  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v113 = (const __CFURL *)v7;
      v114 = 2114;
      v115 = v3;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Output to file type: %{public}@ is not supported when performing metadata changes for file: %{public}@. Falling back to JPG.", buf, 0x16u);
    }
    v10 = (id)*MEMORY[0x1E0CEC530];

    v7 = v10;
  }
  -[__CFURL pathExtension](v3, "pathExtension");
  idst = (CGImageDestinationRef)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredFilenameExtension");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v113 = (const __CFURL *)v7;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Could not determine the extension from type: %{public}@.", buf, 0xCu);
    }
    v11 = idst;
  }
  -[__CFString uppercaseString](v11, "uppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("JPEG"));

  if (v13)
  {

    v11 = CFSTR("JPG");
  }
  -[__CFString uppercaseString](v11, "uppercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v107[5], "stringByAppendingPathExtension:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v77[5], "URLByAppendingPathComponent:", v15);
  v16 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v113 = v16;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Output file URL will be %{public}@", buf, 0xCu);
  }
  -[__CFURL path](v16, "path");
  v17 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);

  if (v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v113 = v17;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFPhotoSharingOperation] Output file already exists at path: %{public}@. Aborting photo remaking.", buf, 0xCu);
    }
    objc_msgSend((id)objc_opt_class(), "operationErrorWithCode:withDescription:", 4, CFSTR("Output file already exists at path: %@"), v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  if ((v19 & 1) != 0)
  {
    v22 = 0;
    idsta = 0;
    goto LABEL_100;
  }
  objc_msgSend(v7, "identifier");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  idsta = CGImageDestinationCreateWithURL(v16, v26, 1uLL, 0);

  if (!idsta)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v113 = (const __CFURL *)v7;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFPhotoSharingOperation] Could not create image destination for file type: %{public}@. Aborting photo remaking.", buf, 0xCu);
    }
    objc_msgSend((id)objc_opt_class(), "operationErrorWithCode:withDescription:", 5, CFSTR("Could not create image destination for file type: %@, file URL: %@"), v7, v16);
    v38 = objc_claimAutoreleasedReturnValue();
    v22 = 0;
    idsta = 0;
    goto LABEL_99;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v65 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Stripping location", buf, 2u);
    }
    objc_msgSend(v47, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBC7F0]);
  }
  if (*((_BYTE *)v57 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Converting to SRGB", buf, 2u);
    }
    objc_msgSend(v47, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBC7A0]);
  }
  v45 = *((unsigned __int8 *)v61 + 24);
  if (!*((_BYTE *)v65 + 24))
  {
    v27 = (const __CFURL *)v101[5];
    if (v27)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v113 = v27;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Applying custom location: %{private}@", buf, 0xCu);
        v27 = (const __CFURL *)v101[5];
      }
      +[PFSharingUtilities gpsDictionaryForLocation:](PFSharingUtilities, "gpsDictionaryForLocation:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0CBCD68]);
        objc_msgSend(v47, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBC790]);
      }

    }
  }
  v46 = CGImageSourceCopyPropertiesAtIndex(isrc, 0, 0);
  v29 = (const __CFURL *)v95[5];
  if (v29)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v113 = v29;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Applying custom date: %{private}@", buf, 0xCu);
    }
    v30 = *MEMORY[0x1E0CBCB50];
    -[__CFDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFSharingUtilities addCreationDate:toExifDictionary:](PFSharingUtilities, "addCreationDate:toExifDictionary:", v95[5], v31);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = *MEMORY[0x1E0CBD090];
    -[__CFDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFSharingUtilities addCreationDate:toTIFFDictionary:](PFSharingUtilities, "addCreationDate:toTIFFDictionary:", v95[5], v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "setObject:forKeyedSubscript:", v44, v30);
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v34, v32);
    objc_msgSend(v47, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBC790]);

  }
  if (*((_BYTE *)v73 + 24) || v89[5] || v83[5])
  {
    v35 = *MEMORY[0x1E0CBCED8];
    -[__CFDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCED8]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "mutableCopy");

    if (*((_BYTE *)v73 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Removing Caption from IPTC", buf, 2u);
      }
      objc_msgSend(v37, "removeObjectForKey:", *MEMORY[0x1E0CBCEB8]);
    }
    else
    {
      v39 = (const __CFURL *)v89[5];
      if (v39)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v113 = v39;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Applying Caption \"%{private}@\" to IPTC", buf, 0xCu);
        }
        if (!v37)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v89[5], *MEMORY[0x1E0CBCEB8]);
      }
    }
    if (*((_BYTE *)v69 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Removing Artwork Content Description from IPTC", buf, 2u);
      }
      objc_msgSend(v37, "removeObjectForKey:", *MEMORY[0x1E0CBCEF0]);
    }
    else
    {
      v40 = (const __CFURL *)v83[5];
      if (v40)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v113 = v40;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Applying Artwork Content Descrption \"%{private}@\" to IPTC", buf, 0xCu);
        }
        if (!v37)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v37, "setObject:forKey:", v83[5], *MEMORY[0x1E0CBCEF0]);
      }
    }
    if (v37)
    {
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v37, v35);
      objc_msgSend(v47, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBC790]);
    }

  }
  if (!v45)
  {
    PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(isrc);
    CGImageDestinationAddImageFromSource(idsta, isrc, PrimaryImageIndex, (CFDictionaryRef)v47);
    goto LABEL_87;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(isrc, 0, 0);
  if (ImageAtIndex)
  {
    CGImageDestinationAddImage(idsta, ImageAtIndex, (CFDictionaryRef)v47);
    CGImageRelease(ImageAtIndex);
LABEL_87:
    LODWORD(ImageAtIndex) = 1;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543875;
    v113 = v3;
    v114 = 2114;
    v115 = v16;
    v116 = 2113;
    v117 = v47;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Finalizing image from source URL: %{public}@, Out URL: %{public}@. Applying destination options: %{private}@", buf, 0x20u);
  }
  if ((_DWORD)ImageAtIndex && CGImageDestinationFinalize(idsta))
  {
    v22 = 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFPhotoSharingOperation] Operation complete.", buf, 2u);
    }
    v38 = (uint64_t)v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Source URL: %@ (Source type: %@), output Type: %@, output URL: %@"), v3, v6, v7, v16);
    v43 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543619;
      v113 = v43;
      v114 = 2113;
      v115 = (const __CFURL *)v47;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFPhotoSharingOperation] Unable to finalize image destination. %{public}@. Destination options: %{private}@", buf, 0x16u);
    }
    objc_msgSend((id)objc_opt_class(), "operationErrorWithCode:withDescription:", 6, CFSTR("Unable to finalize image destination. %@"), v43);
    v38 = objc_claimAutoreleasedReturnValue();

    v22 = 0;
  }

  v20 = v47;
LABEL_99:

  v20 = (void *)v38;
LABEL_100:
  CFRelease(isrc);
  if (idsta)
    CFRelease(idsta);
LABEL_27:
  v23 = self->_externalIsolation;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __31__PFPhotoSharingOperation_main__block_invoke_23;
  v51[3] = &unk_1E45A4AF0;
  v54 = v22;
  v51[4] = self;
  v52 = v20;
  v53 = v16;
  v24 = v16;
  v25 = v20;
  dispatch_sync(v23, v51);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v100, 8);

  _Block_object_dispose(&v106, 8);
}

- (NSError)operationError
{
  NSObject *externalIsolation;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4423;
  v10 = __Block_byref_object_dispose__4424;
  v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PFPhotoSharingOperation_operationError__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (float)progress
{
  NSObject *externalIsolation;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PFPhotoSharingOperation_progress__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  if (*((_BYTE *)v7 + 24))
    v3 = 1.0;
  else
    v3 = 0.0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)success
{
  NSObject *externalIsolation;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PFPhotoSharingOperation_success__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setOutputDirectoryURL:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PFPhotoSharingOperation_setOutputDirectoryURL___block_invoke;
  block[3] = &unk_1E45A4B40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (NSURL)outputDirectoryURL
{
  NSObject *externalIsolation;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4423;
  v10 = __Block_byref_object_dispose__4424;
  v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PFPhotoSharingOperation_outputDirectoryURL__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

- (void)setOutputFilename:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PFPhotoSharingOperation_setOutputFilename___block_invoke;
  block[3] = &unk_1E45A4B40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (NSString)outputFilename
{
  NSObject *externalIsolation;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4423;
  v10 = __Block_byref_object_dispose__4424;
  v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PFPhotoSharingOperation_outputFilename__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)setCustomLocation:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PFPhotoSharingOperation_setCustomLocation___block_invoke;
  block[3] = &unk_1E45A4B40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (CLLocation)customLocation
{
  NSObject *externalIsolation;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4423;
  v10 = __Block_byref_object_dispose__4424;
  v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PFPhotoSharingOperation_customLocation__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CLLocation *)v3;
}

- (void)setCustomCaption:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PFPhotoSharingOperation_setCustomCaption___block_invoke;
  block[3] = &unk_1E45A4B40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (NSString)customCaption
{
  NSObject *externalIsolation;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4423;
  v10 = __Block_byref_object_dispose__4424;
  v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PFPhotoSharingOperation_customCaption__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)setCustomAccessibilityLabel:(id)a3
{
  id v4;
  NSObject *externalIsolation;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PFPhotoSharingOperation_setCustomAccessibilityLabel___block_invoke;
  block[3] = &unk_1E45A4B40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(externalIsolation, block);

}

- (NSString)customAccessibilityLabel
{
  NSObject *externalIsolation;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4423;
  v10 = __Block_byref_object_dispose__4424;
  v11 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PFPhotoSharingOperation_customAccessibilityLabel__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)setShouldStripCaption:(BOOL)a3
{
  NSObject *externalIsolation;
  _QWORD v4[5];
  BOOL v5;

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PFPhotoSharingOperation_setShouldStripCaption___block_invoke;
  v4[3] = &unk_1E45A4B18;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

- (BOOL)shouldStripCaption
{
  NSObject *externalIsolation;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PFPhotoSharingOperation_shouldStripCaption__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setShouldStripAccessibilityDescription:(BOOL)a3
{
  NSObject *externalIsolation;
  _QWORD v4[5];
  BOOL v5;

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PFPhotoSharingOperation_setShouldStripAccessibilityDescription___block_invoke;
  v4[3] = &unk_1E45A4B18;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

- (BOOL)shouldStripAccessibilityDescription
{
  NSObject *externalIsolation;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__PFPhotoSharingOperation_shouldStripAccessibilityDescription__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setShouldStripLocation:(BOOL)a3
{
  NSObject *externalIsolation;
  _QWORD v4[5];
  BOOL v5;

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PFPhotoSharingOperation_setShouldStripLocation___block_invoke;
  v4[3] = &unk_1E45A4B18;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

- (BOOL)shouldStripLocation
{
  NSObject *externalIsolation;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PFPhotoSharingOperation_shouldStripLocation__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setShouldConvertToSRGB:(BOOL)a3
{
  NSObject *externalIsolation;
  _QWORD v4[5];
  BOOL v5;

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PFPhotoSharingOperation_setShouldConvertToSRGB___block_invoke;
  v4[3] = &unk_1E45A4B18;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(externalIsolation, v4);
}

- (BOOL)shouldConvertToSRGB
{
  NSObject *externalIsolation;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  externalIsolation = self->_externalIsolation;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PFPhotoSharingOperation_shouldConvertToSRGB__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalIsolation, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDate)customDate
{
  return self->_customDate;
}

- (void)setCustomDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)shouldStripMetadata
{
  return self->_shouldStripMetadata;
}

- (void)setShouldStripMetadata:(BOOL)a3
{
  self->_shouldStripMetadata = a3;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)_setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSURL)resultingFileURL
{
  return self->_resultingFileURL;
}

- (PFAssetAdjustments)_adjustments
{
  return self->__adjustments;
}

- (void)_setAdjustments:(id)a3
{
  objc_storeStrong((id *)&self->__adjustments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__adjustments, 0);
  objc_storeStrong((id *)&self->_resultingFileURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_customAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_customCaption, 0);
  objc_storeStrong((id *)&self->_customDate, 0);
  objc_storeStrong((id *)&self->_customLocation, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_externalIsolation, 0);
}

uint64_t __46__PFPhotoSharingOperation_shouldConvertToSRGB__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 269);
  return result;
}

uint64_t __50__PFPhotoSharingOperation_setShouldConvertToSRGB___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 269) != v2)
    *(_BYTE *)(v1 + 269) = v2;
  return result;
}

uint64_t __46__PFPhotoSharingOperation_shouldStripLocation__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 266);
  return result;
}

uint64_t __50__PFPhotoSharingOperation_setShouldStripLocation___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 266) != v2)
    *(_BYTE *)(v1 + 266) = v2;
  return result;
}

uint64_t __62__PFPhotoSharingOperation_shouldStripAccessibilityDescription__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 268);
  return result;
}

uint64_t __66__PFPhotoSharingOperation_setShouldStripAccessibilityDescription___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 268) != v2)
    *(_BYTE *)(v1 + 268) = v2;
  return result;
}

uint64_t __45__PFPhotoSharingOperation_shouldStripCaption__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 267);
  return result;
}

uint64_t __49__PFPhotoSharingOperation_setShouldStripCaption___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 267) != v2)
    *(_BYTE *)(v1 + 267) = v2;
  return result;
}

void __51__PFPhotoSharingOperation_customAccessibilityLabel__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 312));
}

void __55__PFPhotoSharingOperation_setCustomAccessibilityLabel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 312);
    *(_QWORD *)(v3 + 312) = v2;

  }
}

void __40__PFPhotoSharingOperation_customCaption__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 304));
}

void __44__PFPhotoSharingOperation_setCustomCaption___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 304);
    *(_QWORD *)(v3 + 304) = v2;

  }
}

void __41__PFPhotoSharingOperation_customLocation__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 288));
}

void __45__PFPhotoSharingOperation_setCustomLocation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 288);
    *(_QWORD *)(v3 + 288) = v2;

  }
}

void __41__PFPhotoSharingOperation_outputFilename__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 280));
}

void __45__PFPhotoSharingOperation_setOutputFilename___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  if (v3 != v2 && (objc_msgSend(v3, "isEqualToString:") & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 280);
    *(_QWORD *)(v5 + 280) = v4;

  }
}

void __45__PFPhotoSharingOperation_outputDirectoryURL__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 272));
}

void __49__PFPhotoSharingOperation_setOutputDirectoryURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 272);
    *(_QWORD *)(v5 + 272) = v4;

  }
}

uint64_t __34__PFPhotoSharingOperation_success__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 265);
  return result;
}

uint64_t __35__PFPhotoSharingOperation_progress__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 264);
  return result;
}

void __41__PFPhotoSharingOperation_operationError__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 256));
}

void __31__PFPhotoSharingOperation_main__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v2 = objc_msgSend(*(id *)(a1[4] + 280), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(a1[4] + 288), "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_msgSend(*(id *)(a1[4] + 296), "copy");
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = objc_msgSend(*(id *)(a1[4] + 304), "copy");
  v12 = *(_QWORD *)(a1[8] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = objc_msgSend(*(id *)(a1[4] + 312), "copy");
  v15 = *(_QWORD *)(a1[9] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  v17 = objc_msgSend(*(id *)(a1[4] + 272), "copy");
  v18 = *(_QWORD *)(a1[10] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = *(_BYTE *)(a1[4] + 267);
  *(_BYTE *)(*(_QWORD *)(a1[12] + 8) + 24) = *(_BYTE *)(a1[4] + 268);
  *(_BYTE *)(*(_QWORD *)(a1[13] + 8) + 24) = *(_BYTE *)(a1[4] + 266);
  *(_BYTE *)(*(_QWORD *)(a1[14] + 8) + 24) = *(_BYTE *)(a1[4] + 270);
  *(_BYTE *)(*(_QWORD *)(a1[15] + 8) + 24) = *(_BYTE *)(a1[4] + 269);
}

void __31__PFPhotoSharingOperation_main__block_invoke_23(uint64_t a1)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 265) = *(_BYTE *)(a1 + 56);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 256), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 265))
    objc_storeStrong((id *)(v2 + 328), *(id *)(a1 + 48));
}

+ (BOOL)outputSupportedForTypeIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = outputSupportedForTypeIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&outputSupportedForTypeIdentifier__onceToken, &__block_literal_global_4471);
  v5 = objc_msgSend((id)outputSupportedForTypeIdentifier__supportedImageDestinationTypeIdentifiers, "containsObject:", v4);

  return v5;
}

+ (id)operationErrorWithCode:(int64_t)a3 withDescription:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  if (a4)
  {
    v5 = (objc_class *)MEMORY[0x1E0CB3940];
    v6 = a4;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, &v11);

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFPhotoSharingOperationErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __60__PFPhotoSharingOperation_outputSupportedForTypeIdentifier___block_invoke()
{
  CFArrayRef v0;
  void *v1;

  v0 = CGImageDestinationCopyTypeIdentifiers();
  v1 = (void *)outputSupportedForTypeIdentifier__supportedImageDestinationTypeIdentifiers;
  outputSupportedForTypeIdentifier__supportedImageDestinationTypeIdentifiers = (uint64_t)v0;

}

@end
