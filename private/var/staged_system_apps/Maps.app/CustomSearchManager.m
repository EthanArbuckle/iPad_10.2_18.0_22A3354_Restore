@implementation CustomSearchManager

+ (id)sharedManager
{
  if (qword_1014D1ED8 != -1)
    dispatch_once(&qword_1014D1ED8, &stru_1011AEDE8);
  return (id)qword_1014D1ED0;
}

- (CustomSearchManager)init
{
  CustomSearchManager *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CustomSearchManager;
  v2 = -[CustomSearchManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SearchResult removeObserver:forKeyPath:](self->_customSearchResult, "removeObserver:forKeyPath:", self, kAnnotationCoordinateKey);
  -[SearchResult removeObserver:forKeyPath:](self->_customSearchResult, "removeObserver:forKeyPath:", self, CFSTR("reverseGeocoded"));
  v3.receiver = self;
  v3.super_class = (Class)CustomSearchManager;
  -[CustomSearchManager dealloc](&v3, "dealloc");
}

- (SearchResult)customSearchResult
{
  return self->_customSearchResult;
}

- (void)setCustomSearchResult:(id)a3 animated:(BOOL)a4 shouldSelectOnMap:(id)a5
{
  -[CustomSearchManager setCustomSearchResult:animated:shouldSelectOnMap:context:](self, "setCustomSearchResult:animated:shouldSelectOnMap:context:", a3, a4, a5, 0);
}

- (void)setCustomSearchResult:(id)a3 animated:(BOOL)a4 shouldSelectOnMap:(id)a5 context:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  SearchResult **p_customSearchResult;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  p_customSearchResult = &self->_customSearchResult;
  if (!-[SearchResult isEqualToSearchResult:forPurpose:](self->_customSearchResult, "isEqualToSearchResult:forPurpose:", v11, 5))
  {
    if (*p_customSearchResult)
    {
      -[SearchResult removeObserver:forKeyPath:](*p_customSearchResult, "removeObserver:forKeyPath:", self, kAnnotationCoordinateKey);
      -[SearchResult removeObserver:forKeyPath:](self->_customSearchResult, "removeObserver:forKeyPath:", self, CFSTR("reverseGeocoded"));
    }
    objc_storeStrong((id *)&self->_customSearchResult, a3);
    if (*p_customSearchResult)
    {
      -[SearchResult addObserver:forKeyPath:options:context:](*p_customSearchResult, "addObserver:forKeyPath:options:context:", self, kAnnotationCoordinateKey, 0, 0);
      -[SearchResult addObserver:forKeyPath:options:context:](self->_customSearchResult, "addObserver:forKeyPath:options:context:", self, CFSTR("reverseGeocoded"), 0, 0);
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects", 0));
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "customSearchManager:didReplaceCustomSearchResult:animated:shouldSelectOnMap:context:", self, v11, v8, v12, v13);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }

  }
}

- (BOOL)isCustomSearchResult:(id)a3
{
  return a3 && self->_customSearchResult == a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v8 = a3;
  v9 = v8;
  if (self->_customSearchResult == a4)
  {
    v10 = kAnnotationCoordinateKey;
    if ((objc_msgSend(v8, "isEqualToString:", kAnnotationCoordinateKey) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", CFSTR("reverseGeocoded")))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects", 0));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "customSearchManager:didModifyCustomSearchResult:coordinateChanged:", self, self->_customSearchResult, objc_msgSend(v9, "isEqualToString:", v10));
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
  }

}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSearchResult, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
