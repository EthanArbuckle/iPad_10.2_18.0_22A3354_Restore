@implementation PXAssetsDataSource

- (id)assetAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXSectionedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)assetCollectionAtSectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXSectionedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)objectReferenceClassForItem
{
  return (Class)objc_opt_class();
}

- (id)assetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXSectionedDataSource objectsInIndexPath:](self, "objectsInIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)assetCollectionReferenceAtSectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v5;
  void *v6;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _OWORD v13[2];

  v5 = *(_OWORD *)&a3->item;
  v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v13[1] = v5;
  -[PXSectionedDataSource objectReferenceAtIndexPath:](self, "objectReferenceAtIndexPath:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsDataSource.m"), 80, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self objectReferenceAtIndexPath:indexPath]"), v10);
LABEL_6:

    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsDataSource.m"), 80, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self objectReferenceAtIndexPath:indexPath]"), v10, v12);

    goto LABEL_6;
  }
  return v6;
}

- (id)assetReferenceAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXSectionedDataSource objectReferenceAtIndexPath:](self, "objectReferenceAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectIDAtIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXAssetsDataSource assetIdentifierAtItemIndexPath:](self, "assetIdentifierAtItemIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)assetIdentifierAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  void *v4;
  void *v5;
  _OWORD v7[2];

  v3 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v3;
  -[PXAssetsDataSource assetAtItemIndexPath:](self, "assetAtItemIndexPath:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXDisplayCollection)containerCollection
{
  void *v3;

  if (-[PXSectionedDataSource numberOfSections](self, "numberOfSections") == 1)
  {
    -[PXAssetsDataSource firstAssetCollection](self, "firstAssetCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PXDisplayCollection *)v3;
}

- (PXDisplayAssetCollection)firstAssetCollection
{
  void *v3;
  int64_t v5;
  __int128 v6;
  uint64_t v7;

  if (-[PXSectionedDataSource numberOfSections](self, "numberOfSections") < 1)
  {
    v3 = 0;
  }
  else
  {
    v5 = -[PXSectionedDataSource identifier](self, "identifier");
    v6 = xmmword_24438BBE0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    -[PXAssetsDataSource assetCollectionAtSectionIndexPath:](self, "assetCollectionAtSectionIndexPath:", &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXDisplayAssetCollection *)v3;
}

- (PXDisplayAssetCollection)lastAssetCollection
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];
  int64x2_t v8;

  v3 = -[PXSectionedDataSource numberOfSections](self, "numberOfSections");
  v4 = v3 - 1;
  if (v3 < 1)
  {
    v5 = 0;
  }
  else
  {
    v7[0] = -[PXSectionedDataSource identifier](self, "identifier");
    v7[1] = v4;
    v8 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    -[PXAssetsDataSource assetCollectionAtSectionIndexPath:](self, "assetCollectionAtSectionIndexPath:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXDisplayAssetCollection *)v5;
}

- (Class)objectReferenceClassForSection
{
  return (Class)objc_opt_class();
}

- (id)assetCollectionReferenceForAssetCollectionReference:(id)a3
{
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  -[PXSectionedDataSource objectReferenceForObjectReference:](self, "objectReferenceForObjectReference:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsDataSource.m"), 88, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[self objectReferenceForObjectReference:assetCollectionReference]"), v9, v10);

    }
  }
  return v5;
}

- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3
{
  return 0;
}

- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3 assetCollectionReferenceWithSameKeyAssetAsParent:(id *)a4
{
  return 0;
}

- (PXSimpleIndexPath)indexPathForAssetReference:(SEL)a3
{
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  return -[PXSectionedDataSource indexPathForObjectReference:](self, "indexPathForObjectReference:", a4);
}

- (unint64_t)estimatedAssetCountForSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (BOOL)getAssetCounts:(id *)a3 guestAssetCounts:(id *)a4 allowFetch:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v22;
  int64x2_t v23;
  int64_t v24;
  PXAssetsDataSource *v25;
  _BOOL4 v26;
  _QWORD v27[2];
  int64x2_t v28;
  __int128 v29;
  uint64_t v30;

  v26 = a5;
  v29 = 0uLL;
  v30 = 0;
  v24 = -[PXSectionedDataSource identifier](self, "identifier");
  v25 = self;
  v8 = -[PXSectionedDataSource numberOfSections](self, "numberOfSections");
  v21 = a3;
  v22 = a4;
  if (v8 < 1)
  {
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v10 = 1;
  }
  else
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v23 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    while (1)
    {
      v27[0] = v24;
      v27[1] = v11;
      v28 = v23;
      -[PXAssetsDataSource assetsInSectionIndexPath:](v25, "assetsInSectionIndexPath:", v27, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v26)
      {
        v17 = objc_msgSend(v15, "countOfAssetsWithMediaType:", 1);
        v18 = objc_msgSend(v16, "countOfAssetsWithMediaType:", 2);
        v19 = objc_msgSend(v16, "countOfAssetsWithMediaType:", 3);
      }
      else
      {
        v17 = objc_msgSend(v15, "cachedCountOfAssetsWithMediaType:", 1);
        v18 = objc_msgSend(v16, "cachedCountOfAssetsWithMediaType:", 2);
        v19 = objc_msgSend(v16, "cachedCountOfAssetsWithMediaType:", 3);
      }
      if (v17 == 0x7FFFFFFFFFFFFFFFLL || v18 == 0x7FFFFFFFFFFFFFFFLL || v19 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v12 += v17;
      v13 += v18;
      v14 += v19;

      v10 = ++v11 >= v9;
      if (v9 == v11)
        goto LABEL_13;
    }
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v30 = 0x7FFFFFFFFFFFFFFFLL;
    v29 = PXDisplayAssetDetailedCountsUndefined;

    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_13:
  if (v21)
  {
    v21->var0 = v12;
    v21->var1 = v13;
    v21->var2 = v14;
  }
  if (v22)
  {
    *(_OWORD *)&v22->var0 = v29;
    v22->var2 = v30;
  }
  return v10;
}

- (id)startingAssetReference
{
  void *v3;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  if (-[PXAssetsDataSource startsAtEnd](self, "startsAtEnd"))
    -[PXSectionedDataSource lastItemIndexPath](self, "lastItemIndexPath");
  else
    -[PXSectionedDataSource firstItemIndexPath](self, "firstItemIndexPath");
  if ((_QWORD)v6)
  {
    v5[0] = v6;
    v5[1] = v7;
    -[PXAssetsDataSource assetReferenceAtItemIndexPath:](self, "assetReferenceAtItemIndexPath:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)startingSection
{
  return 0;
}

- (BOOL)startsAtEnd
{
  return 0;
}

- (BOOL)isFiltered
{
  return 0;
}

- (NSPredicate)filterPredicate
{
  return 0;
}

- (BOOL)ignoreSharedLibraryFilters
{
  return 0;
}

- (int64_t)libraryFilter
{
  return 0;
}

- (BOOL)isSorted
{
  return 0;
}

- (id)keyAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (PXSimpleIndexPath)keyAssetIndexPathForSectionIndexPath:(SEL)a3
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  return self;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  return 0;
}

- (PXDisplayAsset)keyAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXAssetsDataSource containerCollection](self, "containerCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "canContainAssets")
    || (-[PXAssetsDataSource keyAssetsForAssetCollection:](self, "keyAssetsForAssetCollection:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "firstObject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    -[PXAssetsDataSource startingAssetReference](self, "startingAssetReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PXDisplayAsset *)v5;
}

- (id)curatedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (id)uncuratedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (int64_t)numberOfUncuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (int64_t)numberOfCuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (int64_t)numberOfUncuratedItemsInAssetCollection:(id)a3
{
  return 0;
}

- (int64_t)numberOfCuratedItemsInAssetCollection:(id)a3
{
  return 0;
}

- (BOOL)hasCurationForAssetCollection:(id)a3
{
  return 0;
}

- (int64_t)numberOfSectionsWithEnrichmentState:(unsigned __int16)a3
{
  return 0;
}

- (int64_t)estimatedAssetsCountWithEnrichmentState:(unsigned __int16)a3
{
  return 0;
}

- (id)primaryFaceForAssetAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (BOOL)isFilteringSectionIndexPath:(PXSimpleIndexPath *)a3
{
  PXAssetsDataSource *v3;
  __int128 v4;
  void *v5;
  _OWORD v7[2];

  v3 = self;
  v4 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v4;
  -[PXAssetsDataSource assetCollectionAtSectionIndexPath:](self, "assetCollectionAtSectionIndexPath:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[PXAssetsDataSource isFilteringAssetCollection:](v3, "isFilteringAssetCollection:", v5);

  return (char)v3;
}

- (BOOL)isFilteringAssetCollection:(id)a3
{
  return 0;
}

- (BOOL)isFilteringDisabledForSectionIndexPath:(PXSimpleIndexPath *)a3
{
  PXAssetsDataSource *v3;
  __int128 v4;
  void *v5;
  _OWORD v7[2];

  v3 = self;
  v4 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v4;
  -[PXAssetsDataSource assetCollectionAtSectionIndexPath:](self, "assetCollectionAtSectionIndexPath:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[PXAssetsDataSource isFilteringDisabledForAssetCollection:](v3, "isFilteringDisabledForAssetCollection:", v5);

  return (char)v3;
}

- (BOOL)isFilteringDisabledForAssetCollection:(id)a3
{
  return 0;
}

- (BOOL)areAllSectionsConsideredAccurate
{
  return 1;
}

- (BOOL)isSectionConsideredAccurate:(int64_t)a3
{
  return 1;
}

- (id)objectReferenceNearestToObjectReference:(id)a3 inSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v11;

  -[PXSectionedDataSource objectReferenceNearestToObjectReference:](self, "objectReferenceNearestToObjectReference:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "indexPath");
    v7 = v11;
  }
  else
  {
    v7 = 0;
  }
  if (v7 == a4)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (id)assetCollectionReferenceNearestToObjectReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v8;
  __int128 v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXSectionedDataSource objectReferenceForObjectReference:](self, "objectReferenceForObjectReference:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 0u;
      v9 = 0u;
      -[PXSectionedDataSource objectReferenceNearestToObjectReference:](self, "objectReferenceNearestToObjectReference:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSectionedDataSource indexPathForObjectReference:](self, "indexPathForObjectReference:", v5);

    }
    v6 = 0;
  }

  return v6;
}

- (unint64_t)estimatedPhotosCount
{
  return self->_estimatedPhotosCount;
}

- (unint64_t)estimatedVideosCount
{
  return self->_estimatedVideosCount;
}

- (unint64_t)estimatedOtherCount
{
  return self->_estimatedOtherCount;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

@end
