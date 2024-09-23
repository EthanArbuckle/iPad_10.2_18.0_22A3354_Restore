@implementation PXFeedTestAssetsSectionInfo

- (PXFeedTestAssetsSectionInfo)initWithPhotoLibrary:(id)a3
{
  PXFeedTestAssetsSectionInfo *v3;
  PXFeedTestAssetsSectionInfo *v4;
  uint64_t v5;
  NSArray *plAssets;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXFeedTestAssetsSectionInfo;
  v3 = -[PXFeedTestSectionInfo initWithPhotoLibrary:](&v8, sel_initWithPhotoLibrary_, a3);
  v4 = v3;
  if (v3)
  {
    -[PXFeedTestAssetsSectionInfo _fetchPhotoAssets:](v3, "_fetchPhotoAssets:", -[PXFeedTestSectionInfo countOfItems](v3, "countOfItems"));
    v5 = objc_claimAutoreleasedReturnValue();
    plAssets = v4->_plAssets;
    v4->_plAssets = (NSArray *)v5;

  }
  return v4;
}

- (int64_t)sectionType
{
  return 0;
}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)assetForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXFeedTestAssetsSectionInfo plAssets](self, "plAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)countsByAssetDisplayType
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXFeedTestAssetsSectionInfo plAssets](self, "plAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "px_displayType", (_QWORD)v12);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_fetchPhotoAssets:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kind"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudSharedAsset"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v12);

  objc_msgSend(v7, "setFetchLimit:", a3);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v14);

  -[PXFeedTestSectionInfo photoLibrary](self, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "executeFetchRequest:error:", v7, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kind = %d)"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v18);

    objc_msgSend(v16, "executeFetchRequest:error:", v7, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v19;
  }

  return v17;
}

- (NSArray)plAssets
{
  return self->_plAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plAssets, 0);
}

@end
