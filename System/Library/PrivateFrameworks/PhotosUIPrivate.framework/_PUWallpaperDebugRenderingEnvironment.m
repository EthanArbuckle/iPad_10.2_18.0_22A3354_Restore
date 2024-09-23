@implementation _PUWallpaperDebugRenderingEnvironment

- (_PUWallpaperDebugRenderingEnvironment)initWithPosterConfiguration:(id)a3 assetDirectory:(id)a4
{
  id v7;
  id v8;
  _PUWallpaperDebugRenderingEnvironment *v9;
  _PUWallpaperDebugRenderingEnvironment *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  id v23;
  NSURL *v24;
  NSObject *p_super;
  id v27;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_PUWallpaperDebugRenderingEnvironment;
  v9 = -[_PUWallpaperDebugRenderingEnvironment init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_posterConfiguration, a3);
    if (v8)
    {
      v11 = v8;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileURLWithPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("PhotosPosterRendering"));
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "media");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "assetUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v15, "fileExistsAtPath:", v20);

    if ((v17 & 1) != 0)
    {
      v21 = 0;
    }
    else
    {
      v28 = 0;
      objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v28);
      v21 = v28;
    }
    v27 = v21;
    v22 = objc_msgSend(v7, "saveToURL:error:", v11, &v27);
    v23 = v27;

    if (v22)
    {
      v24 = (NSURL *)v11;
      p_super = &v10->_assetDirectory->super;
      v10->_assetDirectory = v24;
    }
    else
    {
      PLWallpaperGetLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v23;
        _os_log_impl(&dword_1AAB61000, p_super, OS_LOG_TYPE_ERROR, "Failed to store playground configuration: %@", buf, 0xCu);
      }
    }

  }
  return v10;
}

- (int64_t)px_backlightLuminance
{
  return -1;
}

- (BOOL)px_isPlayground
{
  return 1;
}

- (BOOL)px_isCallServices
{
  return 0;
}

- (int64_t)px_boundingShape
{
  return -1;
}

- (int64_t)px_contentsType
{
  return 2;
}

- (CGRect)px_floatingObscurableBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)px_deviceOrientation
{
  return 0;
}

- (CGRect)px_titleBoundsForLayout:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (PFPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (BOOL)px_isSnapshot
{
  return self->_px_snapshot;
}

- (BOOL)px_isPreview
{
  return self->_px_preview;
}

- (unint64_t)px_significantEventsCounter
{
  return self->_px_significantEventsCounter;
}

- (void)setPx_significantEventsCounter:(unint64_t)a3
{
  self->_px_significantEventsCounter = a3;
}

- (NSURL)assetDirectory
{
  return self->_assetDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDirectory, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
}

@end
