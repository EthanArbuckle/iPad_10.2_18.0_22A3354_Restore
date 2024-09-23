@implementation PXMemoryInfo

- (BOOL)px_isEmpty
{
  return 0;
}

- (BOOL)px_isFavorite
{
  void *v4;
  char v5;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  -[PXMemoryInfo assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Containers+PXSelectionAssetContainer.m"), 32, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Containers+PXSelectionAssetContainer.m"), 32, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v9, v11);

    goto LABEL_6;
  }
LABEL_3:
  v5 = objc_msgSend(v4, "px_isFavorite");

  return v5;
}

- (BOOL)px_canPerformFavoriteAction
{
  void *v4;
  char v5;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  -[PXMemoryInfo assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Containers+PXSelectionAssetContainer.m"), 36, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Containers+PXSelectionAssetContainer.m"), 36, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v9, v11);

    goto LABEL_6;
  }
LABEL_3:
  v5 = objc_msgSend(v4, "px_canPerformFavoriteAction");

  return v5;
}

- (id)px_fetchContainedAssets
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  -[PXMemoryInfo assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Containers+PXSelectionAssetContainer.m"), 40, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Containers+PXSelectionAssetContainer.m"), 40, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v9, v11);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v4, "px_fetchContainedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXMemoryInfo)memoryInfoWithUpdatedKeyAssetFetchResult:(id)a3
{
  id v4;
  id *v5;
  id v6;

  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v5 + 2, self->_localizedTitle);
  objc_storeStrong(v5 + 3, self->_assetCollection);
  objc_storeStrong(v5 + 1, self->_localizedDateText);
  v6 = v5[4];
  v5[4] = v4;

  return (PXMemoryInfo *)v5;
}

- (PHMemory)memory
{
  void *v2;
  id v3;

  -[PXMemoryInfo assetCollection](self, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "assetCollectionType") == 4)
    v3 = v2;
  else
    v3 = 0;

  return (PHMemory *)v3;
}

- (BOOL)isFavorite
{
  void *v2;
  char v3;

  -[PXMemoryInfo memory](self, "memory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFavorite");

  return v3;
}

- (unint64_t)category
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXMemoryInfo memory](self, "memory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "category");
  else
    v4 = 0;

  return v4;
}

- (double)score
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PXMemoryInfo memory](self, "memory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "score");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (PHAsset)primaryAsset
{
  void *v3;
  void *v4;
  void *v5;

  -[PXMemoryInfo prefetchedPrimaryAsset](self, "prefetchedPrimaryAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXMemoryInfo prefetchedPrimaryAsset](self, "prefetchedPrimaryAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXMemoryInfo keyAssetFetchResult](self, "keyAssetFetchResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PHAsset *)v4;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoryInfo localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoryInfo localizedDateText](self, "localizedDateText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoryInfo primaryAsset](self, "primaryAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, date: %@, primary asset: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)localizedDateText
{
  return self->_localizedDateText;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PHFetchResult)keyAssetFetchResult
{
  return self->_keyAssetFetchResult;
}

- (PHAsset)prefetchedPrimaryAsset
{
  return self->_prefetchedPrimaryAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedPrimaryAsset, 0);
  objc_storeStrong((id *)&self->_keyAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDateText, 0);
}

+ (id)fastMemoryInfoWithMemory:(id)a3
{
  PHAssetCollection *v3;
  PXMemoryInfo *v4;
  PHAssetCollection *assetCollection;
  PHAssetCollection *v6;
  uint64_t v7;
  NSString *localizedTitle;
  uint64_t v9;
  NSString *localizedDateText;

  v3 = (PHAssetCollection *)a3;
  v4 = objc_alloc_init(PXMemoryInfo);
  assetCollection = v4->_assetCollection;
  v4->_assetCollection = v3;
  v6 = v3;

  -[PHAssetCollection localizedTitle](v6, "localizedTitle");
  v7 = objc_claimAutoreleasedReturnValue();
  localizedTitle = v4->_localizedTitle;
  v4->_localizedTitle = (NSString *)v7;

  -[PHAssetCollection localizedSubtitle](v6, "localizedSubtitle");
  v9 = objc_claimAutoreleasedReturnValue();
  localizedDateText = v4->_localizedDateText;
  v4->_localizedDateText = (NSString *)v9;

  return v4;
}

+ (id)memoryInfoWithMemory:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "fastMemoryInfoWithMemory:", v3);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4 + 4, v5);
  v6 = objc_msgSend(v5, "count");
  if (v3 && !v6)
  {
    v7 = (void *)MEMORY[0x1E0CD16F8];
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsToRepairKeyCuratedAssetForMemories:", v8);

  }
  objc_msgSend(v3, "px_assignStoryTitleCategoryIfNeeded");
  objc_msgSend(v4, "primaryAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchColorNormalizationData");

  if (objc_msgSend(v9, "isEligibleForAutoPlayback"))
  {
    objc_msgSend(v9, "fetchPropertySetsIfNeeded");
    objc_msgSend(v9, "photoIrisProperties");

  }
  return v4;
}

+ (id)memoryInfoWithAssetCollection:(id)a3 keyAssetFetchResult:(id)a4
{
  PHAssetCollection *v6;
  id v7;
  PXMemoryInfo *v8;
  PHAssetCollection *assetCollection;
  PHAssetCollection *v10;
  id v11;

  v6 = (PHAssetCollection *)a3;
  v7 = a4;
  v8 = objc_alloc_init(PXMemoryInfo);
  assetCollection = v8->_assetCollection;
  v8->_assetCollection = v6;
  v10 = v6;

  objc_storeStrong((id *)&v8->_keyAssetFetchResult, a4);
  v11 = (id)objc_msgSend(v7, "firstObject");
  objc_msgSend(a1, "_updateTitleForMemoryInfo:withAssetCollection:", v8, v10);

  return v8;
}

+ (id)memoryInfoWithAssetCollection:(id)a3 prefetchedPrimaryAsset:(id)a4
{
  PHAssetCollection *v6;
  PHAsset *v7;
  PXMemoryInfo *v8;
  PHAssetCollection *assetCollection;
  PHAssetCollection *v10;
  PHAsset *prefetchedPrimaryAsset;

  v6 = (PHAssetCollection *)a3;
  v7 = (PHAsset *)a4;
  v8 = objc_alloc_init(PXMemoryInfo);
  assetCollection = v8->_assetCollection;
  v8->_assetCollection = v6;
  v10 = v6;

  prefetchedPrimaryAsset = v8->_prefetchedPrimaryAsset;
  v8->_prefetchedPrimaryAsset = v7;

  objc_msgSend(a1, "_updateTitleForMemoryInfo:withAssetCollection:", v8, v10);
  return v8;
}

+ (void)_updateTitleForMemoryInfo:(id)a3 withAssetCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;

  v13 = a3;
  v5 = a4;
  objc_msgSend(v5, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseStringWithLocale:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v13[2];
  v13[2] = v10;

  v12 = objc_msgSend(v5, "assetCollectionType");
  if (v12 == 3 && !v13[2])
    v13[2] = CFSTR("Placeholder");

}

@end
