@implementation WFShortcutsFileLocation

- (id)resolveLocationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[WFFileStorageUtilities documentsDirectoryWithError:](WFFileStorageUtilities, "documentsDirectoryWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFileLocation relativeSubpath](self, "relativeSubpath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)locationAtRootDirectory
{
  return -[WFFileLocation initWithRelativeSubpath:]([WFShortcutsFileLocation alloc], "initWithRelativeSubpath:", &stru_1E7AFA810);
}

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  +[WFFileStorageUtilities documentsDirectoryWithError:](WFFileStorageUtilities, "documentsDirectoryWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "wf_relationshipToDirectoryAtURL:", v6);

  return v7 < 2;
}

+ (id)subpathFromURL:(id)a3 item:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[WFFileStorageUtilities documentsDirectoryWithError:](WFFileStorageUtilities, "documentsDirectoryWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_relativePathFromURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
