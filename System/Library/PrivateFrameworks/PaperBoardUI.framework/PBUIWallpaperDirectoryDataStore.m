@implementation PBUIWallpaperDirectoryDataStore

+ (NSURL)defaultDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (PBUIWallpaperDirectoryDataStore)initWithDirectoryURL:(id)a3
{
  id v4;
  PBUIWallpaperDirectoryDataStore *v5;
  uint64_t v6;
  NSURL *directoryURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIWallpaperDirectoryDataStore;
  v5 = -[PBUIWallpaperDirectoryDataStore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    directoryURL = v5->_directoryURL;
    v5->_directoryURL = (NSURL *)v6;

  }
  return v5;
}

- (void)cleanup
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  int v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  -[PBUIWallpaperDirectoryDataStore directoryURL](self, "directoryURL");
  v3 = objc_claimAutoreleasedReturnValue();
  __possibleWallpaperFileNames();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C99A18];
  v64 = *MEMORY[0x1E0C99A18];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v3;
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v7, 1, &__block_literal_global_7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v55;
    v37 = v6;
    v38 = v4;
    v35 = *(_QWORD *)v55;
    v36 = v8;
    do
    {
      v12 = 0;
      v39 = v10;
      do
      {
        if (*(_QWORD *)v55 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v12);
        v52 = 0;
        v53 = 0;
        v14 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v53, v6, &v52);
        v15 = v53;
        v42 = v52;
        if ((v14 & 1) != 0)
        {
          if (!objc_msgSend(v15, "BOOLValue"))
            goto LABEL_38;
          v40 = v15;
          v41 = v12;
          objc_msgSend(v13, "lastPathComponent");
          v16 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject hasPrefix:](v16, "hasPrefix:", CFSTR("."))
            && (-[NSObject pathExtension](v16, "pathExtension"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "length"),
                v17,
                v18 == 6))
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v19 = v4;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v49;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v49 != v22)
                    objc_enumerationMutation(v19);
                  if (-[NSObject containsString:](v16, "containsString:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i)))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = 0;
                    v25 = objc_msgSend(v24, "removeItemAtURL:error:", v13, &v47);
                    v26 = v47;

                    PBUILogCommon();
                    v27 = objc_claimAutoreleasedReturnValue();
                    v28 = v27;
                    if (v25)
                    {
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138543362;
                        v61 = v13;
                        _os_log_debug_impl(&dword_1B71C0000, v28, OS_LOG_TYPE_DEBUG, "Removed bad wallpaper data @ URL %{public}@", buf, 0xCu);
                      }
                    }
                    else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v61 = v13;
                      v62 = 2114;
                      v63 = v26;
                      _os_log_error_impl(&dword_1B71C0000, v28, OS_LOG_TYPE_ERROR, "Unable to remove bad wallpaper data @ URL %{public}@: %{public}@", buf, 0x16u);
                    }

                  }
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
              }
              while (v21);
            }
          }
          else
          {
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            v29 = v4;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v44;
              do
              {
                for (j = 0; j != v31; ++j)
                {
                  if (*(_QWORD *)v44 != v32)
                    objc_enumerationMutation(v29);
                  if (-[NSObject hasPrefix:](v16, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j)))-[PBUIWallpaperDirectoryDataStore didWriteFileToURL:](self, "didWriteFileToURL:", v13);
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
              }
              while (v31);
            }
          }
          v4 = v38;

          v8 = v36;
          v6 = v37;
          v11 = v35;
          v10 = v39;
        }
        else
        {
          v40 = v15;
          v41 = v12;
          PBUILogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v61 = v13;
            v62 = 2114;
            v63 = v42;
            _os_log_error_impl(&dword_1B71C0000, v16, OS_LOG_TYPE_ERROR, "Unable to read resource type from directory URL %{public}@: %{public}@", buf, 0x16u);
          }
        }

        v15 = v40;
        v12 = v41;
LABEL_38:

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v10);
  }

}

uint64_t __42__PBUIWallpaperDirectoryDataStore_cleanup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  PBUILogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __42__PBUIWallpaperDirectoryDataStore_cleanup__block_invoke_cold_1();

  return 1;
}

- (PBUIWallpaperDirectoryDataStore)init
{
  void *v3;
  PBUIWallpaperDirectoryDataStore *v4;

  objc_msgSend((id)objc_opt_class(), "defaultDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PBUIWallpaperDirectoryDataStore initWithDirectoryURL:](self, "initWithDirectoryURL:", v3);

  return v4;
}

- (id)wallpaperImageURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[PBUIWallpaperDirectoryDataStore directoryURL](self, "directoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __wallpaperImageFilename(a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)wallpaperOriginalImageURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[PBUIWallpaperDirectoryDataStore directoryURL](self, "directoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __wallpaperOriginalImageFilename(a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)wallpaperThumbnailURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[PBUIWallpaperDirectoryDataStore directoryURL](self, "directoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __wallpaperThumbnailFilename(a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)wallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  const __CFArray *ImagesFromData;
  const __CFArray *v14;
  const void *ValueAtIndex;
  float v16;
  double v17;
  NSObject *v18;
  PBUIWallpaperImage *v19;
  NSObject *v20;
  void *v21;
  double v22;
  void *v24;
  CFTypeRef cf;
  id v26;
  CFTypeRef v27[4];

  v27[3] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  -[PBUIWallpaperDirectoryDataStore wallpaperImageURLForVariant:wallpaperMode:](self, "wallpaperImageURLForVariant:wallpaperMode:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v26 = 0;
    PBUIWallpaperDataForFileURL(v7, &v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v26;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  PBUILogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[PBUIWallpaperDirectoryDataStore wallpaperImageURLForVariant:wallpaperMode:](self, "wallpaperImageURLForVariant:wallpaperMode:", a3, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27[0]) = 138543362;
    *(CFTypeRef *)((char *)v27 + 4) = v24;
    _os_log_debug_impl(&dword_1B71C0000, v11, OS_LOG_TYPE_DEBUG, "Wallpaper file URL: %{public}@", (uint8_t *)v27, 0xCu);

  }
  PBUILogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PBUIWallpaperDirectoryDataStore wallpaperImageForVariant:wallpaperMode:].cold.3(v9, v12);

  if (v9)
  {
    v27[0] = 0;
    cf = 0;
    ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
    if (ImagesFromData)
    {
      v14 = ImagesFromData;
      ValueAtIndex = CFArrayGetValueAtIndex(ImagesFromData, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v27[0])
      {
        objc_msgSend((id)v27[0], "floatValue");
        v17 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", cf);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "scale");
        v17 = v22;

      }
      v19 = -[PBUIWallpaperImage initWithCGImage:scale:orientation:wallpaperFileURL:]([PBUIWallpaperImage alloc], "initWithCGImage:scale:orientation:wallpaperFileURL:", ValueAtIndex, 0, v8, v17);
      CFRelease(v14);
    }
    else
    {
      PBUILogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PBUIWallpaperDirectoryDataStore wallpaperImageForVariant:wallpaperMode:].cold.2((uint64_t *)&cf, v20);

      v19 = 0;
    }
    if (cf)
      CFRelease(cf);
    if (v27[0])
      CFRelease(v27[0]);
  }
  else
  {
    PBUILogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[PBUIWallpaperDirectoryDataStore wallpaperImageForVariant:wallpaperMode:].cold.1((uint64_t)v10, v18);

    v19 = 0;
  }

  return v19;
}

- (BOOL)hasWallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  char v5;

  -[PBUIWallpaperDirectoryDataStore wallpaperImageURLForVariant:wallpaperMode:](self, "wallpaperImageURLForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0);

  return v5;
}

- (id)wallpaperThumbnailDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  void *v5;

  -[PBUIWallpaperDirectoryDataStore wallpaperThumbnailURLForVariant:wallpaperMode:](self, "wallpaperThumbnailURLForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)wallpaperOriginalImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PBUIWallpaperDirectoryDataStore wallpaperOriginalImageURLForVariant:wallpaperMode:](self, "wallpaperOriginalImageURLForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithContentsOfCPBitmapFile:flags:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSDictionary)directoryCreationAttributes
{
  return 0;
}

- (void)createDirectory
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B71C0000, v0, v1, "Error creating wallpaper directory at location '%{public}@': %{public}@");
  OUTLINED_FUNCTION_9();
}

- (void)didWriteFileToURL:(id)a3
{
  objc_msgSend(a3, "setResourceValue:forKey:error:", *MEMORY[0x1E0C99940], *MEMORY[0x1E0C99938], 0);
}

- (BOOL)setWallpaperImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  BOOL v11;

  v8 = a3;
  if (!__hasEnoughFreeSpaceToSetWallpaper()
    || (-[PBUIWallpaperDirectoryDataStore createDirectory](self, "createDirectory"), a4 == -1))
  {
    v11 = 0;
  }
  else
  {
    -[PBUIWallpaperDirectoryDataStore wallpaperImageURLForVariant:wallpaperMode:](self, "wallpaperImageURLForVariant:wallpaperMode:", a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if ((objc_msgSend(v8, "writeToCPBitmapFile:flags:", v10, 1) & 1) != 0
        || (v11 = 0, objc_msgSend(v8, "writeToCPBitmapFile:flags:", v10, 0)))
      {
        -[PBUIWallpaperDirectoryDataStore didWriteFileToURL:](self, "didWriteFileToURL:", v9);
        v11 = 1;
      }
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)setWallpaperOriginalImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  BOOL v11;

  v8 = a3;
  if (!__hasEnoughFreeSpaceToSetWallpaper()
    || (-[PBUIWallpaperDirectoryDataStore createDirectory](self, "createDirectory"), a4 == -1))
  {
    v11 = 0;
  }
  else
  {
    -[PBUIWallpaperDirectoryDataStore wallpaperOriginalImageURLForVariant:wallpaperMode:](self, "wallpaperOriginalImageURLForVariant:wallpaperMode:", a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if ((objc_msgSend(v8, "writeToCPBitmapFile:flags:", v10, 1) & 1) != 0
        || (v11 = 0, objc_msgSend(v8, "writeToCPBitmapFile:flags:", v10, 0)))
      {
        -[PBUIWallpaperDirectoryDataStore didWriteFileToURL:](self, "didWriteFileToURL:", v9);
        v11 = 1;
      }
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8;
  void *v9;
  int v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4 != -1)
  {
    -[PBUIWallpaperDirectoryDataStore wallpaperThumbnailURLForVariant:wallpaperMode:](self, "wallpaperThumbnailURLForVariant:wallpaperMode:", a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v16 = 0;
      v10 = objc_msgSend(v8, "writeToURL:options:error:", v9, 268435457, &v16);
      v11 = v16;
      if (v10)
      {
        -[PBUIWallpaperDirectoryDataStore didWriteFileToURL:](self, "didWriteFileToURL:", v9);
        v12 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v11 = 0;
    }
    PBUILogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      PBUIStringForWallpaperVariant(a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_1B71C0000, v13, OS_LOG_TYPE_INFO, "Error writing thumbnail for variant %{public}@ to disk at URL '%{public}@': %{public}@", buf, 0x20u);

    }
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)moveWallpaperImageDataTypes:(unint64_t)a3 fromVariant:(int64_t)a4 toVariant:(int64_t)a5
{
  char v7;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 4; ++i)
  {
    if ((v7 & 1) != 0)
    {
      -[PBUIWallpaperDirectoryDataStore wallpaperImageURLForVariant:wallpaperMode:](self, "wallpaperImageURLForVariant:wallpaperMode:", a4, i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDirectoryDataStore wallpaperImageURLForVariant:wallpaperMode:](self, "wallpaperImageURLForVariant:wallpaperMode:", a5, i);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v10 && v11)
        objc_msgSend(v19, "moveItemAtURL:toURL:error:", v10, v11, 0);

      if ((v7 & 4) == 0)
      {
LABEL_4:
        if ((v7 & 2) == 0)
          continue;
LABEL_14:
        -[PBUIWallpaperDirectoryDataStore wallpaperOriginalImageURLForVariant:wallpaperMode:](self, "wallpaperOriginalImageURLForVariant:wallpaperMode:", a4, i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBUIWallpaperDirectoryDataStore wallpaperOriginalImageURLForVariant:wallpaperMode:](self, "wallpaperOriginalImageURLForVariant:wallpaperMode:", a5, i);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16 && v17)
          objc_msgSend(v19, "moveItemAtURL:toURL:error:", v16, v17, 0);

        continue;
      }
    }
    else if ((v7 & 4) == 0)
    {
      goto LABEL_4;
    }
    -[PBUIWallpaperDirectoryDataStore wallpaperThumbnailURLForVariant:wallpaperMode:](self, "wallpaperThumbnailURLForVariant:wallpaperMode:", a4, i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperDirectoryDataStore wallpaperThumbnailURLForVariant:wallpaperMode:](self, "wallpaperThumbnailURLForVariant:wallpaperMode:", a5, i);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13 && v14)
      objc_msgSend(v19, "moveItemAtURL:toURL:error:", v13, v14, 0);

    if ((v7 & 2) != 0)
      goto LABEL_14;
  }

}

- (void)removeWallpaperImageDataTypes:(unint64_t)a3 forVariants:(int64_t)a4
{
  char v4;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  unint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__PBUIWallpaperDirectoryDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke;
  v19[3] = &unk_1E6B94FF0;
  v21 = a3;
  v19[4] = self;
  v8 = v7;
  v20 = v8;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v19);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), 0, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    }
    while (v12);
  }

}

void __77__PBUIWallpaperDirectoryDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  for (i = 0; i != 4; ++i)
  {
    v5 = *(_QWORD *)(a1 + 48);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "wallpaperImageURLForVariant:wallpaperMode:", a2, i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

      v5 = *(_QWORD *)(a1 + 48);
      if ((v5 & 2) == 0)
      {
LABEL_4:
        if ((v5 & 4) == 0)
          continue;
LABEL_12:
        objc_msgSend(*(id *)(a1 + 32), "wallpaperThumbnailURLForVariant:wallpaperMode:", a2, i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

        continue;
      }
    }
    else if ((v5 & 2) == 0)
    {
      goto LABEL_4;
    }
    objc_msgSend(*(id *)(a1 + 32), "wallpaperOriginalImageURLForVariant:wallpaperMode:", a2, i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

    if ((*(_QWORD *)(a1 + 48) & 4) != 0)
      goto LABEL_12;
  }
}

- (BOOL)supportsWallpaperImageHashDataStorage
{
  return 0;
}

- (BOOL)setWallpaperImageHashData:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (id)wallpaperImageHashDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (id)wallpaperVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[PBUIWallpaperDirectoryDataStore directoryURL](self, "directoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __wallpaperVideoFilename(a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)wallpaperOriginalVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[PBUIWallpaperDirectoryDataStore directoryURL](self, "directoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __wallpaperOriginalVideoFilename(a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)verifiedVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  -[PBUIWallpaperDirectoryDataStore wallpaperVideoURLForVariant:wallpaperMode:](self, "wallpaperVideoURLForVariant:wallpaperMode:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    -[PBUIWallpaperDirectoryDataStore wallpaperOriginalVideoURLForVariant:wallpaperMode:](self, "wallpaperOriginalVideoURLForVariant:wallpaperMode:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0))
      v9 = v8;

    v7 = v9;
  }
  return v7;
}

- (id)verifiedOriginalVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;

  -[PBUIWallpaperDirectoryDataStore wallpaperOriginalVideoURLForVariant:wallpaperMode:](self, "wallpaperOriginalVideoURLForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {

    v4 = 0;
  }
  return v4;
}

- (BOOL)copyVideoAtURL:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    -[PBUIWallpaperDirectoryDataStore createDirectory](self, "createDirectory");
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    LOBYTE(v8) = 0;
    if (v7 && v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeItemAtURL:error:", v7, 0);
      v15 = 0;
      v8 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v6, v7, &v15);
      v12 = v15;
      if (v8)
      {
        -[PBUIWallpaperDirectoryDataStore didWriteFileToURL:](self, "didWriteFileToURL:", v7);
      }
      else
      {
        PBUILogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[PBUIWallpaperDirectoryDataStore copyVideoAtURL:toURL:].cold.1((uint64_t)v7, v12, v13);

      }
    }

  }
  return v8;
}

- (BOOL)setVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[PBUIWallpaperDirectoryDataStore wallpaperVideoURLForVariant:wallpaperMode:](self, "wallpaperVideoURLForVariant:wallpaperMode:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[PBUIWallpaperDirectoryDataStore copyVideoAtURL:toURL:](self, "copyVideoAtURL:toURL:", v8, v9);

  return a4;
}

- (BOOL)setOriginalVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[PBUIWallpaperDirectoryDataStore wallpaperOriginalVideoURLForVariant:wallpaperMode:](self, "wallpaperOriginalVideoURLForVariant:wallpaperMode:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[PBUIWallpaperDirectoryDataStore copyVideoAtURL:toURL:](self, "copyVideoAtURL:toURL:", v8, v9);

  return a4;
}

- (void)removeVideoForVariant:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  __int128 v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  *(_QWORD *)&v8 = 138543362;
  v16 = v8;
  do
  {
    -[PBUIWallpaperDirectoryDataStore wallpaperVideoURLForVariant:wallpaperMode:](self, "wallpaperVideoURLForVariant:wallpaperMode:", a3, v6, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v18 = v7,
          v10 = objc_msgSend(v5, "removeItemAtURL:error:", v9, &v18),
          v11 = v18,
          v7,
          v7 = v11,
          (v10 & 1) == 0))
    {
      if ((objc_msgSend(v7, "pbui_isFileNotFoundError") & 1) == 0)
      {
        PBUILogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v16;
          v20 = v7;
          _os_log_error_impl(&dword_1B71C0000, v12, OS_LOG_TYPE_ERROR, "Error removing video file: %{public}@", buf, 0xCu);
        }

      }
    }

    -[PBUIWallpaperDirectoryDataStore wallpaperOriginalVideoURLForVariant:wallpaperMode:](self, "wallpaperOriginalVideoURLForVariant:wallpaperMode:", a3, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v17 = 0;
      v14 = objc_msgSend(v5, "removeItemAtURL:error:", v13, &v17);
      v7 = v17;
      if ((v14 & 1) != 0)
        goto LABEL_16;
    }
    else
    {
      v7 = 0;
    }
    if ((objc_msgSend(v7, "pbui_isFileNotFoundError") & 1) == 0)
    {
      PBUILogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v16;
        v20 = v7;
        _os_log_error_impl(&dword_1B71C0000, v15, OS_LOG_TYPE_ERROR, "Error removing original video file: %{public}@", buf, 0xCu);
      }

    }
LABEL_16:

    ++v6;
  }
  while (v6 != 4);

}

- (id)proceduralWallpaperInfoForVariant:(int64_t)a3
{
  return 0;
}

- (BOOL)setProceduralWallpaperInfo:(id)a3 forVariants:(int64_t)a4
{
  return 0;
}

- (id)wallpaperOptionsURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3 == 1)
  {
    v5 = CFSTR("HomeWallpaperOptions");
  }
  else
  {
    if (a3)
    {
LABEL_9:
      v9 = 0;
      return v9;
    }
    v5 = CFSTR("LockWallpaperOptions");
  }
  if (a4 == 2)
  {
    PBUIStringForWallpaperMode(2uLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v6);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(".plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_9;
  -[PBUIWallpaperDirectoryDataStore directoryURL](self, "directoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)wallpaperOptionsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v7;
  PBUIWallpaperOptions *v8;

  if (-[PBUIWallpaperDirectoryDataStore supportsWallpaperOptions](self, "supportsWallpaperOptions"))
  {
    -[PBUIWallpaperDirectoryDataStore wallpaperOptionsURLForVariant:wallpaperMode:](self, "wallpaperOptionsURLForVariant:wallpaperMode:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = -[PBUIWallpaperOptions initWithContentsOfURL:]([PBUIWallpaperOptions alloc], "initWithContentsOfURL:", v7);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  char v6;
  id v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a4;
  v8 = a3;
  if (-[PBUIWallpaperDirectoryDataStore supportsWallpaperOptions](self, "supportsWallpaperOptions"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 1;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__PBUIWallpaperDirectoryDataStore_setWallpaperOptions_forVariants_wallpaperMode___block_invoke;
    v11[3] = &unk_1E6B95018;
    v11[4] = self;
    v14 = a5;
    v12 = v8;
    v13 = &v15;
    PBUIWallpaperEnumerateVariantsForLocations(v6, v11);
    v9 = *((_BYTE *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __81__PBUIWallpaperDirectoryDataStore_setWallpaperOptions_forVariants_wallpaperMode___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperOptionsURLForVariant:wallpaperMode:", a2, *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (v5 = v3, v4 = objc_msgSend(*(id *)(a1 + 40), "writeToURL:error:", v3, 0), v3 = v5, (v4 & 1) == 0))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

}

- (void)removeWallpaperOptionsForVariants:(int64_t)a3
{
  char v3;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a3;
  if (-[PBUIWallpaperDirectoryDataStore supportsWallpaperOptions](self, "supportsWallpaperOptions"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__PBUIWallpaperDirectoryDataStore_removeWallpaperOptionsForVariants___block_invoke;
    v7[3] = &unk_1E6B94C18;
    v7[4] = self;
    v8 = v5;
    v6 = v5;
    PBUIWallpaperEnumerateVariantsForLocations(v3, v7);

  }
}

void __69__PBUIWallpaperDirectoryDataStore_removeWallpaperOptionsForVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  void *v5;

  for (i = 0; i != 4; ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "wallpaperOptionsURLForVariant:wallpaperMode:", a2, i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "removeItemAtURL:error:", v5, 0);

  }
}

- (id)wallpaperColorForVariant:(int64_t)a3
{
  return 0;
}

- (id)wallpaperColorNameForVariant:(int64_t)a3
{
  return 0;
}

- (BOOL)setWallpaperColor:(id)a3 forVariants:(int64_t)a4
{
  return 0;
}

- (BOOL)setWallpaperColorName:(id)a3 forVariants:(int64_t)a4
{
  return 0;
}

- (id)wallpaperGradientForVariant:(int64_t)a3
{
  return 0;
}

- (BOOL)setWallpaperGradient:(id)a3 forVariants:(int64_t)a4
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperDirectoryDataStore descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperDirectoryDataStore descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDirectoryDataStore directoryURL](self, "directoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("directoryURL"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperDirectoryDataStore succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (BOOL)supportsWallpaperOptions
{
  return self->_supportsWallpaperOptions;
}

- (void)setSupportsWallpaperOptions:(BOOL)a3
{
  self->_supportsWallpaperOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

void __42__PBUIWallpaperDirectoryDataStore_cleanup__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B71C0000, v0, v1, "Unable to read wallpaper directory URL %{public}@: %{public}@");
  OUTLINED_FUNCTION_9();
}

- (void)wallpaperImageForVariant:(uint64_t)a1 wallpaperMode:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B71C0000, a2, OS_LOG_TYPE_DEBUG, "Error reading wallpaper file data: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_9();
}

- (void)wallpaperImageForVariant:(uint64_t *)a1 wallpaperMode:(NSObject *)a2 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B71C0000, a2, OS_LOG_TYPE_ERROR, "Error deserializing wallpaper image: %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_9();
}

- (void)wallpaperImageForVariant:(void *)a1 wallpaperMode:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = objc_msgSend(a1, "length");
  v6 = 2048;
  v7 = a1;
  _os_log_debug_impl(&dword_1B71C0000, a2, OS_LOG_TYPE_DEBUG, "Wallpaper file data length: %lu (%p)", (uint8_t *)&v4, 0x16u);
}

- (void)copyVideoAtURL:(NSObject *)a3 toURL:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1B71C0000, a3, OS_LOG_TYPE_ERROR, "Error writing video file to '%{public}@': %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
