@implementation PXPhotoKitAssetsDataSource

- (id)firstAssetCollection
{
  void *v2;
  void *v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)numberOfSectionsWithEnrichmentState:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSectionsWithEnrichmentState:", v3);

  return v5;
}

- (int64_t)estimatedAssetsCountWithEnrichmentState:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "estimatedAssetsCountWithEnrichmentState:", v3);

  return v5;
}

- (BOOL)hasCurationForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCurationForAssetCollection:", v4);

  return v6;
}

- (PXSimpleIndexPath)keyAssetIndexPathForSectionIndexPath:(SEL)a3
{
  int64_t dataSourceIdentifier;
  void *v9;
  int64_t v10;
  PXSimpleIndexPath *result;
  __int128 v12;
  int64_t section;
  void *v14;

  dataSourceIdentifier = a4->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPhotoKitAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndexPath.dataSourceIdentifier == self.identifier"));

  }
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "keyAssetIndexInSection:", a4->section);

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&retstr->item = v12;
  }
  else
  {
    result = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
    section = a4->section;
    retstr->dataSourceIdentifier = (int64_t)result;
    retstr->section = section;
    retstr->item = v10;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (unint64_t)estimatedAssetCountForSectionIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollectionForSection:", a3->section);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "estimatedAssetCount");

  return v6;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  __int128 v17;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPhotoKitAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == [self identifier]"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
    goto LABEL_10;
  if (a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_OWORD *)&a3->item;
      v16 = *(_OWORD *)&a3->dataSourceIdentifier;
      v17 = v9;
      objc_msgSend(v7, "assetAtSimpleIndexPath:", &v16);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_OWORD *)&a3->item;
    v16 = *(_OWORD *)&a3->dataSourceIdentifier;
    v17 = v14;
    PXSimpleIndexPathDescription();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 125, CFSTR("%@ invalid indexPath:%@"), self, v15, v16, v17);

    abort();
  }
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollectionForSection:", a3->section);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v10 = (void *)v8;

  return v10;
}

- (int64_t)identifier
{
  void *v2;
  int64_t v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "versionIdentifier");

  return v3;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (BOOL)containsAnyItems
{
  void *v2;
  char v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty") ^ 1;

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItemsInSection:", a3);

  return v5;
}

- (id)objectReferenceAtIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v5;
  __int128 v8;
  __int128 v10;
  void *v11;
  __int128 v12;
  void *v13;
  id v14;
  __int128 v15;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v5 = *(_QWORD *)off_1E50B7E98;
  if (a3->dataSourceIdentifier != *(_QWORD *)off_1E50B7E98
    && a3->section != 0x7FFFFFFFFFFFFFFFLL
    && a3->item == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = *(_OWORD *)&a3->item;
    v20 = *(_OWORD *)&a3->dataSourceIdentifier;
    v21 = v10;
    -[PXPhotoKitAssetsDataSource assetCollectionAtSectionIndexPath:](self, "assetCollectionAtSectionIndexPath:", &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v12 = *(_OWORD *)&a3->item;
    v18 = *(_OWORD *)&a3->dataSourceIdentifier;
    v19 = v12;
    -[PXPhotoKitAssetsDataSource keyAssetIndexPathForSectionIndexPath:](self, "keyAssetIndexPathForSectionIndexPath:", &v18);
    if ((_QWORD)v20 == v5)
    {
      v13 = 0;
    }
    else
    {
      v18 = v20;
      v19 = v21;
      -[PXPhotoKitAssetsDataSource assetReferenceAtItemIndexPath:](self, "assetReferenceAtItemIndexPath:", &v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_alloc((Class)off_1E50B1668);
    v15 = *(_OWORD *)&a3->item;
    v18 = *(_OWORD *)&a3->dataSourceIdentifier;
    v19 = v15;
    v16 = (void *)objc_msgSend(v14, "initWithAssetCollection:keyAssetReference:indexPath:", v11, v13, &v18);

    return v16;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PXPhotoKitAssetsDataSource;
    v8 = *(_OWORD *)&a3->item;
    v20 = *(_OWORD *)&a3->dataSourceIdentifier;
    v21 = v8;
    -[PXPhotoKitAssetsDataSource objectReferenceAtIndexPath:](&v17, sel_objectReferenceAtIndexPath_, &v20);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)containerCollection
{
  void *v2;
  void *v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)libraryFilter
{
  void *v2;
  int64_t v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "libraryFilter");

  return v3;
}

- (PXPhotoKitAssetsDataSource)initWithImmutablePhotosDataSource:(id)a3 withChange:(id)a4
{
  id v6;
  void *v7;
  PXPhotoKitAssetsDataSource *v8;

  v6 = a3;
  objc_msgSend(a4, "sectionedDataSourceChangeDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPhotoKitAssetsDataSource initWithImmutablePhotosDataSource:withChangeDetails:](self, "initWithImmutablePhotosDataSource:withChangeDetails:", v6, v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDetails, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_assetReferenceNearestToAssetCache, 0);
  objc_storeStrong((id *)&self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache, 0);
  objc_storeStrong((id *)&self->_layoutItemByAssetCache, 0);
}

- (void)prefetchSections:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prefetchAssetsInSections:", v4);

}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  void *v6;
  void *v7;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;

  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)&a3->dataSourceIdentifier;
    v14 = *(_OWORD *)&a3->item;
    PXSimpleIndexPathDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 136, CFSTR("%@ invalid indexPath:%@"), self, v12, v13, v14);

    abort();
  }
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsInSection:", a3->section);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)areAllSectionsConsideredAccurate
{
  void *v2;
  char v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areAllSectionsConsideredAccurate");

  return v3;
}

- (PXPhotoKitAssetsDataSource)initWithImmutablePhotosDataSource:(id)a3 withChangeDetails:(id)a4
{
  id v8;
  id v9;
  PXPhotoKitAssetsDataSource *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *layoutItemByAssetCache;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotoKitAssetsDataSource;
  v10 = -[PXPhotoKitAssetsDataSource init](&v15, sel_init);
  if (v10)
  {
    if ((objc_msgSend(v8, "options") & 4) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PXPhotoKitAssetsDataSource.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("([immutablePhotosDataSource options] & PXPhotosDataSourceOptionDisableChangeHandling) == PXPhotosDataSourceOptionDisableChangeHandling"));

    }
    objc_storeStrong((id *)&v10->_photosDataSource, a3);
    objc_storeStrong((id *)&v10->_changeDetails, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    layoutItemByAssetCache = v10->_layoutItemByAssetCache;
    v10->_layoutItemByAssetCache = v11;

  }
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoKitAssetsDataSource;
  -[PXPhotoKitAssetsDataSource description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetsDataSource container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ photosDataSource:%@, container:%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (unint64_t)estimatedPhotosCount
{
  void *v2;
  unint64_t v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "estimatedPhotosCount");

  return v3;
}

- (unint64_t)estimatedVideosCount
{
  void *v2;
  unint64_t v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "estimatedVideosCount");

  return v3;
}

- (unint64_t)estimatedOtherCount
{
  void *v2;
  unint64_t v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "estimatedOtherCount");

  return v3;
}

- (BOOL)isFilteringAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoForAssetCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "UUIDFilterHidesSomeAssets");
  return (char)v5;
}

- (BOOL)isFilteringDisabledForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoForAssetCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "explicitlyDisableFilters");
  return (char)v5;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  return -[PXPhotoKitAssetsDataSource _indexPathForObjectReference:restrictedToSection:](self, "_indexPathForObjectReference:restrictedToSection:", a4, 0x7FFFFFFFFFFFFFFFLL);
}

- (PXSimpleIndexPath)_indexPathForObjectReference:(SEL)a3 restrictedToSection:(id)a4
{
  id v9;
  int64_t dataSourceIdentifier;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int64_t v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  int64_t section;
  int64_t item;
  PXSimpleIndexPath *result;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const char *v54;
  _OWORD v55[2];
  __int128 v56;
  __int128 v57;
  char v58;
  objc_super v59;

  v9 = a4;
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  v59.receiver = self;
  v59.super_class = (Class)PXPhotoKitAssetsDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v59, sel_indexPathForObjectReference_, v9);
  dataSourceIdentifier = retstr->dataSourceIdentifier;
  if (retstr->dataSourceIdentifier != *(_QWORD *)off_1E50B7E98)
    goto LABEL_49;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
    -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "px_descriptionForAssertionMessage");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 249, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference"), v47, v49);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 249, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference"), v47);
    }

LABEL_9:
    objc_msgSend(v15, "assetCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "sectionForAssetCollection:", v16);

    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      retstr->dataSourceIdentifier = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
      retstr->section = v17;
      *(int64x2_t *)&retstr->item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    }
    goto LABEL_43;
  }
  v11 = v9;
  v58 = 0;
  -[PXPhotoKitAssetsDataSource changeDetails](self, "changeDetails");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v11)
  {
    memset(v55, 0, sizeof(v55));
    if (v12)
      goto LABEL_5;
LABEL_12:
    v56 = 0u;
    v57 = 0u;
    goto LABEL_13;
  }
  objc_msgSend(v11, "indexPath");
  if (!v13)
    goto LABEL_12;
LABEL_5:
  objc_msgSend(v13, "indexPathAfterApplyingChangesToIndexPath:hasIncrementalChanges:objectChanged:", v55, &v58, 0);
LABEL_13:
  v18 = v57;
  *(_OWORD *)&retstr->dataSourceIdentifier = v56;
  *(_OWORD *)&retstr->item = v18;

  objc_msgSend(v11, "asset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (retstr->dataSourceIdentifier != dataSourceIdentifier || v58)
  {
    if (retstr->dataSourceIdentifier == dataSourceIdentifier && PXDisplayAssetIsSyndicatedAndUnsaved(v19))
    {
      -[PXPhotoKitAssetsDataSource _indexPathForSavedSyndicatedAssetReference:](self, "_indexPathForSavedSyndicatedAssetReference:", v11);
      v26 = v57;
      *(_OWORD *)&retstr->dataSourceIdentifier = v56;
      *(_OWORD *)&retstr->item = v26;
    }
    goto LABEL_42;
  }
  v54 = a3;
  objc_msgSend(v11, "asset");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "asset");
      v25 = objc_claimAutoreleasedReturnValue();
      v53 = v20;
      if (v11)
        objc_msgSend(v11, "indexPath");
      PXIndexPathFromSimpleIndexPath();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "assetCollection");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "indexPathForAsset:hintIndexPath:hintCollection:", v25, v32, v35);
      v33 = (void *)v25;
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v23, "numberOfSections") <= a5
        || (objc_msgSend(v24, "assetCollectionForSection:", a5), (v30 = objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_32:
        if (PXDisplayAssetIsSyndicatedAndUnsaved(v20))
        {
          -[PXPhotoKitAssetsDataSource _indexPathForSavedSyndicatedAssetReference:](self, "_indexPathForSavedSyndicatedAssetReference:", v11);
          v36 = v57;
          *(_OWORD *)&retstr->dataSourceIdentifier = v56;
          *(_OWORD *)&retstr->item = v36;
        }
        goto LABEL_34;
      }
      v31 = (void *)v30;
      v53 = v20;
      objc_msgSend(v11, "asset");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "indexPathForAsset:inCollection:", v32, v31);
      v33 = v31;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v20 = v53;
    if (v34)
    {

LABEL_40:
      -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
      PXSimpleIndexPathFromIndexPath();
      v40 = v57;
      *(_OWORD *)&retstr->dataSourceIdentifier = v56;
      *(_OWORD *)&retstr->item = v40;
      goto LABEL_41;
    }
    goto LABEL_32;
  }
  objc_msgSend(v11, "asset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v24, "uuid");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v24, "burstIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = v29;
      }
      else
      {

        v52 = 0;
      }
      -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "indexPathForLastAsset");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v28;
      objc_msgSend(v39, "indexPathForAssetWithUUID:orBurstIdentifier:hintIndexPath:hintCollection:", v28, v52, v38, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_41;
      goto LABEL_40;
    }
  }
LABEL_34:

  v34 = 0;
LABEL_41:

  a3 = v54;
LABEL_42:

LABEL_43:
  if (retstr->dataSourceIdentifier != dataSourceIdentifier)
  {
    section = retstr->section;
    if (section >= -[PXPhotoKitAssetsDataSource numberOfSections](self, "numberOfSections"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 256, CFSTR("Section must be valid"));

    }
    item = retstr->item;
    if (item != 0x7FFFFFFFFFFFFFFFLL
      && item >= -[PXPhotoKitAssetsDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", retstr->section))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 257, CFSTR("Item must be valid"));

    }
  }
LABEL_49:

  return result;
}

- (PXSimpleIndexPath)_indexPathForSavedSyndicatedAssetReference:(SEL)a3
{
  id v7;
  __int128 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PXSimpleIndexPath *result;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;

  v7 = a4;
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v8;
  objc_msgSend(v7, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!PXDisplayAssetIsSyndicatedAndUnsaved(v9))
    goto LABEL_9;
  v10 = v9;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 268, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("removedDisplayAsset"), v19);
LABEL_12:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 268, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("removedDisplayAsset"), v19, v21);

    goto LABEL_12;
  }
LABEL_4:
  objc_msgSend(v10, "fetchPropertySetsIfNeeded");
  objc_msgSend(v10, "curationProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "syndicationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v7)
      objc_msgSend(v7, "indexPath");
    PXIndexPathFromSimpleIndexPath();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexPathForAssetWithUUID:orSyndicationIdentifier:hintIndexPath:hintCollection:", 0, v12, v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
    PXSimpleIndexPathFromIndexPath();
    *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
    *(_OWORD *)&retstr->item = 0u;

  }
LABEL_9:

  return result;
}

- (id)keyAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  void *v10;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPhotoKitAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyAssetsInSection:", a3->section);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sectionForAssetCollection:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "keyAssetsInSection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)curatedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  void *v10;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPhotoKitAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndexPath.dataSourceIdentifier == self.identifier"));

  }
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "curatedAssetsInSection:", a3->section);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)uncuratedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  void *v10;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPhotoKitAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndexPath.dataSourceIdentifier == self.identifier"));

  }
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uncuratedAssetsInSection:", a3->section);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)numberOfUncuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  int64_t v9;
  void *v11;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPhotoKitAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndexPath.dataSourceIdentifier == self.identifier"));

  }
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uncuratedAssetsInSection:", a3->section);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (int64_t)numberOfCuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  int64_t v9;
  void *v11;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPhotoKitAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndexPath.dataSourceIdentifier == self.identifier"));

  }
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "curatedAssetsInSection:", a3->section);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (int64_t)numberOfUncuratedItemsInAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uncuratedAssetsForAssetCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (int64_t)numberOfCuratedItemsInAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "curatedAssetsForAssetCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (BOOL)getAssetCounts:(id *)a3 guestAssetCounts:(id *)a4 allowFetch:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int64x2_t v26;
  int64x2_t v27;
  int64x2_t v28;
  __int128 v29;
  uint64_t v30;
  int64x2_t v31;
  unint64_t v32;
  _BYTE v33[24];

  v5 = a5;
  v8 = *(_QWORD *)off_1E50B7EE0;
  v7 = *((_QWORD *)off_1E50B7EE0 + 1);
  v9 = *((_QWORD *)off_1E50B7EE0 + 2);
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotosMetadataFetcher sharedFetcherForPhotoLibrary:](PXPhotosMetadataFetcher, "sharedFetcherForPhotoLibrary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXPhotoKitAssetsDataSource numberOfSections](self, "numberOfSections");
  v15.i64[0] = v8;
  v15.i64[1] = v7;
  v28 = v15;
  v15.i64[0] = v7;
  v15.i64[1] = v9;
  v27 = v15;
  if (v14 < 1)
  {
    v17 = 1;
    v19 = v9;
    goto LABEL_15;
  }
  v16 = v14;
  v17 = 0;
  v18 = 0;
  v19 = v9;
  while (1)
  {
    objc_msgSend(v13, "assetsInSection:", v18);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
      break;
LABEL_9:
    v17 = ++v18 >= v16;
    if (v16 == v18)
      goto LABEL_15;
  }
  v21 = (void *)v20;
  *(_OWORD *)v33 = *(_OWORD *)off_1E50B7EE0;
  *(_QWORD *)&v33[16] = v9;
  v26 = *(int64x2_t *)v33;
  v31 = *(int64x2_t *)v33;
  v32 = v9;
  if (objc_msgSend(v12, "getAssetCounts:guestAssetCounts:forFetchResult:allowFetch:", v33, &v31, v20, v5))
  {
    objc_msgSend(v13, "assetCollectionForSection:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "px_isAllPhotosSmartAlbum") & 1) != 0
      || objc_msgSend(v22, "px_isRecentsSmartAlbum"))
    {
      PXDisplayAssetDetailedCountsSubtract();
      *(_OWORD *)v33 = v29;
      *(_QWORD *)&v33[16] = v30;
    }
    else if (objc_msgSend(v22, "px_isContentSyndicationAlbum"))
    {
      v31 = v26;
      v32 = v9;
    }
    v8 += *(_QWORD *)v33;
    v27 = vaddq_s64(*(int64x2_t *)&v33[8], v27);
    v28 = vaddq_s64(v31, v28);
    v19 += v32;

    goto LABEL_9;
  }
  v28 = *(int64x2_t *)off_1E50B7ED8;
  v19 = *((_QWORD *)off_1E50B7ED8 + 2);

  v27 = vzip2q_s64(v28, vdupq_n_s64(v19));
  v8 = v28.i64[0];
LABEL_15:
  if (a3)
  {
    a3->var0 = v8;
    *(int64x2_t *)&a3->var1 = v27;
  }
  if (a4)
  {
    *(int64x2_t *)&a4->var0 = v28;
    a4->var2 = v19;
  }

  return v17;
}

- (id)primaryFaceForAssetAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  _OWORD v9[2];

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v5;
  objc_msgSend(v4, "facesAtSimpleIndexPath:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_fastKeyCuratedAssetForAssetCollection:(id)a3
{
  id v4;
  NSCache *fetchedKeyAssetByAssetCollectionLocalIdentifierCache;
  NSCache *v6;
  NSCache *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXPhotosAssetsFetcherConfiguration *v13;
  void *v14;
  NSCache *v15;
  void *v16;
  void *v17;

  v4 = a3;
  fetchedKeyAssetByAssetCollectionLocalIdentifierCache = self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache;
  if (!fetchedKeyAssetByAssetCollectionLocalIdentifierCache)
  {
    v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v7 = self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache;
    self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache = v6;

    fetchedKeyAssetByAssetCollectionLocalIdentifierCache = self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache;
  }
  objc_msgSend(v4, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](fetchedKeyAssetByAssetCollectionLocalIdentifierCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (objc_msgSend(v4, "px_supportsFastCuration"))
    {
      -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPhotosAssetsFetcher sharedFetcherForPhotoLibrary:](PXPhotosAssetsFetcher, "sharedFetcherForPhotoLibrary:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_alloc_init(PXPhotosAssetsFetcherConfiguration);
      -[PXPhotosAssetsFetcherConfiguration setCurationKind:](v13, "setCurationKind:", 5);
      -[PXPhotosAssetsFetcherConfiguration setLibraryFilter:](v13, "setLibraryFilter:", -[PXPhotoKitAssetsDataSource libraryFilter](self, "libraryFilter"));
      objc_msgSend(v12, "fetchAssetsInContainer:configuration:", v4, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache;
      objc_msgSend(v4, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache setObject:forKey:](v15, "setObject:forKey:", v9, v16);

    }
    else
    {
      v9 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v17)
  {

    v9 = 0;
  }

  return v9;
}

- (id)objectReferenceNearestToObjectReference:(id)a3
{
  return -[PXPhotoKitAssetsDataSource objectReferenceNearestToObjectReference:inSection:](self, "objectReferenceNearestToObjectReference:inSection:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (id)objectReferenceNearestToObjectReference:(id)a3 inSection:(int64_t)a4
{
  id v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  id v16;
  void *v17;
  NSCache *assetReferenceNearestToAssetCache;
  NSCache *v19;
  NSCache *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29;
  __int128 v30;
  int64_t v31;
  NSObject *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v38;
  objc_class *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  int64_t v50;
  int64_t v51;
  uint64_t v52;
  int64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  int64x2_t v57;
  _BYTE v58[32];
  objc_super v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[16];
  __int128 v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "options");

  if (v7)
  {
    objc_msgSend(v7, "indexPath");
    v10 = v60;
  }
  else
  {
    v10 = 0;
    v60 = 0u;
    v61 = 0u;
  }
  if (v10 == -[PXPhotoKitAssetsDataSource identifier](self, "identifier"))
    v11 = v7;
  else
    v11 = 0;
  v12 = v7;
  if (v11)
    goto LABEL_62;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v59.receiver = self;
    v59.super_class = (Class)PXPhotoKitAssetsDataSource;
    -[PXPhotoKitAssetsDataSource objectReferenceNearestToObjectReference:](&v59, sel_objectReferenceNearestToObjectReference_, v7);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_OWORD *)buf = 0u;
    v63 = 0u;
    -[PXPhotoKitAssetsDataSource _indexPathForObjectReference:restrictedToSection:](self, "_indexPathForObjectReference:restrictedToSection:", v7, a4);
    if (!*(_QWORD *)off_1E50B7E98)
      goto LABEL_13;
    *(_OWORD *)v58 = *(_OWORD *)buf;
    *(_OWORD *)&v58[16] = v63;
    -[PXPhotoKitAssetsDataSource objectReferenceAtIndexPath:](self, "objectReferenceAtIndexPath:", v58);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v13;
  if (v13)
    goto LABEL_62;
LABEL_13:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v9 & 0x800) != 0)
  {
    -[PXPhotoKitAssetsDataSource _assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch:](self, "_assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_62;
  }
  if ((v9 & 0x80) != 0)
  {
    -[PXPhotoKitAssetsDataSource _assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate:](self, "_assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_62;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v7, "itemObject"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v14,
        (isKindOfClass & 1) == 0))
  {
    v12 = 0;
    goto LABEL_62;
  }
  v16 = v7;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "px_descriptionForAssertionMessage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 460, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference"), v40, v42);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 460, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference"), v40);
  }

LABEL_22:
  objc_msgSend(v16, "asset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 461, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetReference.asset"), v45);
LABEL_68:

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_descriptionForAssertionMessage");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 461, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetReference.asset"), v45, v47);

    goto LABEL_68;
  }
LABEL_24:
  assetReferenceNearestToAssetCache = self->_assetReferenceNearestToAssetCache;
  if (!assetReferenceNearestToAssetCache)
  {
    v19 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v20 = self->_assetReferenceNearestToAssetCache;
    self->_assetReferenceNearestToAssetCache = v19;

    assetReferenceNearestToAssetCache = self->_assetReferenceNearestToAssetCache;
  }
  -[NSCache objectForKey:](assetReferenceNearestToAssetCache, "objectForKey:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (-[PXPhotoKitAssetsDataSource containsAnyItems](self, "containsAnyItems"))
    {
      if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(_OWORD *)buf = 0u;
        v63 = 0u;
        if (v7)
          objc_msgSend(v16, "indexPath");
        v21 = objc_alloc((Class)off_1E50B1668);
        objc_msgSend(v16, "assetCollection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0x7FFFFFFFFFFFFFFFLL;
        v56 = *(_OWORD *)buf;
        v57 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        v48 = v57.i64[1];
        v24 = (void *)objc_msgSend(v21, "initWithAssetCollection:keyAssetReference:indexPath:", v22, 0, &v56);

        -[PXPhotoKitAssetsDataSource indexPathForAssetCollectionReference:](self, "indexPathForAssetCollectionReference:", v24);
        v25 = *(_QWORD *)v58;
        v26 = *(_QWORD *)off_1E50B7E98;
        if (*(_QWORD *)v58 == *(_QWORD *)off_1E50B7E98)
        {
          v27 = *(_QWORD *)&buf[8];
          v28 = -[PXPhotoKitAssetsDataSource numberOfSections](self, "numberOfSections") - 1;
          if (v27 < v28)
            v28 = v27;
          v29 = v28 & ~(v28 >> 63);
          v25 = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
          *((_QWORD *)&v30 + 1) = v48;
          *(_QWORD *)&v30 = v29;
        }
        else
        {
          v30 = *(_OWORD *)&v58[8];
          v23 = *(_QWORD *)&v58[24];
        }
        v53 = v25;
        v54 = v30;
        v55 = v23;
        -[PXPhotoKitAssetsDataSource firstNonEmptySectionAtOrBeforeSection:](self, "firstNonEmptySectionAtOrBeforeSection:", &v53);
        a4 = *(_QWORD *)&v58[8];
        v31 = *(_QWORD *)v58;
        if (*(_QWORD *)v58 == v26)
        {
          -[PXPhotoKitAssetsDataSource firstItemIndexPath](self, "firstItemIndexPath");
          v31 = v26;
          if (v52 != v26)
          {
            -[PXPhotoKitAssetsDataSource firstItemIndexPath](self, "firstItemIndexPath");
            v31 = v50;
            a4 = v51;
          }
        }

      }
      else
      {
        v31 = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
        v26 = *(_QWORD *)off_1E50B7E98;
      }
      if (v31 == v26)
      {
        PXAssertGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A6789000, v32, OS_LOG_TYPE_ERROR, "At this point, since the data source contains at least 1 item, we should have a sectionToSearch", buf, 2u);
        }
        v12 = 0;
      }
      else
      {
        -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
        v32 = objc_claimAutoreleasedReturnValue();
        -[NSObject assetsInSection:](v32, "assetsInSection:", a4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "px_indexOfSortedAssetNearestToAsset:", v17);
        if (v34 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_58;
        if (!objc_msgSend(v33, "count"))
          goto LABEL_55;
        if (v7)
        {
          objc_msgSend(v16, "indexPath");
          v34 = v49;
        }
        else
        {
          v34 = 0;
        }
        v35 = objc_msgSend(v33, "count");
        if (v34 >= v35 - 1)
          v34 = v35 - 1;
        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_55:
          PXAssertGetLog();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = self;
            _os_log_error_impl(&dword_1A6789000, v36, OS_LOG_TYPE_ERROR, "Should be able to return some closest asset reference in non-empty data source:%@", buf, 0xCu);
          }

          v12 = 0;
        }
        else
        {
LABEL_58:
          *(_QWORD *)buf = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
          *(_QWORD *)&buf[8] = a4;
          *(_QWORD *)&v63 = v34;
          *((_QWORD *)&v63 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          -[PXPhotoKitAssetsDataSource assetReferenceAtItemIndexPath:](self, "assetReferenceAtItemIndexPath:", buf);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache setObject:forKey:](self->_assetReferenceNearestToAssetCache, "setObject:forKey:", v12, v17);
        }

      }
    }
    else
    {
      v12 = 0;
    }
  }

LABEL_62:
  return v12;
}

- (id)_assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate:(id)a3
{
  id v5;
  void *v6;
  __int16 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v29;
  __int128 v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  __int128 v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  id v55;
  void *v57;
  void *v58;
  objc_class *v59;
  void *v60;
  objc_class *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int64_t v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[5];
  id v70;
  __int128 *v71;
  __int128 *v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  BOOL (*v77)(_QWORD *, uint64_t);
  void *v78;
  PXPhotoKitAssetsDataSource *v79;
  id v80;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v83;
  void *v84;
  _OWORD v85[2];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "options");

  if ((v7 & 0x80) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXOptionsHasSpecificValue(photosDataSourceOptions, PXPhotosDataSourceOptionAssetCollectionsAreSortedByIncreasingCreationDate)"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
LABEL_21:
    v15 = 0;
    v17 = 0;
    goto LABEL_74;
  }
  v10 = v5;
  objc_msgSend(v10, "keyAssetReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v10, "assetCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_11:
        if (objc_msgSend(v12, "assetCollectionSubtype") == 1000000301)
        {
          objc_msgSend(v12, "startDate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 0;
        }
        else
        {
          PLCuratedLibraryGetLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v10;
            _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Missing key curated asset in %@. Degrading gracefully, but transitions might not work as expected.", (uint8_t *)&buf, 0xCu);
          }

          -[PXPhotoKitAssetsDataSource _fastKeyCuratedAssetForAssetCollection:](self, "_fastKeyCuratedAssetForAssetCollection:", v12);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "creationDate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (objc_class *)objc_opt_class();
      NSStringFromClass(v61);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 554, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v60, v62);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 554, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v60);
    }

    goto LABEL_11;
  }
  objc_msgSend(v8, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:
  if (!v9)
    goto LABEL_21;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v83 = 0x4010000000;
  v84 = &unk_1A7E74EE7;
  memset(v85, 0, sizeof(v85));
  *(_QWORD *)&v85[0] = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
  *(_OWORD *)((char *)v85 + 8) = xmmword_1A7C0C1F0;
  *((_QWORD *)&v85[1] + 1) = 0x7FFFFFFFFFFFFFFFLL;
  v14 = -[PXPhotoKitAssetsDataSource numberOfSections](self, "numberOfSections");
  v75 = MEMORY[0x1E0C809B0];
  v76 = 3221225472;
  v77 = __118__PXPhotoKitAssetsDataSource__assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate___block_invoke;
  v78 = &unk_1E511E4C8;
  p_buf = &buf;
  v79 = self;
  v15 = v9;
  v80 = v15;
  v16 = PXLastIndexInSortedRangePassingTest();
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0;
  }
  else
  {
    v66 = v14;
    v18 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    if ((v16 & 0x8000000000000000) == 0)
    {
      while (1)
      {
        v19 = *((_QWORD *)&buf + 1);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v16;
        v20 = *(_OWORD *)(v19 + 48);
        v73 = *(_OWORD *)(v19 + 32);
        v74 = v20;
        -[PXPhotoKitAssetsDataSource assetCollectionAtSectionIndexPath:](self, "assetCollectionAtSectionIndexPath:", &v73);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "startDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (!v22)
          break;
        objc_msgSend(v22, "timeIntervalSinceDate:", v15);
        if (v24 > 0.0)
          break;
        objc_msgSend(v21, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25 && (objc_msgSend(v25, "timeIntervalSinceDate:", v15), v27 >= 0.0))
        {
          objc_msgSend(v18, "addIndex:", v16);
        }
        else if (objc_msgSend(v18, "count"))
        {

          break;
        }

        if (v16-- <= 0)
          goto LABEL_34;
      }

    }
LABEL_34:
    if (objc_msgSend(v18, "count"))
    {
      *(_QWORD *)&v73 = 0;
      *((_QWORD *)&v73 + 1) = &v73;
      v74 = 0x2020000000uLL;
      *((_QWORD *)&v74 + 1) = objc_msgSend(v18, "lastIndex");
      if ((unint64_t)objc_msgSend(v18, "count") >= 2 && v8)
      {
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __118__PXPhotoKitAssetsDataSource__assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate___block_invoke_2;
        v69[3] = &unk_1E511E4F0;
        v71 = &buf;
        v69[4] = self;
        v70 = v8;
        v72 = &v73;
        objc_msgSend(v18, "enumerateIndexesWithOptions:usingBlock:", 2, v69);

      }
      v29 = *((_QWORD *)&buf + 1);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 24);
      v30 = *(_OWORD *)(v29 + 48);
      v67 = *(_OWORD *)(v29 + 32);
      v68 = v30;
      -[PXPhotoKitAssetsDataSource assetCollectionReferenceAtSectionIndexPath:](self, "assetCollectionReferenceAtSectionIndexPath:", &v67);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if ((v7 & 0x200) == 0)
        goto LABEL_70;
      objc_msgSend(v31, "assetCollection");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "assetCollectionSubtype") == 1000000302;

      if (!v34)
        goto LABEL_70;
      v35 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 24) + 1;
      if (v35 >= v66)
        goto LABEL_70;
      v65 = 0;
      v36 = 1.79769313e308;
      while (1)
      {
        v37 = *((_QWORD *)&buf + 1);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v35;
        v38 = *(_OWORD *)(v37 + 48);
        v67 = *(_OWORD *)(v37 + 32);
        v68 = v38;
        -[PXPhotoKitAssetsDataSource assetCollectionReferenceAtSectionIndexPath:](self, "assetCollectionReferenceAtSectionIndexPath:", &v67);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "assetCollection");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "assetCollectionSubtype") == 1000000302;

        if (v41)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v39, "assetCollection");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "startDate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (!v43)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v64;
          }
          objc_msgSend(v15, "timeIntervalSinceDate:", v44);
          v46 = v45;
          if (!v43)

          if (v46 >= 0.0)
            v47 = v46;
          else
            v47 = -v46;
          objc_msgSend(v42, "endDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48;
          if (!v48)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v63;
          }
          objc_msgSend(v15, "timeIntervalSinceDate:", v49);
          v51 = v50;
          if (!v48)

          v52 = -v51;
          if (v51 >= 0.0)
            v52 = v51;
          if (v47 >= v52)
            v53 = v52;
          else
            v53 = v47;
          if (v53 >= v36)
          {
            v53 = v36;
          }
          else
          {
            v54 = v39;

            v65 = v54;
          }

          v36 = v53;
        }

        if (v66 == ++v35)
          goto LABEL_68;
      }

LABEL_68:
      if (v65)
      {
        v17 = v65;

      }
      else
      {
LABEL_70:
        v17 = v32;
      }
      _Block_object_dispose(&v73, 8);
    }
    else
    {
      v17 = 0;
    }

  }
  _Block_object_dispose(&buf, 8);
LABEL_74:
  v55 = v17;

  return v55;
}

- (id)_assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch:(id)a3
{
  id v5;
  void *v6;
  __int16 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void (**v12)(void *, _QWORD *, void *, uint64_t, uint64_t *, uint64_t *);
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  void (**v23)(void *, uint64_t);
  void *v24;
  __int128 v25;
  void *v27;
  id v28;
  int64x2_t v29;
  _OWORD v30[2];
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  int64_t *v35;
  _QWORD *v36;
  _QWORD v37[4];
  int64_t v38;
  int64_t *v39;
  int64x2_t v40;
  __int128 v41;
  __int128 v42;
  _QWORD aBlock[4];
  id v44;
  PXPhotoKitAssetsDataSource *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v5 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "options");

  if ((v7 & 0x800) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 647, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXOptionsHasSpecificValue(self.photosDataSource.options, PXPhotosDataSourceOptionAllowExhaustiveNearestToObjectSearch)"));

  }
  objc_msgSend(v5, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v28 = v5;
    v48 = 0;
    v49 = 0x7FFFFFFFFFFFFFFFLL;
    v46 = 0;
    v47 = 0x7FFFFFFFFFFFFFFFLL;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke;
    aBlock[3] = &unk_1E511E518;
    v11 = v9;
    v44 = v11;
    v45 = self;
    v12 = (void (**)(void *, _QWORD *, void *, uint64_t, uint64_t *, uint64_t *))_Block_copy(aBlock);
    v13 = -[PXPhotoKitAssetsDataSource numberOfSections](self, "numberOfSections");
    v14 = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
    if (v13 >= 1)
    {
      v15 = v14;
      v16 = 0;
      v29 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        v38 = v15;
        v39 = v16;
        v40 = v29;
        -[PXPhotoKitAssetsDataSource assetCollectionAtSectionIndexPath:](self, "assetCollectionAtSectionIndexPath:", &v38);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v16, v18, -1, &v49, &v48);

        objc_msgSend(v17, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v16, v19, 1, &v47, &v46);

        v16 = (int64_t *)((char *)v16 + 1);
      }
      while ((int64_t *)v13 != v16);
    }
    v38 = 0;
    v39 = &v38;
    v40.i64[0] = 0x4010000000;
    v40.i64[1] = (uint64_t)&unk_1A7E74EE7;
    v20 = *((_OWORD *)off_1E50B8778 + 1);
    v41 = *(_OWORD *)off_1E50B8778;
    v42 = v20;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    v21 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke_2;
    v33[3] = &unk_1E511E540;
    v33[4] = self;
    v34 = v11;
    v35 = &v38;
    v36 = v37;
    v31[0] = v21;
    v31[1] = 3221225472;
    v31[2] = __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke_3;
    v31[3] = &unk_1E511E568;
    v31[4] = self;
    v22 = _Block_copy(v33);
    v32 = v22;
    v23 = (void (**)(void *, uint64_t))_Block_copy(v31);
    v23[2](v23, v49);
    if (v47 != v49)
      ((void (*)(void (**)(void *, uint64_t)))v23[2])(v23);
    if (v39[4] == *(_QWORD *)off_1E50B7E98)
    {
      v24 = 0;
    }
    else
    {
      v25 = *((_OWORD *)v39 + 3);
      v30[0] = *((_OWORD *)v39 + 2);
      v30[1] = v25;
      -[PXPhotoKitAssetsDataSource assetReferenceAtItemIndexPath:](self, "assetReferenceAtItemIndexPath:", v30);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(&v38, 8);

    v5 = v28;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)assetCollectionReferenceNearestToObjectReference:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXPhotoKitAssetsDataSource;
  -[PXPhotoKitAssetsDataSource assetCollectionReferenceNearestToObjectReference:](&v7, sel_assetCollectionReferenceNearestToObjectReference_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXPhotoKitAssetsDataSource objectReferenceNearestToObjectReference:](self, "objectReferenceNearestToObjectReference:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  void *v15;
  int64_t v16;
  PXSimpleIndexPath *result;
  id v18;

  v18 = a4;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSections");
  if (v7 < 1)
  {
LABEL_5:
    v14 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&retstr->item = v14;
  }
  else
  {
    v8 = v7;
    v9 = 0;
    while (1)
    {
      -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "assetsInSection:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "fetchedObjectIDsSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v18);

      if (v13)
        break;

      if (v8 == ++v9)
        goto LABEL_5;
    }
    objc_msgSend(v11, "fetchedObjectIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "indexOfObject:", v18);

    retstr->dataSourceIdentifier = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
    retstr->section = v9;
    retstr->item = v16;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;

  }
  return result;
}

- (id)indexPathSetForObjectIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v4 = a3;
  v22 = objc_msgSend(v4, "count");
  if (v22)
  {
    -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
    v5 = objc_msgSend(v20, "numberOfSections");
    objc_msgSend(off_1E50B3668, "indexPathSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v5;
    if (v5 >= 1)
    {
      v6 = 0;
      v7 = 0;
      while (1)
      {
        -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "assetsInSection:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "fetchedObjectIDsSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "intersectSet:", v10);
        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v9, "fetchedObjectIDs");
          v12 = v4;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = MEMORY[0x1E0C809B0];
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __55__PXPhotoKitAssetsDataSource_indexPathSetForObjectIDs___block_invoke;
          v27[3] = &unk_1E511E590;
          v15 = v11;
          v28 = v15;
          objc_msgSend(v13, "indexesOfObjectsPassingTest:", v27);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = v14;
          v25[1] = 3221225472;
          v25[2] = __55__PXPhotoKitAssetsDataSource_indexPathSetForObjectIDs___block_invoke_2;
          v25[3] = &unk_1E5128958;
          v26 = v16;
          v17 = v16;
          objc_msgSend(v23, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v21, v6, v25);
          v7 += objc_msgSend(v17, "count");

          v4 = v12;
          if (v7 == v22)
            break;
        }

        if (v24 == ++v6)
          goto LABEL_10;
      }

    }
LABEL_10:

    v18 = v23;
  }
  else
  {
    objc_msgSend(off_1E50B3180, "indexPathSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)assetIdentifierAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  __int128 v15;
  _OWORD v16[2];
  objc_super v17;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPhotoKitAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 788, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 789, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

  }
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetsInSection:", a3->section);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectIDAtIndex:", a3->item);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    return v11;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotoKitAssetsDataSource;
  v15 = *(_OWORD *)&a3->item;
  v16[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v16[1] = v15;
  -[PXPhotoKitAssetsDataSource assetIdentifierAtItemIndexPath:](&v17, sel_assetIdentifierAtItemIndexPath_, v16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)container
{
  void *v2;
  void *v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastAssetCollection
{
  void *v2;
  void *v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3
{
  return -[PXPhotoKitAssetsDataSource assetCollectionReferencesWithParentAssetCollectionReference:assetCollectionReferenceWithSameKeyAssetAsParent:](self, "assetCollectionReferencesWithParentAssetCollectionReference:assetCollectionReferenceWithSameKeyAssetAsParent:", a3, 0);
}

- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3 assetCollectionReferenceWithSameKeyAssetAsParent:(id *)a4
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v31;
  objc_class *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  id v43;
  void *v45;
  int64x2_t v47;
  int64_t v48;
  uint64_t v49;
  int64x2_t v50;

  v4 = a3;
  objc_msgSend(v4, "assetCollection");
  v5 = 0x1E0CD1000uLL;
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 822, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("parentAssetCollectionReference.assetCollection"), v33);
LABEL_28:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "px_descriptionForAssertionMessage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 822, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("parentAssetCollectionReference.assetCollection"), v33, v35);

    goto LABEL_28;
  }
LABEL_3:
  v41 = v4;
  objc_msgSend(v4, "keyAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 823, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("parentAssetCollectionReference.keyAssetReference.asset"), v38, v39);

    }
  }
  v42 = v7;
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
  v9 = -[PXPhotoKitAssetsDataSource numberOfSections](self, "numberOfSections");
  v10 = v45;
  if (v9)
  {
    v11 = v9;
    v12 = 0;
    v47 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    while (1)
    {
      v48 = v8;
      v49 = v12;
      v50 = v47;
      -[PXPhotoKitAssetsDataSource assetCollectionAtSectionIndexPath:](self, "assetCollectionAtSectionIndexPath:", &v48);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "px_highlightKind") != -1)
        break;
LABEL_17:

      if (v11 == ++v12)
        goto LABEL_22;
    }
    v14 = v13;
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_11:
        v15 = v5;
        objc_msgSend(v14, "parentPhotosHighlight");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (v18)
        {
          v19 = objc_alloc((Class)off_1E50B1668);
          v48 = v8;
          v49 = v12;
          v50 = v47;
          v20 = (void *)objc_msgSend(v19, "initWithAssetCollection:keyAssetReference:indexPath:", v14, 0, &v48);
          objc_msgSend(v43, "addObject:", v20);
          if (a4)
          {
            objc_msgSend(v42, "objectID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "keyAssetObjectIDForKind");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "isEqual:", v22);

            if (v23)
              *a4 = objc_retainAutorelease(v20);
          }

          v10 = v45;
        }

        v5 = v15;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "px_descriptionForAssertionMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 833, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("candidateAssetCollection"), v26, v28);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSource.m"), 833, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("candidateAssetCollection"), v26);
    }

    goto LABEL_11;
  }
LABEL_22:
  if (objc_msgSend(v43, "count"))
    v29 = (void *)objc_msgSend(v43, "copy");
  else
    v29 = 0;

  return v29;
}

- (id)startingAssetReference
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v10 = *(_OWORD *)((char *)off_1E50B8778 + 8);
  v11 = *((_QWORD *)off_1E50B8778 + 3);
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfSections") < 1)
  {
    v4 = *(_QWORD *)off_1E50B8778;
  }
  else
  {
    if (-[PXPhotoKitAssetsDataSource startsAtEnd](self, "startsAtEnd"))
      -[PXPhotoKitAssetsDataSource lastItemIndexPath](self, "lastItemIndexPath");
    else
      -[PXPhotoKitAssetsDataSource firstItemIndexPath](self, "firstItemIndexPath");
    v4 = v7;
    v10 = v8;
    v11 = v9;
  }
  if (v4 == *(_QWORD *)off_1E50B7E98)
  {
    v5 = 0;
  }
  else
  {
    v7 = v4;
    v8 = v10;
    v9 = v11;
    -[PXPhotoKitAssetsDataSource assetReferenceAtItemIndexPath:](self, "assetReferenceAtItemIndexPath:", &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (int64_t)startingSection
{
  void *v3;
  int64_t v4;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfSections") < 1)
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (-[PXPhotoKitAssetsDataSource startsAtEnd](self, "startsAtEnd"))
  {
    v4 = objc_msgSend(v3, "numberOfSections") - 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)startsAtEnd
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "startsAtEnd");
  }
  else if (objc_msgSend(v2, "numberOfSections") < 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "assetCollectionForSection:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "startsAtEnd");

  }
  v7 = v5 ^ objc_msgSend(v2, "reverseSortOrder");

  return v7;
}

- (BOOL)isFiltered
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)filterPredicate
{
  void *v2;
  void *v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  void *v2;
  char v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "includeOthersInSocialGroupAssets");

  return v3;
}

- (BOOL)ignoreSharedLibraryFilters
{
  void *v2;
  char v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreSharedLibraryFilters");

  return v3;
}

- (BOOL)isSorted
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)containsMultipleItems
{
  void *v2;
  char v3;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsMultipleAssets");

  return v3;
}

- (BOOL)couldObjectReferenceAppear:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  BOOL v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v6, "isEmpty");

      if ((v8 & 1) != 0)
      {
        v9 = 1;
LABEL_15:

        v10 = v9 != 0;
        goto LABEL_16;
      }
      objc_msgSend(v5, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isCloudSharedAsset");

      v13 = objc_msgSend(v6, "numberOfSections");
      if (v13 < 1)
      {
        v9 = 0;
        goto LABEL_15;
      }
      v14 = v13;
      v7 = 0;
      v15 = 1;
      do
      {
        v16 = v7;
        objc_msgSend(v6, "assetCollectionForSection:", v15 - 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v12 ^ objc_msgSend(v7, "isCloudSharedAlbum");
      }
      while (v17 == 1 && v15++ < v14);
      v9 = v17 ^ 1;
    }
    else
    {
      v9 = 1;
    }

    goto LABEL_15;
  }
  v10 = 1;
LABEL_16:

  return v10;
}

- (BOOL)isSectionConsideredAccurate:(int64_t)a3
{
  void *v4;

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "isSectionConsideredAccurate:", a3);

  return a3;
}

- (void)prefetchIndexPaths:(id)a3
{
  -[PXPhotoKitAssetsDataSource prefetchIndexPaths:level:](self, "prefetchIndexPaths:level:", a3, 0);
}

- (void)prefetchIndexPaths:(id)a3 level:(unint64_t)a4
{
  _BOOL8 v5;
  id v6;
  id v7;

  v5 = a4 == 1;
  v6 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prefetchAssetsAtIndexPaths:onlyThumbnailAssets:", v6, v5);

}

- (id)fetchAllItemObjects
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[PXPhotoKitAssetsDataSource numberOfSections](self, "numberOfSections") == 1)
  {
    -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetsInSection:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXPhotoKitAssetsDataSource;
    -[PXPhotoKitAssetsDataSource fetchAllItemObjects](&v6, sel_fetchAllItemObjects);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)inputForItem:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];

  v4 = a3;
  v5 = -[PXPhotoKitAssetsDataSource identifier](self, "identifier");
  v6 = objc_msgSend(v4, "px_section");
  v7 = objc_msgSend(v4, "px_item");
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "px_section");

  objc_msgSend(v8, "assetCollectionForSection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "wantsCurationForAssetCollection:", v10);

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v19[1] = v6;
  v19[2] = v7;
  v19[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v12, "assetAtSimpleIndexPath:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v9)
  {
    objc_msgSend(v13, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_layoutItemByAssetCache, "objectForKey:", v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "weightForAsset:", v13);

      v17 = objc_alloc((Class)off_1E50B3218);
      objc_msgSend(v13, "size");
      v15 = (id)objc_msgSend(v17, "initWithSize:weight:");
      -[NSMutableDictionary setObject:forKey:](self->_layoutItemByAssetCache, "setObject:forKey:", v15, v14);
    }

  }
  else
  {
    v15 = v13;
  }

  return v15;
}

- (id)selectionSnapshotForAsset:(id)a3 assetCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v6 = a4;
  v7 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForAsset:inCollection:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = objc_msgSend(v8, "versionIdentifier");
  v12[1] = objc_msgSend(v9, "section");
  v12[2] = objc_msgSend(v9, "item");
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  v10 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A80), "initWithDataSource:selectedIndexPath:", self, v12);

  return v10;
}

- (id)selectionSnapshotForAssetsByAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B3668, "indexPathSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __74__PXPhotoKitAssetsDataSource_selectionSnapshotForAssetsByAssetCollection___block_invoke;
  v15 = &unk_1E5131F30;
  v16 = v5;
  v17 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v12);

  v9 = objc_alloc((Class)off_1E50B4A80);
  v10 = (void *)objc_msgSend(v9, "initWithDataSource:selectedIndexPaths:", self, v7, v12, v13, v14, v15);

  return v10;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (PXSectionedDataSourceChangeDetails)changeDetails
{
  return self->_changeDetails;
}

void __74__PXPhotoKitAssetsDataSource_selectionSnapshotForAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "indexPathForAsset:inCollection:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10), v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(*(id *)(a1 + 32), "versionIdentifier");
        v13 = objc_msgSend(v11, "section");
        v14 = objc_msgSend(v11, "item");
        v15 = *(void **)(a1 + 40);
        v16[0] = v12;
        v16[1] = v13;
        v16[2] = v14;
        v16[3] = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(v15, "addIndexPath:", v16);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

uint64_t __55__PXPhotoKitAssetsDataSource_indexPathSetForObjectIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;

  v6 = a2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v6);
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      *a4 = 1;
  }

  return v7;
}

uint64_t __55__PXPhotoKitAssetsDataSource_indexPathSetForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexes:", *(_QWORD *)(a1 + 32));
}

void __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5, double *a6)
{
  id v11;
  double v12;
  double v13;
  BOOL v14;
  id v15;

  v11 = a3;
  if (v11)
  {
    v15 = v11;
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v11 = v15;
    v13 = v12 * (double)a4;
    if (v13 >= 0.0 && (*a5 == 0x7FFFFFFFFFFFFFFFLL || v13 < *a6))
    {
      v14 = objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", a2) < 1;
      v11 = v15;
      if (!v14)
      {
        *a5 = a2;
        *a6 = v13;
      }
    }
  }

}

void __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke_2(_QWORD *a1, _OWORD *a2)
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  _OWORD *v11;
  uint64_t v12;
  __int128 v13;
  _OWORD v14[2];

  v4 = (void *)a1[4];
  v5 = a2[1];
  v14[0] = *a2;
  v14[1] = v5;
  objc_msgSend(v4, "assetAtItemIndexPath:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", a1[5]);
    v9 = fabs(v8);
    v10 = *(_QWORD *)(a1[6] + 8);
    v12 = *(_QWORD *)(v10 + 32);
    v11 = (_OWORD *)(v10 + 32);
    if (v12 == *(_QWORD *)off_1E50B7E98 || v9 < *(double *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      v13 = a2[1];
      *v11 = *a2;
      v11[1] = v13;
      *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = v9;
    }
  }

}

uint64_t __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, _QWORD *, uint64_t, uint64_t);
  _QWORD v13[12];

  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13[10] = v2;
    v13[11] = v3;
    v5 = result;
    v6 = objc_msgSend(*(id *)(result + 32), "identifier");
    result = objc_msgSend(*(id *)(v5 + 32), "numberOfItemsInSection:", a2);
    if (result >= 1)
    {
      v9 = result;
      for (i = 0; i != v9; ++i)
      {
        v11 = *(_QWORD *)(v5 + 40);
        v12 = *(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(v11 + 16);
        v13[0] = v6;
        v13[1] = a2;
        v13[2] = i;
        v13[3] = 0x7FFFFFFFFFFFFFFFLL;
        result = v12(v11, v13, v7, v8);
      }
    }
  }
  return result;
}

BOOL __118__PXPhotoKitAssetsDataSource__assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  _BOOL8 v10;
  _OWORD v12[2];

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = a2;
  v3 = (void *)a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(_OWORD *)(v4 + 48);
  v12[0] = *(_OWORD *)(v4 + 32);
  v12[1] = v5;
  objc_msgSend(v3, "assetCollectionAtSectionIndexPath:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", a1[5]);
    v10 = v9 <= 0.0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __118__PXPhotoKitAssetsDataSource__assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate___block_invoke_2(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  int v10;
  _OWORD v11[2];

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = a2;
  v6 = (void *)a1[4];
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(_OWORD *)(v7 + 48);
  v11[0] = *(_OWORD *)(v7 + 32);
  v11[1] = v8;
  objc_msgSend(v6, "assetsInSectionIndexPath:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", a1[5]);

  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a2;
    *a3 = 1;
  }
}

+ (PXPhotoKitAssetsDataSource)dataSourceWithAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetsDataSource.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSourceWithAssets:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPhotoKitAssetsDataSource *)v7;
}

+ (PXPhotoKitAssetsDataSource)dataSourceWithAssets:(id)a3 userInfo:(id)a4 transientIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetsDataSource.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets.count > 0"));

  }
  v12 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v11, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v11, 0, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSourceWithAssetCollections:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setUserInfo:", v10);
  return (PXPhotoKitAssetsDataSource *)v17;
}

+ (PXPhotoKitAssetsDataSource)dataSourceWithAssets:(id)a3
{
  return (PXPhotoKitAssetsDataSource *)objc_msgSend(a1, "dataSourceWithAssets:userInfo:transientIdentifier:", a3, MEMORY[0x1E0C9AA70], 0);
}

+ (PXPhotoKitAssetsDataSource)dataSourceWithAssetCollections:(id)a3
{
  void *v3;
  void *v4;
  PXPhotosDataSourceConfiguration *v5;
  PXPhotosDataSource *v6;
  PXPhotoKitAssetsDataSource *v7;

  objc_msgSend(MEMORY[0x1E0CD14E0], "transientCollectionListWithCollections:title:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v4, 4);
  v6 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v5);
  v7 = -[PXPhotoKitAssetsDataSource initWithImmutablePhotosDataSource:withChange:]([PXPhotoKitAssetsDataSource alloc], "initWithImmutablePhotosDataSource:withChange:", v6, 0);

  return v7;
}

- (BOOL)isAssetAtIndexPathPartOfCuratedSet:(PXSimpleIndexPath *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v7[2];

  -[PXPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v5;
  LOBYTE(a3) = objc_msgSend(v4, "isAssetAtIndexPathPartOfCuratedSet:", v7);

  return (char)a3;
}

@end
