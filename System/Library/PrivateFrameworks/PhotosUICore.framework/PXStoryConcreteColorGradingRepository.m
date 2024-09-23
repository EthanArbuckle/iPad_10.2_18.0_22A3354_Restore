@implementation PXStoryConcreteColorGradingRepository

- (PXStoryConcreteColorGradingRepository)init
{
  return -[PXStoryConcreteColorGradingRepository initWithOptions:](self, "initWithOptions:", 0);
}

- (PXStoryConcreteColorGradingRepository)initWithOptions:(unint64_t)a3
{
  char v3;
  PXStoryConcreteColorGradingRepository *v4;
  const char *v5;
  objc_class *v6;
  id v7;
  os_log_t v8;
  OS_os_log *log;
  NSCache *v10;
  NSCache *colorLookupCubeCache;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryConcreteColorGradingRepository;
  v4 = -[PXStoryConcreteColorGradingRepository init](&v13, sel_init);
  if (v4)
  {
    v5 = (const char *)*MEMORY[0x1E0D744D8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = os_log_create(v5, (const char *)objc_msgSend(v7, "UTF8String"));
    log = v4->_log;
    v4->_log = (OS_os_log *)v8;

    if ((v3 & 1) == 0)
    {
      v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
      colorLookupCubeCache = v4->_colorLookupCubeCache;
      v4->_colorLookupCubeCache = v10;

    }
  }
  return v4;
}

- (PXStoryColorGradingConfiguration)configuration
{
  return +[PXStoryColorGradingConfigurationFactory sharedConfiguration](PXStoryColorGradingConfigurationFactory, "sharedConfiguration");
}

- (void)startPreloadingWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_group_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  os_signpost_id_t v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  id v23;
  id buf[2];

  v4 = a3;
  -[PXStoryConcreteColorGradingRepository log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StoryColorLookupCubePreloading", ", (uint8_t *)buf, 2u);
  }

  v9 = dispatch_group_create();
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E513F0F8;
  v12 = v9;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  objc_copyWeak(&v23, buf);
  -[PXStoryConcreteColorGradingRepository _enumerateSupporedColorGradeCategoriesUsingBlock:](self, "_enumerateSupporedColorGradeCategoriesUsingBlock:", v20);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke_3;
  v16[3] = &unk_1E5148F60;
  v18 = v4;
  v19 = v6;
  v17 = v8;
  v14 = v4;
  v15 = v8;
  dispatch_group_notify(v12, MEMORY[0x1E0C80D38], v16);

  objc_destroyWeak(&v23);
  objc_destroyWeak(buf);

}

- (void)_enumerateSupporedColorGradeCategoriesUsingBlock:(id)a3
{
  void (**v3)(id, _QWORD);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  v3[2](v3, 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  PFStoryColorGradeSupportedCategories();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        v3[2](v3, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_cubeResourceNameForColorGradeKind:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PXStoryConcreteColorGradingRepository configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_cachedColorLookupCubeForColorGradeKind:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[PXStoryConcreteColorGradingRepository colorLookupCubeCache](self, "colorLookupCubeCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 < 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[PXStoryConcreteColorGradingRepository _createColorLookupCubeForColorGradeKind:](self, "_createColorLookupCubeForColorGradeKind:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v9;
    if (v9)
      v10 = (void *)v9;
    else
      v10 = v7;
    objc_msgSend(v5, "setObject:forKey:", v10, v6);
  }
  if (v8 == v7)
  {

    v8 = 0;
  }

  return v8;
}

- (id)_createColorLookupCubeForColorGradeKind:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PXStoryConcreteColorGradingRepository _cubeResourceNameForColorGradeKind:](self, "_cubeResourceNameForColorGradeKind:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXStoryConcreteColorGradingRepository _createCustomColorLookupCubeForResourceName:](self, "_createCustomColorLookupCubeForResourceName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLForResource:withExtension:subdirectory:", v5, CFSTR("zcube"), CFSTR("Grades"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v18 = 0;
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v8, 1, &v18);
        v10 = v18;
        if (v9)
        {
          v17 = v10;
          objc_msgSend(MEMORY[0x1E0D75350], "decompressData:options:error:", v9, 0, &v17);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = v17;

          if (v11)
          {
            v6 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B2D78), "initWithData:edgeSize:pixelFormat:", v11, llround(cbrt((double)((unint64_t)-[NSObject length](v11, "length") >> 2))), 70);
            if (!v6)
            {
              PXAssertGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v20 = v5;
                v21 = 2112;
                v22 = v12;
                _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "failed to create color cube for resource %@: %@", buf, 0x16u);
              }

            }
            PLStoryGetLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v8, "lastPathComponent");
              v15 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v20 = v5;
              v21 = 2114;
              v22 = v15;
              _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_INFO, "Color cube for grade '%{public}@' loaded from resource: %{public}@", buf, 0x16u);

            }
          }
          else
          {
            PXAssertGetLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v20 = v5;
              v21 = 2112;
              v22 = v12;
              _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "failed to decompress data for color cube resource %@: %@", buf, 0x16u);
            }
            v6 = 0;
          }

        }
        else
        {
          PXAssertGetLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v20 = v5;
            v21 = 2112;
            v22 = v10;
            _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "failed to read compressed data for color cube resource %@: %@", buf, 0x16u);
          }
          v6 = 0;
          v12 = v10;
        }

      }
      else
      {
        if ((unint64_t)a3 < 2)
        {
          v6 = 0;
LABEL_27:

          goto LABEL_28;
        }
        PXAssertGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v5;
          _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "couldn't find color cube resource %@", buf, 0xCu);
        }
        v6 = 0;
      }

      goto LABEL_27;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_28:

  return v6;
}

- (id)_createCustomColorLookupCubeForResourceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  double v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  float v18;
  float v19;
  uint64_t v20;
  uint64_t v22;
  NSObject *v23;
  double v24;
  _BYTE v26[24];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryConcreteColorGradingRepository _loadCustomColorLookupCubeForResourceName:](self, "_loadCustomColorLookupCubeForResourceName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_23;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorGradeBlendingFactor");
  if (v7 != 0.0)
  {
    v8 = v7;
    -[PXStoryConcreteColorGradingRepository _loadCustomColorLookupCubeForResourceName:](self, "_loadCustomColorLookupCubeForResourceName:", CFSTR("neutral"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      *(float *)&v10 = v8;
      v11 = objc_msgSend(v5, "blendWithCube:factor:", v9, v10);
      PLStoryGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v26 = 138543618;
          *(_QWORD *)&v26[4] = v4;
          *(_WORD *)&v26[12] = 2048;
          *(double *)&v26[14] = v8;
          v14 = "Blended color cube '%{public}@' with neutral LUT with factor: %0.01f";
          v15 = v13;
          v16 = OS_LOG_TYPE_INFO;
          v17 = 22;
LABEL_12:
          _os_log_impl(&dword_1A6789000, v15, v16, v14, v26, v17);
        }
LABEL_13:

        goto LABEL_14;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v4;
      v14 = "Failed to blend color cube '%{public}@' with neutral LUT: size mismatch";
    }
    else
    {
      PLStoryGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v4;
      v14 = "Failed to blend color cube '%{public}@' with neutral LUT: failed to load neutral LUT";
    }
    v15 = v13;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 12;
    goto LABEL_12;
  }
LABEL_14:
  objc_msgSend(v6, "colorGradeSmoothingFactor", *(_OWORD *)v26, *(_QWORD *)&v26[16]);
  v19 = v18;
  v20 = objc_msgSend(v6, "colorGradeSmoothingPasses");
  if (v19 != 0.0 && v20 >= 1)
  {
    v22 = v20;
    PLStoryGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v26 = 138543874;
      *(_QWORD *)&v26[4] = v4;
      *(_WORD *)&v26[12] = 2048;
      *(double *)&v26[14] = v19;
      *(_WORD *)&v26[22] = 2048;
      v27 = v22;
      _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_INFO, "Smoothing color cube '%{public}@' with factor: %0.2f, %ld passes", v26, 0x20u);
    }

    do
    {
      *(float *)&v24 = v19;
      objc_msgSend(v5, "smoothWithFactor:", v24);
      --v22;
    }
    while (v22);
  }
  -[PXStoryConcreteColorGradingRepository _writeTemporaryFileWithCompressedColorCube:forResourceName:](self, "_writeTemporaryFileWithCompressedColorCube:forResourceName:", v5, v4);

LABEL_23:
  return v5;
}

- (id)_loadCustomColorLookupCubeForResourceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D73208], "defaultSystemPhotoDataDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("Grades"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathExtension:", CFSTR("cube"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v10, 1, &v28);
  v12 = v28;
  if (!v11)
  {
    objc_msgSend(v8, "URLByAppendingPathComponent:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathExtension:", CFSTR("cube.zz"));
    v16 = objc_claimAutoreleasedReturnValue();

    v26 = v12;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v16, 1, &v26);
    v14 = v26;

    if (v17)
    {
      v25 = v14;
      objc_msgSend(MEMORY[0x1E0D75350], "decompressData:options:error:", v17, 0, &v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25;

      if (v11)
      {
        v24 = v19;
        v13 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B29E8), "initWithData:format:error:", v11, 1, &v24);
        v14 = v24;

        if (!v13)
        {
          PXAssertGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v30 = v3;
            v31 = 2112;
            v32 = v14;
            _os_log_error_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "failed to create color cube for resource %@: %@", buf, 0x16u);
          }

        }
        PLStoryGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          -[NSObject path](v16, "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v3;
          v31 = 2114;
          v32 = v22;
          _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_INFO, "Color cube for grade '%{public}@' loaded from on-device file at %{public}@", buf, 0x16u);

        }
      }
      else
      {
        v13 = 0;
        v14 = v19;
      }
    }
    else
    {
      v11 = 0;
      v13 = 0;
    }
    goto LABEL_19;
  }
  v27 = v12;
  v13 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B29E8), "initWithData:format:error:", v11, 1, &v27);
  v14 = v27;

  if (!v13)
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v3;
      v31 = 2112;
      v32 = v14;
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "failed to create color cube for resource %@: %@", buf, 0x16u);
    }

  }
  PLStoryGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v3;
    v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_INFO, "Color cube for grade '%{public}@' loaded from uncompressed on-device file at %{public}@", buf, 0x16u);
LABEL_19:

  }
  return v13;
}

- (void)_writeTemporaryFileWithCompressedColorCube:(id)a3 forResourceName:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "textureData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    NSTemporaryDirectory();
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "stringByAppendingString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("scube"));
    v9 = objc_claimAutoreleasedReturnValue();

    v21 = 0;
    LOBYTE(v7) = objc_msgSend(v6, "writeToFile:options:error:", v9, 1, &v21);
    v10 = v21;
    if ((v7 & 1) != 0)
    {
      PLStoryGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v9;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_INFO, "uncompressed color cube written to %@", buf, 0xCu);
      }
    }
    else
    {
      PXAssertGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v10;
        _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "failed to write uncompressed data: %@", buf, 0xCu);
      }
    }

    v20 = v10;
    objc_msgSend(MEMORY[0x1E0D75350], "compressData:options:error:", v6, 0, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;

    if (v13)
    {
      NSTemporaryDirectory();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingString:", v5);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v16, "stringByAppendingPathExtension:", CFSTR("zcube"));
      v17 = objc_claimAutoreleasedReturnValue();

      v19 = v14;
      LOBYTE(v16) = objc_msgSend(v13, "writeToFile:options:error:", v17, 1, &v19);
      v12 = v19;

      if ((v16 & 1) != 0)
      {
        PLStoryGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v17;
          _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_INFO, "compressed color cube written to %@", buf, 0xCu);
        }
      }
      else
      {
        PXAssertGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v12;
          _os_log_error_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "failed to write compressed data: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      PXAssertGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_error_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "failed to compress data: %@", buf, 0xCu);
      }
      v12 = v14;
    }

  }
  else
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = 0;
      _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "failed to read uncompressed data: %@", buf, 0xCu);
    }
  }

}

- (int64_t)colorGradeKindForColorGradeCategory:(id)a3
{
  return -[PXStoryConcreteColorGradingRepository colorGradeKindForColorGradeCategory:excludingKinds:](self, "colorGradeKindForColorGradeCategory:excludingKinds:", a3, 0);
}

- (int64_t)colorGradeKindForColorGradeCategory:(id)a3 excludingKinds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t i;
  unint64_t j;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  PXStoryConcreteColorGradingRepository *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v23 = self;
    -[PXStoryConcreteColorGradingRepository configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v9 = 0;
      v10 = 1;
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isAutoSelectable"))
        {
          objc_msgSend(v11, "categories");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v9 <= v13)
            v9 = v13;
        }

        ++v10;
      }
      while (v10 < objc_msgSend(v8, "count"));
      if (v9 >= 1)
      {
        for (i = 0; i != v9; ++i)
        {
          if ((unint64_t)objc_msgSend(v8, "count") >= 2)
          {
            for (j = 1; j < objc_msgSend(v8, "count"); ++j)
            {
              objc_msgSend(v8, "objectAtIndexedSubscript:", j);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "isAutoSelectable"))
              {
                objc_msgSend(v16, "categories");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v17, "count") > i)
                {
                  objc_msgSend(v17, "objectAtIndexedSubscript:", i);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v6, "isEqualToString:", v18);

                  if (v19)
                  {
                    if (!objc_msgSend(v7, "containsIndex:", j))
                    {

                      goto LABEL_28;
                    }
                  }
                }

              }
            }
          }
        }
      }
    }
    PLStoryGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "no color grade kind found for '%@' excluding %@", buf, 0x16u);
    }

    if (objc_msgSend(v7, "count"))
    {
      PLStoryGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEFAULT, "trying to find color grade kind for '%@', ignoring exclusion list", buf, 0xCu);
      }

      j = -[PXStoryConcreteColorGradingRepository colorGradeKindForColorGradeCategory:excludingKinds:](v23, "colorGradeKindForColorGradeCategory:excludingKinds:", v6, 0);
    }
    else
    {
      j = 1;
    }
LABEL_28:

  }
  else
  {
    j = 1;
  }

  return j;
}

- (id)localizedTitleForColorGradeKind:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  if ((unint64_t)a3 >= 2
    && (-[PXStoryConcreteColorGradingRepository configuration](self, "configuration"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectAtIndexedSubscript:", a3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    objc_msgSend(v5, "resource");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("None");
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("InteractiveMemoryFilter_%@"), v6);
  PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)supportedColorGradeKinds
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[PXStoryConcreteColorGradingRepository configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
  {
    v6 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      ++v6;
      -[PXStoryConcreteColorGradingRepository configuration](self, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

    }
    while (v6 < v9);
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (id)supportedUserPickableColorGradeKinds
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[PXStoryConcreteColorGradingRepository configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v5 = 1;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isUserSelectable"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v7);

      }
      ++v5;
    }
    while (v5 < objc_msgSend(v4, "count"));
  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)colorLookupCubeForColorGradeKind:(int64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  -[PXStoryConcreteColorGradingRepository log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StoryColorLookupCubeForKind", ", buf, 2u);
  }

  -[PXStoryConcreteColorGradingRepository _cachedColorLookupCubeForColorGradeKind:](self, "_cachedColorLookupCubeForColorGradeKind:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_END, v6, "StoryColorLookupCubeForKind", ", v13, 2u);
  }

  return v9;
}

- (unint64_t)minimumCategoryKindFallbacks
{
  return 3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSCache)colorLookupCubeCache
{
  return self->_colorLookupCubeCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorLookupCubeCache, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E5147B18;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v5 = v3;
  v7 = v5;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "scheduleTaskWithQoS:block:", 0, v6);

  objc_destroyWeak(&v9);
}

uint64_t __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t result;
  uint8_t v6[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_END, v4, "StoryColorLookupCubePreloading", ", v6, 2u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __78__PXStoryConcreteColorGradingRepository_startPreloadingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  id v6;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "colorGradeKindForColorGradeCategory:", *(_QWORD *)(a1 + 32));

  v5 = objc_loadWeakRetained(v2);
  v6 = (id)objc_msgSend(v5, "colorLookupCubeForColorGradeKind:", v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

@end
