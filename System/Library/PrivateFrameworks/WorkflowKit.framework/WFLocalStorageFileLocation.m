@implementation WFLocalStorageFileLocation

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  void *v5;
  char v6;

  objc_msgSend(a4, "providerDomainID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

  return v6;
}

+ (id)subpathFromURL:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___WFLocalStorageFileLocation;
  objc_msgSendSuper2(&v4, sel_subpathFromURL_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)subpathFromURL:(id)a3 item:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  unint64_t v27;

  v5 = a3;
  v6 = a4;
  +[WFFileLocationUtilities parentItemsForItem:](WFFileLocationUtilities, "parentItemsForItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count")
    || (objc_msgSend(v6, "itemIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CAABA0]),
        v8,
        (v9 & 1) == 0))
  {
    objc_msgSend(v5, "pathComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reverseObjectEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v5, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayWithObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v18 = objc_msgSend(v14, "count") - 1;
      v19 = objc_msgSend(v7, "count") - 1;
      if (v18 < v19)
        v19 = v18;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __50__WFLocalStorageFileLocation_subpathFromURL_item___block_invoke;
      v24[3] = &unk_1E7AEA1A0;
      v27 = v19;
      v25 = v7;
      v20 = v17;
      v26 = v20;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
      objc_msgSend(v20, "reverseObjectEnumerator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("/"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = &stru_1E7AFA810;
  }

  return v10;
}

void __50__WFLocalStorageFileLocation_subpathFromURL_item___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v7 = a2;
  if (*(_QWORD *)(a1 + 48) >= a3)
  {
    v12 = v7;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CAABA0]);

    if (v10)
    {
      *a4 = 1;
    }
    else
    {
      objc_msgSend(v8, "filename");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v11))
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
      else
        *a4 = 1;

    }
    v7 = v12;
  }
  else
  {
    *a4 = 1;
  }

}

- (BOOL)isSupportedOnCurrentPlatform
{
  return 1;
}

- (id)resolveLocationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFFileProviderLocation resolveCrossDeviceItemIDWithError:](self, "resolveCrossDeviceItemIDWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[WFFileProviderLocation appContainerBundleIdentifier](self, "appContainerBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WFFileProviderLocation appContainerBundleIdentifier](self, "appContainerBundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFFileLocationUtilities documentsURLForApplicationContainerBundleID:](WFFileLocationUtilities, "documentsURLForApplicationContainerBundleID:", v6);
    }
    else
    {
      -[WFFileProviderLocation fileProviderDomainID](self, "fileProviderDomainID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFFileLocationUtilities fetchRootItemURLForDomainWithID:](WFFileLocationUtilities, "fetchRootItemURLForDomainWithID:", v6);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WFFileLocation relativeSubpath](self, "relativeSubpath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  return 1;
}

@end
