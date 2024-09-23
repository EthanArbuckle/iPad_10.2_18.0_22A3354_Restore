@implementation PXPhotosMutableResultRecord

- (void)_updateFilteredFetchResultIfNeeded
{
  PXPhotosMutableResultRecord *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  NSSet *v11;
  PHFetchResult *v12;
  void *v13;
  NSSet *v14;
  id v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  NSSet *excludedOids;
  NSSet *v45;
  PHFetchResult *filteredFetchResult;
  PHFetchResult *v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  PXPhotosMutableResultRecord *v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!self->_filteredFetchResultIsValid)
  {
    v2 = self;
    self->_filteredFetchResultIsValid = 1;
    v3 = -[PXPhotosMutableResultRecord reverseSortOrder](self, "reverseSortOrder");
    -[PXPhotosMutableResultRecord excludedOids](v2, "excludedOids");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosMutableResultRecord keyAssetsFetchResult](v2, "keyAssetsFetchResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchedObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();

    v59 = (void *)v7;
    if (v7)
      v60 = -[PXPhotosMutableResultRecord ensureKeyAssetAtBeginning](v2, "ensureKeyAssetAtBeginning");
    else
      v60 = 0;
    -[PXPhotosMutableResultRecord exposedFetchResultBeforeFiltering](v2, "exposedFetchResultBeforeFiltering");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
      v10 = 1;
    else
      v10 = v3;
    if ((v10 & 1) != 0 || v60)
    {
      objc_msgSend(v8, "fetchedObjectIDs");
      v12 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v57 = v8;
        objc_msgSend(v8, "fetchedObjectIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
        v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
        v53 = v2;
        v50 = v3;
        if (v3)
        {
          objc_msgSend(v13, "reverseObjectEnumerator");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v16 = -[PXPhotosMutableResultRecord preloadAssetTypeCounts](v2, "preloadAssetTypeCounts");
          v17 = objc_msgSend(v13, "count") - 1;
          v18 = -1;
        }
        else
        {
          v15 = v13;
          v16 = -[PXPhotosMutableResultRecord preloadAssetTypeCounts](v2, "preloadAssetTypeCounts");
          v17 = 0;
          v18 = 1;
        }
        v51 = v13;
        v52 = v9;
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v19 = v15;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        if (v20)
        {
          v21 = v20;
          v54 = 0;
          v55 = 0;
          v56 = 0;
          v22 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v62 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              if (objc_msgSend(v4, "containsObject:", v24))
              {
                -[NSSet addObject:](v14, "addObject:", v24);
                if (v16)
                {
                  objc_msgSend(v57, "objectAtIndexedSubscript:", v17);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "mediaType");
                  switch(v26)
                  {
                    case 3:
                      ++v56;
                      break;
                    case 2:
                      ++v55;
                      break;
                    case 1:
                      ++v54;
                      break;
                  }

                }
              }
              else if (v24 != v59 || !v60)
              {
                objc_msgSend(v58, "addObject:", v24);
              }
              v17 += v18;
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
          }
          while (v21);
        }
        else
        {
          v54 = 0;
          v55 = 0;
          v56 = 0;
        }

        v11 = v14;
        v28 = -[NSSet count](v14, "count");
        v29 = v50;
        if (v28)
          v29 = 1;
        if ((v29 | v60) == 1)
        {
          v30 = 0x7FFFFFFFFFFFFFFFLL;
          v31 = 0x7FFFFFFFFFFFFFFFLL;
          v32 = 0x7FFFFFFFFFFFFFFFLL;
          v8 = v57;
          if (v16)
          {
            v33 = objc_msgSend(v57, "cachedCountOfAssetsWithMediaType:", 1);
            v34 = objc_msgSend(v57, "cachedCountOfAssetsWithMediaType:", 2);
            v35 = objc_msgSend(v57, "cachedCountOfAssetsWithMediaType:", 3);
            v36 = v33 - v54;
            if (v33 < v54 || v33 == 0x7FFFFFFFFFFFFFFFLL)
              v36 = 0x7FFFFFFFFFFFFFFFLL;
            if (v34 < v55 || v34 == 0x7FFFFFFFFFFFFFFFLL)
              v31 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v31 = v34 - v55;
            if (v35 < v56 || v35 == 0x7FFFFFFFFFFFFFFFLL)
              v32 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v32 = v35 - v56;
            v30 = v36;
          }
          if (v60 && (objc_msgSend(v4, "containsObject:", v59) & 1) == 0)
            objc_msgSend(v58, "insertObject:atIndex:", v59, 0);
          v40 = objc_alloc(MEMORY[0x1E0CD1620]);
          objc_msgSend(v57, "fetchType");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "fetchPropertySets");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v31;
          v48 = v30;
          v43 = v58;
          v9 = v52;
          v12 = (PHFetchResult *)objc_msgSend(v40, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:photosCount:videosCount:audiosCount:", v58, v52, v41, v42, 0, 0, v48, v49, v32);

          v11 = v14;
        }
        else
        {
          v12 = 0;
          v8 = v57;
          v43 = v58;
          v9 = v52;
        }

        v2 = v53;
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
    excludedOids = v2->_excludedOids;
    v2->_excludedOids = v11;
    v45 = v11;

    filteredFetchResult = v2->_filteredFetchResult;
    v2->_filteredFetchResult = v12;
    v47 = v12;

  }
}

- (NSSet)excludedOids
{
  return self->_excludedOids;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXPhotosMutableResultRecord *v4;
  void *v5;
  uint64_t v6;
  PHFetchResult *fetchResult;
  void *v8;
  uint64_t v9;
  PHFetchResult *curatedFetchResult;
  void *v11;
  uint64_t v12;
  PHFetchResult *keyAssetsFetchResult;
  void *v14;
  uint64_t v15;
  NSArray *sortDescriptors;
  void *v17;
  uint64_t v18;
  PHFetchResult *filteredFetchResult;
  void *v20;
  uint64_t v21;
  NSSet *excludedOids;
  void *v23;
  uint64_t v24;
  NSSet *includedOids;
  void *v26;
  uint64_t v27;
  NSSet *curatedOids;
  uint64_t v29;
  id curatedRefetchCondition;

  v4 = objc_alloc_init(PXPhotosMutableResultRecord);
  -[PXPhotosMutableResultRecord fetchResult](self, "fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  fetchResult = v4->_fetchResult;
  v4->_fetchResult = (PHFetchResult *)v6;

  -[PXPhotosMutableResultRecord curatedFetchResult](self, "curatedFetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  curatedFetchResult = v4->_curatedFetchResult;
  v4->_curatedFetchResult = (PHFetchResult *)v9;

  -[PXPhotosMutableResultRecord keyAssetsFetchResult](self, "keyAssetsFetchResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  keyAssetsFetchResult = v4->_keyAssetsFetchResult;
  v4->_keyAssetsFetchResult = (PHFetchResult *)v12;

  v4->_keyAssetIndex = self->_keyAssetIndex;
  v4->_wantsCuration = -[PXPhotosMutableResultRecord wantsCuration](self, "wantsCuration");
  v4->_curationLength = -[PXPhotosMutableResultRecord curationLength](self, "curationLength");
  -[PXPhotosMutableResultRecord sortDescriptors](self, "sortDescriptors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  sortDescriptors = v4->_sortDescriptors;
  v4->_sortDescriptors = (NSArray *)v15;

  -[PXPhotosMutableResultRecord filteredFetchResult](self, "filteredFetchResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  filteredFetchResult = v4->_filteredFetchResult;
  v4->_filteredFetchResult = (PHFetchResult *)v18;

  -[PXPhotosMutableResultRecord excludedOids](self, "excludedOids");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  excludedOids = v4->_excludedOids;
  v4->_excludedOids = (NSSet *)v21;

  -[PXPhotosMutableResultRecord includedOids](self, "includedOids");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "copy");
  includedOids = v4->_includedOids;
  v4->_includedOids = (NSSet *)v24;

  -[PXPhotosMutableResultRecord curatedOids](self, "curatedOids");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "copy");
  curatedOids = v4->_curatedOids;
  v4->_curatedOids = (NSSet *)v27;

  v4->_filteredFetchResultIsValid = self->_filteredFetchResultIsValid;
  v4->_preloadAssetTypeCounts = self->_preloadAssetTypeCounts;
  v4->_reverseSortOrder = self->_reverseSortOrder;
  v29 = objc_msgSend(self->_curatedRefetchCondition, "copy");
  curatedRefetchCondition = v4->_curatedRefetchCondition;
  v4->_curatedRefetchCondition = (id)v29;

  v4->_ensureKeyAssetAtBeginning = self->_ensureKeyAssetAtBeginning;
  return v4;
}

- (id)exposedFetchResultBeforeFiltering
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!-[PXPhotosMutableResultRecord wantsCuration](self, "wantsCuration"))
    goto LABEL_5;
  -[PXPhotosMutableResultRecord curatedFetchResult](self, "curatedFetchResult");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[PXPhotosMutableResultRecord curatedFetchResult](self, "curatedFetchResult"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        v6))
  {
    -[PXPhotosMutableResultRecord curatedFetchResult](self, "curatedFetchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    -[PXPhotosMutableResultRecord fetchResult](self, "fetchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (PHFetchResult)curatedFetchResult
{
  return self->_curatedFetchResult;
}

- (BOOL)wantsCuration
{
  return self->_wantsCuration;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (PHFetchResult)exposedFetchResult
{
  void *v3;

  -[PXPhotosMutableResultRecord filteredFetchResult](self, "filteredFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PXPhotosMutableResultRecord exposedFetchResultBeforeFiltering](self, "exposedFetchResultBeforeFiltering");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PHFetchResult *)v3;
}

- (PHFetchResult)filteredFetchResult
{
  -[PXPhotosMutableResultRecord _updateFilteredFetchResultIfNeeded](self, "_updateFilteredFetchResultIfNeeded");
  return self->_filteredFetchResult;
}

- (NSSet)includedOids
{
  return self->_includedOids;
}

- (NSSet)curatedOids
{
  return self->_curatedOids;
}

- (BOOL)ensureKeyAssetAtBeginning
{
  return self->_ensureKeyAssetAtBeginning;
}

- (void)setReverseSortOrder:(BOOL)a3
{
  if (self->_reverseSortOrder != a3)
  {
    self->_reverseSortOrder = a3;
    -[PXPhotosMutableResultRecord _invalidateFilteredFetchResult](self, "_invalidateFilteredFetchResult");
  }
}

- (void)setFetchResult:(id)a3 reverseSortOrder:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[PXPhotosMutableResultRecord setFetchResult:](self, "setFetchResult:", a3);
  -[PXPhotosMutableResultRecord setReverseSortOrder:](self, "setReverseSortOrder:", v4);
}

- (void)setKeyAssetsFetchResult:(id)a3
{
  PHFetchResult *v5;
  PHFetchResult *v6;

  v5 = (PHFetchResult *)a3;
  if (self->_keyAssetsFetchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_keyAssetsFetchResult, a3);
    -[PXPhotosMutableResultRecord _invalidateKeyAssetIndex](self, "_invalidateKeyAssetIndex");
    v5 = v6;
  }

}

- (void)setCuratedRefetchCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setCuratedFetchResult:(id)a3
{
  NSSet *v5;
  NSSet *curatedOids;
  PHFetchResult *v7;

  v7 = (PHFetchResult *)a3;
  if (self->_curatedFetchResult != v7)
  {
    objc_storeStrong((id *)&self->_curatedFetchResult, a3);
    -[PHFetchResult fetchedObjectIDsSet](v7, "fetchedObjectIDsSet");
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    curatedOids = self->_curatedOids;
    self->_curatedOids = v5;

    -[PXPhotosMutableResultRecord _invalidateFilteredFetchResult](self, "_invalidateFilteredFetchResult");
  }

}

- (PXPhotosMutableResultRecord)init
{
  PXPhotosMutableResultRecord *v2;
  PXPhotosMutableResultRecord *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPhotosMutableResultRecord;
  v2 = -[PXPhotosMutableResultRecord init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXPhotosMutableResultRecord _invalidateKeyAssetIndex](v2, "_invalidateKeyAssetIndex");
  return v3;
}

- (void)_invalidateKeyAssetIndex
{
  self->_keyAssetIndex = -1;
}

- (void)setWantsCuration:(BOOL)a3
{
  if (self->_wantsCuration != a3)
  {
    self->_wantsCuration = a3;
    -[PXPhotosMutableResultRecord _invalidateFilteredFetchResult](self, "_invalidateFilteredFetchResult");
  }
}

- (void)setPreloadAssetTypeCounts:(BOOL)a3
{
  self->_preloadAssetTypeCounts = a3;
}

- (void)setFetchResult:(id)a3
{
  PHFetchResult *v5;
  PHFetchResult *v6;

  v5 = (PHFetchResult *)a3;
  if (self->_fetchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fetchResult, a3);
    -[PXPhotosMutableResultRecord _invalidateFilteredFetchResult](self, "_invalidateFilteredFetchResult");
    v5 = v6;
  }

}

- (void)_invalidateFilteredFetchResult
{
  PHFetchResult *filteredFetchResult;

  self->_filteredFetchResultIsValid = 0;
  filteredFetchResult = self->_filteredFetchResult;
  self->_filteredFetchResult = 0;

  -[PXPhotosMutableResultRecord _invalidateKeyAssetIndex](self, "_invalidateKeyAssetIndex");
}

- (void)setEnsureKeyAssetAtBeginning:(BOOL)a3
{
  if (self->_ensureKeyAssetAtBeginning != a3)
  {
    self->_ensureKeyAssetAtBeginning = a3;
    -[PXPhotosMutableResultRecord _invalidateFilteredFetchResult](self, "_invalidateFilteredFetchResult");
  }
}

- (BOOL)preloadAssetTypeCounts
{
  return self->_preloadAssetTypeCounts;
}

- (PHFetchResult)keyAssetsFetchResult
{
  return self->_keyAssetsFetchResult;
}

- (NSPredicate)inclusionPredicate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSPredicate *v7;
  NSPredicate *inclusionPredicate;

  if (!self->_inclusionPredicateIsValid)
  {
    self->_inclusionPredicateIsValid = 1;
    -[PXPhotosMutableResultRecord includedOids](self, "includedOids");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3880];
      -[PXPhotosMutableResultRecord includedOids](self, "includedOids");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicateWithFormat:", CFSTR("self IN %@"), v6);
      v7 = (NSPredicate *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    inclusionPredicate = self->_inclusionPredicate;
    self->_inclusionPredicate = v7;

  }
  return self->_inclusionPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong(&self->_curatedRefetchCondition, 0);
  objc_storeStrong((id *)&self->_keyAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_curatedFetchResult, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_curatedOids, 0);
  objc_storeStrong((id *)&self->_includedOids, 0);
  objc_storeStrong((id *)&self->_excludedOids, 0);
  objc_storeStrong((id *)&self->_inclusionPredicate, 0);
  objc_storeStrong((id *)&self->_filteredFetchResult, 0);
}

- (BOOL)isCurated
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PXPhotosMutableResultRecord curatedFetchResult](self, "curatedFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXPhotosMutableResultRecord exposedFetchResultBeforeFiltering](self, "exposedFetchResultBeforeFiltering");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosMutableResultRecord curatedFetchResult](self, "curatedFetchResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4 == v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)keyAssetIndex
{
  int64_t keyAssetIndex;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  keyAssetIndex = self->_keyAssetIndex;
  if (keyAssetIndex == -1)
  {
    -[PXPhotosMutableResultRecord keyAssetsFetchResult](self, "keyAssetsFetchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[PXPhotosMutableResultRecord exposedFetchResult](self, "exposedFetchResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        v6 = v4;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        keyAssetIndex = 0x7FFFFFFFFFFFFFFFLL;
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v14;
          while (2)
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v14 != v9)
                objc_enumerationMutation(v6);
              v11 = objc_msgSend(v5, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
              if (v11 != 0x7FFFFFFFFFFFFFFFLL)
              {
                keyAssetIndex = v11;
                goto LABEL_15;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
            if (v8)
              continue;
            break;
          }
          keyAssetIndex = 0x7FFFFFFFFFFFFFFFLL;
        }
LABEL_15:

      }
      else
      {
        keyAssetIndex = 0x7FFFFFFFFFFFFFFFLL;
      }

    }
    else
    {
      keyAssetIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    self->_keyAssetIndex = keyAssetIndex;

  }
  return keyAssetIndex;
}

- (void)invalidateFetchResultAssetCache
{
  PHFetchResult *v3;
  PHFetchResult *filteredFetchResult;
  PHFetchResult *v5;
  PHFetchResult *fetchResult;

  v3 = (PHFetchResult *)-[PHFetchResult copyWithOptions:](self->_filteredFetchResult, "copyWithOptions:", &unk_1E53F0A98);
  filteredFetchResult = self->_filteredFetchResult;
  self->_filteredFetchResult = v3;

  v5 = (PHFetchResult *)-[PHFetchResult copyWithOptions:](self->_fetchResult, "copyWithOptions:", &unk_1E53F0A98);
  fetchResult = self->_fetchResult;
  self->_fetchResult = v5;

}

- (void)includeOids:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "count");
  v5 = v9;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosMutableResultRecord includedOids](self, "includedOids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PXPhotosMutableResultRecord includedOids](self, "includedOids");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unionSet:", v8);

    }
    -[PXPhotosMutableResultRecord _setIncludeOids:](self, "_setIncludeOids:", v6);

    v5 = v9;
  }

}

- (void)stopIncludingAllOids
{
  -[PXPhotosMutableResultRecord _setIncludeOids:](self, "_setIncludeOids:", 0);
}

- (void)_setIncludeOids:(id)a3
{
  NSUInteger v5;
  id v6;

  v6 = a3;
  v5 = -[NSSet count](self->_includedOids, "count");
  if (v5 != objc_msgSend(v6, "count"))
  {
    objc_storeStrong((id *)&self->_includedOids, a3);
    -[PXPhotosMutableResultRecord _invalidateInclusionPredicate](self, "_invalidateInclusionPredicate");
    -[PXPhotosMutableResultRecord setFetchResult:](self, "setFetchResult:", 0);
  }

}

- (void)_invalidateInclusionPredicate
{
  self->_inclusionPredicateIsValid = 0;
}

- (void)excludeOids:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSUInteger v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "count");
  v5 = v10;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosMutableResultRecord excludedOids](self, "excludedOids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PXPhotosMutableResultRecord excludedOids](self, "excludedOids");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unionSet:", v8);

    }
    v9 = -[NSSet count](self->_excludedOids, "count");
    if (v9 != objc_msgSend(v6, "count"))
    {
      objc_storeStrong((id *)&self->_excludedOids, v6);
      -[PXPhotosMutableResultRecord _invalidateFilteredFetchResult](self, "_invalidateFilteredFetchResult");
    }

    v5 = v10;
  }

}

- (void)stopExcludingOids:(id)a3
{
  void *v4;
  void *v5;
  NSUInteger v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[PXPhotosMutableResultRecord excludedOids](self, "excludedOids");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "minusSet:", v7);
    v6 = -[NSSet count](self->_excludedOids, "count");
    if (v6 != objc_msgSend(v5, "count"))
    {
      objc_storeStrong((id *)&self->_excludedOids, v5);
      -[PXPhotosMutableResultRecord _invalidateFilteredFetchResult](self, "_invalidateFilteredFetchResult");
    }

  }
}

- (void)setCurationLength:(int64_t)a3
{
  if (self->_curationLength != a3)
  {
    self->_curationLength = a3;
    -[PXPhotosMutableResultRecord setFetchResult:](self, "setFetchResult:", 0);
    -[PXPhotosMutableResultRecord setCuratedFetchResult:](self, "setCuratedFetchResult:", 0);
    -[PXPhotosMutableResultRecord _invalidateFilteredFetchResult](self, "_invalidateFilteredFetchResult");
  }
}

- (void)setSortDescriptors:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *sortDescriptors;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_sortDescriptors;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      sortDescriptors = self->_sortDescriptors;
      self->_sortDescriptors = v6;

      -[PXPhotosMutableResultRecord setFetchResult:](self, "setFetchResult:", 0);
      -[PXPhotosMutableResultRecord setCuratedFetchResult:](self, "setCuratedFetchResult:", 0);
      -[PXPhotosMutableResultRecord _invalidateFilteredFetchResult](self, "_invalidateFilteredFetchResult");
    }
  }

}

- (void)adoptPreparedFilteredFetchResultFromRecord:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  int v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  NSSet *v26;
  NSSet *excludedOids;
  void *v28;
  PHFetchResult *v29;
  PHFetchResult *filteredFetchResult;
  id v31;

  v4 = a3;
  if (self->_filteredFetchResultIsValid)
    goto LABEL_27;
  v31 = v4;
  v5 = -[PXPhotosMutableResultRecord reverseSortOrder](self, "reverseSortOrder");
  v6 = v5 == objc_msgSend(v31, "reverseSortOrder");
  v4 = v31;
  if (!v6)
    goto LABEL_27;
  -[PXPhotosMutableResultRecord excludedOids](self, "excludedOids");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v31, "excludedOids");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v8 != v10)
  {
    v11 = objc_msgSend(v8, "isEqual:", v10);
    if (v9)
      goto LABEL_11;
    goto LABEL_10;
  }
  v11 = 1;
  if (!v9)
LABEL_10:

LABEL_11:
  if (!v7)

  v4 = v31;
  if (v11)
  {
    -[PXPhotosMutableResultRecord keyAssetsFetchResult](self, "keyAssetsFetchResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchedObjectIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "keyAssetsFetchResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchedObjectIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v14 == v17)
    {

    }
    else
    {
      v18 = v17;
      v19 = objc_msgSend(v14, "isEqual:", v17);

      v4 = v31;
      if ((v19 & 1) == 0)
        goto LABEL_27;
    }
    v20 = -[PXPhotosMutableResultRecord ensureKeyAssetAtBeginning](self, "ensureKeyAssetAtBeginning");
    v6 = v20 == objc_msgSend(v31, "ensureKeyAssetAtBeginning");
    v4 = v31;
    if (v6)
    {
      -[PXPhotosMutableResultRecord exposedFetchResultBeforeFiltering](self, "exposedFetchResultBeforeFiltering");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "exposedFetchResultBeforeFiltering");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
      {

      }
      else
      {
        v23 = v22;
        v24 = objc_msgSend(v21, "isEqual:", v22);

        v4 = v31;
        if ((v24 & 1) == 0)
          goto LABEL_27;
      }
      objc_msgSend(v31, "excludedOids");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (NSSet *)objc_msgSend(v25, "copy");
      excludedOids = self->_excludedOids;
      self->_excludedOids = v26;

      objc_msgSend(v31, "filteredFetchResult");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (PHFetchResult *)objc_msgSend(v28, "copy");
      filteredFetchResult = self->_filteredFetchResult;
      self->_filteredFetchResult = v29;

      v4 = v31;
      self->_filteredFetchResultIsValid = 1;
    }
  }
LABEL_27:

}

- (void)setKeyAssetIndex:(int64_t)a3
{
  self->_keyAssetIndex = a3;
}

- (int64_t)curationLength
{
  return self->_curationLength;
}

- (id)curatedRefetchCondition
{
  return self->_curatedRefetchCondition;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

@end
