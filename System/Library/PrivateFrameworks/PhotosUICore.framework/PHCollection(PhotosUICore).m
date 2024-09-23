@implementation PHCollection(PhotosUICore)

- (uint64_t)px_assetsDropMode
{
  return 0;
}

- (uint64_t)px_allowsSpringLoading
{
  if (objc_msgSend(a1, "px_assetsDropMode"))
    return 1;
  else
    return objc_msgSend(a1, "px_isFolder");
}

- (id)px_rootCollectionList
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_virtualCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "px_isSharedAlbumsFolder") & 1) != 0
    || (objc_msgSend(a1, "px_isMediaTypesFolder") & 1) != 0
    || (objc_msgSend(a1, "px_isTopLevelFolder") & 1) != 0
    || objc_msgSend(a1, "px_isProjectsFolder"))
  {
    v4 = a1;
LABEL_6:
    v5 = v4;
    goto LABEL_7;
  }
  if (objc_msgSend(a1, "px_isSharedAlbum"))
    goto LABEL_9;
  if (objc_msgSend(a1, "px_isMediaTypeSmartAlbum"))
  {
    objc_msgSend(v3, "mediaTypesCollectionList");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(a1, "px_isLemonadeUtilitiesAlbum"))
  {
    objc_msgSend(v3, "utilitiesCollectionList");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(a1, "px_isUserCreated"))
  {
    objc_msgSend(v3, "rootAlbumCollectionList");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(a1, "px_isSharedActivityVirtualCollection"))
  {
LABEL_9:
    objc_msgSend(v3, "sharedAlbumsCollectionList");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(a1, "px_isContentSyndicationAlbum"))
  {
    v7 = (void *)MEMORY[0x1E0CD14E0];
    v9[0] = a1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transientCollectionListWithCollections:title:", v8, CFSTR("SomeTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (id)px_rootAssetCollection
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_virtualCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "px_isEvent"))
  {
    objc_msgSend(v3, "eventsCollection");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "px_isTrip"))
  {
    objc_msgSend(v3, "tripsCollection");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(a1, "px_isMemory"))
    {
      v5 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v3, "memoriesCollection");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_8:

  return v5;
}

- (id)px_fetchContainer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIncludeRootFolder:", 1);
  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionListsContainingCollection:options:", a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)px_fetchContainerTitle
{
  void *v2;
  void *v3;
  id v4;
  __CFString *v5;
  void *v6;

  objc_msgSend(a1, "px_fetchContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    if (objc_msgSend(a1, "px_isProjectsFolder"))
      v5 = CFSTR("PXProjectsOutlineTitle");
    else
      v5 = CFSTR("PXAlbumsOutlineTitle");
    PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;

  return v6;
}

- (id)px_fetchAncestryIncludingRoot:()PhotosUICore
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionListsContainingCollection:options:", a1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "px_rootCollectionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    do
    {
      if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
        break;
      objc_msgSend(v5, "insertObject:atIndex:", v7, 0);
      objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionListsContainingCollection:options:", v7, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    while (v10);

  }
  if (a3)
  {
    if (v8)
    {
      v11 = v8;
    }
    else
    {
      objc_msgSend(a1, "px_rootAssetCollection");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if ((objc_msgSend(a1, "isEqual:", v11) & 1) == 0)
      objc_msgSend(v5, "insertObject:atIndex:", v11, 0);
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (id)px_fetchContainedAssetCollections
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXCollectAssetCollectionsInCollections(v3, v2);

  objc_msgSend(v2, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)px_fetchIsEmpty
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(a1, "px_fetchIsEmptyWithOptions:", v3);
  return v4;
}

- (uint64_t)px_fetchIsEmptyWithOptions:()PhotosUICore
{
  return 1;
}

- (id)px_debugDictionary
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("localizedTitle");
  objc_msgSend(a1, "localizedTitle");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = CFSTR("nil");
  if (v2)
    v4 = (__CFString *)v2;
  v13[0] = v4;
  v12[1] = CFSTR("canContainAssets");
  v5 = v4;
  if (objc_msgSend(a1, "canContainAssets"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  v13[1] = v7;
  v12[2] = CFSTR("canContainCollections");
  if (objc_msgSend(a1, "canContainCollections"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)px_exportFolderName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "localizedTitle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByDeletingPathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)px_navigationURLHost
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHCollection+PhotosUICore.m"), 240, CFSTR("Method %s is a responsibility of subclass %@"), "-[PHCollection(PhotosUICore) px_navigationURLHost]", v6);

  abort();
}

- (void)px_navigationWellKnownName
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHCollection+PhotosUICore.m"), 244, CFSTR("Method %s is a responsibility of subclass %@"), "-[PHCollection(PhotosUICore) px_navigationWellKnownName]", v6);

  abort();
}

- (id)px_navigationURLQueryItemWithPrefix:()PhotosUICore
{
  __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(a1, "px_navigationWellKnownName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "isTransient") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = &stru_1E5149688;
  if (v4)
    v7 = v4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB39D8];
    v10 = v8;
    v11 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR("uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB39D8];
    v10 = v8;
    v11 = v6;
  }
  objc_msgSend(v9, "queryItemWithName:value:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)px_navigationURLComponents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "px_navigationURLQueryItemWithPrefix:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3998];
    objc_msgSend(a1, "px_navigationURLHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("photos://"), "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQueryItems:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)px_navigationURLWithSelectedObject:()PhotosUICore
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;

  v4 = a3;
  objc_msgSend(a1, "px_navigationURLComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    v12 = v6;
LABEL_8:

    goto LABEL_9;
  }
  v7 = v6;

  if (v5 && v7)
  {
    objc_msgSend(v5, "queryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v7, "px_navigationURLQueryItemWithPrefix:", CFSTR("revealasset"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

    objc_msgSend(v5, "setQueryItems:", v12);
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v5, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (uint64_t)px_navigationURL
{
  return objc_msgSend(a1, "px_navigationURLWithSelectedObject:", 0);
}

- (uint64_t)px_isTransientCollectionWithIdentifier:()PhotosUICore
{
  return 0;
}

@end
