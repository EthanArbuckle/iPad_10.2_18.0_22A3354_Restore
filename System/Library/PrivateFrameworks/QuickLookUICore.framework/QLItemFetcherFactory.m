@implementation QLItemFetcherFactory

+ (id)fetcherForPreviewItem:(id)a3
{
  id v3;
  QLDataFetcher *v4;
  _BOOL8 v5;
  void *v6;
  QLUbiquitousItemFetcher *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  QLUbiquitousItemFetcher *v11;
  void *v13;
  QLDataFetcher *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  QLDataFetcher *v20;
  void *v21;
  QLItemProviderFetcher *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  QLSpotlightFetcher *v28;
  void *v29;
  QLFPItemFetcher *v30;
  NSObject *v31;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isPromisedItem") & 1) == 0)
  {
    v5 = objc_msgSend(v3, "previewItemType") == 6 || objc_msgSend(v3, "previewItemType") == 4;
    objc_msgSend(v3, "sandboxingURLWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [QLUbiquitousItemFetcher alloc];
      objc_msgSend(v3, "sandboxingURLWrapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[QLUbiquitousItemFetcher initWithSandboxingURLWrapper:shouldZipPackageIfNeeded:](v7, "initWithSandboxingURLWrapper:shouldZipPackageIfNeeded:", v8, v5);
      goto LABEL_10;
    }
    objc_msgSend(v3, "previewItemURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [QLUbiquitousItemFetcher alloc];
      objc_msgSend(v3, "previewItemURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[QLUbiquitousItemFetcher initWithURL:shouldZipPackageIfNeeded:](v11, "initWithURL:shouldZipPackageIfNeeded:", v8, v5);
      goto LABEL_10;
    }
    objc_msgSend(v3, "previewItemData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = [QLDataFetcher alloc];
      objc_msgSend(v3, "previewItemData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "previewItemContentType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "previewItemTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[QLDataFetcher initWithData:contentType:previewItemTitle:](v14, "initWithData:contentType:previewItemTitle:", v15, v16, v17);
    }
    else
    {
      objc_msgSend(v3, "previewItemDataProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = [QLDataFetcher alloc];
        objc_msgSend(v3, "previewItemContentType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = -[QLDataFetcher initWithItem:contentType:](v20, "initWithItem:contentType:", v3, v15);
        goto LABEL_19;
      }
      objc_msgSend(v3, "previewItemProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = [QLItemProviderFetcher alloc];
        objc_msgSend(v3, "previewItemContentType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "itemSize");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = -[QLItemProviderFetcher initWithContentType:fileSize:](v22, "initWithContentType:fileSize:", v23, v24);

        objc_msgSend(v3, "previewItemProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLDataFetcher setItemProvider:](v4, "setItemProvider:", v15);
        goto LABEL_19;
      }
      objc_msgSend(v3, "searchableItemIdentifier");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25
        || (v26 = (void *)v25,
            objc_msgSend(v3, "searchableItemApplicationBundleIdentifier"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v27,
            v26,
            !v27))
      {
        objc_msgSend(v3, "fpItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          QLSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v32 = 138412290;
            v33 = v3;
            _os_log_impl(&dword_1D936E000, v31, OS_LOG_TYPE_DEBUG, "No fetcher available for item: %@ #PreviewItem", (uint8_t *)&v32, 0xCu);
          }

          goto LABEL_2;
        }
        v30 = [QLFPItemFetcher alloc];
        objc_msgSend(v3, "fpItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[QLFPItemFetcher initWithFPItem:shouldZipPackageIfNeeded:](v30, "initWithFPItem:shouldZipPackageIfNeeded:", v8, v5);
LABEL_10:
        v4 = (QLDataFetcher *)v9;

        goto LABEL_11;
      }
      v28 = [QLSpotlightFetcher alloc];
      objc_msgSend(v3, "searchableItemIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "spotlightQueryString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "searchableItemApplicationBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[QLSpotlightFetcher initWithSearchableItemUniqueIdentifier:queryString:applicationBundleIdentifier:](v28, "initWithSearchableItemUniqueIdentifier:queryString:applicationBundleIdentifier:", v15, v16, v17);
    }
    v4 = (QLDataFetcher *)v18;

LABEL_19:
    goto LABEL_11;
  }
LABEL_2:
  v4 = 0;
LABEL_11:

  return v4;
}

+ (id)possibleFetcherClasses
{
  if (possibleFetcherClasses_onceToken != -1)
    dispatch_once(&possibleFetcherClasses_onceToken, &__block_literal_global);
  return (id)possibleFetcherClasses__possibleFetcherClasses;
}

void __46__QLItemFetcherFactory_possibleFetcherClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)possibleFetcherClasses__possibleFetcherClasses;
  possibleFetcherClasses__possibleFetcherClasses = v4;

}

@end
