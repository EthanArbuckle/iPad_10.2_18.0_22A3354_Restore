@implementation PUVideoComplementItemSource

- (id)_initWithVideoComplement:(id)a3 bundleAtURL:(id)a4
{
  id v6;
  id v7;
  PUVideoComplementItemSource *v8;
  PUVideoComplementItemSource *v9;
  void **p_bundleURL;
  PFVideoComplement *v11;
  PFVideoComplement *videoComplement;
  id *p_videoComplement;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PUVideoComplementItemSource;
  v8 = -[PUVideoComplementItemSource init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    p_bundleURL = (void **)&v8->_bundleURL;
    objc_storeStrong((id *)&v8->_bundleURL, a4);
    v11 = v6
        ? (PFVideoComplement *)v6
        : (PFVideoComplement *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v7);
    p_videoComplement = (id *)&v9->_videoComplement;
    videoComplement = v9->_videoComplement;
    v9->_videoComplement = v11;

    if (!*p_bundleURL)
    {
      if (*p_videoComplement)
      {
        objc_msgSend(*p_videoComplement, "imagePath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByDeletingLastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pathExtension");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D75488]);

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, 1);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *p_bundleURL;
          *p_bundleURL = (void *)v18;

        }
      }
    }
  }

  return v9;
}

- (PUVideoComplementItemSource)initWithVideoComplementBundleAtURL:(id)a3
{
  return (PUVideoComplementItemSource *)-[PUVideoComplementItemSource _initWithVideoComplement:bundleAtURL:](self, "_initWithVideoComplement:bundleAtURL:", 0, a3);
}

- (PUVideoComplementItemSource)initWithVideoComplement:(id)a3
{
  return (PUVideoComplementItemSource *)-[PUVideoComplementItemSource _initWithVideoComplement:bundleAtURL:](self, "_initWithVideoComplement:bundleAtURL:", a3, 0);
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier", a3, a4);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  NSURL *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Photos.activity.saveToCameraRoll"))
    || (v6 = self->_videoComplement) == 0)
  {
    if (+[PUActivityItemSourceConfiguration isLivePhotoBundleSupportedByActivityType:](PUActivityItemSourceConfiguration, "isLivePhotoBundleSupportedByActivityType:", v5))
    {
      v6 = self->_bundleURL;
    }
    else
    {
      v6 = 0;
    }
  }
  -[PFVideoComplement imagePath](self->_videoComplement, "imagePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DA0]))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v7, 1, 0);
      if (!v8)
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v7);
      v9 = (void *)MEMORY[0x1E0D752F0];
      objc_msgSend(v7, "pathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "typeWithFilenameExtension:conformingToType:", v10, *MEMORY[0x1E0CEC520]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = 0;
      if (v8 && v11)
      {
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12;
        v15[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
        v6 = (NSURL *)objc_claimAutoreleasedReturnValue();

      }
      if (v6)
        goto LABEL_18;
    }
    else
    {
      v6 = 0;
    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
      v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_18:

  return v6;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CGRect v17;
  CGRect v18;

  height = a5.height;
  width = a5.width;
  -[PFVideoComplement imagePath](self->_videoComplement, "imagePath", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithContentsOfFile:", v7);
  objc_msgSend(v8, "size");
  v17.origin.x = PURectWithAspectRatioFillingRect(v9 / v10, 0.0, 0.0, width, height);
  v18 = CGRectIntegral(v17);
  v11 = v18.size.width;
  v12 = v18.size.height;
  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v18.origin.x = v18.size.width;
  v18.origin.y = v18.size.height;
  UIGraphicsBeginImageContextWithOptions((CGSize)v18.origin, 1, 0.0);
  objc_msgSend(v8, "drawInRect:", v13, v14, v11, v12);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)activityViewControllerSubject:(id)a3
{
  void *v3;
  void *v4;

  -[PFVideoComplement imagePath](self->_videoComplement, "imagePath", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)activityViewControllerSuggestionFileURL:(id)a3
{
  return self->_bundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoComplement, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end
