@implementation PXPhotosDataSource

- (id)_resultRecordForAssetCollection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_resultRecordByAssetCollection, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PXPhotosDataSource _createResultRecordForAssetCollection:](self, "_createResultRecordForAssetCollection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resultRecordByAssetCollection, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (BOOL)_addResultTuple:(id)a3 forAssetCollection:(id)a4 preparedResultRecord:(id)a5 toMutableResultRecord:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  void *v24;
  void *v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[PXPhotosDataSource _isResultTupleApplicable:forAssetCollection:](self, "_isResultTupleApplicable:forAssetCollection:", v10, v11);
  if (v14)
  {
    objc_msgSend(v13, "fetchResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 || (v16 = self->_options & 0x800400, v15, v16))
    {
      if (objc_msgSend(v10, "fetchedWithReverseSortOrder"))
        v17 = -[PXPhotosDataSource reverseSortOrder](self, "reverseSortOrder") ^ 1;
      else
        v17 = 0;
      objc_msgSend(v10, "fetchResult");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFetchResult:reverseSortOrder:", v18, v17);

    }
    objc_msgSend(v13, "keyAssetsFetchResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v10, "keyAssetsFetchResult");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setKeyAssetsFetchResult:", v20);

    }
    objc_msgSend(v13, "curatedFetchResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      if (!v12)
      {
LABEL_13:
        WeakRetained = objc_loadWeakRetained((id *)&self->_parentDataSource);
        objc_msgSend(WeakRetained, "_childDataSourceDidUpdateFetchesForAssetCollection:", v11);

        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v10, "curatedFetchResult");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCuratedFetchResult:", v24);

      objc_msgSend(v10, "curatedRefetchCondition");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCuratedRefetchCondition:", v25);

      if (!v12)
        goto LABEL_13;
    }
    objc_msgSend(v13, "adoptPreparedFilteredFetchResultFromRecord:", v12);
    goto LABEL_13;
  }
LABEL_14:

  return v14;
}

- (id)_createResultRecordForAssetCollection:(id)a3
{
  PXPhotosMutableResultRecord *v4;
  void *v5;

  v4 = objc_alloc_init(PXPhotosMutableResultRecord);
  -[PXPhotosMutableResultRecord setWantsCuration:](v4, "setWantsCuration:", -[PXPhotosDataSource wantsCurationByDefault](self, "wantsCurationByDefault"));
  -[PXPhotosMutableResultRecord setPreloadAssetTypeCounts:](v4, "setPreloadAssetTypeCounts:", (self->_options >> 1) & 1);
  -[PXPhotosMutableResultRecord setEnsureKeyAssetAtBeginning:](v4, "setEnsureKeyAssetAtBeginning:", (self->_options >> 14) & 1);
  -[PXPhotosMutableResultRecord setCurationLength:](v4, "setCurationLength:", -[PXPhotosDataSource curationLength](self, "curationLength"));
  -[PXPhotosDataSource sortDescriptors](self, "sortDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosMutableResultRecord setSortDescriptors:](v4, "setSortDescriptors:", v5);

  return v4;
}

- (BOOL)wantsCurationByDefault
{
  return self->_wantsCurationByDefault;
}

- (void)_performManualChangesForAssetCollections:(id)a3 collectionsToDiff:(id)a4 collectionsToChange:(id)a5 changeBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(void);
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id *p_isa;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t k;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  PXPhotosDataSourceChange *v57;
  uint64_t v58;
  int64_t v59;
  id v60;
  void (**v61)(void);
  void *v62;
  void *v63;
  id v64;
  id obj;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  id v70;
  uint64_t v71;
  PXPhotosDataSource *v72;
  unint64_t options;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v70 = a5;
  v12 = (void (**)(void))a6;
  if (objc_msgSend(v10, "count"))
  {
    if (self->_nestedCoalesceChanges >= 1 && -[NSMutableArray count](self->_coalescedChanges, "count"))
    {
      -[PXPhotosDataSource _performManualReloadWithChangeBlock:](self, "_performManualReloadWithChangeBlock:", v12);
      goto LABEL_73;
    }
    v61 = v12;
    v72 = self;
    options = self->_options;
    v59 = -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v60 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v84 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
          if (-[PXPhotosDataSource sectionForAssetCollection:](v72, "sectionForAssetCollection:", v19) != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v13, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if ((options & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v69 = 0;
    }
    p_isa = (id *)&v72->super.isa;
    -[PXPhotosDataSource collectionListFetchResult](v72, "collectionListFetchResult");
    v58 = objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v21 = v13;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v80 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j);
          objc_msgSend(p_isa, "_assetsForAssetCollection:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setObject:forKeyedSubscript:", v27, v26);
          if ((options & 0x20) != 0)
          {
            objc_msgSend(p_isa, "_keyAssetsForAssetCollection:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "setObject:forKeyedSubscript:", v28, v26);

            p_isa = (id *)&v72->super.isa;
          }

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      }
      while (v23);
    }

    objc_msgSend(p_isa, "_willChange");
    v61[2]();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v21;
    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    if (v71)
    {
      v68 = *(_QWORD *)v76;
      v64 = v11;
      do
      {
        for (k = 0; k != v71; ++k)
        {
          if (*(_QWORD *)v76 != v68)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
          objc_msgSend(p_isa, "_assetsForAssetCollection:", v30);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKeyedSubscript:", v30);
          v32 = objc_claimAutoreleasedReturnValue();
          if (v31 == (id)v32)
          {
            v33 = v31;
            goto LABEL_60;
          }
          v33 = (id)v32;
          if (v31)
          {
            if (v32)
              goto LABEL_34;
          }
          else
          {
            v31 = p_isa[35];
            if (v33)
            {
LABEL_34:
              if (!v11)
                goto LABEL_40;
              goto LABEL_39;
            }
          }
          v33 = p_isa[35];
          if (!v11)
            goto LABEL_40;
LABEL_39:
          if (objc_msgSend(v11, "containsObject:", v30))
          {
LABEL_40:
            objc_msgSend(p_isa[12], "objectForKeyedSubscript:", v30);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "fetchResultBeforeChanges");
            v35 = (id)objc_claimAutoreleasedReturnValue();
            if (v35 == v33)
            {
              v67 = 1;
            }
            else
            {
              objc_msgSend(v34, "fetchResultBeforeChanges");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "fetchedObjectIDs");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "fetchedObjectIDs");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37 == v38)
                v67 = 1;
              else
                v67 = objc_msgSend(v37, "isEqual:", v38);

            }
            objc_msgSend(v34, "fetchResultAfterChanges");
            v41 = (id)objc_claimAutoreleasedReturnValue();
            if (v41 == v31)
            {
              v45 = 1;
            }
            else
            {
              objc_msgSend(v34, "fetchResultAfterChanges");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "fetchedObjectIDs");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "fetchedObjectIDs");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (v43 == v44)
                v45 = 1;
              else
                v45 = objc_msgSend(v43, "isEqual:", v44);

              p_isa = (id *)&v72->super.isa;
            }

            if ((v67 & v45) == 1)
            {
              v46 = v34;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CD1588], "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v33, v31, MEMORY[0x1E0C9AA60]);
              v46 = (id)objc_claimAutoreleasedReturnValue();
            }
            v40 = v46;
            if ((objc_msgSend(v46, "hasAnyChanges") & 1) == 0)
            {

              v40 = 0;
            }

            v11 = v64;
            goto LABEL_59;
          }
          v39 = objc_alloc(MEMORY[0x1E0CD1588]);
          v40 = (void *)objc_msgSend(v39, "initWithFetchResult:currentFetchResult:changedIdentifiers:unknownMergeEvent:", v33, v31, MEMORY[0x1E0C9AA60], 1);
LABEL_59:
          objc_msgSend(v66, "setObject:forKeyedSubscript:", v40, v30);

LABEL_60:
          objc_msgSend(v74, "setObject:forKeyedSubscript:", v31, v30);
          if ((options & 0x20) != 0)
          {
            objc_msgSend(p_isa, "_keyAssetsForAssetCollection:", v30);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectForKeyedSubscript:", v30);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47 != v48)
              objc_msgSend(v63, "addIndex:", objc_msgSend(p_isa, "sectionForAssetCollection:", v30));

          }
          if (objc_msgSend(v70, "containsObject:", v30))
          {
            objc_msgSend(v30, "objectID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              objc_msgSend(v30, "objectID");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "addObject:", v50);

            }
          }

        }
        v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
      }
      while (v71);
    }

    if (objc_msgSend(v62, "count"))
    {
      objc_msgSend(p_isa, "collectionListFetchResult");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)v58;
      v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1588]), "initWithFetchResult:currentFetchResult:changedIdentifiers:unknownMergeEvent:", v58, v51, v62, 0);

    }
    else
    {
      v53 = 0;
      v52 = (void *)v58;
    }
    v54 = objc_msgSend(p_isa, "versionIdentifier");
    objc_msgSend(p_isa, "_sectionCache");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "assetCollectionToSection");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = -[PXPhotosDataSourceChange initWithIncrementalChanges:assetCollectionChangeDetails:sectionsWithKeyAssetChanges:previousCollectionsCount:assetCollectionToSectionCache:originatingPhotoLibraryChange:fromIdentifier:toIdentifier:]([PXPhotosDataSourceChange alloc], "initWithIncrementalChanges:assetCollectionChangeDetails:sectionsWithKeyAssetChanges:previousCollectionsCount:assetCollectionToSectionCache:originatingPhotoLibraryChange:fromIdentifier:toIdentifier:", v53, v66, v63, objc_msgSend(p_isa, "_previousCollectionsCount"), v56, 0, v59, v54);
    objc_msgSend(p_isa, "_didChange:", v57);

    v10 = v60;
    v12 = v61;
  }
LABEL_73:

}

- (id)_keyAssetsForAssetCollection:(id)a3
{
  void *v3;
  void *v4;

  -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyAssetsFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_assetsForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPhotosDataSource _assetCollectionFetchStatus:](self, "_assetCollectionFetchStatus:", v4);
  if (v6 - 1 > 2)
  {
    v9 = 0;
  }
  else
  {
    v7 = v6;
    objc_msgSend(v5, "exposedFetchResult");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 != 2 && !v8)
    {
      -[PXPhotosDataSource _fetchTupleForAssetCollection:calledOnClientQueue:isLimitedInitialFetch:](self, "_fetchTupleForAssetCollection:calledOnClientQueue:isLimitedInitialFetch:", v4, 1, v7 == 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDataSource _mutableResultRecordForAssetCollection:](self, "_mutableResultRecordForAssetCollection:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDataSource _addResultTuple:forAssetCollection:preparedResultRecord:toMutableResultRecord:](self, "_addResultTuple:forAssetCollection:preparedResultRecord:toMutableResultRecord:", v10, v4, 0, v11);
      objc_msgSend(v11, "exposedFetchResult");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (unint64_t)_assetCollectionFetchStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t options;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PXPhotosDataSource _inaccurateAssetCollections](self, "_inaccurateAssetCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

    goto LABEL_7;
  }
  -[PXPhotosDataSource _inaccurateAssetCollections](self, "_inaccurateAssetCollections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (!v7)
  {
LABEL_7:
    -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "wantsCuration") && (objc_msgSend(v4, "px_supportsFastCuration") & 1) == 0)
    {
      objc_msgSend(v10, "exposedFetchResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {

      }
      else if (!-[PXPhotosDataSource allowSlowFetchesOnClientQueue](self, "allowSlowFetchesOnClientQueue"))
      {
        v9 = 0;
        goto LABEL_13;
      }
    }
    v9 = 3;
LABEL_13:

    goto LABEL_14;
  }
  options = self->_options;
  if ((options & 0x400) != 0)
    v9 = 1;
  else
    v9 = (options >> 22) & 2;
LABEL_14:

  return v9;
}

- (id)_inaccurateAssetCollections
{
  -[PXPhotosDataSource _updateInaccurateAssetCollectionsIfNeeded](self, "_updateInaccurateAssetCollectionsIfNeeded");
  return self->__inaccurateAssetCollections;
}

- (void)_updateInaccurateAssetCollectionsIfNeeded
{
  void *v2;
  unint64_t options;
  PHFetchResult *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *inaccurateAssetCollections;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_inaccurateAssetCollectionsNeedsUpdate)
  {
    self->_inaccurateAssetCollectionsNeedsUpdate = 0;
    options = self->_options;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_collectionListFetchResult;
    v6 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v6)
      goto LABEL_30;
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v10, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((options & 1) == 0)
        {
          if ((options & 0x10) != 0)
          {
            if (objc_msgSend(v10, "px_supportsFastCuration"))
              v12 = (options & 0x20) == 0;
            else
              v12 = 0;
            if (v12)
              goto LABEL_28;
          }
          else if ((options & 0x20) == 0)
          {
            goto LABEL_28;
          }
        }
        objc_msgSend(v11, "fetchResult");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          -[NSMutableOrderedSet addObject:](self->_queuedAssetCollectionsToFetch, "addObject:", v10);
          inaccurateAssetCollections = self->__inaccurateAssetCollections;
LABEL_27:
          objc_msgSend(inaccurateAssetCollections, "addObject:", v10);
          goto LABEL_28;
        }
        if ((options & 0x10) != 0)
        {
          objc_msgSend(v11, "curatedFetchResult");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v15;
          if (!v15)
            goto LABEL_26;
          if ((options & 0x20) == 0)
          {

            goto LABEL_28;
          }
        }
        else if ((options & 0x20) == 0)
        {
          goto LABEL_28;
        }
        objc_msgSend(v11, "keyAssetsFetchResult");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ((options & 0x10) != 0)
        if (!v16)
        {
LABEL_26:
          inaccurateAssetCollections = self->_queuedAssetCollectionsToFetch;
          goto LABEL_27;
        }
LABEL_28:

      }
      v7 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v7)
      {
LABEL_30:

        return;
      }
    }
  }
}

- (unint64_t)_cachedSectionForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetCollectionToSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

- (id)assetCollectionForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_sectionCache
{
  PXPhotosDataSourceSectionCache *sectionCache;
  PHFetchResult *collectionListFetchResult;
  PHFetchResult *v5;
  PXPhotosDataSourceSectionCache *v6;
  PXPhotosDataSourceSectionCache *v7;

  sectionCache = self->__sectionCache;
  if (!sectionCache
    || (collectionListFetchResult = self->_collectionListFetchResult,
        -[PXPhotosDataSourceSectionCache collectionListFetchResult](sectionCache, "collectionListFetchResult"),
        v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue(),
        v5,
        collectionListFetchResult != v5))
  {
    v6 = -[PXPhotosDataSourceSectionCache initWithCollectionListFetchResult:]([PXPhotosDataSourceSectionCache alloc], "initWithCollectionListFetchResult:", self->_collectionListFetchResult);
    v7 = self->__sectionCache;
    self->__sectionCache = v6;

  }
  return self->__sectionCache;
}

- (unint64_t)_previousCollectionsCount
{
  return self->__previousCollectionsCount;
}

uint64_t __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_3;
  v5[3] = &unk_1E513CD40;
  v1 = a1[4];
  v2 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v5[1] = 3221225472;
  v3 = a1[6];
  v5[4] = v1;
  v5[5] = v3;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);
}

- (void)_fetchRemainingCollectionsBackgroundLoopWithId:(int64_t)a3
{
  unsigned int v3;
  uint64_t v6;
  PHFetchResult *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  NSMutableOrderedSet *queuedAssetCollectionsToFetch;
  id v18;
  id v19;
  NSMutableOrderedSet *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *backgroundQueue;
  uint64_t v26;
  unsigned int v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *pendingResultsIsolationQueue;
  id v51;
  id v52;
  id v53;
  void *v54;
  int v55;
  _QWORD v56[4];
  id v57[2];
  _QWORD block[4];
  id v59[2];
  BOOL v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id location[2];

  v3 = atomic_load((unsigned int *)&self->_backgroundFetchId);
  if (v3 == a3)
  {
    objc_initWeak(location, self);
    v6 = MEMORY[0x1E0C809B0];
    if (self->_backgroundFetchOriginSectionChanged)
    {
      self->_backgroundFetchOriginSectionChanged = 0;
      v7 = self->_collectionListFetchResult;
      if (v7)
      {
        v8 = -[PXPhotosDataSource backgroundFetchOriginSection](self, "backgroundFetchOriginSection");
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[PHFetchResult count](v7, "count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PHFetchResult count](v7, "count");
        if (v10 >= 1)
        {
          v11 = 0;
          v12 = -v8;
          do
          {
            -[PHFetchResult objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12 + v11 >= 0)
              v14 = v12 + v11;
            else
              v14 = -(v12 + v11);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v13);

            ++v11;
          }
          while (v10 != v11);
        }
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        queuedAssetCollectionsToFetch = self->_queuedAssetCollectionsToFetch;
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke;
        v67[3] = &unk_1E513CC50;
        v18 = v9;
        v68 = v18;
        v19 = v16;
        v69 = v19;
        -[NSMutableOrderedSet enumerateObjectsUsingBlock:](queuedAssetCollectionsToFetch, "enumerateObjectsUsingBlock:", v67);
        -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_queuedAssetCollectionsToFetch, "removeObjectsAtIndexes:", v19);
        v20 = self->_queuedAssetCollectionsToFetch;
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_2;
        v65[3] = &unk_1E513CC78;
        v21 = v18;
        v66 = v21;
        -[NSMutableOrderedSet sortUsingComparator:](v20, "sortUsingComparator:", v65);

        v6 = MEMORY[0x1E0C809B0];
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_interruptBackgroundFetch)
    {
      v26 = 0;
      do
      {
        v27 = atomic_load((unsigned int *)&self->_backgroundFetchId);
        if (v27 != a3)
          break;
        if (v26)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "timeIntervalSinceDate:", v22);
          v30 = v29;

          if (v30 >= 1.0)
            break;
        }
        if (!-[NSMutableOrderedSet count](self->_queuedAssetCollectionsToFetch, "count"))
        {
          -[PXPhotosDataSource _interruptBackgroundFetch](self, "_interruptBackgroundFetch");
          break;
        }
        -[NSMutableOrderedSet objectAtIndex:](self->_queuedAssetCollectionsToFetch, "objectAtIndex:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableOrderedSet removeObjectAtIndex:](self->_queuedAssetCollectionsToFetch, "removeObjectAtIndex:", 0);
        -[PXPhotosDataSource _fetchTupleForAssetCollection:calledOnClientQueue:isLimitedInitialFetch:](self, "_fetchTupleForAssetCollection:calledOnClientQueue:isLimitedInitialFetch:", v31, 0, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "fetchResult");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "count");

        if ((self->_options & 0x400) != 0)
        {
          objc_msgSend(v32, "fetchResult");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "count");

          if (v35)
          {
            if (objc_msgSend(v31, "keyAssetsAtEnd"))
            {
              objc_msgSend(v32, "fetchResult");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "count") - 1;

            }
            else
            {
              v37 = 0;
            }
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "fetchResult");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "prefetchObjectsAtIndexes:", v38);

            objc_msgSend(v32, "fetchResult");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "prefetchThumbnailAssetsAtIndexes:", v38);

          }
        }
        if ((self->_options & 0x8000) != 0)
        {
          -[PXPhotosDataSource _createResultRecordForAssetCollection:](self, "_createResultRecordForAssetCollection:", v31);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "fetchResult");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setFetchResult:reverseSortOrder:", v42, objc_msgSend(v32, "fetchedWithReverseSortOrder"));

          objc_msgSend(v32, "keyAssetsFetchResult");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setKeyAssetsFetchResult:", v43);

          objc_msgSend(v32, "curatedFetchResult");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setCuratedFetchResult:", v44);

          objc_msgSend(v32, "curatedRefetchCondition");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setCuratedRefetchCondition:", v45);

          objc_msgSend(v41, "exposedFetchResult");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "px_safelyPrefetchObjectAtIndex:", 0);

          objc_msgSend(v41, "fetchResult");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "px_safelyPrefetchObjectAtIndex:", 0);

          objc_msgSend(v41, "keyAssetsFetchResult");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "px_safelyPrefetchObjectAtIndex:", 0);

          objc_msgSend(v41, "curatedFetchResult");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "px_safelyPrefetchObjectAtIndex:", 0);

        }
        else
        {
          v41 = 0;
        }
        pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
        v61[0] = v6;
        v61[1] = 3221225472;
        v61[2] = __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_3;
        v61[3] = &unk_1E513DD48;
        v61[4] = self;
        v51 = v31;
        v62 = v51;
        v52 = v32;
        v63 = v52;
        v53 = v41;
        v64 = v53;
        dispatch_sync(pendingResultsIsolationQueue, v61);
        +[PXPhotosDataSourceSettings sharedInstance](PXPhotosDataSourceSettings, "sharedInstance");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "slowBackgroundFetch");

        if (v55)
          sleep(3u);

        --v26;
      }
      while (!self->_interruptBackgroundFetch);
    }
    self->_interruptBackgroundFetch = 0;
    v23 = -[NSMutableOrderedSet count](self->_queuedAssetCollectionsToFetch, "count");
    -[PXPhotosDataSource clientQueue](self, "clientQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_4;
    block[3] = &unk_1E513CCA0;
    v60 = v23 != 0;
    objc_copyWeak(v59, location);
    v59[1] = (id)a3;
    dispatch_async(v24, block);

    if (v23)
    {
      backgroundQueue = self->_backgroundQueue;
      v56[0] = v6;
      v56[1] = 3221225472;
      v56[2] = __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_5;
      v56[3] = &unk_1E51447A0;
      objc_copyWeak(v57, location);
      v57[1] = (id)a3;
      dispatch_async(backgroundQueue, v56);
      objc_destroyWeak(v57);
    }
    objc_destroyWeak(v59);

    objc_destroyWeak(location);
  }
}

- (id)_fetchTupleForAssetCollection:(id)a3 calledOnClientQueue:(BOOL)a4 isLimitedInitialFetch:(BOOL)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  PHPhotoLibrary *photoLibrary;
  void *v22;
  void *v23;
  PHFetchResult *v24;
  unint64_t v25;
  void *v26;
  PHFetchResult *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  PHFetchResult *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  char v41;
  _BOOL4 v42;
  unint64_t v43;
  void *v44;
  void *v45;
  char v46;
  unint64_t v47;
  NSObject *v48;
  NSObject *v49;
  BOOL v50;
  char v51;
  NSObject *v52;
  _QWORD *v53;
  NSObject *v54;
  const char *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint32_t v58;
  id v59;
  void *v60;
  void *v61;
  NSObject *v62;
  PXPhotosResultTuple *v63;
  uint64_t v64;
  void *v65;
  PXPhotosResultTuple *v66;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  unint64_t v71;
  PHPhotoLibrary *v72;
  id v73;
  uint64_t v74;
  BOOL v75;
  unint64_t options;
  void *v77;
  void *v78;
  void (**block)(void);
  _BOOL4 v80;
  PHFetchResult *v81;
  _BOOL4 v82;
  id v83;
  id v84;
  _QWORD v85[5];
  id v86;
  BOOL v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  uint64_t *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD aBlock[5];
  id v102;
  uint64_t *v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t *v112;
  BOOL v113;
  BOOL v114;
  uint64_t v115;
  _QWORD v116[4];
  id v117;
  uint64_t v118;
  _QWORD v119[4];
  id v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t (*v130)(uint64_t, uint64_t);
  void (*v131)(uint64_t);
  id v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t (*v142)(uint64_t, uint64_t);
  void (*v143)(uint64_t);
  id v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  char v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  void (*v153)(uint64_t);
  id v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  uint64_t (*v158)(uint64_t, uint64_t);
  void (*v159)(uint64_t);
  id v160;
  uint64_t v161;
  uint64_t *v162;
  uint64_t v163;
  uint64_t (*v164)(uint64_t, uint64_t);
  void (*v165)(uint64_t);
  id v166;
  uint8_t buf[4];
  PXPhotosDataSource *v168;
  __int16 v169;
  id v170;
  __int16 v171;
  unint64_t v172;
  _QWORD v173[2];
  _BYTE v174[128];
  _BYTE v175[128];
  uint64_t v176;

  v80 = a5;
  v82 = a4;
  v176 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  options = self->_options;
  v161 = 0;
  v162 = &v161;
  v163 = 0x3032000000;
  v164 = __Block_byref_object_copy__243379;
  v165 = __Block_byref_object_dispose__243380;
  v166 = 0;
  v155 = 0;
  v156 = &v155;
  v157 = 0x3032000000;
  v158 = __Block_byref_object_copy__243379;
  v159 = __Block_byref_object_dispose__243380;
  v160 = 0;
  v149 = 0;
  v150 = &v149;
  v151 = 0x3032000000;
  v152 = __Block_byref_object_copy__243379;
  v153 = __Block_byref_object_dispose__243380;
  v154 = 0;
  v145 = 0;
  v146 = &v145;
  v147 = 0x2020000000;
  v148 = 0;
  v139 = 0;
  v140 = &v139;
  v141 = 0x3032000000;
  v142 = __Block_byref_object_copy__243379;
  v143 = __Block_byref_object_dispose__243380;
  v144 = 0;
  v133 = 0;
  v134 = &v133;
  v135 = 0x3032000000;
  v136 = __Block_byref_object_copy__243379;
  v137 = __Block_byref_object_dispose__243380;
  v138 = 0;
  v127 = 0;
  v128 = &v127;
  v129 = 0x3032000000;
  v130 = __Block_byref_object_copy__243379;
  v131 = __Block_byref_object_dispose__243380;
  v132 = 0;
  v121 = 0;
  v122 = &v121;
  v123 = 0x3032000000;
  v124 = __Block_byref_object_copy__243379;
  v125 = __Block_byref_object_dispose__243380;
  v126 = 0;
  v118 = 0;
  v119[0] = &v118;
  v119[1] = 0x3032000000;
  v119[2] = __Block_byref_object_copy__243379;
  v119[3] = __Block_byref_object_dispose__243380;
  v120 = 0;
  v115 = 0;
  v116[0] = &v115;
  v116[1] = 0x3032000000;
  v116[2] = __Block_byref_object_copy__243379;
  v116[3] = __Block_byref_object_dispose__243380;
  v117 = 0;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke;
  aBlock[3] = &unk_1E513C960;
  v103 = &v161;
  aBlock[4] = self;
  v83 = v6;
  v102 = v83;
  v104 = &v155;
  v105 = &v149;
  v106 = &v145;
  v113 = (options & 0x20) != 0;
  v107 = &v139;
  v108 = &v133;
  v114 = v80;
  v109 = &v127;
  v110 = &v121;
  v111 = &v118;
  v112 = &v115;
  block = (void (**)(void))_Block_copy(aBlock);
  if (v82)
  {
    block[2]();
  }
  else
  {
    -[PXPhotosDataSource clientQueue](self, "clientQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v8, block);

  }
  v84 = (id)v140[5];
  -[PXPhotosDataSource fetcher](self, "fetcher");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource _assetContainerForAssetCollection:](self, "_assetContainerForAssetCollection:", v83);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if ((self->_options & 0x40) != 0)
    goto LABEL_11;
  v9 = (void *)v162[5];
  if (v9 && !objc_msgSend(v9, "count") || (v10 = (void *)v156[5]) != 0 && !objc_msgSend(v10, "count"))
  {
    v81 = self->_emptyAssetsFetchResult;
    v75 = 1;
    goto LABEL_49;
  }
  v11 = self->_options;
  if (v80 && (v11 & 0x10000) != 0)
  {
LABEL_11:
    v81 = self->_emptyAssetsFetchResult;
LABEL_12:
    v75 = 0;
    goto LABEL_49;
  }
  if ((v11 & 8) != 0)
  {
    objc_msgSend(v77, "fetchAssetsInContainer:configuration:", v78, v128[5]);
    v81 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v12 = (void *)objc_msgSend((id)v128[5], "copy");
  objc_msgSend(v12, "setFilterPredicate:", v134[5]);
  objc_msgSend(v77, "fetchAssetsInContainer:configuration:", v78, v12);
  v81 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  if (v156[5])
  {
    -[PHFetchResult fetchedObjectIDs](v81, "fetchedObjectIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v97, v175, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v98 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i);
          if (objc_msgSend((id)v156[5], "containsObject:", v19))
            objc_msgSend(v14, "addObject:", v19);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v97, v175, 16);
      }
      while (v16);
    }

    v20 = objc_alloc(MEMORY[0x1E0CD1620]);
    photoLibrary = self->_photoLibrary;
    -[PHFetchResult fetchType](v81, "fetchType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchResult fetchPropertySets](v81, "fetchPropertySets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (PHFetchResult *)objc_msgSend(v20, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v14, photoLibrary, v22, v23, 0, 1);

    v25 = -[PHFetchResult count](v24, "count");
    v75 = v25 < -[PHFetchResult count](v81, "count");
LABEL_47:

    v81 = v24;
    goto LABEL_48;
  }
  if (v162[5])
  {
    if ((self->_options & 0x1000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid in %@"), v162[5]);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = 0u;
      v96 = 0u;
      v94 = 0u;
      v93 = 0u;
      v27 = v81;
      v28 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v93, v174, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v94;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v94 != v29)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * j), "uuid");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend((id)v162[5], "containsObject:", v31))
              objc_msgSend(v26, "addObject:", v31);

          }
          v28 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v93, v174, 16);
        }
        while (v28);
      }

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid in %@"), v26);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v134[5])
    {
      v32 = (void *)MEMORY[0x1E0CB3528];
      v173[0] = v134[5];
      v173[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "andPredicateWithSubpredicates:", v33);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = v15;
    }
    v34 = (PHFetchResult *)objc_msgSend((id)v128[5], "copy");
    -[PHFetchResult setFilterPredicate:](v34, "setFilterPredicate:", v14);
    objc_msgSend(v77, "fetchAssetsInContainer:configuration:", v78, v34);
    v24 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v35 = -[PHFetchResult count](v24, "count");
    v75 = v35 < -[PHFetchResult count](v81, "count");
    if (v150[5])
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHFetchResult px_fetchedObjectIDsSortedByUUIDs:](v24, "px_fetchedObjectIDsSortedByUUIDs:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v73 = objc_alloc(MEMORY[0x1E0CD1620]);
      v72 = self->_photoLibrary;
      -[PHFetchResult fetchType](v24, "fetchType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHFetchResult fetchPropertySets](v24, "fetchPropertySets");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v37, v72, v38, v39, 0, 1);

      v24 = (PHFetchResult *)v74;
    }

    v81 = v34;
    goto LABEL_47;
  }
  v75 = 0;
LABEL_48:

LABEL_49:
  v40 = (objc_msgSend(v83, "px_supportsFastCuration") & 1) != 0 || objc_msgSend((id)v122[5], "curationKind") == 3;
  v42 = !v82 || (*((_BYTE *)v146 + 24) ? (v41 = 1) : (v41 = v40), (v41 & 1) != 0) || !self->_isBackgroundFetching;
  v43 = self->_options;
  if ((v43 & 0x10) == 0)
  {
    v44 = 0;
    goto LABEL_61;
  }
  if (v42)
  {
    if (v82)
    {
      if (*((_BYTE *)v146 + 24))
        v46 = 1;
      else
        v46 = v40;
      v47 = self->_options;
      if ((v46 & 1) == 0)
      {
        PLUIGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v168 = self;
          v169 = 2112;
          v170 = v83;
          _os_log_impl(&dword_1A6789000, v48, OS_LOG_TYPE_DEFAULT, "%@ fetching curated assets for %@ on the main queue. This can block for a long time and should never happen.", buf, 0x16u);
        }

        v47 = self->_options;
      }
      if ((v47 & 0x2000) == 0)
        goto LABEL_84;
    }
    else if ((v43 & 0x2000) == 0)
    {
      goto LABEL_84;
    }
    if (objc_msgSend(v83, "assetCollectionType") == 4)
    {
      objc_msgSend(v77, "fetchAssetsInContainer:configuration:", v78, v122[5]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "count"))
      {
        v44 = 0;
      }
      else
      {
        v88[0] = v7;
        v88[1] = 3221225472;
        v88[2] = __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke_214;
        v88[3] = &unk_1E513C988;
        v89 = v83;
        v90 = v77;
        v91 = v78;
        v92 = &v121;
        v44 = _Block_copy(v88);

      }
      goto LABEL_85;
    }
LABEL_84:
    v44 = 0;
    v45 = 0;
LABEL_85:
    if (objc_msgSend(v45, "count"))
    {
      if (v45)
        goto LABEL_87;
    }
    else
    {
      v68 = (void *)objc_msgSend((id)v122[5], "copy");
      objc_msgSend(v68, "setOptions:", objc_msgSend(v68, "options") & 0xFFFFFFFFFFFFFFFDLL);
      objc_msgSend(v77, "fetchAssetsInContainer:configuration:", v78, v68);
      v69 = objc_claimAutoreleasedReturnValue();

      v45 = (void *)v69;
      if (v69)
        goto LABEL_87;
    }
    PLUIGetLog();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v168 = self;
      v169 = 2112;
      v170 = v83;
      v171 = 2112;
      v172 = (unint64_t)v78;
      _os_log_impl(&dword_1A6789000, v70, OS_LOG_TYPE_ERROR, "%@ failed to fetch curated assets for assetCollection:%@ assetContainer:%@", buf, 0x20u);
    }

LABEL_61:
    v45 = 0;
LABEL_87:
    if ((options & 0x20) == 0 || v84)
      goto LABEL_108;
    if (v42)
    {
      if (v82)
      {
        v51 = *((_BYTE *)v146 + 24) || v40;
        if ((v51 & 1) == 0)
        {
          PLUIGetLog();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v168 = self;
            v169 = 2112;
            v170 = v83;
            _os_log_impl(&dword_1A6789000, v52, OS_LOG_TYPE_DEFAULT, "%@ fetching key assets for %@ on the main queue. This can block for a long time and should never happen.", buf, 0x16u);
          }

        }
      }
      if ((self->_options & 0x200000) != 0)
      {
        +[PXPhotoKitFetcher fetchAssetsWithCurationKind:container:libraryFilter:curationContext:](_TtC12PhotosUICore17PXPhotoKitFetcher, "fetchAssetsWithCurationKind:container:libraryFilter:curationContext:", 4, v78, objc_msgSend((id)v122[5], "libraryFilter"), 1);
        v84 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = v116;
        if ((v43 & 0x10) == 0)
          v53 = v119;
        objc_msgSend(v77, "fetchAssetsInContainer:configuration:", v78, *(_QWORD *)(*v53 + 40));
        v84 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v84)
        goto LABEL_108;
      PLUIGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v71 = self->_options;
        *(_DWORD *)buf = 138412802;
        v168 = self;
        v169 = 2112;
        v170 = v78;
        v171 = 2048;
        v172 = v71;
        v55 = "%@ failed to fetch key curated assets for %@ options %ti";
        v56 = v54;
        v57 = OS_LOG_TYPE_ERROR;
        v58 = 32;
        goto LABEL_104;
      }
      goto LABEL_105;
    }
LABEL_102:
    PLUIGetLog();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v168 = self;
      v169 = 2112;
      v170 = v83;
      v55 = "%@ not allowed to fetch key assets for %@ on the main queue.";
      v56 = v54;
      v57 = OS_LOG_TYPE_DEBUG;
      v58 = 22;
LABEL_104:
      _os_log_impl(&dword_1A6789000, v56, v57, v55, buf, v58);
    }
LABEL_105:

    v84 = 0;
    goto LABEL_108;
  }
  PLUIGetLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v168 = self;
    v169 = 2112;
    v170 = v83;
    _os_log_impl(&dword_1A6789000, v49, OS_LOG_TYPE_DEBUG, "%@ not allowed to fetch curated assets for %@ on the main queue.", buf, 0x16u);
  }

  v44 = 0;
  v45 = 0;
  if (v84)
    v50 = 0;
  else
    v50 = (options & 0x20) != 0;
  if (v50)
    goto LABEL_102;
LABEL_108:
  v85[0] = v7;
  v85[1] = 3221225472;
  v85[2] = __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke_217;
  v85[3] = &unk_1E51473C0;
  v85[4] = self;
  v59 = v83;
  v86 = v59;
  v87 = v75;
  v60 = _Block_copy(v85);
  v61 = v60;
  if (v82)
  {
    (*((void (**)(void *))v60 + 2))(v60);
  }
  else
  {
    -[PXPhotosDataSource clientQueue](self, "clientQueue");
    v62 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v62, v61);

  }
  v63 = [PXPhotosResultTuple alloc];
  v64 = objc_msgSend((id)v128[5], "reverseSortOrder");
  objc_msgSend((id)v128[5], "filterPredicate");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[PXPhotosResultTuple initWithFetchResult:fetchedWithReverseSortOrder:curatedFetchResult:curatedRefetchCondition:keyAssetsFetchResult:filterPredicate:](v63, "initWithFetchResult:fetchedWithReverseSortOrder:curatedFetchResult:curatedRefetchCondition:keyAssetsFetchResult:filterPredicate:", v81, v64, v45, v44, v84, v65);

  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v118, 8);

  _Block_object_dispose(&v121, 8);
  _Block_object_dispose(&v127, 8);

  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(&v139, 8);

  _Block_object_dispose(&v145, 8);
  _Block_object_dispose(&v149, 8);

  _Block_object_dispose(&v155, 8);
  _Block_object_dispose(&v161, 8);

  return v66;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (PXPhotosAssetsFetcher)fetcher
{
  return (PXPhotosAssetsFetcher *)+[PXPhotosAssetsFetcher sharedFetcherForPhotoLibrary:](PXPhotosAssetsFetcher, "sharedFetcherForPhotoLibrary:", self->_photoLibrary);
}

void __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  objc_msgSend(*(id *)(a1 + 32), "_allowedUUIDsForAssetCollection:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_allowedOIDsForAssetCollection:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "infoForAssetCollection:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "manualOrderUUIDs");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "allowSlowFetchesOnClientQueue");
  v12 = *(unsigned __int8 *)(a1 + 128);
  if (*(_BYTE *)(a1 + 128))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyAssetsFetchResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v13);
  if (v12)
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "_filterPredicateForAssetCollection:", *(_QWORD *)(a1 + 40));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_msgSend(*(id *)(a1 + 32), "_fetcherConfigurationForAssetCollection:useCase:isLimitedInitialFetch:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 129));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  objc_msgSend(*(id *)(a1 + 32), "_fetcherConfigurationForAssetCollection:useCase:isLimitedInitialFetch:", *(_QWORD *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 129));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  objc_msgSend(*(id *)(a1 + 32), "_fetcherConfigurationForAssetCollection:useCase:isLimitedInitialFetch:", *(_QWORD *)(a1 + 40), 2, *(unsigned __int8 *)(a1 + 129));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

  objc_msgSend(*(id *)(a1 + 32), "_fetcherConfigurationForAssetCollection:useCase:isLimitedInitialFetch:", *(_QWORD *)(a1 + 40), 3, *(unsigned __int8 *)(a1 + 129));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v26;

}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (id)_filterPredicateForAssetCollection:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (-[PXPhotosDataSource _areFiltersDisabledForAssetCollection:](self, "_areFiltersDisabledForAssetCollection:", a3))
    return 0;
  -[PXPhotosDataSource basePredicate](self, "basePredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource filterPredicate](self, "filterPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3528]);
    v12[0] = v5;
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithType:subpredicates:", 1, v9);

  }
  else
  {
    if (v5)
    {
      v11 = v5;
    }
    else
    {
      if (!v6)
      {
        v10 = 0;
        goto LABEL_11;
      }
      v11 = v6;
    }
    v10 = v11;
  }
LABEL_11:

  return v10;
}

- (BOOL)_areFiltersDisabledForAssetCollection:(id)a3
{
  void *v3;
  char v4;

  -[PXPhotosDataSource infoForAssetCollection:](self, "infoForAssetCollection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "explicitlyDisableFilters");

  return v4;
}

- (id)infoForAssetCollection:(id)a3
{
  id v4;
  PXAssetCollectionDataSourceInfo *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_infoForAssetCollection, "objectForKeyedSubscript:", v4);
  v5 = (PXAssetCollectionDataSourceInfo *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(PXAssetCollectionDataSourceInfo);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_infoForAssetCollection, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (NSPredicate)basePredicate
{
  return self->_basePredicate;
}

- (id)_inclusionPredicateForAssetCollection:(id)a3
{
  void *v3;
  void *v4;

  -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inclusionPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_getFetchLimit:(unint64_t *)a3 fetchWithReverseSortOrder:(BOOL *)a4 forAssetCollection:(id)a5 isLimitedInitialFetch:(BOOL)a6
{
  unint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;

  v14 = a5;
  v10 = -[PXPhotosDataSource fetchLimit](self, "fetchLimit");
  if (-[PXPhotosDataSource _reverseSortOrderForAssetCollection:](self, "_reverseSortOrderForAssetCollection:", v14))
  {
    v11 = 1;
    v12 = v14;
    if (!a6)
      goto LABEL_10;
    goto LABEL_9;
  }
  LOBYTE(v11) = -[PXPhotosDataSource reverseSortOrder](self, "reverseSortOrder");
  if (a6)
  {
    if ((v11 & 1) != 0)
      v11 = 1;
    else
      v11 = objc_msgSend(v14, "keyAssetsAtEnd");
LABEL_9:
    v13 = +[PXPhotosAssetsFetcher _adjustedReverseSortOrderForCollection:reverseSortOrder:fetcherOptions:](PXPhotosAssetsFetcher, "_adjustedReverseSortOrderForCollection:reverseSortOrder:fetcherOptions:", v14, v11, (self->_options >> 15) & 0x10 | (self->_options >> 12) & 2 | (self->_options >> 8) & 1 | (self->_options >> 15) & 0x28 | (self->_options >> 16) & 0x40);
    v12 = v14;
    LOBYTE(v11) = v13;
    v10 = 1000;
    goto LABEL_10;
  }
  v12 = v14;
LABEL_10:
  *a3 = v10;
  *a4 = v11;

}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (BOOL)_reverseSortOrderForAssetCollection:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[PXPhotosDataSource fetchLimit](self, "fetchLimit"))
    v5 = objc_msgSend(v4, "keyAssetsAtEnd");
  else
    v5 = 0;

  return v5;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)allowSlowFetchesOnClientQueue
{
  return self->_allowSlowFetchesOnClientQueue;
}

- (id)_allowedUUIDsForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (-[PXPhotosDataSource _areFiltersDisabledForAssetCollection:](self, "_areFiltersDisabledForAssetCollection:", v4))
  {
    v5 = 0;
  }
  else
  {
    -[PXPhotosDataSource infoForAssetCollection:](self, "infoForAssetCollection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allowedUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[PXPhotosDataSource allowedUUIDs](self, "allowedUUIDs");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v9;

  }
  return v5;
}

- (NSSet)allowedUUIDs
{
  return self->_allowedUUIDs;
}

- (id)_allowedOIDsForAssetCollection:(id)a3
{
  void *v4;

  if (-[PXPhotosDataSource _areFiltersDisabledForAssetCollection:](self, "_areFiltersDisabledForAssetCollection:", a3))
  {
    v4 = 0;
  }
  else
  {
    -[PXPhotosDataSource allowedOIDs](self, "allowedOIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSSet)allowedOIDs
{
  return self->_allowedOIDs;
}

- (PHAsset)referenceAsset
{
  return self->_referenceAsset;
}

- (int64_t)backgroundFetchOriginSection
{
  return self->_backgroundFetchOriginSection;
}

uint64_t __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_3(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 160), "setObject:forKeyedSubscript:", a1[6], a1[5]);
  return objc_msgSend(*(id *)(a1[4] + 168), "setObject:forKeyedSubscript:", a1[7], a1[5]);
}

void __29__PXPhotosDataSource_isEmpty__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "exposedFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    v5 = 0;
  }

}

- (id)firstAssetCollection
{
  return -[PHFetchResult firstObject](self->_collectionListFetchResult, "firstObject");
}

- (int64_t)numberOfSectionsWithEnrichmentState:(unsigned __int16)a3
{
  int v3;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v11;

  v3 = a3;
  -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  switch(v3)
  {
    case 0:
      v8 = objc_msgSend(v6, "numberOfEnrichmentStateNotEnrichedAssetCollections");
      break;
    case 1:
      v8 = objc_msgSend(v6, "numberOfEnrichmentStateAssetMetadataOnlyAssetCollections");
      break;
    case 2:
      v8 = objc_msgSend(v6, "numberOfEnrichmentStateAssetMetadataAndScoreAssetCollections");
      break;
    case 3:
      v8 = objc_msgSend(v6, "numberOfEnrichmentStateAssetMetadataAndScenesProcessedAssetCollections");
      break;
    case 4:
      v8 = objc_msgSend(v6, "numberOfEnrichmentStateCompleteAssetCollections");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 1491, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v9 = v8;

  return v9;
}

- (int64_t)estimatedAssetsCountWithEnrichmentState:(unsigned __int16)a3
{
  int v3;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v11;

  v3 = a3;
  -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  switch(v3)
  {
    case 0:
      v8 = objc_msgSend(v6, "estimatedAssetCountWithEnrichmentStateNotEnriched");
      break;
    case 1:
      v8 = objc_msgSend(v6, "estimatedAssetCountWithEnrichmentStateAssetMetadataOnly");
      break;
    case 2:
      v8 = objc_msgSend(v6, "estimatedAssetCountWithEnrichmentStateAssetMetadataAndScore");
      break;
    case 3:
      v8 = objc_msgSend(v6, "estimatedAssetCountWithEnrichmentStateAssetMetadataAndScenesProcessed");
      break;
    case 4:
      v8 = objc_msgSend(v6, "estimatedAssetCountWithEnrichmentStateComplete");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 1508, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v9 = v8;

  return v9;
}

- (BOOL)hasCurationForAssetCollection:(id)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 0;
  -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurated");

  return v4;
}

void __47__PXPhotosDataSource_prefetchAssetsInSections___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", *(_QWORD *)(a2 + 8));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "keyAssetsInSection:", *(_QWORD *)(a2 + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);

  }
}

- (id)keyAssetsInSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource _keyAssetsForAssetCollection:](self, "_keyAssetsForAssetCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)keyAssetIndexInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "keyAssetIndex");

  return v6;
}

- (id)assetsInSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource _assetsForAssetCollection:](self, "_assetsForAssetCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (id)assetAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_OWORD *)&a3->dataSourceIdentifier;
    v16 = *(_OWORD *)&a3->item;
    PXSimpleIndexPathDescription();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 1887, CFSTR("Data source identifier in indexPath %@ must match %@ for safety and correctness."), v11, self, v14, v16);

  }
  -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", a3->section);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_OWORD *)&a3->dataSourceIdentifier;
    v17 = *(_OWORD *)&a3->item;
    PXSimpleIndexPathDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 1890, CFSTR("%@ asked for asset at indexPath:%@ but fetchResult is nil."), self, v13, v15, v17);

  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3->item);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEmpty
{
  NSNumber *cachedIsEmpty;
  int64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  int64_t v9;
  uint64_t v10;
  NSMutableDictionary *resultRecordByAssetCollection;
  uint64_t v12;
  NSNumber *v13;
  NSNumber *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  if (-[PXPhotosDataSource isImmutable](self, "isImmutable"))
  {
    cachedIsEmpty = self->_cachedIsEmpty;
    if (cachedIsEmpty)
      return -[NSNumber BOOLValue](cachedIsEmpty, "BOOLValue");
  }
  v5 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
  v6 = 1;
  if (v5)
  {
    v7 = v5;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    if (-[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", 0) > 0
      || v7 >= 2 && -[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v7 - 1) >= 1)
    {
      *((_BYTE *)v17 + 24) = 0;
    }
    v8 = v17;
    if (*((_BYTE *)v17 + 24))
    {
      v9 = -[PXPhotosDataSource backgroundFetchOriginSection](self, "backgroundFetchOriginSection");
      if (v9 < 0 || v9 >= v7)
      {
        v8 = v17;
      }
      else
      {
        v10 = -[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v9);
        v8 = v17;
        if (v10 >= 1)
          *((_BYTE *)v17 + 24) = 0;
      }
    }
    if (*((_BYTE *)v8 + 24))
    {
      resultRecordByAssetCollection = self->_resultRecordByAssetCollection;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __29__PXPhotosDataSource_isEmpty__block_invoke;
      v15[3] = &unk_1E513CAE8;
      v15[4] = &v16;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resultRecordByAssetCollection, "enumerateKeysAndObjectsUsingBlock:", v15);
      if (*((_BYTE *)v17 + 24))
      {
        if (v7 >= 1)
        {
          v12 = 0;
          while (!-[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v12))
          {
            if (v7 == ++v12)
              goto LABEL_23;
          }
          *((_BYTE *)v17 + 24) = 0;
        }
      }
    }
LABEL_23:
    if (-[PXPhotosDataSource isImmutable](self, "isImmutable"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v17 + 24));
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = self->_cachedIsEmpty;
      self->_cachedIsEmpty = v13;

    }
    v6 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  return v6;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (BOOL)isImmutable
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (PHCollection)containerCollection
{
  PHCollection *containerCollection;
  PHCollection *v3;

  containerCollection = self->_containerCollection;
  if (containerCollection)
  {
    v3 = containerCollection;
  }
  else if (-[PXPhotosDataSource numberOfSections](self, "numberOfSections") == 1)
  {
    -[PXPhotosDataSource firstAssetCollection](self, "firstAssetCollection");
    v3 = (PHCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)numberOfSections
{
  return -[PHFetchResult count](self->_collectionListFetchResult, "count");
}

- (BOOL)isBackgroundFetching
{
  return self->_isBackgroundFetching;
}

- (void)_interruptBackgroundFetch
{
  if (!self->_needToStartBackgroundFetch)
    self->_interruptBackgroundFetch = 1;
}

- (void)setBackgroundFetchOriginSection:(int64_t)a3
{
  if (self->_backgroundFetchOriginSection != a3)
  {
    self->_backgroundFetchOriginSection = a3;
    self->_backgroundFetchOriginSectionChanged = 1;
    -[PXPhotosDataSource _interruptBackgroundFetch](self, "_interruptBackgroundFetch");
  }
}

- (void)registerChangeObserver:(id)a3
{
  id v4;
  NSObject *observersQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PXPhotosDataSource_registerChangeObserver___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observersQueue, block);

}

- (void)_childDataSourceDidUpdateFetchesForAssetCollection:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (-[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXPhotosDataSource _bringFetchResultsUpToDateWithFetcherCacheForAssetCollection:](self, "_bringFetchResultsUpToDateWithFetcherCacheForAssetCollection:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentDataSource);
    objc_msgSend(WeakRetained, "_childDataSourceDidUpdateFetchesForAssetCollection:", v5);

  }
}

void __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[16];

  v6 = a2;
  v7 = a3;
  objc_msgSend(v7, "fetchResult");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v7, "keyAssetsFetchResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {

        goto LABEL_14;
      }
      v3 = v11;
      if (!*(_BYTE *)(a1 + 57))
      {

LABEL_11:
LABEL_12:
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
        goto LABEL_14;
      }
    }
    else if (!*(_BYTE *)(a1 + 57))
    {
      goto LABEL_11;
    }
    objc_msgSend(v7, "curatedFetchResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    if (v12)
      goto LABEL_12;
  }
LABEL_14:
  objc_msgSend(*(id *)(a1 + 40), "_mutableResultRecordForAssetCollection:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "_addResultTuple:forAssetCollection:preparedResultRecord:toMutableResultRecord:", v7, v6, 0, v13) & 1) == 0)
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "When forcing, the result should always be applicable.", v16, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "_inaccurateAssetCollections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObject:", v6);

}

- (void)_bringFetchResultsUpToDateWithFetcherCacheForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PHFetchResult *v11;
  unint64_t options;
  BOOL v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;

  v4 = a3;
  -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource _inaccurateAssetCollections](self, "_inaccurateAssetCollections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
    v8 = (BYTE1(self->_options) >> 2) & 1;
  else
    v8 = 0;
  -[PXPhotosDataSource fetcher](self, "fetcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource _assetContainerForAssetCollection:](self, "_assetContainerForAssetCollection:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && !(_DWORD)v8)
    goto LABEL_38;
  objc_msgSend(v5, "fetchResult");
  v11 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v29 = 0;
    v28 = 0;
    -[PXPhotosDataSource _getFetchLimit:fetchWithReverseSortOrder:forAssetCollection:isLimitedInitialFetch:](self, "_getFetchLimit:fetchWithReverseSortOrder:forAssetCollection:isLimitedInitialFetch:", &v29, &v28, v4, v8);
    options = self->_options;
    if ((options & 0x40) != 0)
      goto LABEL_12;
    v13 = (options & 0x10000) == 0;
    v14 = v8 ^ 1;
    if (v13)
      v14 = 1;
    if ((v14 & 1) != 0)
    {
      -[PXPhotosDataSource _fetcherConfigurationForAssetCollection:useCase:isLimitedInitialFetch:](self, "_fetcherConfigurationForAssetCollection:useCase:isLimitedInitialFetch:", v4, 0, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "existingAssetsFetchResultForContainer:configuration:", v10, v15);
      v11 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_19;
    }
    else
    {
LABEL_12:
      v11 = self->_emptyAssetsFetchResult;
      if (!v11)
        goto LABEL_19;
    }
    -[PXPhotosDataSource _mutableResultRecordForAssetCollection:](self, "_mutableResultRecordForAssetCollection:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      v17 = -[PXPhotosDataSource reverseSortOrder](self, "reverseSortOrder") ^ 1;
    else
      v17 = 0;
    objc_msgSend(v16, "setFetchResult:reverseSortOrder:", v11, v17);

  }
LABEL_19:
  v18 = self->_options;
  if ((v18 & 0x10) != 0 && objc_msgSend(v4, "px_supportsFastCuration"))
  {
    objc_msgSend(v5, "curatedFetchResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      -[PXPhotosDataSource _fetcherConfigurationForAssetCollection:useCase:isLimitedInitialFetch:](self, "_fetcherConfigurationForAssetCollection:useCase:isLimitedInitialFetch:", v4, 1, v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "existingAssetsFetchResultForContainer:configuration:", v10, v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[PXPhotosDataSource _mutableResultRecordForAssetCollection:](self, "_mutableResultRecordForAssetCollection:", v4);
        v27 = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setCuratedFetchResult:", v19);

        v20 = v27;
      }

    }
  }
  if ((self->_options & 0x20) != 0)
  {
    v22 = objc_msgSend(v4, "px_supportsFastCuration");
    if ((v18 & 0x10) == 0 || v22)
    {
      objc_msgSend(v5, "keyAssetsFetchResult");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        if ((v18 & 0x10) != 0)
          v24 = 3;
        else
          v24 = 2;
        -[PXPhotosDataSource _fetcherConfigurationForAssetCollection:useCase:isLimitedInitialFetch:](self, "_fetcherConfigurationForAssetCollection:useCase:isLimitedInitialFetch:", v4, v24, v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "existingAssetsFetchResultForContainer:configuration:", v10, v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          -[PXPhotosDataSource _mutableResultRecordForAssetCollection:](self, "_mutableResultRecordForAssetCollection:", v4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setKeyAssetsFetchResult:", v23);

        }
      }

    }
  }

LABEL_38:
}

void __74__PXPhotosDataSource_setWantsCurationForAllCollections_collectionsToDiff___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_mutableResultRecordForAssetCollection:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setWantsCuration:", *(unsigned __int8 *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_mutableResultRecordForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_resultRecordByAssetCollection, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (!v6)
  {
    -[PXPhotosDataSource _createResultRecordForAssetCollection:](self, "_createResultRecordForAssetCollection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resultRecordByAssetCollection, "setObject:forKeyedSubscript:", v6, v4);

  return v6;
}

- (id)_finalFilterPredicateForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[PXPhotosDataSource _filterPredicateForAssetCollection:](self, "_filterPredicateForAssetCollection:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource allowedUUIDs](self, "allowedUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid in %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
    {
      v8 = (void *)MEMORY[0x1E0CB3528];
      v19[0] = v4;
      v19[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v10;
    }
    else
    {
      v4 = v6;
    }

  }
  -[PXPhotosDataSource allowedOIDs](self, "allowedOIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v4)
    {
      v14 = (void *)MEMORY[0x1E0CB3528];
      v18[0] = v4;
      v18[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v16;
    }
    else
    {
      v4 = v12;
    }

  }
  return v4;
}

_QWORD *__57__PXPhotosDataSource__enumerateChangeObserversWithBlock___block_invoke_2(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 40) == *(_QWORD *)(v1 + 24))
    *(_BYTE *)(v1 + 16) = *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24);
  return result;
}

void __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_mutableResultRecordForAssetCollection:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "sectionForAssetCollection:", v9) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "_addResultTuple:forAssetCollection:preparedResultRecord:toMutableResultRecord:", v5, v9, v7, v6))
    {
      objc_msgSend(*(id *)(a1 + 32), "_inaccurateAssetCollections");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v9);

    }
  }

}

void __57__PXPhotosDataSource__enumerateChangeObserversWithBlock___block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 16);
  *(_BYTE *)(a1[4] + 16) = 1;
}

uint64_t __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

void __52__PXPhotosDataSource__curationSharedBackgroundQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  PXLIFOQueue *v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.datasource.curation-shared-background-queue", attr);
  v2 = -[PXLIFOQueue initWithTargetQueue:]([PXLIFOQueue alloc], "initWithTargetQueue:", v1);
  v3 = (void *)_curationSharedBackgroundQueue_sharedCurationBackgroundQueue;
  _curationSharedBackgroundQueue_sharedCurationBackgroundQueue = (uint64_t)v2;

}

- (void)_didChange:(id)a3
{
  if (self->_nestedCoalesceChanges < 1)
    -[PXPhotosDataSource _distributeChange:](self, "_distributeChange:", a3);
  else
    -[NSMutableArray addObject:](self->_coalescedChanges, "addObject:", a3);
  --self->_nestedChanges;
}

- (PXPhotosDataSource)initWithPhotosDataSourceConfiguration:(id)a3
{
  id v5;
  PXPhotosDataSource *v6;
  void *v7;
  uint64_t v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *clientQueue;
  id v22;
  uint64_t v23;
  NSPredicate *basePredicate;
  uint64_t v25;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  uint64_t v27;
  PXLibraryFilterState *libraryFilterState;
  PXLibraryFilterState *v29;
  uint64_t v30;
  uint64_t v31;
  NSArray *fetchPropertySets;
  void *v33;
  uint64_t v34;
  id assetContainerProvider;
  uint64_t v36;
  NSMutableDictionary *resultRecordByAssetCollection;
  uint64_t v38;
  NSMutableDictionary *preparedChangeDetailsByAssetCollection;
  uint64_t v40;
  NSDictionary *hintIndexPathByAssetReferenceCache;
  uint64_t v42;
  NSMutableDictionary *facesByAssetCache;
  uint64_t v44;
  NSMutableDictionary *weightByAssetCache;
  uint64_t v46;
  NSMutableSet *inaccurateAssetCollections;
  uint64_t v48;
  NSMutableSet *pauseLibraryChangeDeliveryTokens;
  uint64_t v50;
  NSMutableDictionary *infoForAssetCollection;
  uint64_t v52;
  void *v54;
  id obj;
  char v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[4];
  PXPhotosDataSource *v68;
  _QWORD v69[4];
  PXPhotosDataSource *v70;
  objc_super v71;

  v5 = a3;
  v71.receiver = self;
  v71.super_class = (Class)PXPhotosDataSource;
  v6 = -[PXPhotosDataSource init](&v71, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "collectionListFetchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerCollection");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingAssetCollectionFetchResults");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingKeyAssetsFetchResults");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "referenceAsset");
    v64 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filterPredicate");
    v63 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "includeOthersInSocialGroupAssets");
    objc_msgSend(v5, "sortDescriptors");
    v62 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "canIncludeUnsavedSyndicatedAssets");
    objc_msgSend(v5, "allowedUUIDs");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allowedOIDs");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v5, "options");
    objc_msgSend(v5, "filterPersons");
    v61 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filterSocialGroup");
    v60 = (id)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v5, "hideHiddenAssets");
    objc_msgSend(v5, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v58 = (void *)v8;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    v15 = objc_msgSend(v5, "curationType");
    v16 = objc_msgSend(v5, "reverseSortOrder");
    v17 = objc_msgSend(v5, "includeAllBurstAssets");
    if (v66 && v65)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PXPhotosDataSource.m"), 298, CFSTR("It is invalid to combine allowedUUIDs with allowedOIDs, pick one."));

    }
    objc_msgSend(v5, "clientQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
      clientQueue = v6->_clientQueue;
      v6->_clientQueue = v20;
    }
    else
    {
      v22 = MEMORY[0x1E0C80D38];
      clientQueue = v6->_clientQueue;
      v6->_clientQueue = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    }

    objc_storeStrong((id *)&v6->_photoLibrary, v14);
    objc_storeStrong((id *)&v6->_collectionListFetchResult, v7);
    objc_storeStrong((id *)&v6->_containerCollection, obj);
    objc_msgSend(v5, "basePredicate");
    v23 = objc_claimAutoreleasedReturnValue();
    basePredicate = v6->_basePredicate;
    v6->_basePredicate = (NSPredicate *)v23;

    objc_storeStrong((id *)&v6->_filterPredicate, v63);
    v6->_includeOthersInSocialGroupAssets = v9;
    objc_storeStrong((id *)&v6->_sortDescriptors, v62);
    v6->_canIncludeUnsavedSyndicatedAssets = v10;
    v6->_ignoreSharedLibraryFilters = objc_msgSend(v5, "ignoreSharedLibraryFilters");
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v14);
    v25 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v6->_sharedLibraryStatusProvider;
    v6->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v25;

    objc_msgSend(v5, "libraryFilterState");
    v27 = objc_claimAutoreleasedReturnValue();
    libraryFilterState = v6->_libraryFilterState;
    v6->_libraryFilterState = (PXLibraryFilterState *)v27;

    v29 = v6->_libraryFilterState;
    if (v29)
      v30 = -[PXLibraryFilterState viewMode](v29, "viewMode");
    else
      v30 = objc_msgSend(v5, "libraryFilter");
    v6->_libraryFilter = v30;
    objc_storeStrong((id *)&v6->_allowedUUIDs, v66);
    objc_storeStrong((id *)&v6->_allowedOIDs, v65);
    objc_storeStrong((id *)&v6->_referenceAsset, v64);
    objc_storeStrong((id *)&v6->_filterPersons, v61);
    objc_storeStrong((id *)&v6->_filterSocialGroup, v60);
    v6->_hideHiddenAssets = v56;
    objc_msgSend(v5, "fetchPropertySets");
    v31 = objc_claimAutoreleasedReturnValue();
    fetchPropertySets = v6->_fetchPropertySets;
    v6->_fetchPropertySets = (NSArray *)v31;

    v6->_wantsCurationByDefault = objc_msgSend(v5, "wantsCurationByDefault");
    v6->_curationType = v15;
    v6->_curationKind = objc_msgSend(v5, "curationKind");
    v6->_curationLength = 0;
    v6->_reverseSortOrder = v16;
    v6->_includeAllBurstAssets = v17;
    objc_msgSend(v5, "assetContainerProvider");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    assetContainerProvider = v6->_assetContainerProvider;
    v6->_assetContainerProvider = (id)v34;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = objc_claimAutoreleasedReturnValue();
    resultRecordByAssetCollection = v6->_resultRecordByAssetCollection;
    v6->_resultRecordByAssetCollection = (NSMutableDictionary *)v36;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v38 = objc_claimAutoreleasedReturnValue();
    preparedChangeDetailsByAssetCollection = v6->_preparedChangeDetailsByAssetCollection;
    v6->_preparedChangeDetailsByAssetCollection = (NSMutableDictionary *)v38;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v40 = objc_claimAutoreleasedReturnValue();
    hintIndexPathByAssetReferenceCache = v6->_hintIndexPathByAssetReferenceCache;
    v6->_hintIndexPathByAssetReferenceCache = (NSDictionary *)v40;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v42 = objc_claimAutoreleasedReturnValue();
    facesByAssetCache = v6->_facesByAssetCache;
    v6->_facesByAssetCache = (NSMutableDictionary *)v42;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v44 = objc_claimAutoreleasedReturnValue();
    weightByAssetCache = v6->_weightByAssetCache;
    v6->_weightByAssetCache = (NSMutableDictionary *)v44;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v46 = objc_claimAutoreleasedReturnValue();
    inaccurateAssetCollections = v6->__inaccurateAssetCollections;
    v6->__inaccurateAssetCollections = (NSMutableSet *)v46;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v48 = objc_claimAutoreleasedReturnValue();
    pauseLibraryChangeDeliveryTokens = v6->_pauseLibraryChangeDeliveryTokens;
    v6->_pauseLibraryChangeDeliveryTokens = (NSMutableSet *)v48;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v50 = objc_claimAutoreleasedReturnValue();
    infoForAssetCollection = v6->_infoForAssetCollection;
    v6->_infoForAssetCollection = (NSMutableDictionary *)v50;

    v6->_options = v57;
    -[PXPhotosDataSource _incrementVersionIdentifier](v6, "_incrementVersionIdentifier");
    v52 = MEMORY[0x1E0C809B0];
    if (v59)
    {
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __60__PXPhotosDataSource_initWithPhotosDataSourceConfiguration___block_invoke;
      v69[3] = &unk_1E513C8C0;
      v70 = v6;
      objc_msgSend(v59, "enumerateKeysAndObjectsUsingBlock:", v69);

    }
    if (v58)
    {
      v67[0] = v52;
      v67[1] = 3221225472;
      v67[2] = __60__PXPhotosDataSource_initWithPhotosDataSourceConfiguration___block_invoke_2;
      v67[3] = &unk_1E513C8C0;
      v68 = v6;
      objc_msgSend(v58, "enumerateKeysAndObjectsUsingBlock:", v67);

    }
    -[PXPhotosDataSource _commonInit](v6, "_commonInit");

  }
  return v6;
}

- (PXPhotosDataSource)initWithPhotosDataSource:(id)a3 options:(unint64_t)a4
{
  id v6;
  PXPhotosDataSource *v7;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  uint64_t v10;
  PHFetchResult *collectionListFetchResult;
  uint64_t v12;
  PHCollection *containerCollection;
  uint64_t v14;
  NSPredicate *basePredicate;
  uint64_t v16;
  NSPredicate *filterPredicate;
  uint64_t v18;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  uint64_t v20;
  PXLibraryFilterState *libraryFilterState;
  uint64_t v22;
  NSSet *allowedUUIDs;
  uint64_t v24;
  NSSet *allowedOIDs;
  uint64_t v26;
  NSMutableDictionary *resultRecordByAssetCollection;
  uint64_t v28;
  NSMutableDictionary *preparedChangeDetailsByAssetCollection;
  uint64_t v30;
  NSDictionary *hintIndexPathByAssetReferenceCache;
  void *v32;
  uint64_t v33;
  NSMutableSet *inaccurateAssetCollections;
  uint64_t v35;
  NSMutableDictionary *infoForAssetCollection;
  uint64_t v37;
  NSArray *sortDescriptors;
  uint64_t v39;
  id assetContainerProvider;
  objc_super v42;

  v6 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PXPhotosDataSource;
  v7 = -[PXPhotosDataSource init](&v42, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    objc_msgSend(v6, "collectionListFetchResult");
    v10 = objc_claimAutoreleasedReturnValue();
    collectionListFetchResult = v7->_collectionListFetchResult;
    v7->_collectionListFetchResult = (PHFetchResult *)v10;

    objc_msgSend(v6, "containerCollection");
    v12 = objc_claimAutoreleasedReturnValue();
    containerCollection = v7->_containerCollection;
    v7->_containerCollection = (PHCollection *)v12;

    objc_msgSend(v6, "basePredicate");
    v14 = objc_claimAutoreleasedReturnValue();
    basePredicate = v7->_basePredicate;
    v7->_basePredicate = (NSPredicate *)v14;

    objc_msgSend(v6, "filterPredicate");
    v16 = objc_claimAutoreleasedReturnValue();
    filterPredicate = v7->_filterPredicate;
    v7->_filterPredicate = (NSPredicate *)v16;

    v7->_canIncludeUnsavedSyndicatedAssets = objc_msgSend(v6, "canIncludeUnsavedSyndicatedAssets");
    v7->_includeAllBurstAssets = objc_msgSend(v6, "includeAllBurstAssets");
    v7->_includeOthersInSocialGroupAssets = objc_msgSend(v6, "includeOthersInSocialGroupAssets");
    v7->_ignoreSharedLibraryFilters = objc_msgSend(v6, "ignoreSharedLibraryFilters");
    objc_msgSend(v6, "sharedLibraryStatusProvider");
    v18 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v7->_sharedLibraryStatusProvider;
    v7->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v18;

    objc_msgSend(v6, "libraryFilterState");
    v20 = objc_claimAutoreleasedReturnValue();
    libraryFilterState = v7->_libraryFilterState;
    v7->_libraryFilterState = (PXLibraryFilterState *)v20;

    v7->_libraryFilter = objc_msgSend(v6, "libraryFilter");
    objc_msgSend(v6, "allowedUUIDs");
    v22 = objc_claimAutoreleasedReturnValue();
    allowedUUIDs = v7->_allowedUUIDs;
    v7->_allowedUUIDs = (NSSet *)v22;

    objc_msgSend(v6, "allowedOIDs");
    v24 = objc_claimAutoreleasedReturnValue();
    allowedOIDs = v7->_allowedOIDs;
    v7->_allowedOIDs = (NSSet *)v24;

    v26 = objc_msgSend(*((id *)v6 + 9), "mutableCopy");
    resultRecordByAssetCollection = v7->_resultRecordByAssetCollection;
    v7->_resultRecordByAssetCollection = (NSMutableDictionary *)v26;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    preparedChangeDetailsByAssetCollection = v7->_preparedChangeDetailsByAssetCollection;
    v7->_preparedChangeDetailsByAssetCollection = (NSMutableDictionary *)v28;

    v30 = objc_msgSend(*((id *)v6 + 6), "copy");
    hintIndexPathByAssetReferenceCache = v7->_hintIndexPathByAssetReferenceCache;
    v7->_hintIndexPathByAssetReferenceCache = (NSDictionary *)v30;

    objc_msgSend(v6, "_inaccurateAssetCollections");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "mutableCopy");
    inaccurateAssetCollections = v7->__inaccurateAssetCollections;
    v7->__inaccurateAssetCollections = (NSMutableSet *)v33;

    v35 = objc_msgSend(*((id *)v6 + 14), "mutableCopy");
    infoForAssetCollection = v7->_infoForAssetCollection;
    v7->_infoForAssetCollection = (NSMutableDictionary *)v35;

    v7->__previousCollectionsCount = -[PHFetchResult count](v7->_collectionListFetchResult, "count");
    v7->_fetchLimit = *((_QWORD *)v6 + 57);
    v37 = objc_msgSend(*((id *)v6 + 58), "copy");
    sortDescriptors = v7->_sortDescriptors;
    v7->_sortDescriptors = (NSArray *)v37;

    v7->_reverseSortOrder = *((_BYTE *)v6 + 332);
    v7->_versionIdentifier = *((_QWORD *)v6 + 46);
    objc_storeStrong((id *)&v7->_facesByAssetCache, *((id *)v6 + 28));
    objc_storeStrong((id *)&v7->_weightByAssetCache, *((id *)v6 + 29));
    objc_storeStrong((id *)&v7->_filterPersons, *((id *)v6 + 49));
    v7->_hideHiddenAssets = *((_BYTE *)v6 + 240);
    v7->_wantsCurationByDefault = *((_BYTE *)v6 + 333);
    objc_storeStrong((id *)&v7->_fetchPropertySets, *((id *)v6 + 31));
    v7->_curationType = *((_QWORD *)v6 + 32);
    v7->_curationKind = *((_QWORD *)v6 + 33);
    v7->_curationLength = *((_QWORD *)v6 + 34);
    v7->_allowSlowFetchesOnClientQueue = *((_BYTE *)v6 + 336);
    objc_storeStrong((id *)&v7->_clientQueue, *((id *)v6 + 60));
    v39 = objc_msgSend(*((id *)v6 + 64), "copy");
    assetContainerProvider = v7->_assetContainerProvider;
    v7->_assetContainerProvider = (id)v39;

    objc_storeWeak((id *)&v7->_parentDataSource, v6);
    v7->_options = a4;
    -[PXPhotosDataSource _initResultRecordsWithOldOptions:newOptions:](v7, "_initResultRecordsWithOldOptions:newOptions:", objc_msgSend(v6, "options"), a4);
    -[PXPhotosDataSource _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)libraryFilter
{
  return self->_libraryFilter;
}

- (PHFetchResult)collectionListFetchResult
{
  return self->_collectionListFetchResult;
}

- (BOOL)ignoreSharedLibraryFilters
{
  return self->_ignoreSharedLibraryFilters;
}

- (void)_commonInit
{
  _BOOL4 v3;
  PXLIFOQueue *v4;
  dispatch_qos_class_t v5;
  NSObject *v6;
  NSObject *v7;
  PXLIFOQueue *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *backgroundQueue;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *prefetchQueue;
  NSMutableArray *v14;
  NSMutableArray *coalescedChanges;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *observersQueue;
  id v18;
  PHPhotoLibrary *photoLibrary;
  void *v20;
  PHFetchResult *v21;
  PHFetchResult *emptyAssetsFetchResult;
  unint64_t options;
  NSMutableDictionary *v24;
  NSMutableDictionary *pendingResultsByAssetCollection;
  NSMutableDictionary *v26;
  NSMutableDictionary *pendingPreparedResultRecordByAssetCollection;
  NSObject *v28;
  OS_dispatch_queue *v29;
  OS_dispatch_queue *pendingResultsIsolationQueue;
  NSMutableOrderedSet *v31;
  NSMutableOrderedSet *queuedAssetCollectionsToFetch;
  PXBackgroundFetchToken *v33;
  void *v34;
  PXBackgroundFetchToken *v35;
  NSHashTable *v36;
  NSHashTable *observersQueue_observers;
  _QWORD v38[4];
  PXBackgroundFetchToken *v39;

  v3 = -[PXPhotosDataSource _areSecondaryFetchesEnabled](self, "_areSecondaryFetchesEnabled");
  if (v3)
  {
    +[PXPhotosDataSource _curationSharedBackgroundQueue](PXPhotosDataSource, "_curationSharedBackgroundQueue");
    v4 = (PXLIFOQueue *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((self->_options & 0x1400) != 0)
      v5 = QOS_CLASS_USER_INITIATED;
    else
      v5 = QOS_CLASS_UTILITY;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = [PXLIFOQueue alloc];
    v9 = dispatch_queue_create("com.apple.photos.datasource.background-queue", v7);
    v4 = -[PXLIFOQueue initWithTargetQueue:](v8, "initWithTargetQueue:", v9);

  }
  objc_storeStrong((id *)&self->_backgroundLIFOQueue, v4);
  -[PXLIFOQueue targetQueue](v4, "targetQueue");
  v10 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  backgroundQueue = self->_backgroundQueue;
  self->_backgroundQueue = v10;

  +[PXPhotosDataSource sharedPrefetchQueue](PXPhotosDataSource, "sharedPrefetchQueue");
  v12 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  prefetchQueue = self->_prefetchQueue;
  self->_prefetchQueue = v12;

  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  coalescedChanges = self->_coalescedChanges;
  self->_coalescedChanges = v14;

  v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.datasource.observers-queue", 0);
  observersQueue = self->_observersQueue;
  self->_observersQueue = v16;

  v18 = objc_alloc(MEMORY[0x1E0CD1620]);
  photoLibrary = self->_photoLibrary;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (PHFetchResult *)objc_msgSend(v18, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], photoLibrary, v20, 0, 0, 0);
  emptyAssetsFetchResult = self->_emptyAssetsFetchResult;
  self->_emptyAssetsFetchResult = v21;

  options = self->_options;
  if ((options & 4) == 0 && ((v3 | options) & 1) != 0)
  {
    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingResultsByAssetCollection = self->_pendingResultsByAssetCollection;
    self->_pendingResultsByAssetCollection = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingPreparedResultRecordByAssetCollection = self->_pendingPreparedResultRecordByAssetCollection;
    self->_pendingPreparedResultRecordByAssetCollection = v26;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.datasource.pending-results-queue", v28);
    pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
    self->_pendingResultsIsolationQueue = v29;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v31 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    queuedAssetCollectionsToFetch = self->_queuedAssetCollectionsToFetch;
    self->_queuedAssetCollectionsToFetch = v31;

    self->_needToStartBackgroundFetch = 1;
    self->_isBackgroundFetching = 1;
    self->_inaccurateAssetCollectionsNeedsUpdate = 1;
    v33 = objc_alloc_init(PXBackgroundFetchToken);
    +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __33__PXPhotosDataSource__commonInit__block_invoke;
    v38[3] = &unk_1E5149198;
    v39 = v33;
    v35 = v33;
    objc_msgSend(v34, "scheduleDeferredTaskWithQoS:block:", 0, v38);

    if ((self->_options & 4) != 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  self->_needToStartBackgroundFetch = 0;
  self->_isBackgroundFetching = 0;
  if ((options & 4) == 0)
  {
LABEL_12:
    -[PHPhotoLibrary px_registerChangeObserver:](self->_photoLibrary, "px_registerChangeObserver:", self);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v36 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    observersQueue_observers = self->_observersQueue_observers;
    self->_observersQueue_observers = v36;

  }
LABEL_13:
  if (!-[PXPhotosDataSource isImmutable](self, "isImmutable")
    && !-[PXPhotosDataSource ignoreSharedLibraryFilters](self, "ignoreSharedLibraryFilters"))
  {
    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](self->_sharedLibraryStatusProvider, "registerChangeObserver:context:", self, PXSharedLibraryStatusProviderObservationContext_243356);
    -[PXLibraryFilterState registerChangeObserver:context:](self->_libraryFilterState, "registerChangeObserver:context:", self, PXLibraryFilterStateObservationContext_243357);
  }

}

- (BOOL)_areSecondaryFetchesEnabled
{
  return (self->_options & 0x30) != 0;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (BOOL)canIncludeUnsavedSyndicatedAssets
{
  return self->_canIncludeUnsavedSyndicatedAssets;
}

- (void)_initResultRecordsWithOldOptions:(unint64_t)a3 newOptions:(unint64_t)a4
{
  NSObject *v5;
  NSMutableDictionary *resultRecordByAssetCollection;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  if ((a3 & a4 & 0x20) != 0 && ((a3 >> 4) & 1) != ((a4 >> 4) & 1))
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Clearing key assets fetches for fetch type change", buf, 2u);
    }

    resultRecordByAssetCollection = self->_resultRecordByAssetCollection;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__PXPhotosDataSource__initResultRecordsWithOldOptions_newOptions___block_invoke;
    v7[3] = &unk_1E513C910;
    v8 = 0;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resultRecordByAssetCollection, "enumerateKeysAndObjectsUsingBlock:", v7);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_resultRecordByAssetCollection, "addEntriesFromDictionary:", 0);

  }
}

+ (id)_curationSharedBackgroundQueue
{
  if (_curationSharedBackgroundQueue_onceToken != -1)
    dispatch_once(&_curationSharedBackgroundQueue_onceToken, &__block_literal_global_243574);
  return (id)_curationSharedBackgroundQueue_sharedCurationBackgroundQueue;
}

- (void)_distributeChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  PXPhotosDataSource *v10;
  id v11;

  v4 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __40__PXPhotosDataSource__distributeChange___block_invoke;
  v9 = &unk_1E513C9D8;
  v10 = self;
  v11 = v4;
  v5 = v4;
  -[PXPhotosDataSource _enumerateChangeObserversWithBlock:](self, "_enumerateChangeObserversWithBlock:", &v6);
  -[PXPhotosDataSource _setPreviousCollectionsCount:](self, "_setPreviousCollectionsCount:", -[PHFetchResult count](self->_collectionListFetchResult, "count", v6, v7, v8, v9, v10));

}

- (void)_willChange
{
  int64_t nestedChanges;
  _QWORD v4[5];

  nestedChanges = self->_nestedChanges;
  self->_nestedChanges = nestedChanges + 1;
  if (!nestedChanges)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __33__PXPhotosDataSource__willChange__block_invoke;
    v4[3] = &unk_1E513C9B0;
    v4[4] = self;
    -[PXPhotosDataSource _enumerateChangeObserversWithBlock:](self, "_enumerateChangeObserversWithBlock:", v4);
    -[PXPhotosDataSource _setPreviousCollectionsCount:](self, "_setPreviousCollectionsCount:", -[PHFetchResult count](self->_collectionListFetchResult, "count"));
    -[PXPhotosDataSource _incrementVersionIdentifier](self, "_incrementVersionIdentifier");
  }
}

- (void)_enumerateChangeObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *observersQueue;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[7];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[7];
  _QWORD v18[3];
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__243379;
  v24 = __Block_byref_object_dispose__243380;
  v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  observersQueue = self->_observersQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXPhotosDataSource__enumerateChangeObserversWithBlock___block_invoke;
  block[3] = &unk_1E51401A8;
  block[4] = self;
  block[5] = &v20;
  block[6] = v18;
  dispatch_sync(observersQueue, block);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (id)v21[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v26, 16);
    }
    while (v8);
  }

  v11 = self->_observersQueue;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __57__PXPhotosDataSource__enumerateChangeObserversWithBlock___block_invoke_2;
  v12[3] = &unk_1E51401A8;
  v12[4] = self;
  v12[5] = &v20;
  v12[6] = v18;
  dispatch_sync(v11, v12);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

}

- (void)_setPreviousCollectionsCount:(unint64_t)a3
{
  self->__previousCollectionsCount = a3;
}

- (void)_incrementVersionIdentifier
{
  self->_versionIdentifier = sub_1A7ADF414();
}

void __40__PXPhotosDataSource__distributeChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "photosDataSource:didChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __33__PXPhotosDataSource__willChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "photosDataSourceWillChange:", *(_QWORD *)(a1 + 32));

}

- (id)immutableCopy
{
  return -[PXPhotosDataSource initWithPhotosDataSource:options:]([PXPhotosDataSource alloc], "initWithPhotosDataSource:options:", self, -[PXPhotosDataSource options](self, "options") & 0xFFFFFFFFFFFFFFFALL | 4);
}

+ (OS_dispatch_group)backgroundFetchingGroup
{
  if (backgroundFetchingGroup_onceToken != -1)
    dispatch_once(&backgroundFetchingGroup_onceToken, &__block_literal_global_145_243570);
  return (OS_dispatch_group *)(id)backgroundFetchingGroup__sharedGroup;
}

void __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "photosDataSourceDidFinishBackgroundFetching:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[PHPhotoLibrary px_unregisterChangeObserver:](self->_photoLibrary, "px_unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDataSource;
  -[PXPhotosDataSource dealloc](&v3, sel_dealloc);
}

- (void)prefetchAssetsInSections:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PXPhotosDataSource_prefetchAssetsInSections___block_invoke;
  v8[3] = &unk_1E5142450;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateSectionIndexPathsUsingBlock:", v8);

  -[PXPhotosDataSource _prefetchIndexesByFetchResult:onlyThumbnails:](self, "_prefetchIndexesByFetchResult:onlyThumbnails:", v7, 0);
}

- (void)_prefetchIndexesByFetchResult:(id)a3 onlyThumbnails:(BOOL)a4
{
  id v6;
  _QWORD v7[5];
  BOOL v8;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__PXPhotosDataSource__prefetchIndexesByFetchResult_onlyThumbnails___block_invoke;
    v7[3] = &unk_1E513CC28;
    v8 = a4;
    v7[4] = self;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
  }

}

uint64_t __45__PXPhotosDataSource_registerChangeObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_observersQueue_copyChangeObserversForWriteIfNeeded
{
  NSHashTable *v3;
  NSHashTable *observersQueue_observers;

  if (self->_observersQueue_shouldCopyChangeObserversOnWrite)
  {
    v3 = (NSHashTable *)-[NSHashTable copy](self->_observersQueue_observers, "copy");
    observersQueue_observers = self->_observersQueue_observers;
    self->_observersQueue_observers = v3;

    self->_observersQueue_shouldCopyChangeObserversOnWrite = 0;
  }
}

- (void)setWantsCurationForAllCollections:(BOOL)a3 collectionsToDiff:(id)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  _QWORD v17[4];
  id v18;
  PXPhotosDataSource *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollectionToSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  v12 = v10;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v10);
        -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isCurated") != v4
          || objc_msgSend(v16, "wantsCuration") != v4)
        {

          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __74__PXPhotosDataSource_setWantsCurationForAllCollections_collectionsToDiff___block_invoke;
          v17[3] = &unk_1E51473C0;
          v18 = v10;
          v19 = self;
          v20 = v4;
          -[PXPhotosDataSource _performManualChangesForAssetCollections:collectionsToDiff:changeBlock:](self, "_performManualChangesForAssetCollections:collectionsToDiff:changeBlock:", v18, v6, v17);
          v12 = v18;
          goto LABEL_12;
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
        continue;
      break;
    }
    v12 = v10;
  }
LABEL_12:

}

- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4
{
  void *v5;
  BOOL v6;

  if (-[PXPhotosDataSource _allSectionsConsideredAccurate](self, "_allSectionsConsideredAccurate")
    && !-[PXPhotosDataSource _areSecondaryFetchesEnabled](self, "_areSecondaryFetchesEnabled")
    || -[PXPhotosDataSource numberOfSections](self, "numberOfSections") < 1)
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPhotosDataSource forceAccurateSectionsIfNeeded:reloadChanges:](self, "forceAccurateSectionsIfNeeded:reloadChanges:", v5, 0);

  return v6;
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3 reloadChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v4 = a4;
  v7 = a3;
  if (-[PXPhotosDataSource _allSectionsConsideredAccurate](self, "_allSectionsConsideredAccurate")
    && !-[PXPhotosDataSource _areSecondaryFetchesEnabled](self, "_areSecondaryFetchesEnabled"))
  {
    v10 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__PXPhotosDataSource_forceAccurateSectionsIfNeeded_reloadChanges___block_invoke;
    v12[3] = &unk_1E513F058;
    v13 = v8;
    v14 = a2;
    v12[4] = self;
    v9 = v8;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v12);
    v10 = -[PXPhotosDataSource forceAccurateAssetCollectionsIfNeeded:reloadChanges:](self, "forceAccurateAssetCollectionsIfNeeded:reloadChanges:", v9, v4);

  }
  return v10;
}

- (BOOL)forceAccurateAssetCollectionsIfNeeded:(id)a3 reloadChanges:(BOOL)a4
{
  NSObject *pendingResultsIsolationQueue;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  double v21;
  uint64_t v22;
  BOOL v23;
  unint64_t options;
  void *v25;
  id v26;
  id v27;
  void (**v28)(_QWORD);
  void (**v29)(_QWORD);
  void *v30;
  NSObject *backgroundQueue;
  _BOOL4 v33;
  id v35;
  void *v36;
  id obj;
  _QWORD v38[5];
  id v39;
  _QWORD aBlock[4];
  id v41;
  id v42;
  PXPhotosDataSource *v43;
  SEL v44;
  BOOL v45;
  BOOL v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD block[6];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint8_t buf[4];
  unint64_t v59;
  __int16 v60;
  double v61;
  _BYTE v62[128];
  uint64_t v63;

  v33 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  if (-[PXPhotosDataSource _allSectionsConsideredAccurate](self, "_allSectionsConsideredAccurate")
    && !-[PXPhotosDataSource _areSecondaryFetchesEnabled](self, "_areSecondaryFetchesEnabled"))
  {
    v23 = 0;
  }
  else
  {
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__243379;
    v56 = __Block_byref_object_dispose__243380;
    v57 = 0;
    pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
    if (pendingResultsIsolationQueue)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke;
      block[3] = &unk_1E5148AA8;
      block[4] = self;
      block[5] = &v52;
      dispatch_sync(pendingResultsIsolationQueue, block);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v48 = 0u;
    v47 = 0u;
    obj = v35;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v48 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "fetchResult");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            objc_msgSend((id)v53[5], "objectForKeyedSubscript:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[PXPhotosDataSource _isResultTupleApplicable:forAssetCollection:](self, "_isResultTupleApplicable:forAssetCollection:", v12, v9))
            {
              PLUIGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                v14 = -[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:", v9);
                *(_DWORD *)buf = 134217984;
                v59 = v14;
                _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "Forced section %lu, got result from pending", buf, 0xCu);
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "timeIntervalSinceReferenceDate");
              v17 = v16;

              -[PXPhotosDataSource _fetchTupleForAssetCollection:calledOnClientQueue:isLimitedInitialFetch:](self, "_fetchTupleForAssetCollection:calledOnClientQueue:isLimitedInitialFetch:", v9, 1, 0);
              v18 = objc_claimAutoreleasedReturnValue();

              PLUIGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                v19 = -[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:", v9);
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "timeIntervalSinceReferenceDate");
                *(_DWORD *)buf = 134218240;
                v59 = v19;
                v60 = 2048;
                v61 = (v21 - v17) * 1000.0;
                _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "Forced section %lu, fetched on demand, duration:%.2fms", buf, 0x16u);

              }
              v12 = (void *)v18;
            }

            objc_msgSend(v36, "setObject:forKeyedSubscript:", v12, v9);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      }
      while (v6);
    }

    v22 = objc_msgSend(v36, "count");
    v23 = v22 != 0;
    if (v22)
    {
      options = self->_options;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_278;
      aBlock[3] = &unk_1E513CBB0;
      v26 = v36;
      v41 = v26;
      v45 = (options & 0x20) != 0;
      v46 = (options & 0x10) != 0;
      v27 = v25;
      v42 = v27;
      v43 = self;
      v44 = a2;
      v28 = (void (**)(_QWORD))_Block_copy(aBlock);
      v29 = v28;
      if (self->_nestedChanges < 1)
      {
        if (v33)
        {
          -[PXPhotosDataSource _willChange](self, "_willChange");
          v29[2](v29);
          -[PXPhotosDataSource _publishReloadChange](self, "_publishReloadChange");
        }
        else
        {
          objc_msgSend(v26, "allKeys");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v30, v29);

        }
      }
      else
      {
        v28[2](v28);
      }
      if (self->_isBackgroundFetching && objc_msgSend(v27, "count"))
      {
        backgroundQueue = self->_backgroundQueue;
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_280;
        v38[3] = &unk_1E5148D08;
        v38[4] = self;
        v39 = v27;
        dispatch_async(backgroundQueue, v38);
        -[PXPhotosDataSource _interruptBackgroundFetch](self, "_interruptBackgroundFetch");

      }
    }

    _Block_object_dispose(&v52, 8);
  }

  return v23;
}

- (void)_processAndPublishPendingCollectionFetchResults
{
  NSObject *pendingResultsIsolationQueue;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[7];
  _QWORD block[7];
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  self->_processAndPublishScheduledOnRunloop = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__243379;
  v15 = __Block_byref_object_dispose__243380;
  v16 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__243379;
  v9[4] = __Block_byref_object_dispose__243380;
  v10 = 0;
  pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke;
  block[3] = &unk_1E51401A8;
  block[4] = self;
  block[5] = &v11;
  block[6] = v9;
  dispatch_sync(pendingResultsIsolationQueue, block);
  if (!-[PXPhotosDataSource _allSectionsConsideredAccurate](self, "_allSectionsConsideredAccurate")
    || (self->_options & 0x800000) != 0
    || -[PXPhotosDataSource _areSecondaryFetchesEnabled](self, "_areSecondaryFetchesEnabled"))
  {
    objc_msgSend((id)v12[5], "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_2;
    v7[3] = &unk_1E51401A8;
    v7[4] = self;
    v7[5] = &v11;
    v7[6] = v9;
    -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v5, v7);

    -[NSMutableDictionary removeAllObjects](self->_preparedChangeDetailsByAssetCollection, "removeAllObjects");
  }
  else
  {
    -[NSMutableDictionary removeAllObjects](self->_preparedChangeDetailsByAssetCollection, "removeAllObjects");
  }
  if (self->_didFinishBackgroundFetch && -[PXPhotosDataSource isBackgroundFetching](self, "isBackgroundFetching"))
  {
    -[PXPhotosDataSource setIsBackgroundFetching:](self, "setIsBackgroundFetching:", 0);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_4;
    v6[3] = &unk_1E513C9B0;
    v6[4] = self;
    -[PXPhotosDataSource _enumerateChangeObserversWithBlock:](self, "_enumerateChangeObserversWithBlock:", v6);
  }
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(&v11, 8);
}

- (void)_performManualChangesForAssetCollections:(id)a3 collectionsToDiff:(id)a4 changeBlock:(id)a5
{
  -[PXPhotosDataSource _performManualChangesForAssetCollections:collectionsToDiff:collectionsToChange:changeBlock:](self, "_performManualChangesForAssetCollections:collectionsToDiff:collectionsToChange:changeBlock:", a3, a4, 0, a5);
}

- (void)_performManualChangesForAssetCollections:(id)a3 changeBlock:(id)a4
{
  -[PXPhotosDataSource _performManualChangesForAssetCollections:collectionsToDiff:changeBlock:](self, "_performManualChangesForAssetCollections:collectionsToDiff:changeBlock:", a3, 0, a4);
}

- (BOOL)_allSectionsConsideredAccurate
{
  void *v2;
  BOOL v3;

  -[PXPhotosDataSource _inaccurateAssetCollections](self, "_inaccurateAssetCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (void)setIsBackgroundFetching:(BOOL)a3
{
  PXBackgroundFetchToken *backgroundFetchToken;

  if (self->_isBackgroundFetching != a3)
  {
    self->_isBackgroundFetching = a3;
    if (a3)
    {
      self->_didFinishBackgroundFetch = 0;
    }
    else
    {
      -[PXBackgroundFetchToken finish](self->_backgroundFetchToken, "finish");
      backgroundFetchToken = self->_backgroundFetchToken;
      self->_backgroundFetchToken = 0;

    }
  }
}

void __45__PXPhotosDataSource_backgroundFetchingGroup__block_invoke()
{
  dispatch_group_t v0;
  void *v1;

  v0 = dispatch_group_create();
  v1 = (void *)backgroundFetchingGroup__sharedGroup;
  backgroundFetchingGroup__sharedGroup = (uint64_t)v0;

}

- (void)startBackgroundFetchIfNeeded
{
  PXBackgroundFetchToken *v3;
  PXBackgroundFetchToken *backgroundFetchToken;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8[2];
  id location;

  if (self->_needToStartBackgroundFetch)
  {
    self->_needToStartBackgroundFetch = 0;
    if (!self->_backgroundFetchToken)
    {
      v3 = objc_alloc_init(PXBackgroundFetchToken);
      backgroundFetchToken = self->_backgroundFetchToken;
      self->_backgroundFetchToken = v3;

    }
    -[PXPhotosDataSource _updateInaccurateAssetCollectionsIfNeeded](self, "_updateInaccurateAssetCollectionsIfNeeded");
    v5 = -[PXPhotosDataSource _nextBackgroundFetchId](self, "_nextBackgroundFetchId");
    objc_initWeak(&location, self);
    -[PXPhotosDataSource clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PXPhotosDataSource_startBackgroundFetchIfNeeded__block_invoke;
    block[3] = &unk_1E51447A0;
    objc_copyWeak(v8, &location);
    v8[1] = v5;
    dispatch_async(v6, block);

    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

- (int64_t)_nextBackgroundFetchId
{
  int *p_backgroundFetchId;
  unsigned int v3;
  signed int v4;

  p_backgroundFetchId = &self->_backgroundFetchId;
  do
  {
    v3 = __ldaxr((unsigned int *)p_backgroundFetchId);
    v4 = v3 + 1;
  }
  while (__stlxr(v4, (unsigned int *)p_backgroundFetchId));
  return v4;
}

void __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  if (!*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_didFinishBackgroundFetchingForId:", *(_QWORD *)(a1 + 40));

  }
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "_processAndPublishPendingCollectionFetchResultsWhenAppropriate");

}

- (void)_processAndPublishPendingCollectionFetchResultsWhenAppropriate
{
  _QWORD v2[5];

  if (self->_allowNextChangeDeliveryOnAllRunLoopModes)
  {
    self->_allowNextChangeDeliveryOnAllRunLoopModes = 0;
    -[PXPhotosDataSource _processAndPublishPendingCollectionFetchResults](self, "_processAndPublishPendingCollectionFetchResults");
  }
  else if (!self->_processAndPublishScheduledOnRunloop && !self->_pauseBackgroundFetchResultsDelivery)
  {
    self->_processAndPublishScheduledOnRunloop = 1;
    if ((self->_options & 0x400) != 0)
    {
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __84__PXPhotosDataSource__processAndPublishPendingCollectionFetchResultsWhenAppropriate__block_invoke;
      v2[3] = &unk_1E5149198;
      v2[4] = self;
      -[PXPhotosDataSource _prepareDiffsForPendingResultsWithCompletion:](self, "_prepareDiffsForPendingResultsWithCompletion:", v2);
    }
    else
    {
      -[PXPhotosDataSource _performProcessAndPublishSelectorInDefaultRunLoopMode](self, "_performProcessAndPublishSelectorInDefaultRunLoopMode");
    }
  }
}

- (void)_performProcessAndPublishSelectorInDefaultRunLoopMode
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = *MEMORY[0x1E0C99748];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource performSelectorOnMainThread:withObject:waitUntilDone:modes:](self, "performSelectorOnMainThread:withObject:waitUntilDone:modes:", sel__processAndPublishPendingCollectionFetchResults, 0, 0, v3);

}

- (void)_didFinishBackgroundFetchingForId:(int64_t)a3
{
  unsigned int v3;

  v3 = atomic_load((unsigned int *)&self->_backgroundFetchId);
  if (v3 == a3)
    self->_didFinishBackgroundFetch = 1;
}

void __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_assetContainerProvider, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_allowedOIDs, 0);
  objc_storeStrong((id *)&self->_allowedUUIDs, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_basePredicate, 0);
  objc_storeStrong((id *)&self->_filterSocialGroup, 0);
  objc_storeStrong((id *)&self->_filterPersons, 0);
  objc_storeStrong((id *)&self->_referenceAsset, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_containerCollection, 0);
  objc_destroyWeak((id *)&self->_parentDataSource);
  objc_storeStrong((id *)&self->_coalescedChanges, 0);
  objc_storeStrong((id *)&self->_cachedIsEmpty, 0);
  objc_storeStrong((id *)&self->_emptyAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_weightByAssetCache, 0);
  objc_storeStrong((id *)&self->_facesByAssetCache, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);
  objc_storeStrong((id *)&self->_queuedAssetCollectionsToFetch, 0);
  objc_storeStrong((id *)&self->_backgroundLIFOQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_pendingResultsIsolationQueue, 0);
  objc_storeStrong((id *)&self->_pendingPreparedResultRecordByAssetCollection, 0);
  objc_storeStrong((id *)&self->_pendingResultsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_pauseLibraryChangeDeliveryTokens, 0);
  objc_storeStrong((id *)&self->_backgroundFetchToken, 0);
  objc_storeStrong((id *)&self->_infoForAssetCollection, 0);
  objc_storeStrong((id *)&self->_preparedContainerChangeDetails, 0);
  objc_storeStrong((id *)&self->_preparedChangeDetailsByAssetCollection, 0);
  objc_storeStrong((id *)&self->__inaccurateAssetCollections, 0);
  objc_storeStrong((id *)&self->_resultRecordByAssetCollection, 0);
  objc_storeStrong((id *)&self->_preparedResultRecordChangeDetailsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_preparedIndexPathByAssetReferenceCache, 0);
  objc_storeStrong((id *)&self->_hintIndexPathByAssetReferenceCache, 0);
  objc_storeStrong((id *)&self->__preparedSectionCache, 0);
  objc_storeStrong((id *)&self->__sectionCache, 0);
  objc_storeStrong((id *)&self->_observersQueue_observers, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
}

void __66__PXPhotosDataSource_forceAccurateSectionsIfNeeded_reloadChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __50__PXPhotosDataSource_startBackgroundFetchIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchRemainingCollectionsBackgroundLoopWithId:", *(_QWORD *)(a1 + 40));

}

uint64_t __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1[4] + 160), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(a1[4] + 168), "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1[4] + 160), "removeAllObjects");
  return objc_msgSend(*(id *)(a1[4] + 168), "removeAllObjects");
}

void __50__PXPhotosDataSource_startBackgroundFetchIfNeeded__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7[2];

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 25);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__PXPhotosDataSource_startBackgroundFetchIfNeeded__block_invoke_2;
    v6[3] = &unk_1E51447A0;
    objc_copyWeak(v7, v2);
    v7[1] = *(id *)(a1 + 40);
    objc_msgSend(v5, "dispatchAsync:", v6);
    objc_destroyWeak(v7);
  }

}

- (id)createDataSourceWithAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  PXPhotosDataSource *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetCollections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = 0;
      v14 = 0x1E0CD1000uLL;
      v15 = 0x1E0CB3000uLL;
      v36 = self;
      do
      {
        if (v6)
        {
          objc_msgSend(v6, "indexPath");
          if (v13 != *((_QWORD *)&v39 + 1))
            goto LABEL_13;
          objc_msgSend(v6, "indexPath");
          v16 = v38;
        }
        else
        {
          v39 = 0u;
          if (v13)
            goto LABEL_13;
          v16 = 0;
          v38 = 0;
        }
        -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17
          || (-[PXPhotosDataSource _assetsForAssetCollection:](self, "_assetsForAssetCollection:", v17),
              (v18 = objc_claimAutoreleasedReturnValue()) == 0))
        {

LABEL_13:
          v28 = *(void **)(v14 + 952);
          objc_msgSend(*(id *)(v15 + 2368), "stringWithFormat:", CFSTR("%08ld-%@"), v13, v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], 0, v29, self->_photoLibrary);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v17);
          goto LABEL_14;
        }
        v19 = (void *)v18;
        v20 = *(void **)(v14 + 952);
        objc_msgSend(*(id *)(v15 + 2368), "stringWithFormat:", CFSTR("%08ld-%@"), v13, v9);
        v21 = v6;
        v22 = v9;
        v23 = v7;
        v24 = v15;
        v25 = v14;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "transientAssetCollectionWithAssetFetchResult:title:identifier:", v19, 0, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v25;
        v15 = v24;
        v7 = v23;
        v9 = v22;
        v6 = v21;
        self = v36;
        objc_msgSend(v7, "addObject:", v27);

LABEL_14:
        ++v13;
        -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "assetCollections");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");

      }
      while (v13 < v32);
    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v6, "indexPath");
      v33 = v37;
    }
    else
    {
      v33 = 0;
    }
    -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "addObject:", v9);
  }

  -[PXPhotosDataSource _createDataSourceWithAssetsCollections:](self, "_createDataSourceWithAssetsCollections:", v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)createDataSourceWithAssetsAtIndexPaths:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PXPhotosDataSource_createDataSourceWithAssetsAtIndexPaths___block_invoke;
  v13[3] = &unk_1E513C8E8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v5, "enumerateItemIndexSetsUsingBlock:", v13);

  -[PXPhotosDataSource _createDataSourceWithAssetsCollections:](self, "_createDataSourceWithAssetsCollections:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_createDataSourceWithAssetsCollections:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXPhotosDataSource *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3928];
  v5 = a3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", CFSTR("transientIdentifier"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingDescriptors:", v7);

  objc_msgSend(MEMORY[0x1E0CD14E0], "transientCollectionListWithCollections:title:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CD13B8];
  -[PXPhotosDataSource collectionListFetchResult](self, "collectionListFetchResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchCollectionsInCollectionList:options:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PXPhotosDataSource initWithPhotosDataSource:options:]([PXPhotosDataSource alloc], "initWithPhotosDataSource:options:", self, 0);
  -[PXPhotosDataSource setCollectionListFetchResult:](v13, "setCollectionListFetchResult:", v12);
  -[PXPhotosDataSource setWantsCurationByDefault:](v13, "setWantsCurationByDefault:", 0);

  return v13;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v3 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= 1)
  {
    v5 = 0;
    while (1)
    {
      -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PXPhotosDataSource _assetCollectionFetchStatus:](self, "_assetCollectionFetchStatus:", v6);
      v8 = v7;
      if (v7 - 1 >= 3)
      {
        if (v7)
          v12 = 0;
        else
          v12 = CFSTR("inacc.");
        goto LABEL_16;
      }
      -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exposedFetchResult");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("unknown");
      }
      if (v8 == 1)
        break;
      if (v8 == 2)
      {
        v13 = CFSTR("stale:%@");
LABEL_14:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, v12);
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (__CFString *)v14;
      }

LABEL_16:
      objc_msgSend(v4, "addObject:", v12);

      if (v3 == ++v5)
        goto LABEL_17;
    }
    v13 = CFSTR("limited:%@");
    goto LABEL_14;
  }
LABEL_17:
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3940];
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosDataSource;
  -[PXPhotosDataSource description](&v20, sel_description);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ sections:%ld sectionCounts:[%@]>"), v17, v3, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (BOOL)isSectionConsideredAccurate:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[PHFetchResult objectAtIndexedSubscript:](self->_collectionListFetchResult, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPhotosDataSource _assetCollectionFetchStatus:](self, "_assetCollectionFetchStatus:", v4);
  if (v5 == 2)
  {
    -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exposedFetchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = v5 == 3;
  }

  return v8;
}

- (void)setAllowedUUIDs:(id)a3 manualOrderUUIDs:(id)a4 forAssetCollections:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 723, CFSTR("%s must be called on the main thread"), "-[PXPhotosDataSource setAllowedUUIDs:manualOrderUUIDs:forAssetCollections:]");

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[PXPhotosDataSource infoForAssetCollection:](self, "infoForAssetCollection:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAllowedUUIDs:", v19);

        objc_msgSend(v10, "objectForKeyedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setManualOrderUUIDs:", v20);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  -[PXPhotosDataSource _restartBackgroundFetchWithAssetCollectionsToDiff:](self, "_restartBackgroundFetchWithAssetCollectionsToDiff:", 0);
}

- (id)_assetOidsByAssetCollectionForAssetsAtIndexPathsInSet:(id)a3
{
  id v5;
  int64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  SEL v15;

  v5 = a3;
  v6 = -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier");
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PXPhotosDataSource__assetOidsByAssetCollectionForAssetsAtIndexPathsInSet___block_invoke;
  v12[3] = &unk_1E513C938;
  v14 = v6;
  v15 = a2;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v5, "enumerateItemIndexPathsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

- (void)performChanges:(id)a3
{
  int64_t v4;
  PXPhotosDataSourceChange *v5;
  PXPhotosDataSourceChange *v6;

  ++self->_nestedCoalesceChanges;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  if (self->_nestedCoalesceChanges == 1 && -[NSMutableArray count](self->_coalescedChanges, "count"))
    -[PXPhotosDataSource _restartBackgroundFetchWithAssetCollectionsToDiff:](self, "_restartBackgroundFetchWithAssetCollectionsToDiff:", 0);
  v4 = self->_nestedCoalesceChanges - 1;
  self->_nestedCoalesceChanges = v4;
  if (!v4 && -[NSMutableArray count](self->_coalescedChanges, "count"))
  {
    if (-[NSMutableArray count](self->_coalescedChanges, "count") == 1)
    {
      -[NSMutableArray firstObject](self->_coalescedChanges, "firstObject");
      v5 = (PXPhotosDataSourceChange *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = objc_alloc_init(PXPhotosDataSourceChange);
    }
    v6 = v5;
    -[NSMutableArray removeAllObjects](self->_coalescedChanges, "removeAllObjects");
    -[PXPhotosDataSource _distributeChange:](self, "_distributeChange:", v6);

  }
}

- (void)_performManualReloadWithChangeBlock:(id)a3
{
  void (**v4)(_QWORD);
  PXPhotosDataSourceSectionCache *sectionCache;
  void *v6;

  v4 = (void (**)(_QWORD))a3;
  -[PXPhotosDataSource _willChange](self, "_willChange");
  v4[2](v4);

  sectionCache = self->__sectionCache;
  self->__sectionCache = 0;

  if (self->_needToStartBackgroundFetch)
  {
    -[NSMutableDictionary removeAllObjects](self->_resultRecordByAssetCollection, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->__inaccurateAssetCollections, "removeAllObjects");
    -[NSMutableOrderedSet removeAllObjects](self->_queuedAssetCollectionsToFetch, "removeAllObjects");
    self->_inaccurateAssetCollectionsNeedsUpdate = 1;
    -[PXPhotosDataSource _updateInaccurateAssetCollectionsIfNeeded](self, "_updateInaccurateAssetCollectionsIfNeeded");
  }
  else
  {
    -[PXPhotosDataSource _cancelBackgroundFetchIfNeeded](self, "_cancelBackgroundFetchIfNeeded");
    -[PXPhotosDataSource _inaccurateAssetCollections](self, "_inaccurateAssetCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    -[NSMutableDictionary removeAllObjects](self->_resultRecordByAssetCollection, "removeAllObjects");
  }
  -[PXPhotosDataSource _publishReloadChange](self, "_publishReloadChange");
}

- (id)_fetcherConfigurationForAssetCollection:(id)a3 useCase:(int64_t)a4 isLimitedInitialFetch:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  int64_t curationKind;
  void *v10;
  int v11;
  unint64_t v12;
  PXPhotosAssetsFetcherConfiguration *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v19;
  uint64_t v20;

  v5 = a5;
  v8 = a3;
  switch(a4)
  {
    case 3:
      +[PXPhotosDataSourceSettings sharedInstance](PXPhotosDataSourceSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "disableKeyAssetCuration");

      if (v11)
        curationKind = 4;
      else
        curationKind = 5;
      break;
    case 2:
      curationKind = 4;
      break;
    case 1:
      curationKind = self->_curationKind;
      break;
    default:
      curationKind = 0;
      break;
  }
  if (self->_canIncludeUnsavedSyndicatedAssets)
    v12 = (self->_options >> 15) & 0x10 | (self->_options >> 12) & 2 | (self->_options >> 8) & 1 | (self->_options >> 15) & 0x28 | (self->_options >> 16) & 0x40 | 4;
  else
    v12 = (self->_options >> 15) & 0x10 | (self->_options >> 12) & 2 | (self->_options >> 8) & 1 | (self->_options >> 15) & 0x28 | (self->_options >> 16) & 0x40;
  v20 = 0;
  v19 = 0;
  -[PXPhotosDataSource _getFetchLimit:fetchWithReverseSortOrder:forAssetCollection:isLimitedInitialFetch:](self, "_getFetchLimit:fetchWithReverseSortOrder:forAssetCollection:isLimitedInitialFetch:", &v20, &v19, v8, v5);
  v13 = objc_alloc_init(PXPhotosAssetsFetcherConfiguration);
  -[PXPhotosAssetsFetcherConfiguration setCurationKind:](v13, "setCurationKind:", curationKind);
  -[PXPhotosAssetsFetcherConfiguration setCurationLength:](v13, "setCurationLength:", self->_curationLength);
  -[PXPhotosAssetsFetcherConfiguration setOptions:](v13, "setOptions:", v12);
  -[PXPhotosAssetsFetcherConfiguration setLibraryFilter:](v13, "setLibraryFilter:", self->_libraryFilter);
  -[PXPhotosAssetsFetcherConfiguration setFetchLimit:](v13, "setFetchLimit:", v20);
  -[PXPhotosDataSource _finalFilterPredicateForAssetCollection:](self, "_finalFilterPredicateForAssetCollection:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcherConfiguration setFilterPredicate:](v13, "setFilterPredicate:", v14);

  -[PXPhotosDataSource _inclusionPredicateForAssetCollection:](self, "_inclusionPredicateForAssetCollection:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcherConfiguration setInclusionPredicate:](v13, "setInclusionPredicate:", v15);

  -[PXPhotosDataSource sortDescriptors](self, "sortDescriptors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcherConfiguration setSortDescriptors:](v13, "setSortDescriptors:", v16);

  -[PXPhotosAssetsFetcherConfiguration setIncludeUnsavedSyndicatedAssets:](v13, "setIncludeUnsavedSyndicatedAssets:", self->_canIncludeUnsavedSyndicatedAssets);
  -[PXPhotosAssetsFetcherConfiguration setIncludeAllBurstAssets:](v13, "setIncludeAllBurstAssets:", self->_includeAllBurstAssets);
  -[PXPhotosAssetsFetcherConfiguration setReverseSortOrder:](v13, "setReverseSortOrder:", v19);
  -[PXPhotosAssetsFetcherConfiguration setHideHiddenAssets:](v13, "setHideHiddenAssets:", self->_hideHiddenAssets);
  -[PXPhotosAssetsFetcherConfiguration setFetchPropertySets:](v13, "setFetchPropertySets:", self->_fetchPropertySets);
  -[PXPhotosAssetsFetcherConfiguration setReferencePersons:](v13, "setReferencePersons:", self->_filterPersons);
  -[PXPhotosAssetsFetcherConfiguration setCurationType:](v13, "setCurationType:", self->_curationType);
  -[PXPhotosDataSource referenceAsset](self, "referenceAsset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAssetsFetcherConfiguration setReferenceAsset:](v13, "setReferenceAsset:", v17);

  -[PXPhotosAssetsFetcherConfiguration setIncludeOthersInSocialGroupAssets:](v13, "setIncludeOthersInSocialGroupAssets:", self->_includeOthersInSocialGroupAssets);
  return v13;
}

- (id)_assetContainerForAssetCollection:(id)a3
{
  id v4;
  void (**assetContainerProvider)(id, id);
  id v6;

  v4 = a3;
  assetContainerProvider = (void (**)(id, id))self->_assetContainerProvider;
  if (!assetContainerProvider
    || (assetContainerProvider[2](assetContainerProvider, v4), (v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = v4;
  }

  return v6;
}

- (void)_publishReloadChange
{
  PXPhotosDataSourceChange *v3;

  v3 = objc_alloc_init(PXPhotosDataSourceChange);
  -[PXPhotosDataSource _didChange:](self, "_didChange:", v3);

}

- (void)_publishDidReceivePhotoLibraryChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PXPhotosDataSource__publishDidReceivePhotoLibraryChange___block_invoke;
  v6[3] = &unk_1E513C9D8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXPhotosDataSource _enumerateChangeObserversWithBlock:](self, "_enumerateChangeObserversWithBlock:", v6);

}

- (id)_observerInterestingAssetReferences
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PXPhotosDataSource__observerInterestingAssetReferences__block_invoke;
  v8[3] = &unk_1E513C9D8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[PXPhotosDataSource _enumerateChangeObserversWithBlock:](self, "_enumerateChangeObserversWithBlock:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

- (id)_closestIndexPathToIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void (**v12)(void *, uint64_t, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
  if (!v5)
  {
    v9 = 0;
    goto LABEL_21;
  }
  v6 = v5;
  if (objc_msgSend(v4, "section") < v5)
  {
    v7 = -[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v4, "section"));
    if (objc_msgSend(v4, "item") < v7)
    {
      v8 = v4;
      goto LABEL_8;
    }
    v10 = v7 < 1;
    v11 = v7 - 1;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, objc_msgSend(v4, "section"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = v8;
      if (v8)
        goto LABEL_21;
    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXPhotosDataSource__closestIndexPathToIndexPath___block_invoke;
  aBlock[3] = &unk_1E513CA00;
  aBlock[4] = self;
  v12 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  v13 = objc_msgSend(v4, "section");
  v14 = v6 - 1;
  if (v6 > 1)
  {
    v15 = v13 - 1;
    v16 = v13 + 1;
    while (v16 < v6 || (v15 & 0x8000000000000000) == 0)
    {
      if (v16 < v6 && (v12[2](v12, v16, 0), (v17 = objc_claimAutoreleasedReturnValue()) != 0)
        || (v15 & 0x8000000000000000) == 0
        && v15 < v6
        && (v12[2](v12, v15, 1), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v9 = (void *)v17;
        goto LABEL_20;
      }
      --v15;
      ++v16;
      if (!--v14)
        break;
    }
  }
  v9 = 0;
LABEL_20:

LABEL_21:
  return v9;
}

- (BOOL)_isResultTupleApplicable:(id)a3 forAssetCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  if (!a3)
    return 0;
  v6 = a3;
  -[PXPhotosDataSource _finalFilterPredicateForAssetCollection:](self, "_finalFilterPredicateForAssetCollection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    v9 = 1;
  else
    v9 = objc_msgSend(v7, "isEqual:", v8);

  return v9;
}

- (BOOL)_isFiltering
{
  void *v3;

  -[PXPhotosDataSource filterPredicate](self, "filterPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 || -[PXPhotosDataSource libraryFilter](self, "libraryFilter") != 0;
}

- (int64_t)estimatedPhotosCount
{
  void *v4;
  int64_t v5;

  if (-[PXPhotosDataSource _isFiltering](self, "_isFiltering"))
    return 0;
  -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "estimatedPhotosCount");

  return v5;
}

- (int64_t)estimatedVideosCount
{
  void *v4;
  int64_t v5;

  if (-[PXPhotosDataSource _isFiltering](self, "_isFiltering"))
    return 0;
  -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "estimatedVideosCount");

  return v5;
}

- (int64_t)estimatedOtherCount
{
  void *v4;
  int64_t v5;

  if (-[PXPhotosDataSource _isFiltering](self, "_isFiltering"))
    return 0;
  -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "estimatedOtherCount");

  return v5;
}

- (void)unregisterChangeObserver:(id)a3
{
  id v4;
  NSObject *observersQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PXPhotosDataSource_unregisterChangeObserver___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observersQueue, block);

}

- (void)pauseChangeDeliveryFor:(double)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  -[PXPhotosDataSource photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_beginPausingChangesWithTimeout:identifier:", v6, fmax(a3 + a3, 1.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__PXPhotosDataSource_pauseChangeDeliveryFor_identifier___block_invoke;
  v12[3] = &unk_1E5148D08;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_after(v9, MEMORY[0x1E0C80D38], v12);

}

- (id)pauseChangeDeliveryAndBackgroundLoadingWithTimeout:(double)a3 identifier:(id)a4
{
  double v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  void *v18;
  id v19;
  id location;

  v6 = fmax(a3 + a3, 0.1);
  v7 = a4;
  -[PXPhotosDataSource photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_beginPausingChangesWithTimeout:identifier:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObject:](self->_pauseLibraryChangeDeliveryTokens, "addObject:", v9);
  self->_pauseBackgroundFetchResultsDelivery = 1;
  objc_initWeak(&location, self);
  v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PXPhotosDataSource_pauseChangeDeliveryAndBackgroundLoadingWithTimeout_identifier___block_invoke;
  v16[3] = &unk_1E5147B18;
  objc_copyWeak(&v19, &location);
  v11 = v9;
  v17 = v11;
  v18 = v8;
  v12 = v8;
  dispatch_after(v10, MEMORY[0x1E0C80D38], v16);
  v13 = v18;
  v14 = v11;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  return v14;
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  id v4;
  void *v5;
  NSObject *pendingResultsIsolationQueue;
  uint64_t v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_pauseLibraryChangeDeliveryTokens, "containsObject:", v4))
  {
    -[PXPhotosDataSource photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_endPausingChanges:", v4);

    -[NSMutableSet removeObject:](self->_pauseLibraryChangeDeliveryTokens, "removeObject:", v4);
    if (!-[NSMutableSet count](self->_pauseLibraryChangeDeliveryTokens, "count"))
    {
      self->_pauseBackgroundFetchResultsDelivery = 0;
      pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
      if (pendingResultsIsolationQueue)
      {
        v13 = 0;
        v14 = &v13;
        v15 = 0x2020000000;
        v16 = 0;
        v7 = MEMORY[0x1E0C809B0];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __63__PXPhotosDataSource_resumeChangeDeliveryAndBackgroundLoading___block_invoke;
        block[3] = &unk_1E5148AA8;
        block[4] = self;
        block[5] = &v13;
        dispatch_sync(pendingResultsIsolationQueue, block);
        if (*((_BYTE *)v14 + 24))
        {
          objc_initWeak(&location, self);
          v8 = dispatch_time(0, 500000000);
          v9[0] = v7;
          v9[1] = 3221225472;
          v9[2] = __63__PXPhotosDataSource_resumeChangeDeliveryAndBackgroundLoading___block_invoke_2;
          v9[3] = &unk_1E5148D30;
          objc_copyWeak(&v10, &location);
          dispatch_after(v8, MEMORY[0x1E0C80D38], v9);
          objc_destroyWeak(&v10);
          objc_destroyWeak(&location);
        }
        _Block_object_dispose(&v13, 8);
      }
    }
  }

}

- (void)setCollectionListFetchResult:(id)a3
{
  PHFetchResult *v4;
  PHFetchResult *v5;
  _QWORD v6[5];
  PHFetchResult *v7;

  v4 = (PHFetchResult *)a3;
  v5 = v4;
  if (self->_collectionListFetchResult != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PXPhotosDataSource_setCollectionListFetchResult___block_invoke;
    v6[3] = &unk_1E5148D08;
    v6[4] = self;
    v7 = v4;
    -[PXPhotosDataSource _performManualReloadWithChangeBlock:](self, "_performManualReloadWithChangeBlock:", v6);

  }
}

- (void)setAllowedOIDs:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  NSSet *v6;
  char v7;
  _QWORD v8[5];
  NSSet *v9;

  v4 = (NSSet *)a3;
  v5 = self->_allowedOIDs;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSSet isEqual:](v5, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __37__PXPhotosDataSource_setAllowedOIDs___block_invoke;
      v8[3] = &unk_1E5148D08;
      v8[4] = self;
      v9 = v4;
      -[PXPhotosDataSource _performManualReloadWithChangeBlock:](self, "_performManualReloadWithChangeBlock:", v8);

    }
  }

}

- (void)setAllowedUUIDs:(id)a3
{
  NSSet *v4;
  NSSet *allowedUUIDs;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];
  NSSet *v13;

  v4 = (NSSet *)a3;
  allowedUUIDs = self->_allowedUUIDs;
  if (allowedUUIDs != v4 && (-[NSSet isEqual:](allowedUUIDs, "isEqual:", v4) & 1) == 0)
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__PXPhotosDataSource_setAllowedUUIDs___block_invoke;
    aBlock[3] = &unk_1E5148D08;
    aBlock[4] = self;
    v7 = v4;
    v13 = v7;
    v8 = _Block_copy(aBlock);
    if (-[NSSet count](v7, "count") && self->_allowedUUIDs)
    {
      -[PHFetchResult fetchedObjects](self->_collectionListFetchResult, "fetchedObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDataSource _cancelBackgroundFetchIfNeeded](self, "_cancelBackgroundFetchIfNeeded");
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __38__PXPhotosDataSource_setAllowedUUIDs___block_invoke_2;
      v10[3] = &unk_1E5148CE0;
      v10[4] = self;
      v11 = v8;
      -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v9, v10);

    }
    else
    {
      -[PXPhotosDataSource _performManualReloadWithChangeBlock:](self, "_performManualReloadWithChangeBlock:", v8);
    }

  }
}

- (void)setFetchLimit:(unint64_t)a3
{
  _QWORD v3[6];

  if (self->_fetchLimit != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __36__PXPhotosDataSource_setFetchLimit___block_invoke;
    v3[3] = &unk_1E5144EB8;
    v3[4] = self;
    v3[5] = a3;
    -[PXPhotosDataSource _performManualReloadWithChangeBlock:](self, "_performManualReloadWithChangeBlock:", v3);
  }
}

- (void)setSortDescriptors:(id)a3
{
  NSArray *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  NSArray *v11;
  id v12;

  v5 = (NSArray *)a3;
  if (self->_sortDescriptors != v5)
  {
    if (self->_isBackgroundFetching
      && self->_needToStartBackgroundFetch
      && !-[NSMutableDictionary count](self->_resultRecordByAssetCollection, "count"))
    {
      objc_storeStrong((id *)&self->_sortDescriptors, a3);
    }
    else
    {
      -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assetCollectionToSection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __41__PXPhotosDataSource_setSortDescriptors___block_invoke;
      v10[3] = &unk_1E51457C8;
      v10[4] = self;
      v11 = v5;
      v12 = v8;
      v9 = v8;
      -[PXPhotosDataSource _performManualReloadWithChangeBlock:](self, "_performManualReloadWithChangeBlock:", v10);
      -[PXPhotosDataSource _restartBackgroundFetchWithAssetCollectionsToDiff:](self, "_restartBackgroundFetchWithAssetCollectionsToDiff:", 0);

    }
  }

}

- (void)setReverseSortOrder:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_reverseSortOrder != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __42__PXPhotosDataSource_setReverseSortOrder___block_invoke;
    v3[3] = &unk_1E5144398;
    v3[4] = self;
    v4 = a3;
    -[PXPhotosDataSource _performManualReloadWithChangeBlock:](self, "_performManualReloadWithChangeBlock:", v3);
  }
}

- (void)setKeyAsset:(id)a3 forAssetCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PXPhotosDataSource_setKeyAsset_forAssetCollection___block_invoke;
  v11[3] = &unk_1E51457C8;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v8, v11);

}

- (void)setCurationLength:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PXPhotosDataSource *v11;
  int64_t v12;

  if (self->_curationLength != a3)
  {
    self->_curationLength = a3;
    -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetCollectionToSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__PXPhotosDataSource_setCurationLength___block_invoke;
    v9[3] = &unk_1E5145560;
    v10 = v7;
    v11 = self;
    v12 = a3;
    v8 = v7;
    -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v8, v9);

  }
}

- (void)setWantsCuration:(BOOL)a3 forAssetCollection:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;
  _QWORD v11[2];

  v4 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[PXPhotosDataSource wantsCurationForAssetCollection:](self, "wantsCurationForAssetCollection:", v6) != v4)
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__PXPhotosDataSource_setWantsCuration_forAssetCollection___block_invoke;
    v8[3] = &unk_1E51473C0;
    v8[4] = self;
    v9 = v6;
    v10 = v4;
    -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v7, v8);

  }
}

- (id)lastAssetCollection
{
  return -[PHFetchResult lastObject](self->_collectionListFetchResult, "lastObject");
}

- (id)sectionsForAssetCollections:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = -[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addIndex:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (double)weightForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_weightByAssetCache, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "weight");
      objc_msgSend(v8, "numberWithDouble:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_weightByAssetCache, "setObject:forKey:", v7, v6);
    }
    objc_msgSend(v7, "floatValue");
    v10 = v9;

  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (id)facesAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  __int128 v27;
  void *v28;
  void *v29;
  __int128 v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_OWORD *)&a3->item;
    v32 = *(_OWORD *)&a3->dataSourceIdentifier;
    v33 = v27;
    PXSimpleIndexPathDescription();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 1911, CFSTR("Data source identifier in indexPath %@ must match %@ for safety and correctness."), v28, self, v32, v33);

  }
  -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", a3->section);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchedObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a3->item);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = *(_OWORD *)&a3->item;
    v32 = *(_OWORD *)&a3->dataSourceIdentifier;
    v33 = v10;
    -[PXPhotosDataSource assetAtSimpleIndexPath:](self, "assetAtSimpleIndexPath:", &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_OWORD *)&a3->item;
      v32 = *(_OWORD *)&a3->dataSourceIdentifier;
      v33 = v30;
      PXSimpleIndexPathDescription();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 1919, CFSTR("%@ asset at indexPath:%@ is nil."), self, v31);

      v9 = 0;
    }
  }
  -[NSMutableDictionary objectForKey:](self->_facesByAssetCache, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[PXPhotosDataSource photoLibrary](self, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_standardLibrarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v14, "setIncludeTorsoAndFaceDetectionData:", 1);
    objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIncludedDetectionTypes:", v15);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("assetForFace"), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](self->_filterPersons, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v17, "objectID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "predicateWithFormat:", CFSTR("noindex:(%K) = %@"), CFSTR("personForFace"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB3528];
      v34[0] = v16;
      v34[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "andPredicateWithSubpredicates:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setInternalPredicate:", v24);
    }
    else
    {
      objc_msgSend(v14, "setInternalPredicate:", v16);
    }
    objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesWithOptions:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[NSMutableDictionary setObject:forKey:](self->_facesByAssetCache, "setObject:forKey:", v12, v9);

  }
  return v12;
}

- (id)assetAtIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "item");
  -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 1956, CFSTR("%@ nil asset at indexPath:%@. The indexPath is probably invalid."), self, v5);

  }
  return v8;
}

- (BOOL)isAssetAtIndexPathPartOfCuratedSet:(PXSimpleIndexPath *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", a3->section);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3->item);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    || (objc_msgSend(v5, "objectAtIndex:", a3->item),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "objectID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7))
  {
    -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", a3->section);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "curatedOids");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v7);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)approximateAssetsAtIndexPaths:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  PXPhotosDataSource *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSource collectionListFetchResult](self, "collectionListFetchResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v23 = self;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v27;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "section", v22);
          if (v15 < objc_msgSend(v6, "count"))
          {
            if (v15 != v12 || v9 == 0)
            {
              -[PXPhotosDataSource assetsInSection:](v23, "assetsInSection:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = objc_msgSend(v17, "count");
              v18 = v17;

              v12 = v15;
              v9 = v18;
            }
            else
            {
              v9 = v9;
            }
            if (objc_msgSend(v14, "item") < v10)
            {
              objc_msgSend(v9, "fetchedObjects");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v14, "item"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addObject:", v20);

            }
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v4 = v22;
  }
  else
  {
    v24 = (id)MEMORY[0x1E0C9AA60];
  }

  return v24;
}

- (id)indexPathForAsset:(id)a3 inCollection:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  v7 = -[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:", a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && (v12 = objc_msgSend(v10, "indexOfObject:", v6), v12 != 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)indexPathForAsset:(id)a3 hintIndexPath:(id)a4 hintCollection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5)
  {
    v14 = a5;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = a5;
    objc_msgSend(v10, "arrayWithObjects:count:", &v14, 1);
    a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PXPhotosDataSource indexPathForAsset:hintIndexPath:hintCollections:](self, "indexPathForAsset:hintIndexPath:hintCollections:", v8, v9, a5, v14, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)indexPathForAsset:(id)a3 hintIndexPath:(id)a4 hintCollections:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void (**v29)(void *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD aBlock[5];
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
  v12 = 0;
  if (!v8)
    goto LABEL_47;
  v13 = v11;
  if (!v11)
    goto LABEL_47;
  if (v9 && v11 > objc_msgSend(v9, "section"))
  {
    -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", objc_msgSend(v9, "section"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "item");
    if (v15 < objc_msgSend(v14, "count"))
    {
      v16 = objc_msgSend(v14, "indexOfObject:inRange:", v8, objc_msgSend(v9, "item"), 1);
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_13;
      v17 = objc_msgSend(v9, "item");
      v18 = 250;
      if (v17 > 250)
        v18 = v17;
      v19 = v18 - 250;
      v20 = objc_msgSend(v14, "count");
      v21 = v20 - v19 >= 500 ? 500 : v20 - v19;
      v16 = objc_msgSend(v14, "indexOfObject:inRange:", v8, v19, v21);
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_13:
        objc_msgSend(v14, "objectAtIndex:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "isEqual:", v8) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, objc_msgSend(v9, "section"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            goto LABEL_47;
          goto LABEL_18;
        }

      }
    }

  }
LABEL_18:
  if (objc_msgSend(v10, "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v23 = v10;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v43 != v26)
            objc_enumerationMutation(v23);
          -[PXPhotosDataSource indexPathForAsset:inCollection:](self, "indexPathForAsset:inCollection:", v8, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          v28 = objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v12 = (void *)v28;

            goto LABEL_47;
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v25)
          continue;
        break;
      }
    }

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PXPhotosDataSource_indexPathForAsset_hintIndexPath_hintCollections___block_invoke;
  aBlock[3] = &unk_1E513CA28;
  v41 = v13;
  aBlock[4] = self;
  v40 = v8;
  v29 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v30 = objc_msgSend(v9, "section");
  if (v13 - 1 >= (v30 & ~(v30 >> 63)))
    v31 = v30 & ~(v30 >> 63);
  else
    v31 = v13 - 1;
  v29[2](v29, v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v32 = v13 - 2;
    if (v13 < 2)
    {
      v12 = 0;
    }
    else
    {
      v33 = v31 - 1;
      v34 = v31 + 1;
      while (1)
      {
        v35 = v32;
        v29[2](v29, v34);
        v36 = objc_claimAutoreleasedReturnValue();
        if (v36)
          break;
        v29[2](v29, v33);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12 && (v33 >= 0 || v34 < v13))
        {
          v32 = v35 - 1;
          --v33;
          ++v34;
          if (v35)
            continue;
        }
        goto LABEL_46;
      }
      v12 = (void *)v36;
    }
  }
LABEL_46:

LABEL_47:
  return v12;
}

- (int64_t)indexForAsset:(id)a3 inCollection:(id)a4 hintIndex:(int64_t)a5
{
  id v8;
  id v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    v12 = v10;
    if (v10)
    {
      v13 = -[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:", v9);
      if (v13 < v12)
      {
        -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count") > (unint64_t)a5)
        {
          objc_msgSend(v14, "objectAtIndex:", a5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqual:", v8))
            v11 = a5;

        }
      }
      if (v9 && v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[PXPhotosDataSource indexPathForAsset:inCollection:](self, "indexPathForAsset:inCollection:", v8, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          v11 = objc_msgSend(v16, "item");
        else
          v11 = 0x7FFFFFFFFFFFFFFFLL;

      }
    }
  }

  return v11;
}

- (id)indexPathForAssetWithUUID:(id)a3 orBurstIdentifier:(id)a4 hintIndexPath:(id)a5 hintCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6)
  {
    v17 = a6;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = a6;
    objc_msgSend(v13, "arrayWithObjects:count:", &v17, 1);
    a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PXPhotosDataSource _indexPathForAssetWithUUID:orBurstIdentifier:orSyndicationIdentifier:hintIndexPath:hintCollections:](self, "_indexPathForAssetWithUUID:orBurstIdentifier:orSyndicationIdentifier:hintIndexPath:hintCollections:", v10, v11, 0, v12, a6, v17, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)indexPathForAssetWithUUID:(id)a3 orSyndicationIdentifier:(id)a4 hintIndexPath:(id)a5 hintCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6)
  {
    v17 = a6;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = a6;
    objc_msgSend(v13, "arrayWithObjects:count:", &v17, 1);
    a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PXPhotosDataSource _indexPathForAssetWithUUID:orBurstIdentifier:orSyndicationIdentifier:hintIndexPath:hintCollections:](self, "_indexPathForAssetWithUUID:orBurstIdentifier:orSyndicationIdentifier:hintIndexPath:hintCollections:", v10, 0, v11, v12, a6, v17, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_indexPathForAssetWithUUID:(id)a3 orBurstIdentifier:(id)a4 orSyndicationIdentifier:(id)a5 hintIndexPath:(id)a6 hintCollections:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD aBlock[5];
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  _QWORD *v39;
  _QWORD v40[4];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(v12, "length");
  if (v14 || v17)
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__243379;
    v49 = __Block_byref_object_dispose__243380;
    v50 = 0;
    -[PXPhotosDataSource _closestIndexPathToIndexPath:](self, "_closestIndexPathToIndexPath:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v40[3] = 150;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__PXPhotosDataSource__indexPathForAssetWithUUID_orBurstIdentifier_orSyndicationIdentifier_hintIndexPath_hintCollections___block_invoke;
    aBlock[3] = &unk_1E513CA50;
    v37 = &v41;
    aBlock[4] = self;
    v34 = v14;
    v20 = v12;
    v35 = v20;
    v36 = v13;
    v38 = &v45;
    v39 = v40;
    v21 = _Block_copy(aBlock);
    -[PXPhotosDataSource enumerateStartingAtIndexPath:reverseDirection:usingBlock:](self, "enumerateStartingAtIndexPath:reverseDirection:usingBlock:", v19, 0, v21);
    v22 = (void *)v46[5];
    if (!v22)
    {
      v42[3] = 0;
      -[PXPhotosDataSource enumerateStartingAtIndexPath:reverseDirection:usingBlock:](self, "enumerateStartingAtIndexPath:reverseDirection:usingBlock:", v19, 1, v21);
      v22 = (void *)v46[5];
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", v20);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosDataSource photoLibrary](self, "photoLibrary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "px_standardLibrarySpecificFetchOptions");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1E0CD1390];
        v51[0] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fetchAssetsWithLocalIdentifiers:options:", v25, v31);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          -[PXPhotosDataSource indexPathForAsset:hintIndexPath:hintCollections:](self, "indexPathForAsset:hintIndexPath:hintCollections:", v27, v15, v16);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v46[5];
          v46[5] = v28;

        }
        v22 = (void *)v46[5];
      }
    }
    v18 = v22;

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (!-[PXPhotosDataSource versionIdentifier](self, "versionIdentifier"))
      goto LABEL_10;
LABEL_5:
    objc_msgSend(v5, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v10 = 0;
        goto LABEL_21;
      }
      objc_msgSend(v5, "assetCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "assetCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }

      -[NSDictionary objectForKeyedSubscript:](self->_hintIndexPathByAssetReferenceCache, "objectForKeyedSubscript:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        if (v5)
        {
          objc_msgSend(v5, "simpleIndexPath");
        }
        else
        {
          v16 = 0u;
          v17 = 0u;
        }
        PXIndexPathFromSimpleIndexPath();
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;
      -[PXPhotosDataSource indexPathForAsset:hintIndexPath:hintCollection:](self, "indexPathForAsset:hintIndexPath:hintCollection:", v7, v13, v9, v16, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
      v7 = v6;
    }

    goto LABEL_21;
  }
  objc_msgSend(v4, "simpleIndexPath");
  if (v18 != -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier"))
    goto LABEL_5;
  objc_msgSend(v5, "simpleIndexPath");
LABEL_10:
  PXIndexPathFromSimpleIndexPath();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v10;
}

- (id)assetReferenceForAsset:(id)a3 containedInAssetCollectionWithType:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v6, a4, 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v13 = -[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:", v12);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = v13;
          -[PXPhotosDataSource forceAccurateSection:andSectionsBeforeAndAfter:](self, "forceAccurateSection:andSectionsBeforeAndAfter:", v13, 0);
          -[PXPhotosDataSource uncuratedAssetsInSection:](self, "uncuratedAssetsInSection:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "containsObject:", v6) & 1) != 0)
          {
            v17 = objc_alloc((Class)off_1E50B1688);
            v18 = *((_OWORD *)off_1E50B8778 + 1);
            v20[0] = *(_OWORD *)off_1E50B8778;
            v20[1] = v18;
            v16 = (void *)objc_msgSend(v17, "initWithSectionObject:itemObject:subitemObject:indexPath:", v12, v6, 0, v20);

            goto LABEL_13;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;

  if (!a3)
    return 0;
  v4 = a3;
  -[PXPhotosDataSource assetAtIndexPath:](self, "assetAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc((Class)off_1E50B1688);
  -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier");
  PXSimpleIndexPathFromIndexPath();

  v8 = (void *)objc_msgSend(v7, "initWithSectionObject:itemObject:subitemObject:indexPath:", v6, v5, 0, &v10);
  return v8;
}

- (id)indexPathForFirstAsset
{
  uint64_t v3;
  void *v4;

  if (-[PXPhotosDataSource isEmpty](self, "isEmpty")
    || -[PXPhotosDataSource numberOfSections](self, "numberOfSections") < 1)
  {
LABEL_6:
    v4 = 0;
  }
  else
  {
    v3 = 0;
    while (-[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v3) < 1)
    {
      if (++v3 >= -[PXPhotosDataSource numberOfSections](self, "numberOfSections"))
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)indexPathForLastAsset
{
  void *v3;
  int64_t v4;
  uint64_t v6;

  if (!-[PXPhotosDataSource isEmpty](self, "isEmpty"))
  {
    v4 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
    while (v4-- >= 1)
    {
      v6 = -[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v4);
      if (v6 >= 1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6 - 1, v4);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        return v3;
      }
    }
  }
  v3 = 0;
  return v3;
}

- (void)enumerateStartingAtIndexPath:(id)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL4 v6;
  id v9;
  void (**v10)(id, void *, _BYTE *);
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PXPhotosDataSource *v17;
  int64_t v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;

  v6 = a4;
  v9 = a3;
  v10 = (void (**)(id, void *, _BYTE *))a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 2317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  if (v6)
    v11 = -1;
  else
    v11 = 1;
  v12 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
  v13 = objc_msgSend(v9, "section");
  v23 = v9;
  v14 = objc_msgSend(v9, "item");
  v24 = 0;
  if ((v13 & 0x8000000000000000) == 0)
  {
    v15 = v14;
    v16 = v13;
    do
    {
      if (v16 >= v12 || v24)
        break;
      v17 = self;
      v18 = -[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v16);
      v19 = v18 - 1;
      if (!v6)
        v19 = 0;
      if (v16 != v13)
        v15 = v19;
      if ((v15 & 0x8000000000000000) == 0)
      {
        v20 = v18;
        do
        {
          if (v15 >= v20)
            break;
          if (v24)
            break;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v15, v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, v21, &v24);

          v15 += v11;
        }
        while (v15 >= 0);
      }
      v16 += v11;
      self = v17;
    }
    while (v16 >= 0);
  }

}

- (id)fetchResultsByAssetCollection
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[PXPhotosDataSource numberOfSections](self, "numberOfSections"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXPhotosDataSource collectionListFetchResult](self, "collectionListFetchResult", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", -[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:", v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)forceIncludeAssetsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PXPhotosDataSource *v10;

  v4 = a3;
  if (objc_msgSend(v4, "count") && !-[PXPhotosDataSource isImmutable](self, "isImmutable"))
  {
    -[PXPhotosDataSource _assetOidsByAssetCollectionForAssetsAtIndexPathsInSet:](self, "_assetOidsByAssetCollectionForAssetsAtIndexPathsInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__PXPhotosDataSource_forceIncludeAssetsAtIndexes___block_invoke;
    v8[3] = &unk_1E5148D08;
    v9 = v5;
    v10 = self;
    v7 = v5;
    -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v6, v8);

  }
}

- (void)forceIncludeAssetsAtIndexPaths:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(off_1E50B3180, "indexPathSetWithItemIndexPaths:dataSourceIdentifier:", v4, -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDataSource forceIncludeAssetsAtIndexes:](self, "forceIncludeAssetsAtIndexes:", v5);
}

- (void)stopForceIncludingAllAssets
{
  void *v3;
  NSMutableDictionary *resultRecordByAssetCollection;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  PXPhotosDataSource *v10;
  _QWORD v11[4];
  id v12;

  if (!-[PXPhotosDataSource isImmutable](self, "isImmutable"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    resultRecordByAssetCollection = self->_resultRecordByAssetCollection;
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke;
    v11[3] = &unk_1E513C910;
    v6 = v3;
    v12 = v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resultRecordByAssetCollection, "enumerateKeysAndObjectsUsingBlock:", v11);
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "allKeys");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke_2;
      v8[3] = &unk_1E5148D08;
      v9 = v6;
      v10 = self;
      -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v7, v8);

    }
  }
}

- (void)forceExcludeAssetsAtIndexes:(id)a3
{
  id v5;
  int64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PXPhotosDataSource *v16;
  _QWORD v17[5];
  id v18;
  int64_t v19;
  SEL v20;

  v5 = a3;
  if (objc_msgSend(v5, "count") && !-[PXPhotosDataSource isImmutable](self, "isImmutable"))
  {
    v6 = -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier");
    v7 = objc_alloc_init((Class)off_1E50B3668);
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke;
    v17[3] = &unk_1E513C938;
    v19 = v6;
    v20 = a2;
    v17[4] = self;
    v9 = v7;
    v18 = v9;
    objc_msgSend(v5, "enumerateItemIndexPathsUsingBlock:", v17);
    if (objc_msgSend(v9, "count") >= 1)
    {
      v10 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v10, "minusIndexPathSet:", v9);

      v5 = v10;
    }
    -[PXPhotosDataSource _assetOidsByAssetCollectionForAssetsAtIndexPathsInSet:](self, "_assetOidsByAssetCollectionForAssetsAtIndexPathsInSet:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_2;
    v14[3] = &unk_1E5148D08;
    v15 = v11;
    v16 = self;
    v13 = v11;
    -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v12, v14);

  }
}

- (void)forceExcludeAssetsAtIndexPaths:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(off_1E50B3180, "indexPathSetWithItemIndexPaths:dataSourceIdentifier:", v4, -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDataSource forceExcludeAssetsAtIndexes:](self, "forceExcludeAssetsAtIndexes:", v5);
}

- (void)stopExcludingAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableDictionary *resultRecordByAssetCollection;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PXPhotosDataSource *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") && !-[PXPhotosDataSource isImmutable](self, "isImmutable"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v10), "objectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    resultRecordByAssetCollection = self->_resultRecordByAssetCollection;
    v14 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __42__PXPhotosDataSource_stopExcludingAssets___block_invoke;
    v21[3] = &unk_1E513CAC0;
    v15 = v5;
    v22 = v15;
    v16 = v12;
    v23 = v16;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resultRecordByAssetCollection, "enumerateKeysAndObjectsUsingBlock:", v21);
    if (objc_msgSend(v16, "count"))
    {
      v17[0] = v14;
      v17[1] = 3221225472;
      v17[2] = __42__PXPhotosDataSource_stopExcludingAssets___block_invoke_2;
      v17[3] = &unk_1E51457C8;
      v18 = v16;
      v19 = self;
      v20 = v15;
      -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v18, v17);

    }
  }

}

- (void)clearResultsForAssetCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[PXPhotosDataSource clearResultsForAssetCollections:](self, "clearResultsForAssetCollections:", v6, v7, v8);

}

- (void)clearResultsForAssetCollections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *pendingResultsIsolationQueue;
  PHFetchResult *v13;
  PHFetchResult *collectionListFetchResult;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  PXPhotosDataSource *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPhotosDataSource fetcher](self, "fetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearFetchResultsForAssetCollections:", v4);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[PXPhotosDataSource _mutableResultRecordForAssetCollection:](self, "_mutableResultRecordForAssetCollection:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFetchResult:reverseSortOrder:", 0, 0);
        objc_msgSend(v11, "setCuratedFetchResult:", 0);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
  if (pendingResultsIsolationQueue)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __54__PXPhotosDataSource_clearResultsForAssetCollections___block_invoke;
    v18 = &unk_1E5148D08;
    v19 = self;
    v20 = v6;
    dispatch_sync(pendingResultsIsolationQueue, &v15);

  }
  v13 = (PHFetchResult *)-[PHFetchResult copyWithOptions:](self->_collectionListFetchResult, "copyWithOptions:", &unk_1E53F0ED0, v15, v16, v17, v18, v19);
  collectionListFetchResult = self->_collectionListFetchResult;
  self->_collectionListFetchResult = v13;

}

- (void)refetchResultsForAssetCollection:(id)a3
{
  id v4;
  unint64_t v5;
  PHFetchResult *v6;
  PHFetchResult *collectionListFetchResult;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:", v4);
  if (!-[PXPhotosDataSource isImmutable](self, "isImmutable") && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (PHFetchResult *)-[PHFetchResult copyWithOptions:](self->_collectionListFetchResult, "copyWithOptions:", &unk_1E53F0EF8);
    collectionListFetchResult = self->_collectionListFetchResult;
    self->_collectionListFetchResult = v6;

    -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__PXPhotosDataSource_refetchResultsForAssetCollection___block_invoke;
    v10[3] = &unk_1E5148D08;
    v10[4] = self;
    v4 = v8;
    v11 = v4;
    -[PXPhotosDataSource _performManualChangesForAssetCollections:changeBlock:](self, "_performManualChangesForAssetCollections:changeBlock:", v9, v10);

  }
}

- (BOOL)wantsCurationForFirstAssetCollection
{
  PXPhotosDataSource *v2;
  void *v3;

  v2 = self;
  -[PXPhotosDataSource firstAssetCollection](self, "firstAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[PXPhotosDataSource wantsCurationForAssetCollection:](v2, "wantsCurationForAssetCollection:", v3);

  return (char)v2;
}

- (BOOL)wantsCurationForAssetCollection:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = -[PXPhotosDataSource wantsCurationByDefault](self, "wantsCurationByDefault");
  if (v4)
  {
    -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "wantsCuration");

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (BOOL)isCuratedAssetsEmptyForAssetCollection:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!a3)
    return 1;
  -[PXPhotosDataSource curatedAssetsForAssetCollection:](self, "curatedAssetsForAssetCollection:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "count") == 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isCuratedAssetsFutilelyForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  if (-[PXPhotosDataSource wantsCurationForAssetCollection:](self, "wantsCurationForAssetCollection:", v4))
  {
    -[PXPhotosDataSource curatedAssetsForAssetCollection:](self, "curatedAssetsForAssetCollection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSource uncuratedAssetsForAssetCollection:](self, "uncuratedAssetsForAssetCollection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = v7 <= objc_msgSend(v5, "count");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)curatedAssetsForAssetCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[PXPhotosDataSource _assetsForAssetCollection:](self, "_assetsForAssetCollection:", v4);
  -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "curatedFetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)uncuratedAssetsForAssetCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[PXPhotosDataSource _assetsForAssetCollection:](self, "_assetsForAssetCollection:", v4);
  -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)curatedAssetsInSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXPhotosDataSource curatedAssetsForAssetCollection:](self, "curatedAssetsForAssetCollection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)uncuratedAssetsInSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXPhotosDataSource uncuratedAssetsForAssetCollection:](self, "uncuratedAssetsForAssetCollection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)containsMultipleAssets
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (-[PXPhotosDataSource isEmpty](self, "isEmpty"))
    return 0;
  v4 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
  v5 = -[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", 0);
  if (v4 >= 2)
    v5 += -[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v4 - 1);
  if (v5 > 1)
    return 1;
  v6 = -[PXPhotosDataSource backgroundFetchOriginSection](self, "backgroundFetchOriginSection");
  if (v6 >= v4 - 1)
    v7 = v4 - 1;
  else
    v7 = v6;
  v8 = v7 & ~(v7 >> 63);
  if (v8 >= v4)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v10 = v7 & ~(v7 >> 63);
    do
      v9 += -[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v10++);
    while (v10 < v4 && v9 < 2);
  }
  if (v7 >= 1)
  {
    v11 = v8 + 1;
    do
    {
      if (v8 > v4)
        break;
      if (v9 >= 2)
        break;
      v9 += -[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v11 - 2);
      --v11;
    }
    while (v11 > 1);
  }
  return v9 > 1;
}

- (id)assetsStartingAtIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  PHPhotoLibrary *photoLibrary;
  void *v22;
  void *v24;

  v4 = a3;
  v5 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
  v6 = objc_msgSend(v4, "section");
  v24 = v4;
  v7 = objc_msgSend(v4, "item");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 - v6;
  if (v5 <= v6)
  {
LABEL_12:
    v20 = objc_alloc(MEMORY[0x1E0CD1620]);
    photoLibrary = self->_photoLibrary;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v20, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v8, photoLibrary, v22, 0, 0, 1);

    goto LABEL_13;
  }
  v10 = 0;
  while (1)
  {
    -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", v6 + v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      break;
LABEL_9:

    if (v9 == ++v10)
      goto LABEL_12;
  }
  objc_msgSend(v11, "fetchedObjectIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v14 = v13;
    v15 = v14;
    v16 = v14;
    if (!v10)
    {
      v16 = v14;
      if (v7 >= 1)
      {
        v17 = objc_msgSend(v14, "count");
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v7, v17 - v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectsAtIndexes:", v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v8, "addObjectsFromArray:", v16);

    goto LABEL_9;
  }
  objc_msgSend(v8, "removeAllObjects");
  -[PXPhotosDataSource _fetchAssetsStartingAtIndexPath:](self, "_fetchAssetsStartingAtIndexPath:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_12;
LABEL_13:

  return v19;
}

- (id)_fetchAssetsStartingAtIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  PHPhotoLibrary *photoLibrary;
  void *v20;
  void *v21;
  void *v23;

  v4 = a3;
  v5 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
  v6 = objc_msgSend(v4, "section");
  v23 = v4;
  v7 = objc_msgSend(v4, "item");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 - v6;
  if (v5 > v6)
  {
    v10 = 0;
    do
    {
      -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", v6 + v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "count");
        if (v10 == 0 && v7 > 0)
          v15 = v7;
        else
          v15 = 0;
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v15, v14 - v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectsAtIndexes:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObjectsFromArray:", v17);

        objc_msgSend(v8, "addObjectsFromArray:", v13);
      }

      ++v10;
    }
    while (v9 != v10);
  }
  if (objc_msgSend(v8, "count"))
  {
    v18 = objc_alloc(MEMORY[0x1E0CD1620]);
    photoLibrary = self->_photoLibrary;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v8, photoLibrary, v20, 0, 0, 1);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)fetchResultWithAssetsInSections:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  PHPhotoLibrary *photoLibrary;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  PXPhotosDataSource *v17;
  id v18;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __54__PXPhotosDataSource_fetchResultWithAssetsInSections___block_invoke;
  v16 = &unk_1E51460E8;
  v17 = self;
  v18 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", &v13);

  v8 = objc_alloc(MEMORY[0x1E0CD1620]);
  photoLibrary = self->_photoLibrary;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchType", v13, v14, v15, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v7, photoLibrary, v10, 0, 0, 1);

  return v11;
}

- (id)fetchResultWithAssetsAtIndexPaths:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  id v9;
  id v10;
  PHPhotoLibrary *photoLibrary;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, void *);
  void *v18;
  PXPhotosDataSource *v19;
  id v20;
  int64_t v21;
  SEL v22;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier");
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __56__PXPhotosDataSource_fetchResultWithAssetsAtIndexPaths___block_invoke;
  v18 = &unk_1E513CB10;
  v21 = v8;
  v22 = a2;
  v19 = self;
  v20 = v7;
  v9 = v7;
  objc_msgSend(v6, "enumerateItemIndexSetsUsingBlock:", &v15);

  v10 = objc_alloc(MEMORY[0x1E0CD1620]);
  photoLibrary = self->_photoLibrary;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchType", v15, v16, v17, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v9, photoLibrary, v12, 0, 0, 1);

  return v13;
}

- (id)assetsAtIndexPaths:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  SEL v16;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__PXPhotosDataSource_assetsAtIndexPaths___block_invoke;
  v13[3] = &unk_1E513CB10;
  v15 = v8;
  v16 = a2;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v6, "enumerateItemIndexSetsUsingBlock:", v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

- (id)container
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (!self->_assetContainerProvider
    || (-[PXPhotosDataSource containerAssetCollection](self, "containerAssetCollection"),
        (v3 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v4 = (void *)v3,
        (*((void (**)(void))self->_assetContainerProvider + 2))(),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    -[PXPhotosDataSource containerCollection](self, "containerCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (PHAssetCollection)containerAssetCollection
{
  PHCollection *v3;
  PHCollection *v4;
  PHCollection *v5;

  v3 = self->_containerCollection;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    if (-[PXPhotosDataSource numberOfSections](self, "numberOfSections") != 1)
    {
      v5 = 0;
      goto LABEL_7;
    }
    -[PXPhotosDataSource firstAssetCollection](self, "firstAssetCollection");
    v4 = (PHCollection *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return (PHAssetCollection *)v5;
}

- (BOOL)supportsDynamicBackgroundFetching
{
  return (self->_options & 0x1400) == 4096;
}

- (BOOL)supportsCurationToggling
{
  return (self->_options & 0x20050) == 16;
}

- (void)_startFilterPredicateChangedSignpostForCollection:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PXPhotosDataSource signpostIntervalId](self, "signpostIntervalId"))
  {
    -[PXPhotosDataSource dataSourceLog](self, "dataSourceLog");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, v4);
    v7 = v5;
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      objc_msgSend(v4, "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Begin Set Filter Predicate", "%{public}@", (uint8_t *)&v10, 0xCu);

    }
    -[PXPhotosDataSource setSignpostIntervalId:](self, "setSignpostIntervalId:", v6);

  }
}

- (void)_endFilterPredicateChangedForCollection:(id)a3
{
  id v4;
  unint64_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PXPhotosDataSource signpostIntervalId](self, "signpostIntervalId");
  if (v5)
  {
    v6 = v5;
    -[PXPhotosDataSource dataSourceLog](self, "dataSourceLog");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 != -1 && os_signpost_enabled(v7))
    {
      objc_msgSend(v4, "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v6, "End Set Filter Predicate", "%{public}@", (uint8_t *)&v10, 0xCu);

    }
    -[PXPhotosDataSource setSignpostIntervalId:](self, "setSignpostIntervalId:", 0);
  }

}

- (void)setFilterPredicate:(id)a3
{
  -[PXPhotosDataSource setFilterPredicate:provideIncrementalChangeDetailsForAssetCollections:](self, "setFilterPredicate:provideIncrementalChangeDetailsForAssetCollections:", a3, 0);
}

- (void)setFilterPredicate:(id)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  NSPredicate *v6;
  id v7;
  NSPredicate *v8;
  NSPredicate *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *(*v17)(uint64_t);
  void *v18;
  PXPhotosDataSource *v19;
  id v20;
  NSPredicate *v21;
  id v22;

  v6 = (NSPredicate *)a3;
  v7 = a4;
  v8 = self->_filterPredicate;
  if (v8 == v6)
  {

  }
  else
  {
    v9 = v8;
    v10 = -[NSPredicate isEqual:](v8, "isEqual:", v6);

    if ((v10 & 1) == 0)
    {
      -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "assetCollections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosDataSource _startFilterPredicateChangedSignpostForCollection:](self, "_startFilterPredicateChangedSignpostForCollection:", v13);
      }
      else
      {
        v13 = 0;
      }
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __92__PXPhotosDataSource_setFilterPredicate_provideIncrementalChangeDetailsForAssetCollections___block_invoke;
      v18 = &unk_1E513DD48;
      v19 = self;
      v20 = v12;
      v21 = v6;
      v22 = v7;
      v14 = v12;
      -[PXPhotosDataSource _performManualChangesForAssetCollections:collectionsToDiff:changeBlock:](self, "_performManualChangesForAssetCollections:collectionsToDiff:changeBlock:", v14, v22, &v15);
      if (v13)
        -[PXPhotosDataSource _endFilterPredicateChangedForCollection:](self, "_endFilterPredicateChangedForCollection:", v13, v15, v16, v17, v18, v19, v20, v21, v22);

    }
  }

}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  -[PXPhotosDataSource setIncludeOthersInSocialGroupAssets:provideIncrementalChangeDetailsForAssetCollections:](self, "setIncludeOthersInSocialGroupAssets:provideIncrementalChangeDetailsForAssetCollections:", a3, 0);
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;

  v4 = a3;
  v6 = a4;
  if (self->_includeOthersInSocialGroupAssets != v4)
  {
    -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetCollections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __109__PXPhotosDataSource_setIncludeOthersInSocialGroupAssets_provideIncrementalChangeDetailsForAssetCollections___block_invoke;
    v10[3] = &unk_1E513CB38;
    v10[4] = self;
    v11 = v8;
    v13 = v4;
    v12 = v6;
    v9 = v8;
    -[PXPhotosDataSource _performManualChangesForAssetCollections:collectionsToDiff:changeBlock:](self, "_performManualChangesForAssetCollections:collectionsToDiff:changeBlock:", v9, v12, v10);

  }
}

- (void)_startLibraryFilterChangedSignpostForCollection:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PXPhotosDataSource signpostIntervalId](self, "signpostIntervalId"))
  {
    -[PXPhotosDataSource dataSourceLog](self, "dataSourceLog");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, v4);
    v7 = v5;
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      objc_msgSend(v4, "localizedTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Begin Set Library Filter", "%{public}@", (uint8_t *)&v10, 0xCu);

    }
    -[PXPhotosDataSource setSignpostIntervalId:](self, "setSignpostIntervalId:", v6);

  }
}

- (void)_endLibraryFilterChangedSignpostForCollection:(id)a3
{
  id v4;
  unint64_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PXPhotosDataSource signpostIntervalId](self, "signpostIntervalId");
  if (v5)
  {
    v6 = v5;
    -[PXPhotosDataSource dataSourceLog](self, "dataSourceLog");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 != -1 && os_signpost_enabled(v7))
    {
      objc_msgSend(v4, "localizedTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v6, "End Set Library Filter", "%{public}@", (uint8_t *)&v10, 0xCu);

    }
    -[PXPhotosDataSource setSignpostIntervalId:](self, "setSignpostIntervalId:", 0);
  }

}

- (void)setLibraryFilter:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  -[PXPhotosDataSource libraryFilterState](self, "libraryFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1A6789000, v6, OS_LOG_TYPE_FAULT, "Invalid to change libraryFilter directly on a dataSource configured with a libraryFilterState.", v8, 2u);
    }

  }
  -[PXPhotosDataSource libraryFilterState](self, "libraryFilterState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[PXPhotosDataSource _internalSetLibraryFilter:](self, "_internalSetLibraryFilter:", a3);
}

- (void)_internalSetLibraryFilter:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  if (self->_libraryFilter != a3)
  {
    -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDataSource _startLibraryFilterChangedSignpostForCollection:](self, "_startLibraryFilterChangedSignpostForCollection:", v7);
    }
    else
    {
      v7 = 0;
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__PXPhotosDataSource__internalSetLibraryFilter___block_invoke;
    v8[3] = &unk_1E5144EB8;
    v8[4] = self;
    v8[5] = a3;
    -[PXPhotosDataSource _performManualReloadWithChangeBlock:](self, "_performManualReloadWithChangeBlock:", v8);
    if (v7)
      -[PXPhotosDataSource _endLibraryFilterChangedSignpostForCollection:](self, "_endLibraryFilterChangedSignpostForCollection:", v7);

  }
}

- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_canIncludeUnsavedSyndicatedAssets != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __59__PXPhotosDataSource_setCanIncludeUnsavedSyndicatedAssets___block_invoke;
    v3[3] = &unk_1E5144398;
    v3[4] = self;
    v4 = a3;
    -[PXPhotosDataSource _performManualReloadWithChangeBlock:](self, "_performManualReloadWithChangeBlock:", v3);
  }
}

- (void)setIncludeAllBurstAssets:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_includeAllBurstAssets != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __47__PXPhotosDataSource_setIncludeAllBurstAssets___block_invoke;
    v3[3] = &unk_1E5144398;
    v3[4] = self;
    v4 = a3;
    -[PXPhotosDataSource _performManualReloadWithChangeBlock:](self, "_performManualReloadWithChangeBlock:", v3);
  }
}

- (void)setDisableFilters:(BOOL)a3 forAssetCollection:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  id v13;
  _QWORD v14[2];

  v4 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[PXPhotosDataSource _areFiltersDisabledForAssetCollection:](self, "_areFiltersDisabledForAssetCollection:", v6) != v4)
  {
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__PXPhotosDataSource_setDisableFilters_forAssetCollection___block_invoke;
    v10[3] = &unk_1E51473C0;
    v10[4] = self;
    v11 = v6;
    v12 = v4;
    -[PXPhotosDataSource _performManualChangesForAssetCollections:collectionsToDiff:collectionsToChange:changeBlock:](self, "_performManualChangesForAssetCollections:collectionsToDiff:collectionsToChange:changeBlock:", v9, 0, v8, v10);

  }
}

- (BOOL)forceAccurateAllSectionsIfNeeded
{
  _BOOL4 v3;
  int64_t v4;
  void *v5;
  BOOL v6;

  if (!-[PXPhotosDataSource _allSectionsConsideredAccurate](self, "_allSectionsConsideredAccurate")
    || (v3 = -[PXPhotosDataSource _areSecondaryFetchesEnabled](self, "_areSecondaryFetchesEnabled")))
  {
    if (!-[PXPhotosDataSource _areSecondaryFetchesEnabled](self, "_areSecondaryFetchesEnabled"))
      -[PXPhotosDataSource _cancelBackgroundFetchIfNeeded](self, "_cancelBackgroundFetchIfNeeded");
    v4 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXPhotosDataSource forceAccurateSectionsIfNeeded:](self, "forceAccurateSectionsIfNeeded:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)_forceAccurateSection:(int64_t)a3 andNumberOfSurroundingSectionsWithContent:(int64_t)a4
{
  int64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(void *, uint64_t, _QWORD);
  id v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, void *);
  void *v29;
  id v30;
  PXPhotosDataSource *v31;
  id v32;
  uint64_t *v33;
  int64_t v34;
  int64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  PXPhotosDataSource *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (-[PXPhotosDataSource _allSectionsConsideredAccurate](self, "_allSectionsConsideredAccurate")
    && !-[PXPhotosDataSource _areSecondaryFetchesEnabled](self, "_areSecondaryFetchesEnabled"))
  {
    return 0;
  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v7 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
  -[PXPhotosDataSource filterPredicate](self, "filterPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __86__PXPhotosDataSource__forceAccurateSection_andNumberOfSurroundingSectionsWithContent___block_invoke;
  v29 = &unk_1E513CB60;
  v11 = v10;
  v35 = a3;
  v36 = 0;
  v37 = v7;
  v30 = v11;
  v31 = self;
  v33 = &v38;
  v34 = a4;
  v12 = v9;
  v32 = v12;
  v13 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&v26);
  v13[2](v13, 50, 0);
  if (objc_msgSend(v11, "count", v26, v27, v28, v29) < (unint64_t)a4 && objc_msgSend(v12, "count") != v7)
  {
    v14 = v8;
    if (_predicateByStrippingNoIndex_onceToken != -1)
      dispatch_once(&_predicateByStrippingNoIndex_onceToken, &__block_literal_global_899);
    objc_msgSend(v14, "predicateFormat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "containsString:", CFSTR("noindex:")))
    {
      objc_msgSend((id)_predicateByStrippingNoIndex_regexp, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v15, "length"), CFSTR("$1"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = v14;
    }

    if (v17
      && (objc_msgSend(MEMORY[0x1E0CD14D8], "fetchFilteredAssetCollections:containingAssetsMatchingPredicate:", self->_collectionListFetchResult, v17), v19 = (void *)objc_claimAutoreleasedReturnValue(), (v20 = v19) != 0))
    {
      if (objc_msgSend(v19, "count"))
      {
        objc_msgSend(v20, "fetchedObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosDataSource sectionsForAssetCollections:](self, "sectionsForAssetCollections:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(void *, uint64_t, void *))v13)[2](v13, 0x7FFFFFFFFFFFFFFFLL, v22);
      }
    }
    else
    {
      PLUIGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[PXPhotosDataSource firstAssetCollection](self, "firstAssetCollection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v43 = self;
        v44 = 2112;
        v45 = v24;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEFAULT, "%@ forcing everything to find non-empty sections, this is slow, firstAssetCollection:%@", buf, 0x16u);

      }
      v13[2](v13, 0x7FFFFFFFFFFFFFFFLL, 0);
      v20 = 0;
    }

  }
  v18 = *((_BYTE *)v39 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  return v18;
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3
{
  return -[PXPhotosDataSource forceAccurateSectionsIfNeeded:reloadChanges:](self, "forceAccurateSectionsIfNeeded:reloadChanges:", a3, 1);
}

- (BOOL)forceAccurateIndexPath:(id)a3 andAssetsBeforeAndAfter:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  int64_t v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  void *v24;

  v6 = a3;
  if (-[PXPhotosDataSource _allSectionsConsideredAccurate](self, "_allSectionsConsideredAccurate")
    && !-[PXPhotosDataSource _areSecondaryFetchesEnabled](self, "_areSecondaryFetchesEnabled"))
  {
    v22 = 0;
  }
  else
  {
    v7 = objc_msgSend(v6, "section");
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v24, "estimatedAssetCount");
    v10 = objc_msgSend(v6, "item");
    v11 = (v9 + ~v10) & ~((v9 + ~v10) >> 63);
    v12 = -[PXPhotosDataSource numberOfSections](self, "numberOfSections");
    if (v11 < a4 && v7 + 1 < v12)
    {
      v14 = v12;
      v15 = v7 + 2;
      do
      {
        -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", v15 - 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 += objc_msgSend(v16, "estimatedAssetCount");
        objc_msgSend(v8, "addIndex:", v15 - 1);

      }
      while (v11 < a4 && v15++ < v14);
    }
    v18 = objc_msgSend(v6, "item");
    if (v7 >= 1)
    {
      v19 = v18 & ~(v18 >> 63);
      while (v19 < a4)
      {
        -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", v7 - 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "estimatedAssetCount");
        objc_msgSend(v8, "addIndex:", v7 - 1);

        if ((unint64_t)v7 < 2)
          break;
        v19 += v21;
        --v7;
      }
    }
    v22 = -[PXPhotosDataSource forceAccurateSectionsIfNeeded:](self, "forceAccurateSectionsIfNeeded:", v8);

  }
  return v22;
}

- (void)prefetchApproximateAssetsAtIndexPaths:(id)a3
{
  -[PXPhotosDataSource prefetchApproximateAssetsAtIndexPaths:reverseOrder:](self, "prefetchApproximateAssetsAtIndexPaths:reverseOrder:", a3, 0);
}

- (void)prefetchApproximateAssetsAtIndexPaths:(id)a3 reverseOrder:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *prefetchQueue;
  _BOOL4 v27;
  PXPhotosDataSource *v28;
  void *v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  PXPhotosDataSource *v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v27 = v4;
    v28 = self;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v29 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "section"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v16, "addIndex:", objc_msgSend(v14, "item"));
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", objc_msgSend(v14, "item"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "section"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v17);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke;
    v36[3] = &unk_1E513CBD8;
    v36[4] = v28;
    v22 = v18;
    v37 = v22;
    v23 = v19;
    v38 = v23;
    v24 = v20;
    v39 = v24;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v36);
    if (objc_msgSend(v22, "count"))
    {
      if (v27)
        v25 = 2;
      else
        v25 = 0;
      prefetchQueue = v28->_prefetchQueue;
      block[0] = v21;
      block[1] = 3221225472;
      block[2] = __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_2;
      block[3] = &unk_1E5141C90;
      v31 = v24;
      v35 = v25;
      v32 = v23;
      v33 = v22;
      v34 = v28;
      dispatch_async(prefetchQueue, block);

    }
    v7 = v29;
  }

}

- (void)prefetchAssetsAtIndexPaths:(id)a3 onlyThumbnailAssets:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v4 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a3;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PXPhotosDataSource_prefetchAssetsAtIndexPaths_onlyThumbnailAssets___block_invoke;
  v11[3] = &unk_1E513CC00;
  v12 = v9;
  v13 = a2;
  v11[4] = self;
  v10 = v9;
  objc_msgSend(v8, "enumerateItemIndexSetsUsingBlock:", v11);

  -[PXPhotosDataSource _prefetchIndexesByFetchResult:onlyThumbnails:](self, "_prefetchIndexesByFetchResult:onlyThumbnails:", v10, v4);
}

- (void)_cancelBackgroundFetchIfNeeded
{
  NSObject *backgroundQueue;
  _QWORD block[5];

  if (self->_isBackgroundFetching || self->_needToStartBackgroundFetch)
  {
    -[PXPhotosDataSource setIsBackgroundFetching:](self, "setIsBackgroundFetching:", 0);
    self->_needToStartBackgroundFetch = 0;
    backgroundQueue = self->_backgroundQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PXPhotosDataSource__cancelBackgroundFetchIfNeeded__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(backgroundQueue, block);
    -[PXPhotosDataSource _interruptBackgroundFetch](self, "_interruptBackgroundFetch");
  }
}

- (void)_prepareDiffsForPendingResultsWithCompletion:(id)a3
{
  id v4;
  NSObject *pendingResultsIsolationQueue;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *backgroundQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  PXPhotosDataSource *v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  PXPhotosDataSource *v23;
  _QWORD block[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__243379;
  v29 = __Block_byref_object_dispose__243380;
  v30 = 0;
  pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v25;
  dispatch_sync(pendingResultsIsolationQueue, block);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = (void *)v26[5];
  v21[0] = v6;
  v21[1] = 3221225472;
  v21[2] = __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_2;
  v21[3] = &unk_1E513CCC8;
  v9 = v7;
  v22 = v9;
  v23 = self;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v21);
  -[PXPhotosDataSource clientQueue](self, "clientQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundQueue = self->_backgroundQueue;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_3;
  v15[3] = &unk_1E513CD18;
  v19 = v4;
  v20 = &v25;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v12 = v4;
  v13 = v10;
  v14 = v9;
  dispatch_async(backgroundQueue, v15);

  _Block_object_dispose(&v25, 8);
}

- (void)_restartBackgroundFetchWithAssetCollectionsToDiff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *backgroundQueue;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  PXPhotosDataSource *v22;
  id v23;

  v4 = a3;
  -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetCollections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXPhotosDataSource supportsDynamicBackgroundFetching](self, "supportsDynamicBackgroundFetching");
  if (self->_needToStartBackgroundFetch)
  {
    -[NSMutableOrderedSet addObjectsFromArray:](self->_queuedAssetCollectionsToFetch, "addObjectsFromArray:", v6);
  }
  else if (v7)
  {
    self->_needToStartBackgroundFetch = 1;
    self->_isBackgroundFetching = 1;
    -[PXPhotosDataSource startBackgroundFetchIfNeeded](self, "startBackgroundFetchIfNeeded");
    backgroundQueue = self->_backgroundQueue;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __72__PXPhotosDataSource__restartBackgroundFetchWithAssetCollectionsToDiff___block_invoke;
    v21 = &unk_1E5148D08;
    v22 = self;
    v9 = v6;
    v23 = v9;
    dispatch_async(backgroundQueue, &v18);
    -[NSMutableSet addObjectsFromArray:](self->__inaccurateAssetCollections, "addObjectsFromArray:", v9, v18, v19, v20, v21, v22);
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDataSource forceAccurateAssetCollectionsIfNeeded:reloadChanges:](self, "forceAccurateAssetCollectionsIfNeeded:reloadChanges:", v10, 0);

    }
    objc_msgSend(v4, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSource sectionsForAssetCollections:](self, "sectionsForAssetCollections:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "px_coveringRange");
    if (!v14 || v13 == 0x7FFFFFFFFFFFFFFFLL || (v15 = v13 + (v14 >> 1), v15 == 0x7FFFFFFFFFFFFFFFLL))
      v15 = -[PXPhotosDataSource backgroundFetchOriginSection](self, "backgroundFetchOriginSection");
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      v16 = 0;
    else
      v16 = v15;
    -[PXPhotosDataSource _forceAccurateSection:andNumberOfSurroundingSectionsWithContent:](self, "_forceAccurateSection:andNumberOfSurroundingSectionsWithContent:", v16, 10);

  }
  else
  {
    -[PXPhotosDataSource _cancelBackgroundFetchIfNeeded](self, "_cancelBackgroundFetchIfNeeded");
    -[PXPhotosDataSource _inaccurateAssetCollections](self, "_inaccurateAssetCollections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAllObjects");

    -[NSMutableDictionary removeAllObjects](self->_resultRecordByAssetCollection, "removeAllObjects");
  }

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *pendingResultsIsolationQueue;
  NSObject *v7;
  uint64_t v8;
  PXPhotosDataSourceSectionCache *v9;
  PXPhotosDataSourceSectionCache *preparedSectionCache;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSDictionary *v15;
  NSDictionary *preparedResultRecordChangeDetailsByAssetCollection;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  unint64_t v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  NSDictionary *preparedIndexPathByAssetReferenceCache;
  NSObject *v37;
  id v38;
  uint64_t v39;
  PHObjectChangeDetails *preparedContainerChangeDetails;
  void *v42;
  objc_class *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  id v48;
  void *v49;
  PXPhotosDataSource *v50;
  void *v51;
  void *v52;
  id obj;
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  PXPhotosDataSource *v71;
  id v72;
  _QWORD v73[8];
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _QWORD block[5];
  id v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
  if (pendingResultsIsolationQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke;
    block[3] = &unk_1E5148D08;
    block[4] = self;
    v93 = v4;
    dispatch_sync(pendingResultsIsolationQueue, block);

  }
  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__243379;
  v90 = __Block_byref_object_dispose__243380;
  v91 = 0;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__243379;
  v84 = __Block_byref_object_dispose__243380;
  v85 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__243379;
  v78 = __Block_byref_object_dispose__243380;
  v79 = 0;
  -[PXPhotosDataSource clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_4;
  v73[3] = &unk_1E513CD68;
  v73[4] = self;
  v73[5] = &v80;
  v50 = self;
  v73[6] = &v86;
  v73[7] = &v74;
  dispatch_sync(v7, v73);

  objc_msgSend(v5, "changeDetailsForFetchResult:", v87[5]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend(v49, "fetchResultAfterChanges");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[PXPhotosDataSourceSectionCache initWithCollectionListFetchResult:]([PXPhotosDataSourceSectionCache alloc], "initWithCollectionListFetchResult:", v8);
    preparedSectionCache = self->__preparedSectionCache;
    self->__preparedSectionCache = v9;

    v11 = (void *)v87[5];
    v87[5] = v8;

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)v81[5];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_5;
  v69[3] = &unk_1E513CD90;
  v48 = v5;
  v70 = v48;
  v71 = self;
  v14 = v12;
  v72 = v14;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v69);
  v15 = (NSDictionary *)objc_msgSend(v14, "copy");
  v52 = v14;
  preparedResultRecordChangeDetailsByAssetCollection = self->_preparedResultRecordChangeDetailsByAssetCollection;
  self->_preparedResultRecordChangeDetailsByAssetCollection = v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)v75[5], "count"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)v75[5];
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v94, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v66 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v20, "assetCollection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v20, "asset");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            continue;
          objc_msgSend(v20, "assetCollection");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v20, "simpleIndexPath");
            v24 = *((_QWORD *)&v63 + 1);
          }
          else
          {
            v24 = 0;
            v63 = 0u;
            v64 = 0u;
          }
          if (v24 >= objc_msgSend((id)v87[5], "count")
            || (objc_msgSend((id)v87[5], "objectAtIndexedSubscript:", v24),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                v26 = objc_msgSend(v25, "isEqual:", v21),
                v25,
                (v26 & 1) == 0))
          {
            v24 = objc_msgSend((id)v87[5], "indexOfObject:", v21);
          }
          if (v24 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v52, "objectForKeyedSubscript:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "resultRecordAfterChanges");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "exposedFetchResult");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend(v20, "asset");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                objc_msgSend(v20, "simpleIndexPath");
                v31 = v62;
              }
              else
              {
                v31 = 0;
                v61 = 0u;
                v62 = 0u;
              }
              if (v31 < objc_msgSend(v29, "count")
                && (v32 = objc_msgSend(v29, "indexOfObject:inRange:", v30, v31, 1), v32 != 0x7FFFFFFFFFFFFFFFLL)
                || (v32 = objc_msgSend(v29, "indexOfObject:", v30), v32 != 0x7FFFFFFFFFFFFFFFLL))
              {
                v33 = (id)objc_msgSend(v29, "objectAtIndex:", v32);
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v32, v24);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setObject:forKeyedSubscript:", v34, v20);

              }
            }

          }
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v94, 16);
    }
    while (v17);
  }

  v35 = objc_msgSend(v51, "copy");
  preparedIndexPathByAssetReferenceCache = v50->_preparedIndexPathByAssetReferenceCache;
  v50->_preparedIndexPathByAssetReferenceCache = (NSDictionary *)v35;

  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__243379;
  v59 = __Block_byref_object_dispose__243380;
  v60 = 0;
  -[PXPhotosDataSource clientQueue](v50, "clientQueue");
  v37 = objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_6;
  v54[3] = &unk_1E5148AA8;
  v54[4] = v50;
  v54[5] = &v55;
  dispatch_sync(v37, v54);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = 0;
    goto LABEL_37;
  }
  v38 = (id)v56[5];
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v50, CFSTR("PXPhotosDataSource.m"), 3859, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("container"), v44);
LABEL_40:

    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "px_descriptionForAssertionMessage");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v50, CFSTR("PXPhotosDataSource.m"), 3859, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("container"), v44, v46);

    goto LABEL_40;
  }
LABEL_35:
  objc_msgSend(v48, "changeDetailsForObject:", v38);
  v39 = objc_claimAutoreleasedReturnValue();

LABEL_37:
  preparedContainerChangeDetails = v50->_preparedContainerChangeDetails;
  v50->_preparedContainerChangeDetails = (PHObjectChangeDetails *)v39;

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);

  return 0;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v5;
  PHFetchResult *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableDictionary *resultRecordByAssetCollection;
  id v13;
  id v14;
  id v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id assetContainerProvider;
  PHCollection *containerCollection;
  PHCollection *v27;
  void *v28;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  NSMutableDictionary *infoForAssetCollection;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PHFetchResult *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  PHFetchResult *v42;
  PHFetchResult *collectionListFetchResult;
  void *v44;
  void *v45;
  void (**v46)(_QWORD);
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  int64_t v52;
  void *v53;
  void *v54;
  PXPhotosDataSourceChange *v55;
  NSDictionary *preparedIndexPathByAssetReferenceCache;
  NSDictionary *preparedResultRecordChangeDetailsByAssetCollection;
  PXPhotosDataSourceSectionCache *preparedSectionCache;
  PHObjectChangeDetails *preparedContainerChangeDetails;
  objc_class *v60;
  void *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  id v65;
  int64_t v66;
  int v67;
  void *v68;
  PHObjectChangeDetails *v69;
  _QWORD v70[5];
  id v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[6];
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  _QWORD aBlock[4];
  PHCollection *v84;
  _QWORD v85[5];
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v6 = self->_collectionListFetchResult;
  v7 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v89 != v8)
          objc_enumerationMutation(v6);
        -[PXPhotosDataSource _bringFetchResultsUpToDateWithFetcherCacheForAssetCollection:](self, "_bringFetchResultsUpToDateWithFetcherCacheForAssetCollection:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i));
      }
      v7 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
    }
    while (v7);
  }

  objc_storeStrong((id *)&self->_hintIndexPathByAssetReferenceCache, self->_preparedIndexPathByAssetReferenceCache);
  objc_msgSend(v5, "changeDetailsForFetchResult:", self->_collectionListFetchResult);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_resultRecordByAssetCollection, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  resultRecordByAssetCollection = self->_resultRecordByAssetCollection;
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke;
  v85[3] = &unk_1E513CD90;
  v85[4] = self;
  v86 = v5;
  v13 = v11;
  v14 = v86;
  v15 = v13;
  v87 = v13;
  v16 = resultRecordByAssetCollection;
  v17 = v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v16, "enumerateKeysAndObjectsUsingBlock:", v85);
  v69 = self->_preparedContainerChangeDetails;
  if (!v69)
    goto LABEL_11;
  -[PXPhotosDataSource container](self, "container");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObjectChangeDetails objectBeforeChanges](v69, "objectBeforeChanges");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == v18;

  if (v20)
  {

LABEL_13:
    -[PHObjectChangeDetails objectAfterChanges](self->_preparedContainerChangeDetails, "objectAfterChanges");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (self->_assetContainerProvider)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_2;
      aBlock[3] = &unk_1E513EF80;
      v84 = v22;
      v24 = _Block_copy(aBlock);
      assetContainerProvider = self->_assetContainerProvider;
      self->_assetContainerProvider = v24;

      containerCollection = v84;
LABEL_15:

      v67 = 1;
LABEL_22:

      goto LABEL_23;
    }
    if (!self->_containerCollection || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v67 = 0;
      goto LABEL_22;
    }
    v27 = v23;
    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_20:
        containerCollection = self->_containerCollection;
        self->_containerCollection = v27;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (objc_class *)objc_opt_class();
      NSStringFromClass(v62);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHCollection px_descriptionForAssertionMessage](v27, "px_descriptionForAssertionMessage");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 3977, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("containerAfterChange"), v61, v63);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 3977, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("containerAfterChange"), v61);
    }

    goto LABEL_20;
  }
  objc_msgSend(v14, "changeDetailsForObject:", v18);
  v21 = objc_claimAutoreleasedReturnValue();

  v69 = (PHObjectChangeDetails *)v21;
  if (v21)
    goto LABEL_13;
LABEL_11:
  v69 = 0;
  v67 = 0;
LABEL_23:
  if (!v10 && ((objc_msgSend(v17, "count") == 0) & ~v67) != 0)
  {
    v10 = 0;
    goto LABEL_47;
  }
  v66 = -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier");
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_3;
  v78[3] = &unk_1E5148AA8;
  v78[4] = self;
  v78[5] = &v79;
  v28 = _Block_copy(v78);
  v29 = v28;
  if (v10)
  {
    (*((void (**)(void *))v28 + 2))(v28);
    if (objc_msgSend(v10, "hasIncrementalChanges"))
    {
      v30 = self->_resultRecordByAssetCollection;
      objc_msgSend(v10, "removedObjects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectsForKeys:](v30, "removeObjectsForKeys:", v31);

      infoForAssetCollection = self->_infoForAssetCollection;
      objc_msgSend(v10, "removedObjects");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectsForKeys:](infoForAssetCollection, "removeObjectsForKeys:", v33);
    }
    else
    {
      if (!self->_collectionListFetchResult)
      {
LABEL_40:
        objc_msgSend(v10, "fetchResultAfterChanges");
        v42 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
        collectionListFetchResult = self->_collectionListFetchResult;
        self->_collectionListFetchResult = v42;

        objc_storeStrong((id *)&self->__sectionCache, self->__preparedSectionCache);
        goto LABEL_41;
      }
      objc_msgSend(v10, "fetchResultAfterChanges");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v33, "fetchedObjects");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setWithArray:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = v17;
      v65 = v14;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v37 = self->_collectionListFetchResult;
      v38 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v75;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v75 != v39)
              objc_enumerationMutation(v37);
            v41 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
            if ((objc_msgSend(v36, "containsObject:", v41) & 1) == 0)
            {
              -[NSMutableDictionary removeObjectForKey:](self->_resultRecordByAssetCollection, "removeObjectForKey:", v41);
              -[NSMutableDictionary removeObjectForKey:](self->_infoForAssetCollection, "removeObjectForKey:", v41);
            }
          }
          v38 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
        }
        while (v38);
      }

      v17 = v64;
      v14 = v65;

    }
    goto LABEL_40;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_4;
  v70[3] = &unk_1E513CDB8;
  v70[4] = self;
  v46 = v29;
  v73 = v46;
  v47 = v45;
  v71 = v47;
  v48 = v44;
  v72 = v48;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v70);
  if (v67)
  {
    v46[2](v46);
    if (!v10)
    {
      v49 = objc_alloc(MEMORY[0x1E0CD1588]);
      -[PXPhotosDataSource collectionListFetchResult](self, "collectionListFetchResult");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDataSource collectionListFetchResult](self, "collectionListFetchResult");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v49, "initWithFetchResult:currentFetchResult:changedIdentifiers:unknownMergeEvent:", v50, v51, MEMORY[0x1E0C9AA60], 0);

    }
  }
  if (*((_BYTE *)v80 + 24))
  {
    v52 = -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier");
    -[PXPhotosDataSource _sectionCache](self, "_sectionCache");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "assetCollectionToSection");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = -[PXPhotosDataSourceChange initWithIncrementalChanges:assetCollectionChangeDetails:sectionsWithKeyAssetChanges:previousCollectionsCount:assetCollectionToSectionCache:originatingPhotoLibraryChange:fromIdentifier:toIdentifier:]([PXPhotosDataSourceChange alloc], "initWithIncrementalChanges:assetCollectionChangeDetails:sectionsWithKeyAssetChanges:previousCollectionsCount:assetCollectionToSectionCache:originatingPhotoLibraryChange:fromIdentifier:toIdentifier:", v10, v47, v48, -[PXPhotosDataSource _previousCollectionsCount](self, "_previousCollectionsCount"), v54, v14, v66, v52);
    -[PXPhotosDataSource _didChange:](self, "_didChange:", v55);

  }
  _Block_object_dispose(&v79, 8);
LABEL_47:
  preparedIndexPathByAssetReferenceCache = self->_preparedIndexPathByAssetReferenceCache;
  self->_preparedIndexPathByAssetReferenceCache = 0;

  preparedResultRecordChangeDetailsByAssetCollection = self->_preparedResultRecordChangeDetailsByAssetCollection;
  self->_preparedResultRecordChangeDetailsByAssetCollection = 0;

  preparedSectionCache = self->__preparedSectionCache;
  self->__preparedSectionCache = 0;

  preparedContainerChangeDetails = self->_preparedContainerChangeDetails;
  self->_preparedContainerChangeDetails = 0;

  -[PXPhotosDataSource _publishDidReceivePhotoLibraryChange:](self, "_publishDidReceivePhotoLibraryChange:", v14);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_243356 == a5)
  {
    if ((v6 & 3) != 0)
    {
      v15 = v9;
      -[PXPhotosDataSource sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasPreview");

      if (v12)
        v13 = 2;
      else
        v13 = 0;
      -[PXPhotosDataSource _internalSetLibraryFilter:](self, "_internalSetLibraryFilter:", v13);
      goto LABEL_10;
    }
  }
  else
  {
    if ((void *)PXLibraryFilterStateObservationContext_243357 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 4104, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      v15 = v9;
      -[PXPhotosDataSource libraryFilterState](self, "libraryFilterState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDataSource _internalSetLibraryFilter:](self, "_internalSetLibraryFilter:", objc_msgSend(v10, "viewMode"));

LABEL_10:
      v9 = v15;
    }
  }

}

- (OS_os_log)dataSourceLog
{
  if (dataSourceLog_onceToken != -1)
    dispatch_once(&dataSourceLog_onceToken, &__block_literal_global_301_243353);
  return (OS_os_log *)(id)dataSourceLog_dataSourceLog;
}

- (NSArray)filterPersons
{
  return self->_filterPersons;
}

- (PHSocialGroup)filterSocialGroup
{
  return self->_filterSocialGroup;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (void)setIgnoreSharedLibraryFilters:(BOOL)a3
{
  self->_ignoreSharedLibraryFilters = a3;
}

- (BOOL)includeAllBurstAssets
{
  return self->_includeAllBurstAssets;
}

- (void)setWantsCurationByDefault:(BOOL)a3
{
  self->_wantsCurationByDefault = a3;
}

- (int64_t)curationLength
{
  return self->_curationLength;
}

- (unint64_t)signpostIntervalId
{
  return self->_signpostIntervalId;
}

- (void)setSignpostIntervalId:(unint64_t)a3
{
  self->_signpostIntervalId = a3;
}

- (id)assetContainerProvider
{
  return self->_assetContainerProvider;
}

- (BOOL)allowNextChangeDeliveryOnAllRunLoopModes
{
  return self->_allowNextChangeDeliveryOnAllRunLoopModes;
}

- (void)setAllowNextChangeDeliveryOnAllRunLoopModes:(BOOL)a3
{
  self->_allowNextChangeDeliveryOnAllRunLoopModes = a3;
}

- (void)setAllowSlowFetchesOnClientQueue:(BOOL)a3
{
  self->_allowSlowFetchesOnClientQueue = a3;
}

void __35__PXPhotosDataSource_dataSourceLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "PXPhotosDataSource");
  v1 = (void *)dataSourceLog_dataSourceLog;
  dataSourceLog_dataSourceLog = (uint64_t)v0;

}

void __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultRecordBeforeChanges");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    v8 = v6;
  }
  else
  {
    +[PXPhotosResultRecordChangeDetails resultRecordChangeDetailsFor:withChange:](PXPhotosResultRecordChangeDetails, "resultRecordChangeDetailsFor:withChange:", v5, *(_QWORD *)(a1 + 40));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "resultRecordAfterChanges");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v5)
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, v11);

}

id __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return objc_msgSend(*(id *)(result + 32), "_willChange");
  }
  return result;
}

void __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "exposedFetchResultChangeDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      objc_msgSend(v5, "exposedFetchResultChangeDetails");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v11);

    }
    objc_msgSend(v5, "keyAssetsFetchResultChangeDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(*(id *)(a1 + 32), "sectionForAssetCollection:", v11));
    }
    objc_msgSend(v5, "resultRecordAfterChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKeyedSubscript:", v10, v11);

  }
}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v8 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "copy");
  v2 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_2;
  v12[3] = &unk_1E513CCC8;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v14 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
  v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "copy");
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_3;
  v9[3] = &unk_1E513CAC0;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 376));
  objc_msgSend(*(id *)(a1 + 32), "_observerInterestingAssetReferences");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  +[PXPhotosResultRecordChangeDetails resultRecordChangeDetailsFor:withChange:](PXPhotosResultRecordChangeDetails, "resultRecordChangeDetailsFor:withChange:", a3, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 352) & 2) != 0)
  {
    objc_msgSend(v5, "resultRecordBeforeChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exposedFetchResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resultRecordAfterChanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exposedFetchResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v10)
    {
      objc_msgSend(v6, "resultRecordAfterChanges");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "exposedFetchResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "countOfAssetsWithMediaType:", 1);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, v13);

}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "container");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "resultTupleUpdatedWithChange:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "setObject:forKeyedSubscript:", v7, v8);

}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  +[PXPhotosResultRecordChangeDetails resultRecordChangeDetailsFor:withChange:](PXPhotosResultRecordChangeDetails, "resultRecordChangeDetailsFor:withChange:", a3, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultRecordBeforeChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultRecordAfterChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(v5, "resultRecordAfterChanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setObject:forKeyedSubscript:", v8, v9);

  }
}

uint64_t __72__PXPhotosDataSource__restartBackgroundFetchWithAssetCollectionsToDiff___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

void __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "_assetsForAssetCollection:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

void __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_4;
  v11[3] = &unk_1E513CCF0;
  v13 = *(_QWORD *)(a1 + 64);
  v5 = v2;
  v12 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v11);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_5;
  block[3] = &unk_1E5145688;
  v6 = *(NSObject **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 48);
  v9 = v5;
  v10 = *(id *)(a1 + 56);
  v7 = v5;
  dispatch_async(v6, block);

}

void __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1588], "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v6, v8, MEMORY[0x1E0C9AA60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

uint64_t __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_5(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 96), "addEntriesFromDictionary:", a1[5]);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __84__PXPhotosDataSource__processAndPublishPendingCollectionFetchResultsWhenAppropriate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performProcessAndPublishSelectorInDefaultRunLoopMode");
}

void __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchRemainingCollectionsBackgroundLoopWithId:", *(_QWORD *)(a1 + 40));

}

uint64_t __52__PXPhotosDataSource__cancelBackgroundFetchIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "removeAllObjects");
}

void __67__PXPhotosDataSource__prefetchIndexesByFetchResult_onlyThumbnails___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  dispatch_block_t v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PXPhotosDataSource__prefetchIndexesByFetchResult_onlyThumbnails___block_invoke_2;
  block[3] = &unk_1E51473C0;
  v11 = v5;
  v12 = v6;
  v13 = *(_BYTE *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  v9 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 216), v9);

}

uint64_t __67__PXPhotosDataSource__prefetchIndexesByFetchResult_onlyThumbnails___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "prefetchThumbnailAssetsAtIndexes:", *(_QWORD *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "prefetchObjectsAtIndexes:", *(_QWORD *)(a1 + 40));
  return result;
}

void __69__PXPhotosDataSource_prefetchAssetsAtIndexPaths_onlyThumbnailAssets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "assetsInSection:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);

}

void __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSRange v10;
  void *v11;
  id v12;
  NSRange v13;
  NSRange v14;

  v12 = a2;
  v5 = a3;
  objc_msgSend(a1[4], "assetsInSection:", objc_msgSend(v12, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(v5, "px_coveringRange");
    v9 = v8;
    v14.length = objc_msgSend(v6, "count");
    v13.location = v7;
    v13.length = v9;
    v14.location = 0;
    v10 = NSIntersectionRange(v13, v14);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v10.location, v10.length);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v11, v6);
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v6, v12);
    objc_msgSend(a1[7], "addIndex:", objc_msgSend(v12, "integerValue"));

  }
}

void __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_3;
  v6[3] = &unk_1E51489A0;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "enumerateIndexesWithOptions:usingBlock:", v2, v6);

}

void __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 216);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_4;
    v11[3] = &unk_1E5148D08;
    v12 = v5;
    v13 = v7;
    v10 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v11);
    dispatch_async(v9, v10);

  }
}

uint64_t __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prefetchObjectsAtIndexes:", *(_QWORD *)(a1 + 40));
}

void __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_278(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  __int128 v5;
  __int16 v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_2;
  v3[3] = &unk_1E513CB88;
  v6 = *(_WORD *)(a1 + 64);
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

uint64_t __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_280(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
}

void __86__PXPhotosDataSource__forceAccurateSection_andNumberOfSurroundingSectionsWithContent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  int v13;
  unint64_t v14;
  int v16;
  char v17;
  uint64_t v18;
  char v19;
  id v20;
  int8x16_t v22;
  id v23;
  _QWORD v24[4];
  int8x16_t v25;

  v23 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (a2 >= 1 && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < *(_QWORD *)(a1 + 64))
  {
    v6 = 0;
    do
    {
      v7 = *(_QWORD *)(a1 + 72);
      v8 = *(_QWORD *)(a1 + 80);
      v9 = v7 - v6;
      v10 = v7 + v6;
      v11 = *(_QWORD *)(a1 + 88);
      v12 = v9 < v8 || v9 - v8 >= v11;
      v13 = !v12;
      v12 = v10 >= v8;
      v14 = v10 - v8;
      v16 = v12 && v14 < v11;
      if (v13 == 1)
      {
        if (v23 && !objc_msgSend(v23, "containsIndex:", v9))
        {
          if ((v16 & 1) == 0)
            goto LABEL_26;
LABEL_24:
          if (!objc_msgSend(v23, "containsIndex:", v10))
            goto LABEL_26;
          goto LABEL_25;
        }
        objc_msgSend(v5, "addIndex:", v9);
      }
      if ((v16 & 1) == 0)
        goto LABEL_26;
      if (v23)
        goto LABEL_24;
LABEL_25:
      objc_msgSend(v5, "addIndex:", v10);
LABEL_26:
      if (objc_msgSend(v5, "count"))
      {
        v17 = objc_msgSend(*(id *)(a1 + 40), "forceAccurateSectionsIfNeeded:reloadChanges:", v5, 1);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        if (*(_BYTE *)(v18 + 24))
          v19 = 1;
        else
          v19 = v17;
        *(_BYTE *)(v18 + 24) = v19;
        objc_msgSend(*(id *)(a1 + 48), "addIndexes:", v5);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __86__PXPhotosDataSource__forceAccurateSection_andNumberOfSurroundingSectionsWithContent___block_invoke_2;
        v24[3] = &unk_1E51460E8;
        v22 = *(int8x16_t *)(a1 + 32);
        v20 = (id)v22.i64[0];
        v25 = vextq_s8(v22, v22, 8uLL);
        objc_msgSend(v5, "enumerateIndexesUsingBlock:", v24);
        objc_msgSend(v5, "removeAllIndexes");

        if (++v6 >= a2)
          break;
      }
      else
      {
        ++v6;
        if ((v13 | v16) != 1 || v6 >= a2)
          break;
      }
    }
    while ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count", *(_OWORD *)&v22) < *(_QWORD *)(a1 + 64));
  }

}

uint64_t __86__PXPhotosDataSource__forceAccurateSection_andNumberOfSurroundingSectionsWithContent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2);
  if (result >= 1)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  return result;
}

void __59__PXPhotosDataSource_setDisableFilters_forAssetCollection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "infoForAssetCollection:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setExplicitlyDisableFilters:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "clearResultsForAssetCollection:", *(_QWORD *)(a1 + 40));

}

uint64_t __47__PXPhotosDataSource_setIncludeAllBurstAssets___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 331) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __59__PXPhotosDataSource_setCanIncludeUnsavedSyndicatedAssets___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 330) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __48__PXPhotosDataSource__internalSetLibraryFilter___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 432) = *(_QWORD *)(result + 40);
  return result;
}

_QWORD *__109__PXPhotosDataSource_setIncludeOthersInSocialGroupAssets_provideIncrementalChangeDetailsForAssetCollections___block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "clearResultsForAssetCollections:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 328) = *(_BYTE *)(a1 + 56);
  result = *(_QWORD **)(a1 + 32);
  if (!result[38])
    return (_QWORD *)objc_msgSend(result, "_restartBackgroundFetchWithAssetCollectionsToDiff:", *(_QWORD *)(a1 + 48));
  return result;
}

_QWORD *__92__PXPhotosDataSource_setFilterPredicate_provideIncrementalChangeDetailsForAssetCollections___block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "clearResultsForAssetCollections:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 424), *(id *)(a1 + 48));
  result = *(_QWORD **)(a1 + 32);
  if (!result[38])
    return (_QWORD *)objc_msgSend(result, "_restartBackgroundFetchWithAssetCollectionsToDiff:", *(_QWORD *)(a1 + 56));
  return result;
}

void __41__PXPhotosDataSource_assetsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v10 = a4;
  if (*(_QWORD *)(a1 + 48) != a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXPhotosDataSource.m"), 2779, CFSTR("Identifier must match (%lu != %lu)"), *(_QWORD *)(a1 + 48), a2);

  }
  objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__PXPhotosDataSource_assetsAtIndexPaths___block_invoke_2;
  v11[3] = &unk_1E51460E8;
  v12 = v7;
  v13 = *(id *)(a1 + 40);
  v8 = v7;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", v11);

}

void __41__PXPhotosDataSource_assetsAtIndexPaths___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __56__PXPhotosDataSource_fetchResultWithAssetsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  if (*(_QWORD *)(a1 + 48) != a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXPhotosDataSource.m"), 2762, CFSTR("Identifier must match (%lu != %lu)"), *(_QWORD *)(a1 + 48), a2);

  }
  objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "fetchedObjectIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v9, "objectsAtIndexes:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v11);

    }
  }

}

void __54__PXPhotosDataSource_fetchResultWithAssetsInSections___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "fetchedObjectIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v4);

    v3 = v5;
  }

}

void __55__PXPhotosDataSource_refetchResultsForAssetCollection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_mutableResultRecordForAssetCollection:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchResult:reverseSortOrder:", 0, 0);
  objc_msgSend(v3, "setKeyAssetsFetchResult:", 0);
  objc_msgSend(v3, "setCuratedFetchResult:", 0);
  objc_msgSend(*(id *)(a1 + 32), "fetcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearFetchResultsForAssetCollection:", *(_QWORD *)(a1 + 40));

}

uint64_t __54__PXPhotosDataSource_clearResultsForAssetCollections___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
}

void __42__PXPhotosDataSource_stopExcludingAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "excludedOids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intersectsSet:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

void __42__PXPhotosDataSource_stopExcludingAssets___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_mutableResultRecordForAssetCollection:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stopExcludingOids:", *(_QWORD *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke(uint64_t a1, __int128 *a2)
{
  NSObject *v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  uint8_t buf[16];
  __int128 v17;

  if (*(_QWORD *)a2 == *(_QWORD *)(a1 + 48))
    goto LABEL_5;
  PXAssertGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Data source identifier mismatch when excluding assets, some assets will not be hidden.", buf, 2u);
  }

  if (*(_QWORD *)a2 == *(_QWORD *)(a1 + 48))
  {
LABEL_5:
    v5 = *(void **)(a1 + 32);
    v6 = a2[1];
    *(_OWORD *)buf = *a2;
    v17 = v6;
    objc_msgSend(v5, "assetAtSimpleIndexPath:", buf);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "burstIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(a1 + 40);
      v10 = objc_msgSend(*(id *)(a1 + 32), "versionIdentifier");
      v11 = *((_QWORD *)a2 + 1);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_262;
      v13[3] = &__block_descriptor_64_e27_v16__0__NSMutableIndexSet_8l;
      v12 = a2[1];
      v14 = *a2;
      v15 = v12;
      objc_msgSend(v9, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v10, v11, v13);
    }

  }
}

uint64_t __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_3;
  v3[3] = &unk_1E513CA78;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "_mutableResultRecordForAssetCollection:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "excludeOids:", v5);

}

uint64_t __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_262(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndex:", *(_QWORD *)(a1 + 48));
}

void __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "includedOids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v8);

}

uint64_t __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke_3;
  v3[3] = &unk_1E513C910;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_mutableResultRecordForAssetCollection:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopIncludingAllOids");

}

uint64_t __50__PXPhotosDataSource_forceIncludeAssetsAtIndexes___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PXPhotosDataSource_forceIncludeAssetsAtIndexes___block_invoke_2;
  v3[3] = &unk_1E513CA78;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __50__PXPhotosDataSource_forceIncludeAssetsAtIndexes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "_mutableResultRecordForAssetCollection:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "includeOids:", v5);

}

void __121__PXPhotosDataSource__indexPathForAssetWithUUID_orBurstIdentifier_orSyndicationIdentifier_hintIndexPath_hintCollections___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  id v18;

  v6 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v18 = v6;
  objc_msgSend(*(id *)(a1 + 32), "assetAtIndexPath:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v7, "fetchPropertySetsIfNeeded");
    objc_msgSend(v8, "curationProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "syndicationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v8, "burstIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = *(void **)(a1 + 56);
    objc_msgSend(v8, "burstIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", v15))
    {

LABEL_8:
LABEL_9:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
      *a3 = 1;
      goto LABEL_10;
    }
    if (v10)
    {
      v17 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v10);

      if ((v17 & 1) != 0)
        goto LABEL_9;
      goto LABEL_10;
    }

LABEL_20:
    goto LABEL_10;
  }
  if (!v10)
    goto LABEL_20;
  v16 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v10);

  if ((v16 & 1) != 0)
    goto LABEL_9;
LABEL_10:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                               + 24))
    *a3 = 1;

}

id __70__PXPhotosDataSource_indexPathForAsset_hintIndexPath_hintCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a2 < 0 || *(_QWORD *)(a1 + 48) <= a2)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (v6 = objc_msgSend(v4, "indexOfObject:", *(_QWORD *)(a1 + 40)), v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __58__PXPhotosDataSource_setWantsCuration_forAssetCollection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_mutableResultRecordForAssetCollection:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWantsCuration:", *(unsigned __int8 *)(a1 + 48));

}

uint64_t __40__PXPhotosDataSource_setCurationLength___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_mutableResultRecordForAssetCollection:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCurationLength:", *(_QWORD *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_restartBackgroundFetchWithAssetCollectionsToDiff:", 0);
}

void __53__PXPhotosDataSource_setKeyAsset_forAssetCollection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_mutableResultRecordForAssetCollection:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CD1620]);
  v10[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD1B90];
  objc_msgSend(v2, "keyAssetsFetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchPropertySets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v4, v5, v6, v8, 0, 1);

  objc_msgSend(v2, "setKeyAssetsFetchResult:", v9);
  if (objc_msgSend(*(id *)(a1 + 40), "assetCollectionType") == 6
    && (objc_msgSend(*(id *)(a1 + 40), "assetCollectionSubtype") == 1000000303
     || objc_msgSend(*(id *)(a1 + 40), "assetCollectionSubtype") == 1000000302))
  {
    objc_msgSend(v2, "setFetchResult:reverseSortOrder:", v9, 0);
    objc_msgSend(v2, "setCuratedFetchResult:", v9);
  }

}

uint64_t __42__PXPhotosDataSource_setReverseSortOrder___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 332) = *(_BYTE *)(result + 40);
  return result;
}

void __41__PXPhotosDataSource_setSortDescriptors___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)a1[4] + 58, a1[5]);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = a1[6];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(a1[4], "_mutableResultRecordForAssetCollection:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSortDescriptors:", a1[5]);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __36__PXPhotosDataSource_setFetchLimit___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 456) = *(_QWORD *)(result + 40);
  return result;
}

void __38__PXPhotosDataSource_setAllowedUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 440);
  *(_QWORD *)(v3 + 440) = v2;

}

uint64_t __38__PXPhotosDataSource_setAllowedUUIDs___block_invoke_2(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_cancelBackgroundFetchIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_inaccurateAssetCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
}

void __37__PXPhotosDataSource_setAllowedOIDs___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 448), *(id *)(a1 + 40));
}

void __51__PXPhotosDataSource_setCollectionListFetchResult___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 376), *(id *)(a1 + 40));
}

uint64_t __63__PXPhotosDataSource_resumeChangeDeliveryAndBackgroundLoading___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void __63__PXPhotosDataSource_resumeChangeDeliveryAndBackgroundLoading___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_processAndPublishPendingCollectionFetchResultsWhenAppropriate");

}

void __84__PXPhotosDataSource_pauseChangeDeliveryAndBackgroundLoadingWithTimeout_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "resumeChangeDeliveryAndBackgroundLoading:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(*(id *)(a1 + 40), "px_endPausingChanges:", *(_QWORD *)(a1 + 32));

}

uint64_t __56__PXPhotosDataSource_pauseChangeDeliveryFor_identifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_endPausingChanges:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__PXPhotosDataSource_unregisterChangeObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

id __51__PXPhotosDataSource__closestIndexPathToIndexPath___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2);
  if (v5 < 1)
  {
    v7 = 0;
  }
  else
  {
    if (a3)
      v6 = v5 - 1;
    else
      v6 = 0;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

void __57__PXPhotosDataSource__observerInterestingAssetReferences__block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_opt_respondsToSelector();
  v4 = v6;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v6, "photosDataSourceInterestingAssetReferences:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);

    v4 = v6;
  }

}

void __59__PXPhotosDataSource__publishDidReceivePhotoLibraryChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "photosDataSource:didReceivePhotoLibraryChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

id __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke_214(uint64_t a1, void *a2, char *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "customUserAssetsChangedForPHMemoryOID:", v6))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "userCuratedAssetsChangedForPHMemoryOID:", v7);

    if (!v8)
    {
LABEL_7:
      v9 = 0;
      v10 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "fetchAssetsInContainer:configuration:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {

    goto LABEL_7;
  }
  v10 = 1;
LABEL_8:
  *a3 = v10;

  return v9;
}

void __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke_217(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "infoForAssetCollection:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setUUIDFilterHidesSomeAssets:", *(unsigned __int8 *)(a1 + 48));

}

void __76__PXPhotosDataSource__assetOidsByAssetCollectionForAssetsAtIndexPathsInSet___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  id v9;
  void *v10;
  _OWORD v11[2];

  if (*(_QWORD *)a2 == *(_QWORD *)(a1 + 48))
    goto LABEL_5;
  PXAssertGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v11[0]) = 0;
    _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Data source identifier mismatch.", (uint8_t *)v11, 2u);
  }

  if (*(_QWORD *)a2 == *(_QWORD *)(a1 + 48))
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "assetCollectionForSection:", *(_QWORD *)(a2 + 8));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = *(_OWORD *)(a2 + 16);
    v11[0] = *(_OWORD *)a2;
    v11[1] = v7;
    objc_msgSend(v6, "assetAtSimpleIndexPath:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v5);
    }
    objc_msgSend(v8, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

void __66__PXPhotosDataSource__initResultRecordsWithOldOptions_newOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "keyAssetsFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "setKeyAssetsFetchResult:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

uint64_t __33__PXPhotosDataSource__commonInit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void __61__PXPhotosDataSource_createDataSourceWithAssetsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "fetchedObjectIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectsAtIndexes:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1580]), "initWithExistingFetchResult:filteredObjectIDs:", v7, v9);
    v11 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%08ld-%@"), a3, *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transientAssetCollectionWithAssetFetchResult:title:identifier:", v10, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
  }

}

void __60__PXPhotosDataSource_initWithPhotosDataSourceConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "sectionForAssetCollection:", v8) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "_mutableResultRecordForAssetCollection:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "_reverseSortOrderForAssetCollection:", v8))
      v7 = objc_msgSend(*(id *)(a1 + 32), "reverseSortOrder") ^ 1;
    else
      v7 = 0;
    objc_msgSend(v6, "setFetchResult:reverseSortOrder:", v5, v7);

  }
}

void __60__PXPhotosDataSource_initWithPhotosDataSourceConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "sectionForAssetCollection:", v7) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "_mutableResultRecordForAssetCollection:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKeyAssetsFetchResult:", v5);

  }
}

+ (OS_dispatch_queue)sharedPrefetchQueue
{
  if (sharedPrefetchQueue_onceToken != -1)
    dispatch_once(&sharedPrefetchQueue_onceToken, &__block_literal_global_141_243571);
  return (OS_dispatch_queue *)(id)sharedPrefetchQueue_sharedPrefetchQueue;
}

+ (void)waitForAllBackgroundFetchingToFinish
{
  NSObject *v3;
  dispatch_time_t v4;

  kdebug_trace();
  objc_msgSend(a1, "backgroundFetchingGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_time(0, 120000000000);
  dispatch_group_wait(v3, v4);

  kdebug_trace();
}

void __41__PXPhotosDataSource_sharedPrefetchQueue__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  void *v4;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v1);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.photos.datasource.shared-prefetch-queue", attr);
  v3 = (void *)sharedPrefetchQueue_sharedPrefetchQueue;
  sharedPrefetchQueue_sharedPrefetchQueue = (uint64_t)v2;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleMainQueueTask:", &__block_literal_global_144_243573);

}

void __41__PXPhotosDataSource_sharedPrefetchQueue__block_invoke_2()
{
  dispatch_activate((dispatch_object_t)sharedPrefetchQueue_sharedPrefetchQueue);
}

@end
