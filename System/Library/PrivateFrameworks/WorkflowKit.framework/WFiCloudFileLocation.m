@implementation WFiCloudFileLocation

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getWFFilesLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "providerDomainID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "providerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315650;
    v16 = "+[WFiCloudFileLocation canRepresentURL:item:parentItems:]";
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s Evaluating item with provider domain id: %@ && provider id %@", (uint8_t *)&v15, 0x20u);

  }
  WFPossibleMobileDocumentsFileProviderDomainIDs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerDomainID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v10) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    WFPossibleMobileDocumentsFileProviderDomainIDs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "providerID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "containsObject:", v13);

  }
  return v11;
}

+ (id)subpathFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[WFFileLocationUtilities mobileDocumentsDirectory](WFFileLocationUtilities, "mobileDocumentsDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wf_relativePathFromURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)resolveLocationFromPossibleProviderDomainIDsWithSerializedProviderDomainID:(id)a3 relativeSubpath:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  char v9;
  __CFString *v10;
  __CFString *v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  char v15;
  __CFString *v16;
  __CFString *v17;
  char v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  const __CFString *v26;
  void *v28;

  v5 = a3;
  v6 = a4;
  v7 = (__CFString *)v5;
  v8 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
  if (v7 == CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"))
    goto LABEL_11;
  if (!v7)
  {

    v23 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
    v24 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged");

    v19 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
    v25 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
    v22 = 0;
    goto LABEL_20;
  }
  v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));

  if ((v9 & 1) != 0)
  {
LABEL_12:
    +[WFFileLocationUtilities fetchRootItemURLForDomainWithID:](WFFileLocationUtilities, "fetchRootItemURLForDomainWithID:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "URLByAppendingPathComponent:", v6);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((-[__CFString wf_fileExists](v19, "wf_fileExists") & 1) != 0)
        goto LABEL_14;

    }
    v26 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
    goto LABEL_18;
  }
  v10 = v7;
  v11 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
  if (v10 == CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"))
  {
LABEL_11:

    goto LABEL_12;
  }
  v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));

  if ((v12 & 1) != 0)
    goto LABEL_12;
  v13 = v10;
  v14 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged");
  if (v13 == CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"))
    goto LABEL_24;
  v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

  if ((v15 & 1) != 0)
  {
LABEL_25:
    +[WFFileLocationUtilities fetchRootItemURLForDomainWithID:](WFFileLocationUtilities, "fetchRootItemURLForDomainWithID:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v28;
    if (!v28)
    {
LABEL_28:
      v26 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
LABEL_18:
      +[WFFileLocationUtilities fetchRootItemURLForDomainWithID:](WFFileLocationUtilities, "fetchRootItemURLForDomainWithID:", v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
LABEL_21:
        v19 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v22, "URLByAppendingPathComponent:", v6);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((-[__CFString wf_fileExists](v19, "wf_fileExists") & 1) == 0)
      {
LABEL_20:

        goto LABEL_21;
      }
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v28, "URLByAppendingPathComponent:", v6);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString wf_fileExists](v19, "wf_fileExists") & 1) == 0)
    {

      goto LABEL_28;
    }
LABEL_14:
    v22 = v21;
    goto LABEL_22;
  }
  v16 = v13;
  v17 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
  if (v16 == CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"))
  {
LABEL_24:

    goto LABEL_25;
  }
  v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));

  if ((v18 & 1) != 0)
    goto LABEL_25;
  v19 = 0;
LABEL_23:

  return v19;
}

- (id)resolveLocationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFFileProviderLocation resolveCrossDeviceItemIDWithError:](self, "resolveCrossDeviceItemIDWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[WFFileLocationUtilities mobileDocumentsDirectory](WFFileLocationUtilities, "mobileDocumentsDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFileLocation relativeSubpath](self, "relativeSubpath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v7 = (void *)objc_opt_class();
      -[WFFileProviderLocation fileProviderDomainID](self, "fileProviderDomainID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFFileLocation relativeSubpath](self, "relativeSubpath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resolveLocationFromPossibleProviderDomainIDsWithSerializedProviderDomainID:relativeSubpath:", v8, v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

@end
