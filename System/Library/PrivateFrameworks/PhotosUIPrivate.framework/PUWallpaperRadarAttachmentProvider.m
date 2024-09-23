@implementation PUWallpaperRadarAttachmentProvider

- (PUWallpaperRadarAttachmentProvider)initWithSuggestion:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  PUWallpaperRadarAttachmentProvider *v9;
  PUWallpaperRadarAttachmentProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUWallpaperRadarAttachmentProvider;
  v9 = -[PUWallpaperRadarAttachmentProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
  }

  return v10;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[PUWallpaperRadarAttachmentProvider suggestion](self, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generateDebugDescriptionForSuggestion:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addAttachment:", v7);
}

- (PHSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

+ (id)generateDebugDescriptionForSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Suggestion-%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v20);
  v11 = v20;

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v3, "debugDescription");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("suggestion_debug_information.txt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v15 = -[NSObject writeToURL:atomically:encoding:error:](v12, "writeToURL:atomically:encoding:error:", v14, 1, 4, &v19);
    v16 = v19;
    if ((v15 & 1) == 0)
    {
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v4;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "Failed saving Suggestion<%@> description. Error: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Failed creating temp directory for Suggestion TTR. Error: %@", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)radarConfigurationForAsset:(id)a3 suggestion:(id)a4 compoundLayerStack:(id)a5 segmentationItem:(id)a6 posterDescriptor:(id)a7 posterConfiguration:(id)a8 component:(int64_t)a9 completionHandler:(id)a10
{
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PUParallaxLayerStackRadarController *v23;
  PUWallpaperRadarAttachmentProvider *v24;
  PUWallpaperVisualDiagnosticsProvider *v25;
  id v27;
  id v28;

  v16 = (objc_class *)MEMORY[0x1E0D7B878];
  v17 = a10;
  v28 = a8;
  v27 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = objc_alloc_init(v16);
  objc_msgSend(v22, "setComponent:", a9);
  objc_msgSend(v22, "setClassification:", 7);
  objc_msgSend(v22, "setWantsPhotosDiagnostics:", 1);
  objc_msgSend(v22, "setTitle:", CFSTR("[Maglev] This wallpaper could be better"));
  objc_msgSend(v22, "setDescription:", CFSTR("Please describe how the wallpaper could be better:"));
  objc_msgSend(v22, "setCompletionHandler:", v17);

  v23 = -[PUParallaxLayerStackRadarController initWithAsset:compoundLayerStack:segmentationItem:posterDescriptor:posterConfiguration:]([PUParallaxLayerStackRadarController alloc], "initWithAsset:compoundLayerStack:segmentationItem:posterDescriptor:posterConfiguration:", v21, v19, v18, v27, v28);
  objc_msgSend(v22, "addDiagnosticProvider:", v23);
  v24 = -[PUWallpaperRadarAttachmentProvider initWithSuggestion:asset:]([PUWallpaperRadarAttachmentProvider alloc], "initWithSuggestion:asset:", v20, v21);
  objc_msgSend(v22, "addDiagnosticProvider:", v24);
  v25 = -[PUWallpaperVisualDiagnosticsProvider initWithSuggestion:asset:]([PUWallpaperVisualDiagnosticsProvider alloc], "initWithSuggestion:asset:", v20, v21);

  objc_msgSend(v22, "addDiagnosticProvider:", v25);
  return v22;
}

@end
