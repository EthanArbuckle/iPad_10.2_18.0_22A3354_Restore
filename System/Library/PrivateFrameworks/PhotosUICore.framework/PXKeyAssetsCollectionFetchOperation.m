@implementation PXKeyAssetsCollectionFetchOperation

- (void)main
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int64_t maxKeyAssets;
  unint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[PXCollectionFetchOperation handleBegin](self, "handleBegin");
  -[PXCollectionFetchOperation fetchOptions](self, "fetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PXCollectionFetchOperation collection](self, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_standardLibrarySpecificFetchOptions");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((-[PXKeyAssetsCollectionFetchOperation isCancelled](self, "isCancelled") & 1) != 0
    || (-[PXCollectionFetchOperation collection](self, "collection"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v9 = objc_opt_isKindOfClass(),
        v8,
        (v9 & 1) == 0))
  {
    if ((-[PXKeyAssetsCollectionFetchOperation isCancelled](self, "isCancelled") & 1) != 0
      || (-[PXCollectionFetchOperation collection](self, "collection"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v11,
          (isKindOfClass & 1) == 0))
    {
      v21 = 0;
      v22 = 0;
    }
    else
    {
      -[PXCollectionFetchOperation collection](self, "collection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "collectionListType") & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v35 = v13;
        -[PXCollectionFetchOperation collection](self, "collection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "photoLibrary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "px_standardLibrarySpecificFetchOptions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setReverseSortOrder:", objc_msgSend(v14, "keyCollectionsAtEnd"));
        v33 = v16;
        v34 = v14;
        objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v14, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");
        maxKeyAssets = self->_maxKeyAssets;
        if (maxKeyAssets <= 0)
          maxKeyAssets = 9;
        if (v18 >= maxKeyAssets)
          v20 = maxKeyAssets;
        else
          v20 = v18;
        v36 = v20;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v22 = v17;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v38;
LABEL_18:
          v26 = 0;
          while (1)
          {
            if (*(_QWORD *)v38 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v26);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v27, v5);
              v28 = v5;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v29, "count"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "prefetchObjectsAtIndexes:", v30);

              objc_msgSend(v21, "setObject:forKey:", v29, v27);
              v31 = objc_msgSend(v21, "count");

              v5 = v28;
              if (v31 >= v36)
                break;
            }
            if (v24 == ++v26)
            {
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
              if (v24)
                goto LABEL_18;
              break;
            }
          }
        }

        v13 = v35;
      }
      else
      {
        v21 = 0;
        v22 = 0;
      }

    }
  }
  else
  {
    -[PXCollectionFetchOperation collection](self, "collection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "assetCollectionType") == 4)
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v10, 0);
    else
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v10, v5);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v22, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "prefetchObjectsAtIndexes:", v32);

    v21 = 0;
  }
  -[PXCollectionFetchOperation setOutputFetchResult:](self, "setOutputFetchResult:", v22);
  -[PXKeyAssetsCollectionFetchOperation setOutputOtherFetchResultsByAssetCollection:](self, "setOutputOtherFetchResultsByAssetCollection:", v21);
  -[PXCollectionFetchOperation handleFinish](self, "handleFinish");

}

- (int64_t)maxKeyAssets
{
  return self->_maxKeyAssets;
}

- (void)setMaxKeyAssets:(int64_t)a3
{
  self->_maxKeyAssets = a3;
}

- (NSDictionary)outputOtherFetchResultsByAssetCollection
{
  return self->_outputOtherFetchResultsByAssetCollection;
}

- (void)setOutputOtherFetchResultsByAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_outputOtherFetchResultsByAssetCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputOtherFetchResultsByAssetCollection, 0);
}

@end
