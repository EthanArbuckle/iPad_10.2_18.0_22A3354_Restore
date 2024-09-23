@implementation WFDownloadsFileLocation

- (BOOL)isSupportedOnCurrentPlatform
{
  return 1;
}

- (id)resolveLocationWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFDownloadsFileLocation;
  -[WFFileProviderLocation resolveCrossDeviceItemIDWithError:](&v11, sel_resolveCrossDeviceItemIDWithError_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[WFFileLocationUtilities iCloudDownloadsDirectory](WFFileLocationUtilities, "iCloudDownloadsDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFileLocation relativeSubpath](self, "relativeSubpath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
      v9 = v6;

  }
  return v6;
}

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUbiquitousItemAtURL:", v4);

  return v6 ^ 1;
}

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  if (!a4)
    return 0;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObject:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = +[WFFileLocationUtilities isFileURL:withParentItems:insideFolderType:](WFFileLocationUtilities, "isFileURL:withParentItems:insideFolderType:", v9, v11, 2);
  return (char)v10;
}

+ (id)subpathFromURL:(id)a3 item:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[WFFileLocationUtilities downloadsDirectory](WFFileLocationUtilities, "downloadsDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_relativePathFromURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
