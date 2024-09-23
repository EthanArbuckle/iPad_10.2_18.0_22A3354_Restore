@implementation PLAssetContainerDataSource

- (PLAssetContainerDataSource)initWithAssetCollectionsFetchResult:(id)a3 collectionsAssetsFetchResults:(id)a4
{
  PLAssetContainerDataSource *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PLAssetContainerDataSource;
  v7 = -[PLAssetContainerDataSource init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(a3, "count");
    if (v8 != objc_msgSend(a4, "count"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLAssetContainerDataSource.m"), 68, CFSTR("Mismatched asset collections and asset fetch results"));
    v7->_assetCollectionsFetchResult = (PHFetchResult *)a3;
    v7->_assetsFetchResultByAssetCollection = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a4, "count"));
    v9 = -[PHFetchResult count](v7->_assetCollectionsFetchResult, "count");
    if (v9)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
        -[NSMutableDictionary setObject:forKey:](v7->_assetsFetchResultByAssetCollection, "setObject:forKey:", objc_msgSend(a4, "objectAtIndex:", i), -[PHFetchResult objectAtIndex:](v7->_assetCollectionsFetchResult, "objectAtIndex:", i));
    }
    v12 = -[NSMutableDictionary count](v7->_assetsFetchResultByAssetCollection, "count");
    if (v12 != -[PHFetchResult count](v7->_assetCollectionsFetchResult, "count"))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLAssetContainerDataSource.m"), 79, CFSTR("Mismatched asset collections and asset fetch results"));
    v7->_allAssetsCount = 0x7FFFFFFFFFFFFFFFLL;
    v7->_cachedValuesNeedUpdate = 1;
  }
  return v7;
}

- (void)dealloc
{
  unint64_t *containerCounts;
  objc_super v4;

  containerCounts = self->_containerCounts;
  if (containerCounts)
    free(containerCounts);
  v4.receiver = self;
  v4.super_class = (Class)PLAssetContainerDataSource;
  -[PLAssetContainerDataSource dealloc](&v4, sel_dealloc);
}

- (void)_updateCachedValues
{
  unint64_t v4;
  unint64_t *containerCounts;
  unint64_t *v6;
  PHFetchResult *assetCollectionsFetchResult;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  self->_allAssetsCount = 0;
  v4 = -[PHFetchResult count](self->_assetCollectionsFetchResult, "count");
  if (v4 != -[NSMutableDictionary count](self->_assetsFetchResultByAssetCollection, "count"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetContainerDataSource.m"), 102, CFSTR("Mismatched asset collections and asset fetch results"));
  containerCounts = self->_containerCounts;
  if (!containerCounts)
  {
    if (v4)
    {
      v6 = (unint64_t *)malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
      goto LABEL_8;
    }
LABEL_19:
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_20;
  }
  if (!v4)
  {
    free(containerCounts);
    self->_containerCounts = 0;
    goto LABEL_19;
  }
  v6 = (unint64_t *)malloc_type_realloc(containerCounts, 8 * v4, 0x100004000313F17uLL);
LABEL_8:
  self->_containerCounts = v6;
  if (v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
    v8 = -[PHFetchResult countByEnumeratingWithState:objects:count:](assetCollectionsFetchResult, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        v13 = v10;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(assetCollectionsFetchResult);
          v14 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12)), "count");
          v10 = v13 + 1;
          self->_containerCounts[v13] = v14;
          self->_allAssetsCount += v14;
          ++v12;
          ++v13;
        }
        while (v9 != v12);
        v9 = -[PHFetchResult countByEnumeratingWithState:objects:count:](assetCollectionsFetchResult, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }
  }
  if (self->_lastAssetCollectionIndex >= v4)
  {
    v15 = v4 - 1;
LABEL_20:
    self->_lastAssetCollectionIndex = v15;
  }
  self->_cachedValuesNeedUpdate = 0;
}

- (void)_updateCachedCount:(unint64_t)a3 forContainerAtContainerIndex:(unint64_t)a4
{
  unint64_t *containerCounts;
  unint64_t v5;

  containerCounts = self->_containerCounts;
  v5 = a3 - containerCounts[a4];
  containerCounts[a4] = a3;
  self->_allAssetsCount += v5;
}

- (unint64_t)allAssetsCount
{
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  return self->_allAssetsCount;
}

- (id)assetContainerForAsset:(id)a3
{
  uint64_t v5;
  id result;
  id v7;
  unint64_t v8;

  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v5 = -[NSMutableDictionary count](self->_assetsFetchResultByAssetCollection, "count");
  result = 0;
  if (a3 && v5)
  {
    if (v5 == 1)
    {
      v7 = -[PHFetchResult objectAtIndex:](self->_assetCollectionsFetchResult, "objectAtIndex:", 0);
      if (objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", v7), "indexOfObject:", a3) == 0x7FFFFFFFFFFFFFFFLL)return 0;
      else
        return v7;
    }
    else
    {
      v8 = -[PLAssetContainerDataSource globalIndexOfAsset:](self, "globalIndexOfAsset:", a3);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        return 0;
      else
        return -[PLAssetContainerDataSource assetContainerForAssetGlobalIndex:](self, "assetContainerForAssetGlobalIndex:", v8);
    }
  }
  return result;
}

- (id)assetContainerForAssetGlobalIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v5 = -[NSMutableDictionary count](self->_assetsFetchResultByAssetCollection, "count");
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v6 = v5;
  if (!v5 || -[PLAssetContainerDataSource allAssetsCount](self, "allAssetsCount") <= a3)
    return 0;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    v8 += self->_containerCounts[v7];
    if (v8 > a3)
      break;
    if (v6 == ++v7)
      return 0;
  }
  return -[PHFetchResult objectAtIndex:](self->_assetCollectionsFetchResult, "objectAtIndex:");
}

- (unint64_t)globalIndexForIndexPath:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t *containerCounts;
  uint64_t v8;

  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = objc_msgSend(a3, "section");
  v6 = objc_msgSend(a3, "item");
  if (v5 >= -[PHFetchResult count](self->_assetCollectionsFetchResult, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  containerCounts = self->_containerCounts;
  if (v6 >= containerCounts[v5])
    return 0x7FFFFFFFFFFFFFFFLL;
  for (; v5; --v5)
  {
    v8 = *containerCounts++;
    v6 += v8;
  }
  return v6;
}

- (id)indexPathForGlobalIndex:(unint64_t)a3
{
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  if (self->_allAssetsCount <= a3)
    return 0;
  v5 = -[PHFetchResult count](self->_assetCollectionsFetchResult, "count");
  if (!v5)
    return 0;
  v6 = 0;
  v7 = 0;
  while (1)
  {
    v8 = self->_containerCounts[v6] + v7;
    if (v8 > a3)
      break;
    ++v6;
    v7 = v8;
    if (v5 == v6)
      return 0;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3 - v7);
}

- (unint64_t)incrementGlobalIndex:(unint64_t)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v5 = a5;
  v6 = a4;
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v9 = a3 + 1;
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PLAssetContainerDataSource assetContainerForAssetGlobalIndex:](self, "assetContainerForAssetGlobalIndex:", a3));
  if (v6)
  {
    v11 = objc_msgSend(v10, "count");
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11)
    {
      v13 = v11;
      v14 = -[PLAssetContainerDataSource indexOffsetForAssetContainerAtAssetIndex:](self, "indexOffsetForAssetContainerAtAssetIndex:", a3);
      if (v5)
        v15 = v14;
      else
        v15 = 0x7FFFFFFFFFFFFFFFLL;
      if (v9 >= v14 + v13)
        return v15;
      else
        return a3 + 1;
    }
  }
  else
  {
    v16 = -[PLAssetContainerDataSource allAssetsCount](self, "allAssetsCount");
    if (v5)
      v17 = 0;
    else
      v17 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9 < v16)
      v17 = a3 + 1;
    if (v16)
      return v17;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v12;
}

- (unint64_t)decrementGlobalIndex:(unint64_t)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v5 = a5;
  v6 = a4;
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v9 = (void *)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PLAssetContainerDataSource assetContainerForAssetGlobalIndex:](self, "assetContainerForAssetGlobalIndex:", a3));
  if (v6)
  {
    v10 = objc_msgSend(v9, "count");
    if (v10)
    {
      v11 = v10;
      v12 = -[PLAssetContainerDataSource indexOffsetForAssetContainerAtAssetIndex:](self, "indexOffsetForAssetContainerAtAssetIndex:", a3);
      v13 = v12 + v11;
      if (v12 == a3)
      {
        v14 = v13 - 1;
        if (v5)
          return v14;
        else
          return 0x7FFFFFFFFFFFFFFFLL;
      }
      else if (v13 <= a3)
      {
        return v13 - 1;
      }
      else
      {
        return a3 - 1;
      }
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v16 = -[PLAssetContainerDataSource allAssetsCount](self, "allAssetsCount");
    v17 = a3 - 1;
    v18 = v16 - 1;
    if (v16 <= a3)
      v17 = v16 - 1;
    if (!v5)
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3)
      v17 = v18;
    if (v16)
      return v17;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)assetAtGlobalIndex:(unint64_t)a3
{
  unint64_t v5;
  id v6;
  unint64_t v7;

  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v5 = -[PLAssetContainerDataSource allAssetsCount](self, "allAssetsCount");
  if (v5
    && a3 != 0x7FFFFFFFFFFFFFFFLL
    && v5 > a3
    && (v6 = -[PLAssetContainerDataSource assetContainerForAssetGlobalIndex:](self, "assetContainerForAssetGlobalIndex:", a3), v7 = -[PLAssetContainerDataSource indexOffsetForAssetContainerAtAssetIndex:](self, "indexOffsetForAssetContainerAtAssetIndex:", a3), v6))
  {
    return -[PLAssetContainerDataSource assetInAssetContainer:atIndex:](self, "assetInAssetContainer:atIndex:", v6, a3 - v7);
  }
  else
  {
    return 0;
  }
}

- (unint64_t)globalIndexOfAsset:(id)a3
{
  unint64_t v5;
  unint64_t result;
  uint64_t v7;
  unint64_t lastAssetCollectionIndex;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  PHFetchResult *assetCollectionsFetchResult;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v5 = -[PLAssetContainerDataSource allAssetsCount](self, "allAssetsCount");
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v5)
  {
    if (self->_lastAssetCollectionIndex == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_15;
    v7 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:")), "indexOfObject:", a3);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL
      || (result = -[PLAssetContainerDataSource globalIndexForIndexPath:](self, "globalIndexForIndexPath:", objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7, self->_lastAssetCollectionIndex)), result == 0x7FFFFFFFFFFFFFFFLL))
    {
      lastAssetCollectionIndex = self->_lastAssetCollectionIndex;
      if (lastAssetCollectionIndex)
      {
        v9 = lastAssetCollectionIndex - 1;
        v10 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:", lastAssetCollectionIndex - 1)), "indexOfObject:", a3);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = self->_lastAssetCollectionIndex;
        }
        else
        {
          result = -[PLAssetContainerDataSource globalIndexForIndexPath:](self, "globalIndexForIndexPath:", objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, v9));
          self->_lastAssetCollectionIndex = v9;
          if (result != 0x7FFFFFFFFFFFFFFFLL)
            return result;
        }
      }
      else
      {
        v9 = 0;
      }
      if (v9 >= -[PHFetchResult count](self->_assetCollectionsFetchResult, "count") - 1
        || (v11 = self->_lastAssetCollectionIndex + 1,
            v12 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:", v11)), "indexOfObject:", a3), v12 == 0x7FFFFFFFFFFFFFFFLL)|| (result = -[PLAssetContainerDataSource globalIndexForIndexPath:](self, "globalIndexForIndexPath:", objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12, v11)), self->_lastAssetCollectionIndex = v11, result == 0x7FFFFFFFFFFFFFFFLL))
      {
LABEL_15:
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
        v14 = -[PHFetchResult countByEnumeratingWithState:objects:count:](assetCollectionsFetchResult, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = 0;
          v18 = *(_QWORD *)v24;
          while (2)
          {
            v19 = 0;
            v20 = v16;
            v16 += v15;
            do
            {
              if (*(_QWORD *)v24 != v18)
                objc_enumerationMutation(assetCollectionsFetchResult);
              v21 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19)), "indexOfObject:", a3);
              if (v21 != 0x7FFFFFFFFFFFFFFFLL)
              {
                result = v21 + v17;
                self->_lastAssetCollectionIndex = v20;
                return result;
              }
              v22 = self->_containerCounts[v20++];
              v17 += v22;
              ++v19;
            }
            while (v15 != v19);
            v15 = -[PHFetchResult countByEnumeratingWithState:objects:count:](assetCollectionsFetchResult, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            result = 0x7FFFFFFFFFFFFFFFLL;
            if (v15)
              continue;
            break;
          }
        }
        else
        {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
  }
  return result;
}

- (unint64_t)indexOffsetForAssetContainerAtAssetIndex:(unint64_t)a3
{
  NSUInteger v5;
  NSUInteger v6;
  unint64_t result;
  unint64_t *containerCounts;
  uint64_t v9;
  unint64_t v10;

  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v5 = -[PHFetchResult count](self->_assetCollectionsFetchResult, "count");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  result = 0;
  containerCounts = self->_containerCounts;
  while (1)
  {
    v9 = *containerCounts++;
    v10 = v9 + result;
    if (v9 + result > a3)
      break;
    result = v10;
    if (!--v6)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)assetWithObjectID:(id)a3
{
  id result;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v7[0] = a3;
  result = (id)objc_msgSend((id)objc_msgSend((id)pl_appPhotoLibrary(), "fetchPHObjectsForOIDs:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1)), "lastObject");
  if (result)
  {
    v6 = result;
    if (-[PLAssetContainerDataSource assetContainerForAsset:](self, "assetContainerForAsset:", result))
      return v6;
    else
      return 0;
  }
  return result;
}

- (id)assetsInAssetCollectionAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndex:](self->_assetCollectionsFetchResult, "objectAtIndex:", a3));
}

- (id)newAssetsFetchResults
{
  return (id)-[NSMutableDictionary copy](self->_assetsFetchResultByAssetCollection, "copy");
}

- (id)assetsInAssetCollection:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", a3);
}

- (id)assetAtIndexPath:(id)a3
{
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  return -[PLAssetContainerDataSource assetInAssetContainer:atIndex:](self, "assetInAssetContainer:atIndex:", -[PHFetchResult objectAtIndex:](self->_assetCollectionsFetchResult, "objectAtIndex:", objc_msgSend(a3, "section")), objc_msgSend(a3, "item"));
}

- (id)indexPathOfAsset:(id)a3
{
  id result;
  uint64_t v6;
  unint64_t lastAssetCollectionIndex;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  PHFetchResult *assetCollectionsFetchResult;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  result = -[PLAssetContainerDataSource allAssetsCount](self, "allAssetsCount");
  if (result)
  {
    if (self->_lastAssetCollectionIndex == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_15;
    v6 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:")), "indexOfObject:", a3);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL
      || (result = (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, self->_lastAssetCollectionIndex)) == 0)
    {
      lastAssetCollectionIndex = self->_lastAssetCollectionIndex;
      if (lastAssetCollectionIndex)
      {
        v8 = lastAssetCollectionIndex - 1;
        v9 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:", lastAssetCollectionIndex - 1)), "indexOfObject:", a3);
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v8 = self->_lastAssetCollectionIndex;
        }
        else
        {
          result = (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, v8);
          self->_lastAssetCollectionIndex = v8;
          if (result)
            return result;
        }
      }
      else
      {
        v8 = 0;
      }
      if (v8 >= -[PHFetchResult count](self->_assetCollectionsFetchResult, "count") - 1
        || (v10 = self->_lastAssetCollectionIndex + 1,
            v11 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:", v10)), "indexOfObject:", a3), v11 == 0x7FFFFFFFFFFFFFFFLL)|| (result = (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, v10), self->_lastAssetCollectionIndex = v10, !result))
      {
LABEL_15:
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
        result = (id)-[PHFetchResult countByEnumeratingWithState:objects:count:](assetCollectionsFetchResult, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (result)
        {
          v13 = (char *)result;
          v14 = 0;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            v16 = 0;
            v17 = &v13[(_QWORD)v14];
            do
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(assetCollectionsFetchResult);
              v18 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16)), "indexOfObject:", a3);
              if (v18 != 0x7FFFFFFFFFFFFFFFLL)
              {
                result = (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v18, &v16[(_QWORD)v14]);
                self->_lastAssetCollectionIndex = (unint64_t)&v16[(_QWORD)v14];
                return result;
              }
              ++v16;
            }
            while (v13 != v16);
            v13 = (char *)-[PHFetchResult countByEnumeratingWithState:objects:count:](assetCollectionsFetchResult, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            result = 0;
            v14 = v17;
            if (v13)
              continue;
            break;
          }
        }
      }
    }
  }
  return result;
}

- (id)assetContainerAtIndex:(unint64_t)a3
{
  return -[PHFetchResult objectAtIndex:](self->_assetCollectionsFetchResult, "objectAtIndex:", a3);
}

- (unint64_t)indexOfContainer:(id)a3
{
  return -[PHFetchResult indexOfObject:](self->_assetCollectionsFetchResult, "indexOfObject:", a3);
}

- (id)firstAssetIndexPath
{
  NSUInteger v3;
  uint64_t v4;

  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  if (!self->_allAssetsCount)
    return 0;
  v3 = -[PHFetchResult count](self->_assetCollectionsFetchResult, "count");
  if (!v3)
    return 0;
  v4 = 0;
  while (!self->_containerCounts[v4])
  {
    if (v3 == ++v4)
      return 0;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0);
}

- (id)lastAssetIndexPath
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  if (!self->_allAssetsCount)
    return 0;
  v3 = -[PHFetchResult count](self->_assetCollectionsFetchResult, "count");
  if (!v3)
    return 0;
  v4 = v3 - 1;
  while (1)
  {
    v5 = self->_containerCounts[v4];
    if (v5)
      break;
    if (--v4 == -1)
      return 0;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5 - 1);
}

- (BOOL)hasAssetAtIndexPath:(id)a3
{
  BOOL result;
  unint64_t v6;

  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  result = 0;
  if (a3 && self->_allAssetsCount)
  {
    v6 = objc_msgSend(a3, "section");
    return v6 < -[PHFetchResult count](self->_assetCollectionsFetchResult, "count")
        && objc_msgSend(a3, "row") < self->_containerCounts[v6];
  }
  return result;
}

- (id)findNearestIndexPath:(id)a3 preferNext:(BOOL)a4
{
  _BOOL4 v4;
  id result;
  unint64_t v8;

  v4 = a4;
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  result = 0;
  if (!a3 || !self->_allAssetsCount)
    return result;
  v8 = objc_msgSend(a3, "section");
  if (v8 >= -[PHFetchResult count](self->_assetCollectionsFetchResult, "count"))
  {
    result = -[PLAssetContainerDataSource lastAssetIndexPath](self, "lastAssetIndexPath");
    if (result)
      return result;
    return -[PLAssetContainerDataSource firstAssetIndexPath](self, "firstAssetIndexPath");
  }
  if (objc_msgSend(a3, "row") < self->_containerCounts[v8])
    return a3;
  if (!v4
    || (result = -[PLAssetContainerDataSource incrementAssetIndexPath:insideCurrentAssetContainer:andWrap:](self, "incrementAssetIndexPath:insideCurrentAssetContainer:andWrap:", a3, 0, 0)) == 0)
  {
    result = -[PLAssetContainerDataSource decrementAssetIndexPath:insideCurrentAssetContainer:andWrap:](self, "decrementAssetIndexPath:insideCurrentAssetContainer:andWrap:", a3, 0, 0);
    if (!result)
      return -[PLAssetContainerDataSource firstAssetIndexPath](self, "firstAssetIndexPath");
  }
  return result;
}

- (unint64_t)_indexOfNextNonEmptyAssetContainerAfterContainerIndex:(unint64_t)a3 wrap:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v11;

  v4 = a4;
  v7 = -[PHFetchResult count](self->_assetCollectionsFetchResult, "count");
  if (v7 >= 2)
  {
    v8 = v7;
    v9 = a3 + 1;
    v10 = v7 - 1;
    do
    {
      v11 = v9 % v8;
      if (v9 % v8 < a3 && !v4)
        break;
      if (-[PLAssetContainerDataSource assetCountForContainerAtIndex:](self, "assetCountForContainerAtIndex:", v9 % v8))
        return v11;
      ++v9;
      --v10;
    }
    while (v10);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_indexOfPreviousNonEmptyAssetContainerBeforeContainerIndex:(unint64_t)a3 wrap:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t i;
  NSUInteger v11;

  v4 = a4;
  v7 = -[PHFetchResult count](self->_assetCollectionsFetchResult, "count");
  if (v7 >= 2)
  {
    v8 = v7;
    v9 = a3 - 1;
    for (i = 1; v8 != i; ++i)
    {
      v11 = i >= a3 ? v8 : 0;
      if (v11 + v9 > a3 && !v4)
        break;
      if (-[PLAssetContainerDataSource assetCountForContainerAtIndex:](self, "assetCountForContainerAtIndex:"))
        return v11 + v9;
      --v9;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)incrementAssetIndexPath:(id)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v5 = a5;
  v6 = a4;
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v9 = objc_msgSend(a3, "section");
  v10 = objc_msgSend(a3, "item") + 1;
  v11 = -[PLAssetContainerDataSource assetCountForContainerAtIndex:](self, "assetCountForContainerAtIndex:", v9);
  v12 = v11;
  if (v6)
  {
    if (!v11)
      return 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5)
      v13 = 0;
    if (v10 >= v11)
      v10 = v13;
LABEL_12:
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, v9);
    return 0;
  }
  if (!-[PLAssetContainerDataSource allAssetsCount](self, "allAssetsCount"))
    return 0;
  if (v10 < v12)
    goto LABEL_12;
  v14 = -[PLAssetContainerDataSource _indexOfNextNonEmptyAssetContainerAfterContainerIndex:wrap:](self, "_indexOfNextNonEmptyAssetContainerAfterContainerIndex:wrap:", v9, v5);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v9 = v14;
  v10 = 0;
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, v9);
}

- (id)decrementAssetIndexPath:(id)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v5 = a5;
  v6 = a4;
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v9 = objc_msgSend(a3, "section");
  if (objc_msgSend(a3, "item"))
    v10 = objc_msgSend(a3, "item") - 1;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = -[PLAssetContainerDataSource assetCountForContainerAtIndex:](self, "assetCountForContainerAtIndex:", v9);
  if (!v6)
  {
    if (-[PLAssetContainerDataSource allAssetsCount](self, "allAssetsCount"))
    {
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, v9);
      v12 = -[PLAssetContainerDataSource _indexOfPreviousNonEmptyAssetContainerBeforeContainerIndex:wrap:](self, "_indexOfPreviousNonEmptyAssetContainerBeforeContainerIndex:wrap:", v9, v5);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = v12;
        v11 = -[PLAssetContainerDataSource assetCountForContainerAtIndex:](self, "assetCountForContainerAtIndex:", v12);
        goto LABEL_15;
      }
    }
    return 0;
  }
  if (!v11)
    return 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, v9);
  if (!v5)
    return 0;
LABEL_15:
  v10 = v11 - 1;
  if (v11 == 0x8000000000000000)
    return 0;
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, v9);
}

- (unint64_t)assetCountForContainer:(id)a3
{
  unint64_t v5;
  NSUInteger v6;

  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    v6 = -[PHFetchResult indexOfObject:](self->_assetCollectionsFetchResult, "indexOfObject:", a3);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      return self->_containerCounts[v6];
  }
  return v5;
}

- (unint64_t)assetCountForContainerAtIndex:(unint64_t)a3
{
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  return self->_containerCounts[a3];
}

- (id)assetInAssetContainer:(id)a3 atIndex:(unint64_t)a4
{
  void *v5;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", a3);
  if (objc_msgSend(v5, "count") <= a4)
    return 0;
  else
    return (id)objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
}

- (id)pl_fetchAllAssets
{
  void *v3;
  PHFetchResult *assetCollectionsFetchResult;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_cachedValuesNeedUpdate)
    -[PLAssetContainerDataSource _updateCachedValues](self, "_updateCachedValues");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
  v5 = -[PHFetchResult countByEnumeratingWithState:objects:count:](assetCollectionsFetchResult, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(assetCollectionsFetchResult);
        v9 = -[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0CD1390], "pl_managedAssetsForAssets:", v9));
      }
      v6 = -[PHFetchResult countByEnumeratingWithState:objects:count:](assetCollectionsFetchResult, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)viewControllerPhotoLibraryDidChange:(id)a3
{
  PLAssetContainerDataSource *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  PLAssetContainerDataSource *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v4 = self;
  v46 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "changeDetailsForFetchResult:", -[PLAssetContainerDataSource assetCollectionsFetchResult](self, "assetCollectionsFetchResult"));
  v6 = v5 != 0;
  if (v5)
  {
    v7 = v5;
    v8 = (void *)objc_msgSend(v5, "fetchResultAfterChanges");
    v9 = (void *)objc_msgSend(v7, "insertedObjects");
    v10 = (void *)objc_msgSend(v7, "removedObjects");
    v30 = v8;
    if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
    {
      v11 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v4->_assetsFetchResultByAssetCollection, "mutableCopy", v4);
      -[NSMutableDictionary removeObjectsForKeys:](v11, "removeObjectsForKeys:", v10);
      v12 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "firstObject"), "photoLibrary"), "librarySpecificFetchOptions");
      objc_msgSend(v12, "setIncludeHiddenAssets:", 1);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v40 != v15)
              objc_enumerationMutation(v9);
            -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i), v12), *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          }
          v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v14);
      }
      v4 = v29;
      if (v11)
        goto LABEL_15;
    }
    else if ((objc_msgSend(v7, "hasIncrementalChanges") & 1) == 0)
    {
      v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v24 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "firstObject"), "photoLibrary"), "librarySpecificFetchOptions");
      objc_msgSend(v24, "setIncludeHiddenAssets:", 1);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v25 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v36 != v27)
              objc_enumerationMutation(v8);
            -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), v24), *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
          }
          v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v26);
      }
      goto LABEL_26;
    }
  }
  else
  {
    v30 = 0;
  }
  v11 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v4->_assetsFetchResultByAssetCollection, "mutableCopy");
LABEL_15:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = (void *)-[NSMutableDictionary allKeys](v11, "allKeys");
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k);
        v23 = (void *)objc_msgSend(a3, "changeDetailsForFetchResult:", -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v22));
        if (v23)
        {
          -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", objc_msgSend(v23, "fetchResultAfterChanges"), v22);
          v6 = 1;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v19);
  }
  if (!v6)
  {

    return;
  }
  v8 = v30;
LABEL_26:
  if (v11)
  {

    v4->_assetsFetchResultByAssetCollection = v11;
  }
  if (v8)
  {

    v4->_assetCollectionsFetchResult = (PHFetchResult *)v8;
  }
  -[PLAssetContainerDataSource _updateCachedValues](v4, "_updateCachedValues");
}

- (NSString)description
{
  id v3;
  PHFetchResult *assetCollectionsFetchResult;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PLAssetContainerDataSource;
  v3 = (id)-[NSString mutableCopy](-[PLAssetContainerDataSource description](&v16, sel_description), "mutableCopy");
  objc_msgSend(v3, "appendFormat:", CFSTR(" containing %ld containers with %ld total assets (last container index %ld)"), -[PHFetchResult count](self->_assetCollectionsFetchResult, "count"), self->_allAssetsCount, self->_lastAssetCollectionIndex);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
  v5 = -[PHFetchResult countByEnumeratingWithState:objects:count:](assetCollectionsFetchResult, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(assetCollectionsFetchResult);
        v7 = v10 + 1;
        objc_msgSend(v3, "appendFormat:", CFSTR("\n%@: %ld assets [%ld]"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)), "count"), self->_containerCounts[v10]);
        ++v9;
        ++v10;
      }
      while (v6 != v9);
      v6 = -[PHFetchResult countByEnumeratingWithState:objects:count:](assetCollectionsFetchResult, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }
  return (NSString *)(id)objc_msgSend(v3, "copy");
}

- (PHFetchResult)assetCollectionsFetchResult
{
  return self->_assetCollectionsFetchResult;
}

@end
