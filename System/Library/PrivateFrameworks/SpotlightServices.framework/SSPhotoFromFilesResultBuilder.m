@implementation SSPhotoFromFilesResultBuilder

+ (id)bundleId
{
  if (isMacOS())
    return CFSTR("com.apple.spotlight.syndicatedPhotos.fileProvider");
  else
    return 0;
}

+ (BOOL)supportsResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "contentType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isImageOrVideoContentType((uint64_t)v5);

  }
  return 0;
}

+ (BOOL)isCoreSpotlightResult
{
  return isMacOS() ^ 1;
}

- (SSPhotoFromFilesResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSPhotoFromFilesResultBuilder *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSPhotoFromFilesResultBuilder;
  v5 = -[SSPhotosResultBuilder initWithResult:](&v10, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6108], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setFilePath:](v5, "setFilePath:", v6);

    -[SSResultBuilder filePath](v5, "filePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      SSGeneralLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SSPhotoFromFilesResultBuilder initWithResult:].cold.1(v5, v8);

    }
  }

  return v5;
}

- (id)appBundleId
{
  return CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
}

- (id)buildThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[SSResultBuilder filePath](self, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)MEMORY[0x1E0C99E98];
    -[SSResultBuilder filePath](self, "filePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilePath:", v7);

    return v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSPhotoFromFilesResultBuilder;
    -[SSPhotosResultBuilder buildThumbnail](&v9, sel_buildThumbnail);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)buildPreviewCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[SSResultBuilder filePath](self, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)MEMORY[0x1E0D8C5E0];
    v6 = (void *)MEMORY[0x1E0C99E98];
    -[SSResultBuilder filePath](self, "filePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:isDirectory:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "punchoutWithURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPhotoFilePunchout:", v9);

    -[SSPhotosResultBuilder scenes](self, "scenes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMatchedScenes:", v10);

    return v4;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SSPhotoFromFilesResultBuilder;
    -[SSResultBuilder buildPreviewCommand](&v12, sel_buildPreviewCommand);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhotoFilePunchout:", v6);

  -[SSPhotosResultBuilder scenes](self, "scenes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMatchedScenes:", v7);

  return v5;
}

- (void)initWithResult:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_ERROR, "SSPhotoFromFilesResultBuilder: missing filePath for result:%@", (uint8_t *)&v4, 0xCu);

}

@end
