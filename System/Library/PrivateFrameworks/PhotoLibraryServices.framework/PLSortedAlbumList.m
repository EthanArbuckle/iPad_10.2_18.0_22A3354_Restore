@implementation PLSortedAlbumList

- (PLSortedAlbumList)initWithAlbumList:(id)a3 sortComparator:(id)a4
{
  id v6;
  id v7;
  PLSortedAlbumList *v8;
  PLSortedAlbumList *v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLSortedAlbumList;
  v8 = -[PLSortedAlbumList init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PLSortedAlbumList setBackingAlbumList:](v8, "setBackingAlbumList:", v6);
    -[PLSortedAlbumList setSortComparator:](v9, "setSortComparator:", v7);
    -[PLSortedAlbumList backingAlbumList](v9, "backingAlbumList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EE3BE5B8);

    if (v11)
    {
      -[PLSortedAlbumList backingAlbumList](v9, "backingAlbumList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "registerDerivedAlbumList:", v9);

    }
  }

  return v9;
}

- (void)dealloc
{
  __CFArray *toBackingMap;
  __CFArray *fromBackingMap;
  id sortComparator;
  objc_super v6;

  toBackingMap = self->_toBackingMap;
  if (toBackingMap)
    CFRelease(toBackingMap);
  fromBackingMap = self->_fromBackingMap;
  if (fromBackingMap)
    CFRelease(fromBackingMap);
  sortComparator = self->_sortComparator;
  self->_sortComparator = 0;

  v6.receiver = self;
  v6.super_class = (Class)PLSortedAlbumList;
  -[PLSortedAlbumList dealloc](&v6, sel_dealloc);
}

- (id)identifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
}

- (id)albums
{
  void *v3;
  void *v4;

  -[PLSortedAlbumList _albums](self, "_albums");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PLSortedAlbumList mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("sortedAlbums"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSortedAlbumList set_albums:](self, "set_albums:", v4);

  }
  return -[PLSortedAlbumList _albums](self, "_albums");
}

- (unint64_t)albumsCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albums");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int)filter
{
  void *v2;
  int v3;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "filter");

  return v3;
}

- (BOOL)hasAtLeastOneAlbum
{
  void *v2;
  char v3;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAtLeastOneAlbum");

  return v3;
}

- (unint64_t)unreadAlbumsCount
{
  void *v2;
  unint64_t v3;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unreadAlbumsCount");

  return v3;
}

- (id)managedObjectContext
{
  void *v2;
  void *v3;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (signed)albumListType
{
  void *v2;
  signed __int16 v3;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "albumListType");

  return v3;
}

- (BOOL)canEditAlbums
{
  void *v2;
  char v3;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canEditAlbums");

  return v3;
}

- (BOOL)isFolder
{
  void *v2;
  char v3;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFolder");

  return v3;
}

- (BOOL)albumHasFixedOrder:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "albumHasFixedOrder:", v4);

  return v6;
}

- (id)albumsSortingComparator
{
  void *v2;
  void *v3;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albumsSortingComparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setNeedsReordering
{
  id v2;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsReordering");

}

- (BOOL)needsReordering
{
  void *v2;
  char v3;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsReordering");

  return v3;
}

- (void)updateAlbumsOrderIfNeeded
{
  id v2;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAlbumsOrderIfNeeded");

}

- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preheatAlbumsForProperties:relationships:", v7, v6);

}

- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v8 = (objc_class *)MEMORY[0x1E0CB3788];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__PLSortedAlbumList_preheatAlbumsAtIndexes_forProperties_relationships___block_invoke;
  v15[3] = &unk_1E3675358;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v15);

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preheatAlbumsAtIndexes:forProperties:relationships:", v14, v10, v9);

}

- (id)photoLibrary
{
  void *v2;
  void *v3;

  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)_typeDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_typeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nBacking album list = %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)_prettyDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nBacking album list = %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isEmpty
{
  return !-[PLSortedAlbumList hasAtLeastOneAlbum](self, "hasAtLeastOneAlbum");
}

- (id)containersRelationshipName
{
  return CFSTR("albums");
}

- (void)createSortedIndexesMap
{
  unint64_t v4;
  unint64_t v5;
  const void **v6;
  const void **v7;
  const void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  CFIndex v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PLSortedAlbumList *v20;
  SEL v21;
  const void **v22;

  if (!self->_toBackingMap)
  {
    v4 = -[PLSortedAlbumList albumsCount](self, "albumsCount");
    if (v4)
    {
      v5 = v4;
      v6 = (const void **)malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
      v7 = v6;
      for (i = 0; i != (const void *)v5; i = (char *)i + 1)
        v6[(_QWORD)i] = i;
      -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "albums");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLSortedAlbumList sortComparator](self, "sortComparator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v11, "sortedArrayWithOptions:usingComparator:", 16, v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = v11;
      }
      v14 = v13;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __43__PLSortedAlbumList_createSortedIndexesMap__block_invoke;
      v18[3] = &unk_1E3673A48;
      v17 = v11;
      v19 = v17;
      v20 = self;
      v21 = a2;
      v22 = v7;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);
      v15 = 0;
      self->_toBackingMap = CFArrayCreate(0, v7, v5, 0);
      if (v5 <= 1)
        v16 = 1;
      else
        v16 = v5;
      do
      {
        v7[(_QWORD)CFArrayGetValueAtIndex(self->_toBackingMap, v15)] = (const void *)v15;
        ++v15;
      }
      while (v16 != v15);
      self->_fromBackingMap = CFArrayCreate(0, v7, v5, 0);
      free(v7);

    }
  }
}

- (NSMutableOrderedSet)_albums
{
  return (NSMutableOrderedSet *)objc_loadWeakRetained((id *)&self->_weak_albums);
}

- (void)set_albums:(id)a3
{
  objc_storeWeak((id *)&self->_weak_albums, a3);
}

- (unint64_t)indexInSortedAlbumsOfObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CFIndex v7;
  unint64_t result;
  PLSortedAlbumList *v9;
  const __CFArray *fromBackingMap;

  v4 = a3;
  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = self;
    -[PLSortedAlbumList createSortedIndexesMap](v9, "createSortedIndexesMap");
    fromBackingMap = v9->_fromBackingMap;

    if (fromBackingMap)
      return (unint64_t)CFArrayGetValueAtIndex(fromBackingMap, v7);
    else
      return 0;
  }
  return result;
}

- (id)objectInSortedAlbumsAtIndex:(unint64_t)a3
{
  const void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = backingIndexForIndex(self, a3);
  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)insertObject:(id)a3 inSortedAlbumsAtIndex:(unint64_t)a4
{
  id v6;
  const void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = backingIndexForIndex(self, a4);
  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "albums");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertObject:atIndex:", v6, v7);

}

- (void)removeObjectFromSortedAlbumsAtIndex:(unint64_t)a3
{
  const void *v4;
  void *v5;
  id v6;

  v4 = backingIndexForIndex(self, a3);
  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "albums");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectAtIndex:", v4);

}

- (void)replaceObjectInSortedAlbumsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  const void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = backingIndexForIndex(self, a3);
  -[PLSortedAlbumList backingAlbumList](self, "backingAlbumList");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "albums");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v7, v6);

}

- (NSObject)cachedIndexMapState
{
  __CFArray *fromBackingMap;
  __CFArray *v3;

  fromBackingMap = self->_fromBackingMap;
  if (fromBackingMap)
    v3 = fromBackingMap;
  return fromBackingMap;
}

- (BOOL)mappedDataSourceChanged:(id)a3 remoteNotificationData:(id)a4
{
  __CFArray *toBackingMap;
  __CFArray *fromBackingMap;

  -[PLSortedAlbumList set_albums:](self, "set_albums:", 0, a4);
  toBackingMap = self->_toBackingMap;
  if (toBackingMap)
  {
    CFRelease(toBackingMap);
    self->_toBackingMap = 0;
  }
  fromBackingMap = self->_fromBackingMap;
  if (fromBackingMap)
  {
    CFRelease(fromBackingMap);
    self->_fromBackingMap = 0;
  }
  return 1;
}

- (Class)derivedChangeNotificationClass
{
  return (Class)objc_opt_class();
}

- (PLAlbumContainer)backingAlbumList
{
  return self->_backingAlbumList;
}

- (void)setBackingAlbumList:(id)a3
{
  objc_storeStrong((id *)&self->_backingAlbumList, a3);
}

- (id)sortComparator
{
  return self->_sortComparator;
}

- (void)setSortComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weak_albums);
  objc_storeStrong(&self->_sortComparator, 0);
  objc_storeStrong((id *)&self->_backingAlbumList, 0);
}

void __43__PLSortedAlbumList_createSortedIndexesMap__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:", a2);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("PLSortedAlbumList.m"), 258, &stru_1E36789C0);

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * a3) = v5;
}

uint64_t __72__PLSortedAlbumList_preheatAlbumsAtIndexes_forProperties_relationships___block_invoke(uint64_t a1, CFIndex a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "addIndex:", backingIndexForIndex(*(void **)(a1 + 32), a2));
}

@end
