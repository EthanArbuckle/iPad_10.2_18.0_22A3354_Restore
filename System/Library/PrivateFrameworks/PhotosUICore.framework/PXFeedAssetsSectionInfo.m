@implementation PXFeedAssetsSectionInfo

- (int64_t)sectionType
{
  return 0;
}

- (id)cloudFeedAssetsEntry
{
  void *v4;
  void *v6;

  -[PXFeedSectionInfo cloudFeedEntry](self, "cloudFeedEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedAssetsSectionInfo.m"), 32, CFSTR("unexpected cloud feed entry class"));

  }
  return v4;
}

- (void)updateFromCloudFeedEntry
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXFeedAssetsSectionInfo;
  -[PXFeedSectionInfo updateFromCloudFeedEntry](&v9, sel_updateFromCloudFeedEntry);
  -[PXFeedAssetsSectionInfo cloudFeedAssetsEntry](self, "cloudFeedAssetsEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(v3, "entryAlbumGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionInfo sharedAlbumWithGUID:](self, "sharedAlbumWithGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionInfo setNumberOfItems:](self, "setNumberOfItems:", v5);
  -[PXFeedSectionInfo setSharedAlbum:](self, "setSharedAlbum:", v7);
  -[PXFeedSectionInfo setAlbumTitle:](self, "setAlbumTitle:", v8);

}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)hasPlayableAssetForItemAtIndex:(int64_t)a3
{
  void *v3;
  char v4;

  -[PXFeedAssetsSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canPlayPhotoIris");

  return v4;
}

- (id)assetForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PXFeedAssetsSectionInfo cloudFeedAssetsEntry](self, "cloudFeedAssetsEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)captionForItemAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[PXFeedAssetsSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedCloudComments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "isCaption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = 0;
    if (v7)
    {
      objc_msgSend(v5, "commentText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)batchIDForItemAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PXFeedAssetsSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudBatchID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)indexOfFirstItemFromLastBatch
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v3 = -[PXFeedSectionInfo numberOfItems](self, "numberOfItems");
  -[PXFeedAssetsSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", v3 - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudBatchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 - 1;
  if (v3 >= 1)
  {
    -[PXFeedAssetsSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", v3 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudBatchID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqualToString:", v8);

    if (v9)
    {
      while (1)
      {
        v6 = v3 - 1;
        if (v3 - 1 < 1)
          break;
        -[PXFeedAssetsSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", v3 - 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cloudBatchID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v5, "isEqualToString:", v11);

        v3 = v6;
        if ((v12 & 1) == 0)
          goto LABEL_7;
      }
      v6 = 0;
    }
  }
LABEL_7:

  return v6;
}

- (id)commentForItemAtIndex:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  -[PXFeedAssetsSectionInfo commentsForItemAtIndex:](self, "commentsForItemAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedAssetsSectionInfo.m"), 113, CFSTR("Invalid comments for requested item"));

  }
  if (objc_msgSend(v6, "count") <= (unint64_t)a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedAssetsSectionInfo.m"), 114, CFSTR("Invalid comment requrested from item"));

  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)commentsForItemAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXFeedAssetsSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedCloudComments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_185407);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredOrderedSetUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)likesForItemAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PXFeedAssetsSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedLikeComments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)countsByAssetDisplayType
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXFeedAssetsSectionInfo cloudFeedAssetsEntry](self, "cloudFeedAssetsEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "px_displayType", (_QWORD)v13);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXFeedAssetsSectionInfo cloudFeedAssetsEntry](self, "cloudFeedAssetsEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v7);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "kind");
        if (v14 == 1)
        {
          ++v10;
        }
        else if (!v14)
        {
          ++v11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
    if (a3)
      goto LABEL_13;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    if (a3)
LABEL_13:
      *a3 = v11;
  }
  if (a4)
    *a4 = v10;

}

- (BOOL)areAllAssetsLiked
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PXFeedAssetsSectionInfo cloudFeedAssetsEntry](self, "cloudFeedAssetsEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "userCloudSharedLiked", (_QWORD)v11))
          {
            v9 = 0;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
    v9 = 1;
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PXFeedAssetsSectionInfo cloudFeedAssetsEntry](self, "cloudFeedAssetsEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (int64_t)indexOfItemWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[PXFeedAssetsSectionInfo cloudFeedAssetsEntry](self, "cloudFeedAssetsEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  return v7;
}

- (id)assets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXFeedAssetsSectionInfo cloudFeedAssetsEntry](self, "cloudFeedAssetsEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionInfo excludedAssetIndexes](self, "excludedAssetIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "removeObjectsAtIndexes:", v5);

    v4 = v6;
  }

  return v4;
}

- (unint64_t)assetsCount
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[PXFeedSectionInfo numberOfItems](self, "numberOfItems");
  -[PXFeedSectionInfo excludedAssetIndexes](self, "excludedAssetIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 - objc_msgSend(v4, "count");

  return v5;
}

- (BOOL)isMine
{
  void *v3;
  char v4;

  if (-[PXFeedSectionInfo numberOfItems](self, "numberOfItems") < 1)
  {
    v3 = 0;
  }
  else
  {
    -[PXFeedAssetsSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "cloudIsMyAsset");

  return v4;
}

uint64_t __50__PXFeedAssetsSectionInfo_commentsForItemAtIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "isCaption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue") ^ 1;

  return v3;
}

@end
