@implementation PFVideoComplement

- (PFVideoComplement)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ not supported for %@: use initWithPropertyList: or initWithBundleAtURL:"), v5, objc_opt_class());

  return 0;
}

- (PFVideoComplement)initWithPropertyList:(id)a3
{
  id v4;
  PFVideoComplement *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *imagePath;
  void *v20;
  uint64_t v21;
  NSString *videoPath;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PFVideoComplement;
  v5 = -[PFVideoComplement init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PFVideoComplementMetadataKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PFVideoComplementMetadataVersionKey"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v7 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PFVideoComplementMetadataPairidIdentifierKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v8 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PFVideoComplementMetadataTimingInfoKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
      v8 = 0;
      v7 = 0;
    }
    v10 = CFSTR("1");
    if (v7)
      v10 = v7;
    v11 = v10;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = (id)objc_msgSend(v6, "mutableCopy");
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v12;
    v14 = (void *)-[__CFString copy](v11, "copy");

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("PFVideoComplementMetadataVersionKey"));
    v15 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("PFVideoComplementMetadataTimingInfoKey"));

    v16 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("PFVideoComplementMetadataPairidIdentifierKey"));

    objc_storeStrong((id *)&v5->_metadata, v13);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PFVideoComplementImagePathKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = objc_msgSend(v17, "copy");
        imagePath = v5->_imagePath;
        v5->_imagePath = (NSString *)v18;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PFVideoComplementVideoPathKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = objc_msgSend(v20, "copy");
        videoPath = v5->_videoPath;
        v5->_videoPath = (NSString *)v21;

      }
    }

  }
  return v5;
}

- (PFVideoComplement)initWithBundleAtURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PFVideoComplement *v23;
  id v25;
  PFVideoComplement *v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("pvt"));

  if (v6)
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v10)
    {
      v11 = v10;
      v25 = v4;
      v26 = self;
      v27 = 0;
      v31 = 0;
      v29 = 0;
      v12 = *(_QWORD *)v34;
      v13 = *MEMORY[0x1E0CEC520];
      v30 = *MEMORY[0x1E0CEC568];
      v28 = *MEMORY[0x1E0CEC5A8];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v15, "path", v25);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)MEMORY[0x1E0CEC3F8];
            objc_msgSend(v15, "pathExtension");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "typeWithFilenameExtension:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              if (objc_msgSend(v19, "conformsToType:", v13))
              {
                objc_msgSend(v32, "setObject:forKeyedSubscript:", v16, CFSTR("PFVideoComplementImagePathKey"));
                v31 = 1;
              }
              else if (objc_msgSend(v19, "conformsToType:", v30))
              {
                objc_msgSend(v32, "setObject:forKeyedSubscript:", v16, CFSTR("PFVideoComplementVideoPathKey"));
                v29 = 1;
              }
              else if (objc_msgSend(v19, "conformsToType:", v28))
              {
                v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v16);
                v21 = v20;
                if (v20)
                {
                  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PFVideoComplementMetadataVersionKey"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v22, "isEqualToString:", CFSTR("1")))
                  {
                    objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, CFSTR("PFVideoComplementMetadataKey"));
                    v27 = 1;
                  }

                }
              }
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v11);

      if ((v29 & v31 & v27 & 1) != 0)
      {
        self = -[PFVideoComplement initWithPropertyList:](v26, "initWithPropertyList:", v32);
        v23 = self;
      }
      else
      {
        v23 = 0;
        self = v26;
      }
      v4 = v25;
    }
    else
    {

      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)propertyListRepresentation
{
  id v3;
  void *v4;
  NSString *imagePath;
  NSString *videoPath;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  imagePath = self->_imagePath;
  if (imagePath)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", imagePath, CFSTR("PFVideoComplementImagePathKey"));
  videoPath = self->_videoPath;
  if (videoPath)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", videoPath, CFSTR("PFVideoComplementVideoPathKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_metadata, CFSTR("PFVideoComplementMetadataKey"));
  return v4;
}

- (BOOL)copyOrLinkPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  char v13;
  char v14;
  void *v15;
  id v17;
  id v18;
  __int16 v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v11 = -[PFVideoComplement _getSourceFilePath:destinationFilePath:areOnSameVolume:volumeSupportsCloning:](self, "_getSourceFilePath:destinationFilePath:areOnSameVolume:volumeSupportsCloning:", v8, v9, (char *)&v19 + 1, &v19);
  v12 = 0;
  if (v11
    && HIBYTE(v19)
    && !(_BYTE)v19
    && (v18 = 0,
        v13 = objc_msgSend(v10, "linkItemAtPath:toPath:error:", v8, v9, &v18),
        v12 = v18,
        (v13 & 1) != 0))
  {
    v14 = 1;
  }
  else
  {
    v15 = v12;
    v17 = v12;
    v14 = objc_msgSend(v10, "copyItemAtPath:toPath:error:", v8, v9, &v17);
    v12 = v17;

    if (a5 && (v14 & 1) == 0)
    {
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a5 = v12;
    }
  }

  return v14;
}

- (BOOL)_getSourceFilePath:(id)a3 destinationFilePath:(id)a4 areOnSameVolume:(BOOL *)a5 volumeSupportsCloning:(BOOL *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  id v22;
  BOOL v23;
  void *v24;
  void *v25;
  char v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v12 = *MEMORY[0x1E0C99BC8];
  v35 = 0;
  v13 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v36, v12, &v35);
  v14 = v36;
  v15 = v35;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "URLByDeletingLastPathComponent");
    v33 = 0;
    v34 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v29, "getResourceValue:forKey:error:", &v34, v12, &v33);
    v17 = v34;
    v18 = v33;

    if ((v16 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v38 = v10;
        v39 = 2112;
        v40 = v18;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to query volume ID for %@: %@", buf, 0x16u);
      }
      v23 = 0;
      v15 = v18;
      v25 = v29;
      v24 = v30;
      goto LABEL_17;
    }
    v28 = v17;
    v19 = objc_msgSend(v14, "isEqual:", v17);
    v20 = v19;
    if (a6 && (*a6 = 0, v19))
    {
      v32 = 0;
      v21 = *MEMORY[0x1E0C99C90];
      v31 = 0;
      v27 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v32, v21, &v31);
      v22 = v32;
      v15 = v31;

      if ((v27 & 1) == 0)
      {
        v25 = v29;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v38 = v9;
          v39 = 2112;
          v40 = v15;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to query cloning status for %@: %@", buf, 0x16u);
        }

        v23 = 0;
        v24 = v30;
        v17 = v28;
        goto LABEL_17;
      }
      *a6 = objc_msgSend(v22, "BOOLValue");

    }
    else
    {
      v15 = v18;
    }
    v17 = v28;
    v25 = v29;
    if (a5)
      *a5 = v20;
    v23 = 1;
    v24 = v30;
LABEL_17:

    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v38 = v9;
    v39 = 2112;
    v40 = v15;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to query volume ID for %@: %@", buf, 0x16u);
  }
  v23 = 0;
LABEL_18:

  return v23;
}

- (BOOL)writeToBundleAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t *v15;
  id *v16;
  int v17;
  void *v18;
  uint64_t *v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  NSString *imagePath;
  id *v25;
  BOOL v26;
  void *v27;
  void *v28;
  NSString *videoPath;
  id *v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  id *v34;
  char v35;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  id v43;
  id obj;
  _QWORD v45[6];
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;

  v5 = a3;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 1;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__8436;
  v51 = __Block_byref_object_dispose__8437;
  v52 = 0;
  v46 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __46__PFVideoComplement_writeToBundleAtURL_error___block_invoke;
  v45[3] = &unk_1E45A3F00;
  v45[4] = &v53;
  v45[5] = &v47;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1B0CFA4](v45);
  -[NSString pathExtension](self->_imagePath, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFUniformTypeUtilities typeWithFilenameExtension:](PFUniformTypeUtilities, "typeWithFilenameExtension:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*((_BYTE *)v54 + 24) && (!v9 || (objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) == 0))
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("UTType is not image at '%@'"));
  v46 = 1;
  if (*((_BYTE *)v54 + 24) && (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", self->_imagePath, &v46) & 1) == 0)
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("no file exists at '%@'"));
  if (*((_BYTE *)v54 + 24) && v46)
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("directory exists at '%@'"));
  -[NSString pathExtension](self->_videoPath, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFUniformTypeUtilities typeWithFilenameExtension:](PFUniformTypeUtilities, "typeWithFilenameExtension:", v10);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (*((_BYTE *)v54 + 24) && (!v40 || (objc_msgSend(v40, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) == 0))
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("UTType is not movie at '%@'"));
  v46 = 1;
  if (*((_BYTE *)v54 + 24) && (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", self->_videoPath, &v46) & 1) == 0)
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("no file exists at '%@'"));
  v11 = *((unsigned __int8 *)v54 + 24);
  if (*((_BYTE *)v54 + 24) && v46)
  {
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("directory exists at '%@'"));
    v11 = *((unsigned __int8 *)v54 + 24);
  }
  if (v11 && (objc_msgSend(v5, "isFileURL") & 1) == 0)
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("destination is not a file url: '%@'"));
  if (*((_BYTE *)v54 + 24))
  {
    objc_msgSend(v5, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("pvt"));

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v5, "pathExtension");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("destination has extension '%@' but requires '%@'"));

    }
  }
  objc_msgSend(v5, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v54 + 24) && objc_msgSend(v6, "fileExistsAtPath:", v14))
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("destination already exists: '%@'"));
  v15 = v54;
  v38 = v9;
  if (*((_BYTE *)v54 + 24))
  {
    v16 = (id *)(v48 + 5);
    obj = (id)v48[5];
    v17 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &obj);
    objc_storeStrong(v16, obj);
    v15 = v54;
  }
  else
  {
    v17 = 0;
  }
  *((_BYTE *)v15 + 24) = v17;
  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("metadata.plist"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v54;
  if (*((_BYTE *)v54 + 24))
  {
    v20 = -[NSDictionary writeToFile:atomically:](self->_metadata, "writeToFile:atomically:", v18, 1);
    v19 = v54;
  }
  else
  {
    v20 = 0;
  }
  *((_BYTE *)v19 + 24) = v20;
  -[NSString lastPathComponent](self->_imagePath, "lastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v54;
  if (*((_BYTE *)v54 + 24))
  {
    imagePath = self->_imagePath;
    v25 = (id *)(v48 + 5);
    v43 = (id)v48[5];
    v26 = -[PFVideoComplement copyOrLinkPath:toPath:error:](self, "copyOrLinkPath:toPath:error:", imagePath, v22, &v43);
    objc_storeStrong(v25, v43);
    v23 = v54;
  }
  else
  {
    v26 = 0;
  }
  *((_BYTE *)v23 + 24) = v26;
  -[NSString lastPathComponent](self->_videoPath, "lastPathComponent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*((_BYTE *)v54 + 24))
  {
    *((_BYTE *)v54 + 24) = 0;
    if (!v17)
      goto LABEL_46;
LABEL_44:
    objc_msgSend(v6, "removeItemAtPath:error:", v14, 0);
    if (!*((_BYTE *)v54 + 24))
      goto LABEL_46;
    goto LABEL_45;
  }
  videoPath = self->_videoPath;
  v30 = (id *)(v48 + 5);
  v42 = (id)v48[5];
  v31 = -[PFVideoComplement copyOrLinkPath:toPath:error:](self, "copyOrLinkPath:toPath:error:", videoPath, v28, &v42);
  objc_storeStrong(v30, v42);
  *((_BYTE *)v54 + 24) = v31;
  if (((v31 | v17 ^ 1) & 1) == 0)
    goto LABEL_44;
  if (v31)
  {
LABEL_45:
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *MEMORY[0x1E0C99A00];
    v34 = (id *)(v48 + 5);
    v41 = (id)v48[5];
    objc_msgSend(v32, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v33, &v41);
    objc_storeStrong(v34, v41);

  }
LABEL_46:
  if (a4)
    *a4 = objc_retainAutorelease((id)v48[5]);
  v35 = *((_BYTE *)v54 + 24);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v35;
}

- (NSString)videoPath
{
  return self->_videoPath;
}

- (NSString)imagePath
{
  return self->_imagePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_videoPath, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
}

void __46__PFVideoComplement_writeToBundleAtURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = (__CFString *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v13 = CFSTR("unknown reason");
  if (v12)
    v13 = v12;
  v14 = v13;

  v15 = (void *)MEMORY[0x1E0CB35C8];
  v20 = *MEMORY[0x1E0CB2D50];
  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), -1, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

}

- (PFVideoComplement)initWithPathToVideo:(id)a3 pathToImage:(id)a4
{
  __int128 v5;
  uint64_t v6;

  v5 = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  return -[PFVideoComplement initWithPathToVideo:pathToImage:imageDisplayTime:pairingIdentifier:](self, "initWithPathToVideo:pathToImage:imageDisplayTime:pairingIdentifier:", a3, a4, &v5, 0);
}

- (PFVideoComplement)initWithPathToVideo:(id)a3 pathToImage:(id)a4 imageDisplayTime:(id *)a5 pairingIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CFDictionaryRef v14;
  CFDictionaryRef v15;
  id v16;
  void *v17;
  PFVideoComplement *v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((a5->var2 & 1) != 0)
  {
    v20 = *a5;
    v14 = CMTimeCopyAsDictionary((CMTime *)&v20, 0);
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("PFVideoComplementMetadataTimingInfoKey"));
      CFRelease(v15);
    }
  }
  if (v12)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("PFVideoComplementMetadataPairidIdentifierKey"));
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = v16;
  if (v10)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, CFSTR("PFVideoComplementVideoPathKey"));
  if (v11)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, CFSTR("PFVideoComplementImagePathKey"));
  if (v13)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("PFVideoComplementMetadataKey"));
  v18 = -[PFVideoComplement initWithPropertyList:](self, "initWithPropertyList:", v17);

  return v18;
}

- (NSString)pairingIdentifier
{
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFVideoComplementMetadataPairidIdentifierKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PFVideoComplement originalPairingIdentifier](self, "originalPairingIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)imageDisplayTime
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v7;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("PFVideoComplementMetadataTimingInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v7, (CFDictionaryRef)v5);
  else
    result = -[PFVideoComplement originalImageDisplayTime](self, "originalImageDisplayTime");
  *(CMTime *)retstr = v7;
  return result;
}

- (void)_readMetadataIfNeeded
{
  void *v3;
  NSString *v4;
  NSString *originalPairingIdentifier;
  $95D729B680665BEAEFA1D6FCA8238556 *p_originalVideoDuration;
  __int128 v7;
  int64_t v8;

  if (!self->_didReadOriginalMetadata)
  {
    self->_didReadOriginalMetadata = 1;
    PFVideoComplementMetadataForVideoAtPath((uint64_t)self->_videoPath, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pairingIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    originalPairingIdentifier = self->_originalPairingIdentifier;
    self->_originalPairingIdentifier = v4;

    p_originalVideoDuration = &self->_originalVideoDuration;
    if (v3)
    {
      objc_msgSend(v3, "videoDuration");
      *(_OWORD *)&p_originalVideoDuration->value = v7;
      self->_originalVideoDuration.epoch = v8;
      objc_msgSend(v3, "imageDisplayTime");
    }
    else
    {
      p_originalVideoDuration->value = 0;
      *(_QWORD *)&self->_originalVideoDuration.timescale = 0;
      self->_originalVideoDuration.epoch = 0;
      v7 = 0uLL;
      v8 = 0;
    }
    *(_OWORD *)&self->_originalImageDisplayTime.value = v7;
    self->_originalImageDisplayTime.epoch = v8;

  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalVideoDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PFVideoComplement _readMetadataIfNeeded](self, "_readMetadataIfNeeded");
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_originalVideoDuration;
  return result;
}

- (NSString)originalPairingIdentifier
{
  -[PFVideoComplement _readMetadataIfNeeded](self, "_readMetadataIfNeeded");
  return self->_originalPairingIdentifier;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalImageDisplayTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PFVideoComplement _readMetadataIfNeeded](self, "_readMetadataIfNeeded");
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_originalImageDisplayTime;
  return result;
}

- (int)numberOfFramesRecoveredWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v4 = (void *)MEMORY[0x1E0C8AF90];
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[PFVideoComplement videoPath](self, "videoPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v10 = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = (void *)objc_opt_class();
  v13 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__PFVideoComplement_Convenience__numberOfFramesRecoveredWithError___block_invoke;
  v14[3] = &unk_1E45A3F28;
  v14[4] = &v15;
  objc_msgSend(v9, "_enumerateV3MetadataInAsset:withBlock:error:", v8, v14, &v13);
  v10 = v13;
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(v10);
LABEL_4:
  v11 = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t __67__PFVideoComplement_Convenience__numberOfFramesRecoveredWithError___block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += *(unsigned __int8 *)(a2 + 58);
  return result;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertTime:(SEL)a3 fromAsset:(id *)a4 toAsset:(id)a5
{
  id v10;
  uint64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  v10 = a6;
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v13 = *a4;
  v11 = objc_msgSend(a2, "_originalPTSForFrameAtTime:inAsset:error:", &v13, a5, 0);
  if (v11)
  {
    objc_msgSend(a2, "_retimedPTSForOriginalPTS:inAsset:error:", v11, v10, 0);
    *retstr = v13;
  }

  return result;
}

+ (unint64_t)_originalPTSForFrameAtTime:(id *)a3 inAsset:(id)a4 error:(id *)a5
{
  id v8;
  unint64_t v9;
  _QWORD v11[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v8 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PFVideoComplement_Convenience___originalPTSForFrameAtTime_inAsset_error___block_invoke;
  v11[3] = &unk_1E45A3F50;
  v12 = *a3;
  v11[4] = v13;
  v11[5] = &v14;
  objc_msgSend(a1, "_enumerateV3MetadataInAsset:withBlock:error:", v8, v11, a5);
  v9 = v15[3];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

  return v9;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_retimedPTSForOriginalPTS:(SEL)a3 inAsset:(unint64_t)a4 error:(id)a5
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v14;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__PFVideoComplement_Convenience___retimedPTSForOriginalPTS_inAsset_error___block_invoke;
  v15[3] = &unk_1E45A3F78;
  v15[5] = &v16;
  v15[6] = a4;
  v15[4] = &v20;
  objc_msgSend(a2, "_enumerateV3MetadataInAsset:withBlock:error:", v10, v15, a6);
  v11 = v17[3];
  if (v11)
  {
    v12 = v21[3];
    if (v12)
    {
      CMTimeMake(&v14, v11 - v12, 1000000000);
      *(CMTime *)retstr = v14;
    }
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return result;
}

+ (BOOL)_enumerateV3MetadataInAsset:(id)a3 withBlock:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _DWORD *v35;
  id v36;
  void *v37;
  int32x4_t *v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  id v44;
  id *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  char v52;
  _BYTE count[12];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v52 = 0;
  if (!v7)
  {
    v13 = 0;
    if (!a5)
      goto LABEL_49;
    goto LABEL_48;
  }
  v51 = 0;
  objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v7, &v51);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v51;
  v11 = v10;
  if (v10)
    v12 = 1;
  else
    v12 = v9 == 0;
  if (!v12)
  {
    v43 = v10;
    v44 = v8;
    v45 = a5;
    v46 = v9;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v7, "tracks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (!v15)
    {
LABEL_26:

LABEL_37:
      a5 = v45;
      v9 = v46;
      v11 = v43;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)count = 138412290;
        *(_QWORD *)&count[4] = v7;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to find metadata track for AVAsset %@", count, 0xCu);
      }
      v13 = 0;
      v8 = v44;
      goto LABEL_47;
    }
    v16 = v15;
    v17 = *(_QWORD *)v48;
    v18 = *MEMORY[0x1E0D053E0];
LABEL_15:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v17)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v19);
      objc_msgSend(v20, "formatDescriptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count") == 1
        && (objc_msgSend(v21, "firstObject"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, v22)
        && (CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v22),
            (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v24 = v23;
        v25 = objc_msgSend(v23, "containsObject:", v18);

        if ((v25 & 1) != 0)
        {
          v26 = v20;

          if (!v26)
            goto LABEL_37;
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B000]), "initWithTrack:outputSettings:", v26, 0);
          v9 = v46;
          a5 = v45;
          if (objc_msgSend(v46, "canAddOutput:", v27))
          {
            objc_msgSend(v46, "addOutput:", v27);
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFF0]), "initWithAssetReaderTrackOutput:", v27);
            v8 = v44;
            if (objc_msgSend(v46, "startReading"))
            {
              objc_msgSend(v28, "nextTimedMetadataGroup");
              v29 = objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v30 = (void *)v29;
                v41 = v27;
                v42 = v26;
                do
                {
                  objc_msgSend(v30, "items");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "firstObject");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  *(_QWORD *)count = 0;
                  objc_msgSend(v32, "dataValue");
                  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  objc_msgSend(v33, "bytes");
                  objc_msgSend(v32, "dataValue");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "length");
                  FigLivePhotoMetadataComputeDeserializationSize();

                  v35 = malloc_type_calloc(*(size_t *)count, 1uLL, 0xC60328C9uLL);
                  objc_msgSend(v32, "dataValue");
                  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  objc_msgSend(v36, "bytes");
                  objc_msgSend(v32, "dataValue");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "length");
                  FigLivePhotoMetadataDeserializeIntoBuffer();

                  if (*v35 >= 3u)
                  {
                    v38 = (int32x4_t *)&v35[8 * v35[11]];
                    (*((void (**)(id, int32x4_t *, char *))v44 + 2))(v44, &v38[2 * vaddvq_s32(v38[3]) + 4], &v52);
                  }
                  free(v35);
                  objc_msgSend(v28, "nextTimedMetadataGroup");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v39)
                    break;
                  v30 = v39;
                }
                while (!v52);

                v9 = v46;
                v27 = v41;
                v26 = v42;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)count = 0;
              _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to start reading from asset reader", count, 2u);
            }

            v11 = v43;
          }
          else
          {
            v11 = v43;
            v8 = v44;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)count = 0;
              _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to add output to asset reader", count, 2u);
            }
          }

LABEL_46:
          v13 = 0;
          goto LABEL_47;
        }
      }
      else
      {

      }
      if (v16 == ++v19)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
        if (v16)
          goto LABEL_15;
        goto LABEL_26;
      }
    }
  }
  if (!v10)
    goto LABEL_46;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)count = 138412290;
    *(_QWORD *)&count[4] = v11;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to read from asset with error: %@", count, 0xCu);
  }
  v13 = v11;
LABEL_47:

  if (a5)
LABEL_48:
    *a5 = objc_retainAutorelease(v13);
LABEL_49:

  return 0;
}

_QWORD *__74__PFVideoComplement_Convenience___retimedPTSForOriginalPTS_inAsset_error___block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(result[4] + 8);
  if (!*(_QWORD *)(v3 + 24))
    *(_QWORD *)(v3 + 24) = *(_QWORD *)(a2 + 40);
  if (result[6] == *(_QWORD *)(a2 + 48))
  {
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(a2 + 40);
    *a3 = 1;
  }
  return result;
}

void __75__PFVideoComplement_Convenience___originalPTSForFrameAtTime_inAsset_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  unint64_t v6;
  unint64_t v7;
  CMTime v8;

  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!v7)
  {
    v8 = *(CMTime *)(a1 + 48);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6
                                                                + (unint64_t)(CMTimeGetSeconds(&v8) * 1000000000.0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(a2 + 48);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  if (v7 < v6)
    *a3 = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(a2 + 48);
}

+ (NSString)currentFormatVersion
{
  return (NSString *)CFSTR("1");
}

@end
