@implementation WFDocumentFileLocation

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v15 = a4;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v8, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = +[WFFileLocationUtilities isFileURL:withParentItems:insideFolderType:](WFFileLocationUtilities, "isFileURL:withParentItems:insideFolderType:", v10, v12, 1);
  return v13;
}

+ (id)subpathFromURL:(id)a3 item:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[WFFileLocationUtilities documentsDirectory](WFFileLocationUtilities, "documentsDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_relativePathFromURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isSupportedOnCurrentPlatform
{
  return 1;
}

- (id)resolveLocationWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[WFFileProviderLocation resolveCrossDeviceItemIDWithError:](self, "resolveCrossDeviceItemIDWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "wf_fileExists"))
  {
    v5 = v4;
  }
  else
  {
    +[WFFileLocationUtilities documentsDirectory](WFFileLocationUtilities, "documentsDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFileLocation relativeSubpath](self, "relativeSubpath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v5 = v8;
    }
    else
    {
      -[WFFileProviderLocation fileProviderDomainID](self, "fileProviderDomainID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFFileLocation relativeSubpath](self, "relativeSubpath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFiCloudFileLocation resolveLocationFromPossibleProviderDomainIDsWithSerializedProviderDomainID:relativeSubpath:](WFiCloudFileLocation, "resolveLocationFromPossibleProviderDomainIDsWithSerializedProviderDomainID:relativeSubpath:", v9, v10);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
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

@end
