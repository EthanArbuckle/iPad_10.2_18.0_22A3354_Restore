@implementation PXExportContainer

- (id)_initWithCollection:(id)a3
{
  id v5;
  PXExportContainer *v6;
  PXExportContainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXExportContainer;
  v6 = -[PXExportContainer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collection, a3);

  return v7;
}

- (PXExportContainer)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containersForRootCollection_destinationURL_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExportContainer.m"), 98, CFSTR("Use class factory method %@"), v5);

  return 0;
}

- (PHFetchResult)assets
{
  void *v3;

  if (-[PHCollection canContainAssets](self->_collection, "canContainAssets"))
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", self->_collection, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PHFetchResult *)v3;
}

- (NSString)localizedTitle
{
  return -[PHCollection localizedTitle](self->_collection, "localizedTitle");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; model = %@, url = %@>"),
               objc_opt_class(),
               self,
               self->_collection,
               self->_url);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

+ (id)containersForRootCollection:(id)a3 destinationURL:(id)a4
{
  return (id)objc_msgSend(a1, "containersForRootCollection:destinationURL:uniquifier:includeRootName:", a3, a4, 0, 0);
}

+ (id)containersForRootCollection:(id)a3 destinationURL:(id)a4 uniquifier:(id)a5 includeRootName:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v10, "canContainAssets"))
  {
    v14 = -[PXExportContainer _initWithCollection:]([PXExportContainer alloc], "_initWithCollection:", v10);
    v11 = v11;
    v15 = v11;
    if (v6)
    {
      objc_msgSend(v10, "localizedTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXDragAndDropUtilities sanitizedFileNameForString:](PXDragAndDropUtilities, "sanitizedFileNameForString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "URLByAppendingPathComponent:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "ensureUniqueFileURL:", v15);
        v18 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v18;
      }

    }
    objc_msgSend(v14, "setUrl:", v15);
    objc_msgSend(v13, "addObject:", v14);

  }
  else
  {
    if (v6)
    {
      objc_msgSend(v10, "localizedTitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXDragAndDropUtilities sanitizedFileNameForString:](PXDragAndDropUtilities, "sanitizedFileNameForString:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "URLByAppendingPathComponent:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "ensureUniqueFileURL:", v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v22;
      }

      v11 = v21;
    }
    objc_msgSend(a1, "_traverseStartingAt:prefix:storeIn:uniquifier:", v10, v11, v13, v12);
  }

  return v13;
}

+ (void)_traverseStartingAt:(id)a3 prefix:(id)a4 storeIn:(id)a5 uniquifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[PXExportContainer _initWithCollection:]([PXExportContainer alloc], "_initWithCollection:", v9);
  objc_msgSend(v13, "setUrl:", v10);
  v27 = v13;
  objc_msgSend(v11, "addObject:", v13);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v28 = v9;
  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v9, 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v18, "canContainCollections"))
        {
          if ((objc_msgSend(v18, "isTrashed") & 1) != 0)
            continue;
          objc_msgSend(v18, "localizedTitle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXDragAndDropUtilities sanitizedFileNameForString:](PXDragAndDropUtilities, "sanitizedFileNameForString:", v19);
          v20 = (id)objc_claimAutoreleasedReturnValue();

          v21 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v21, "URLByAppendingPathComponent:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v12, "ensureUniqueFileURL:", v22);
            v23 = objc_claimAutoreleasedReturnValue();

            v22 = (void *)v23;
          }
          objc_msgSend(a1, "_traverseStartingAt:prefix:storeIn:uniquifier:", v18, v22, v11, v12);
        }
        else
        {
          v20 = -[PXExportContainer _initWithCollection:]([PXExportContainer alloc], "_initWithCollection:", v18);
          objc_msgSend(v18, "localizedTitle");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXDragAndDropUtilities sanitizedFileNameForString:](PXDragAndDropUtilities, "sanitizedFileNameForString:", v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "URLByAppendingPathComponent:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v12, "ensureUniqueFileURL:", v25);
            v26 = objc_claimAutoreleasedReturnValue();

            v25 = (void *)v26;
          }
          objc_msgSend(v20, "setUrl:", v25);
          objc_msgSend(v11, "addObject:", v20);

        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }

}

@end
