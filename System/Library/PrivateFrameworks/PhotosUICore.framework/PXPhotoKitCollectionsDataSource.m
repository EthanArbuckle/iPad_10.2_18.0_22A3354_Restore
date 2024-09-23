@implementation PXPhotoKitCollectionsDataSource

- (PXPhotoKitCollectionsDataSource)initWithRootCollectionList:(id)a3 collectionListBySection:(id)a4 collectionsFetchResultBySection:(id)a5 keyAssetsFetchResultsByCollection:(id)a6 collectionsIndexPathsByCollection:(id)a7 itemFetchResultByCollection:(id)a8 virtualCollections:(id)a9 collectionsFetchResult:(id)a10 sharingFilter:(unsigned __int16)a11 dataSourceConfiguration:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  PXPhotoKitCollectionsDataSource *v26;
  PXPhotoKitCollectionsDataSource *v27;
  uint64_t v28;
  NSArray *collectionListBySection;
  uint64_t v30;
  NSArray *collectionsFetchResultBySection;
  uint64_t v32;
  NSDictionary *keyAssetsFetchResultsByCollection;
  uint64_t v34;
  NSDictionary *collectionsIndexPathsByCollection;
  uint64_t v36;
  NSDictionary *itemFetchResultByCollection;
  uint64_t v38;
  PHFetchResult *collectionsFetchResult;
  uint64_t v40;
  NSArray *virtualCollections;
  id v43;
  id v44;
  objc_super v45;

  v43 = a3;
  v44 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a12;
  v45.receiver = self;
  v45.super_class = (Class)PXPhotoKitCollectionsDataSource;
  v26 = -[PXPhotoKitCollectionsDataSource init](&v45, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_collectionList, a3);
    v28 = objc_msgSend(v44, "copy");
    collectionListBySection = v27->__collectionListBySection;
    v27->__collectionListBySection = (NSArray *)v28;

    v30 = objc_msgSend(v19, "copy");
    collectionsFetchResultBySection = v27->__collectionsFetchResultBySection;
    v27->__collectionsFetchResultBySection = (NSArray *)v30;

    v32 = objc_msgSend(v20, "copy");
    keyAssetsFetchResultsByCollection = v27->__keyAssetsFetchResultsByCollection;
    v27->__keyAssetsFetchResultsByCollection = (NSDictionary *)v32;

    v34 = objc_msgSend(v21, "copy");
    collectionsIndexPathsByCollection = v27->__collectionsIndexPathsByCollection;
    v27->__collectionsIndexPathsByCollection = (NSDictionary *)v34;

    v36 = objc_msgSend(v22, "copy");
    itemFetchResultByCollection = v27->_itemFetchResultByCollection;
    v27->_itemFetchResultByCollection = (NSDictionary *)v36;

    v38 = objc_msgSend(v24, "copy");
    collectionsFetchResult = v27->_collectionsFetchResult;
    v27->_collectionsFetchResult = (PHFetchResult *)v38;

    objc_storeStrong((id *)&v27->_configuration, a12);
    v40 = objc_msgSend(v23, "copy");
    virtualCollections = v27->__virtualCollections;
    v27->__virtualCollections = (NSArray *)v40;

    v27->_sharingFilter = a11;
  }

  return v27;
}

- (PXPhotoKitCollectionsDataSource)init
{
  uint64_t v3;

  LOWORD(v3) = 2;
  return -[PXPhotoKitCollectionsDataSource initWithRootCollectionList:collectionListBySection:collectionsFetchResultBySection:keyAssetsFetchResultsByCollection:collectionsIndexPathsByCollection:itemFetchResultByCollection:virtualCollections:collectionsFetchResult:sharingFilter:dataSourceConfiguration:](self, "initWithRootCollectionList:collectionListBySection:collectionsFetchResultBySection:keyAssetsFetchResultsByCollection:collectionsIndexPathsByCollection:itemFetchResultByCollection:virtualCollections:collectionsFetchResult:sharingFilter:dataSourceConfiguration:", 0, 0, 0, 0, 0, 0, 0, 0, v3, 0);
}

- (id)description
{
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v3 = -[PXPhotoKitCollectionsDataSource numberOfSections](self, "numberOfSections");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[PXPhotoKitCollectionsDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", i));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p, numberOfSections:%ld sectionCounts:[%@]>"), v9, self, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  return v6;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;

  -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionsDataSource _keyAssetsFetchResultsByCollection](self, "_keyAssetsFetchResultsByCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  if (v12 <= 1)
    v13 = 1;
  else
    v13 = v12;

  return v13;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v8;
  __int128 v9;

  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
    goto LABEL_9;
  item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_9:
    v6 = *(_OWORD *)&a3->item;
    v8 = *(_OWORD *)&a3->dataSourceIdentifier;
    v9 = v6;
    -[PXPhotoKitCollectionsDataSource _assetAtSimpleIndexPath:](self, "_assetAtSimpleIndexPath:", &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  v5 = *(_OWORD *)&a3->item;
  v8 = *(_OWORD *)&a3->dataSourceIdentifier;
  v9 = v5;
  -[PXPhotoKitCollectionsDataSource _collectionAtSimpleIndexPath:](self, "_collectionAtSimpleIndexPath:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionsDataSource.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsSection(indexPath)"));

    dataSourceIdentifier = a3->dataSourceIdentifier;
  }
  if (dataSourceIdentifier != -[PXPhotoKitCollectionsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionsDataSource.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3->section);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_collectionListAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;

  -[PXPhotoKitCollectionsDataSource _collectionListBySection](self, "_collectionListBySection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3->section);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_collectionAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3->section);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3->item);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_assetAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3->section);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3->item);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitCollectionsDataSource _keyAssetsFetchResultsByCollection](self, "_keyAssetsFetchResultsByCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3->subitem);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)keyAssetsForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSource _keyAssetsFetchResultsByCollection](self, "_keyAssetsFetchResultsByCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  int64x2_t v10;
  void *v13;
  void *v14;
  uint64_t v15;
  int64x2_t v16;
  PXSimpleIndexPath *result;
  int64x2_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  int64x2_t v24;
  uint64_t v25;

  v6 = a4;
  v7 = v6;
  v8 = *(_QWORD *)off_1E50B8778;
  v9 = *((_QWORD *)off_1E50B8778 + 1);
  v18 = *((int64x2_t *)off_1E50B8778 + 1);
  if (!v6)
  {
    if (!-[PXPhotoKitCollectionsDataSource identifier](self, "identifier"))
    {
      v8 = 0;
      v9 = 0;
      v10 = 0uLL;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  objc_msgSend(v6, "indexPath");
  if (v25 != -[PXPhotoKitCollectionsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(v7, "indexPath");
    if (v19 != *(_QWORD *)off_1E50B7E98 && v20 != 0x7FFFFFFFFFFFFFFFLL && v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "itemObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PXPhotoKitCollectionsDataSource indexPathForCollection:](self, "indexPathForCollection:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v8 = -[PXPhotoKitCollectionsDataSource identifier](self, "identifier");
          v9 = objc_msgSend(v14, "section");
          v15 = objc_msgSend(v14, "item");
          v16 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
          v16.i64[0] = v15;
          v18 = v16;
        }

      }
    }
LABEL_19:
    v10 = v18;
    goto LABEL_21;
  }
  objc_msgSend(v7, "indexPath");
  v9 = v23;
  v8 = v22;
  v10 = v24;
LABEL_21:
  retstr->dataSourceIdentifier = v8;
  retstr->section = v9;
  *(int64x2_t *)&retstr->item = v10;

  return result;
}

- (id)indexPathForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSource _collectionsIndexPathsByCollection](self, "_collectionsIndexPathsByCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__PXPhotoKitCollectionsDataSource_indexPathForCollection___block_invoke;
    v10[3] = &unk_1E5140D28;
    v11 = v4;
    v12 = &v18;
    v13 = &v14;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    v8 = v15[3];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, v19[3]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }

  return v6;
}

- (id)collectionAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[16];

  v4 = a3;
  if ((objc_msgSend(v4, "section") & 0x8000000000000000) == 0)
  {
    v5 = objc_msgSend(v4, "section");
    -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 >= objc_msgSend(v6, "count") || objc_msgSend(v4, "item") < 0)
    {

    }
    else
    {
      v7 = objc_msgSend(v4, "item");
      -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v7 < v10)
      {
        -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
    }
  }
  PLUIGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "Requesting for a collection at an indexPath out of bounds.", v16, 2u);
  }

  v13 = 0;
LABEL_10:

  return v13;
}

- (id)collectionListForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v8;
  uint8_t v9[16];

  if (a3 < 0 || -[PXPhotoKitCollectionsDataSource numberOfSections](self, "numberOfSections") <= a3)
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Requesting for a collectionList for a section out of bounds.", v9, 2u);
    }

    return 0;
  }
  else
  {
    -[PXPhotoKitCollectionsDataSource _collectionListBySection](self, "_collectionListBySection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (int64_t)countForCollection:(id)a3
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXPhotoKitCollectionsDataSource sectionedDataSourceLog](self, "sectionedDataSourceLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);
  v8 = v6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    objc_msgSend(v5, "px_cheapLogIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v10;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CountForCollection", "collection==%{public}@", buf, 0xCu);

  }
  v11 = objc_msgSend(v5, "px_isFolder");
  v12 = v5;
  v13 = v12;
  if (v11)
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_7:
        objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PXPhotoKitCollectionsDataSource assetCollectionsCountForFetchResult:](self, "assetCollectionsCountForFetchResult:", v14);
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionsDataSource.m"), 228, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v26, v31);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionsDataSource.m"), 228, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collection"), v26);
    }

    goto LABEL_7;
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionsDataSource.m"), 233, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collection"), v29);
LABEL_32:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionsDataSource.m"), 233, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v29, v33);

    goto LABEL_32;
  }
LABEL_10:
  v16 = objc_msgSend(v13, "px_containsPrivateContent");
  if (objc_msgSend(v13, "assetCollectionType") == 2
    || objc_msgSend(v13, "assetCollectionType") == 9
    || -[PXPhotoKitCollectionsDataSource sharingFilter](self, "sharingFilter") != 2)
  {
    if ((v16 & 1) == 0)
    {
LABEL_18:
      -[PXPhotoKitCollectionsDataSource itemFetchResultByCollection](self, "itemFetchResultByCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v19 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_21;
      }
      v15 = objc_msgSend(v14, "count");
LABEL_20:
      v19 = v15;
LABEL_21:

      goto LABEL_22;
    }
  }
  else
  {
    -[PXPhotoKitCollectionsDataSource itemFetchResultByCollection](self, "itemFetchResultByCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v16 & 1) == 0)
    {
      if (!v18)
      {
        -[PXPhotoKitCollectionsDataSource configuration](self, "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = +[PXPhotoKitCollectionsDataSource estimatedCountForAssetCollection:withConfiguration:](PXPhotoKitCollectionsDataSource, "estimatedCountForAssetCollection:withConfiguration:", v13, v14);
        goto LABEL_20;
      }
      goto LABEL_18;
    }
  }
  v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_22:

  v21 = v9;
  v22 = v21;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v22, OS_SIGNPOST_INTERVAL_END, v7, "CountForCollection", ", buf, 2u);
  }

  return v19;
}

- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[2];

  v4 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v4;
  -[PXPhotoKitCollectionsDataSource _collectionAtSimpleIndexPath:](self, "_collectionAtSimpleIndexPath:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "canContainAssets"))
  {
    -[PXPhotoKitCollectionsDataSource itemFetchResultByCollection](self, "itemFetchResultByCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)assetCollectionsCountForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  NSObject *v9;
  uint8_t v10[16];

  if (a3 < 0 || -[PXPhotoKitCollectionsDataSource numberOfSections](self, "numberOfSections") <= a3)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Requesting for collections count for a section out of bounds.", v10, 2u);
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXPhotoKitCollectionsDataSource assetCollectionsCountForFetchResult:](self, "assetCollectionsCountForFetchResult:", v6);

    return v7;
  }
}

- (int64_t)collectionsListCountForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  NSObject *v9;
  uint8_t v10[16];

  if (a3 < 0 || -[PXPhotoKitCollectionsDataSource numberOfSections](self, "numberOfSections") <= a3)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Requesting for collections count for a section out of bounds.", v10, 2u);
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXPhotoKitCollectionsDataSource collectionsListCountForFetchResult:](self, "collectionsListCountForFetchResult:", v6);

    return v7;
  }
}

- (int64_t)assetCollectionsCountForFetchResult:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "countOfAssetCollections");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)collectionsListCountForFetchResult:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "countOfCollectionsLists");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateCollectionsUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXPhotoKitCollectionsDataSource _collectionsFetchResultBySection](self, "_collectionsFetchResultBySection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PXPhotoKitCollectionsDataSource_enumerateCollectionsUsingBlock___block_invoke;
  v7[3] = &unk_1E51487B8;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (NSArray)_collectionListBySection
{
  return self->__collectionListBySection;
}

- (NSArray)_collectionsFetchResultBySection
{
  return self->__collectionsFetchResultBySection;
}

- (NSDictionary)_keyAssetsFetchResultsByCollection
{
  return self->__keyAssetsFetchResultsByCollection;
}

- (NSDictionary)_collectionsIndexPathsByCollection
{
  return self->__collectionsIndexPathsByCollection;
}

- (NSDictionary)itemFetchResultByCollection
{
  return self->_itemFetchResultByCollection;
}

- (NSArray)_virtualCollections
{
  return self->__virtualCollections;
}

- (PHFetchResult)collectionsFetchResult
{
  return self->_collectionsFetchResult;
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)configuration
{
  return self->_configuration;
}

- (unsigned)sharingFilter
{
  return self->_sharingFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_collectionsFetchResult, 0);
  objc_storeStrong((id *)&self->__virtualCollections, 0);
  objc_storeStrong((id *)&self->_itemFetchResultByCollection, 0);
  objc_storeStrong((id *)&self->__collectionsIndexPathsByCollection, 0);
  objc_storeStrong((id *)&self->__keyAssetsFetchResultsByCollection, 0);
  objc_storeStrong((id *)&self->__collectionsFetchResultBySection, 0);
  objc_storeStrong((id *)&self->__collectionListBySection, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
}

uint64_t __66__PXPhotoKitCollectionsDataSource_enumerateCollectionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateObjectsUsingBlock:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__PXPhotoKitCollectionsDataSource_indexPathForCollection___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "indexOfObject:", a1[4]);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

+ (int64_t)estimatedCountForAssetCollection:(id)a3 withConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "assetsFilterPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "assetTypesToInclude");
  if (!v7)
  {
    if (v8 != -1 && (~(_DWORD)v8 & 3) != 0)
    {
      if ((v8 & 1) == 0)
      {
        if ((v8 & 2) == 0)
        {
          v9 = 0;
          goto LABEL_12;
        }
LABEL_17:
        v10 = objc_msgSend(v5, "estimatedVideosCount");
        goto LABEL_11;
      }
      goto LABEL_16;
    }
LABEL_10:
    v10 = objc_msgSend(v5, "estimatedAssetCount");
LABEL_11:
    v9 = v10;
    goto LABEL_12;
  }
  if ((~(_DWORD)v8 & 7) == 0)
    goto LABEL_10;
  if ((v8 & 4) == 0)
  {
    if ((~(_DWORD)v8 & 3) != 0)
    {
      if ((v8 & 1) == 0)
      {
        if ((v8 & 2) == 0)
          goto LABEL_7;
        goto LABEL_17;
      }
LABEL_16:
      v10 = objc_msgSend(v5, "estimatedPhotosCount");
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_7:
  v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v9;
}

@end
