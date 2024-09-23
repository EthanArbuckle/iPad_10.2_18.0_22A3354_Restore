@implementation PLAggregateAlbumList

- (PLAggregateAlbumList)initWithFilter:(int)a3 inPhotoLibrary:(id)a4
{
  uint64_t v4;
  id v6;
  PLAggregateAlbumList *v7;
  uint64_t v8;
  NSMutableOrderedSet *childAlbumLists;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLAggregateAlbumList;
  v7 = -[PLAggregateAlbumList init](&v16, sel_init);
  if (v7)
  {
    v8 = objc_opt_new();
    childAlbumLists = v7->_childAlbumLists;
    v7->_childAlbumLists = (NSMutableOrderedSet *)v8;

    -[PLAggregateAlbumList setFilter:](v7, "setFilter:", v4);
    +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 5; ++i)
    {
      switch(__albumListTypes[i])
      {
        case 0:
          +[PLManagedAlbumList albumListInPhotoLibrary:](PLManagedAlbumList, "albumListInPhotoLibrary:", v6);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 1:
          +[PLManagedAlbumList eventListInPhotoLibrary:](PLManagedAlbumList, "eventListInPhotoLibrary:", v6);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 2:
          +[PLManagedAlbumList facesAlbumListInPhotoLibrary:](PLManagedAlbumList, "facesAlbumListInPhotoLibrary:", v6);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 3:
          +[PLManagedAlbumList placesAlbumListInPhotoLibrary:](PLManagedAlbumList, "placesAlbumListInPhotoLibrary:", v6);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 4:
          +[PLManagedAlbumList allStreamedAlbumsListInPhotoLibrary:](PLManagedAlbumList, "allStreamedAlbumsListInPhotoLibrary:", v6);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 7:
          +[PLManagedAlbumList importListInPhotoLibrary:](PLManagedAlbumList, "importListInPhotoLibrary:", v6);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 10:
          +[PLManagedAlbumList scenesAlbumListInPhotoLibrary:](PLManagedAlbumList, "scenesAlbumListInPhotoLibrary:", v6);
          v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
          v13 = (void *)v12;
          if (v12)
          {
            +[PLFilteredAlbumList filteredAlbumList:filter:](PLFilteredAlbumList, "filteredAlbumList:filter:", v12, v4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableOrderedSet addObject:](v7->_childAlbumLists, "addObject:", v14);
            objc_msgSend(v10, "addAssetContainerListChangeObserver:containerList:", v7, v14);

          }
          break;
        default:
          continue;
      }
    }

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableOrderedSet *childAlbumLists;
  NSMutableOrderedSet *allAlbums;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_childAlbumLists;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeAssetContainerListChangeObserver:containerList:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  childAlbumLists = self->_childAlbumLists;
  self->_childAlbumLists = 0;

  allAlbums = self->_allAlbums;
  self->_allAlbums = 0;

  v11.receiver = self;
  v11.super_class = (Class)PLAggregateAlbumList;
  -[PLAggregateAlbumList dealloc](&v11, sel_dealloc);
}

- (void)_invalidateAllAlbums
{
  NSMutableOrderedSet *allAlbums;

  allAlbums = self->_allAlbums;
  self->_allAlbums = 0;

}

- (void)assetContainerListDidChange:(id)a3
{
  id v4;
  void *v5;
  NSMutableOrderedSet *childAlbumLists;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableOrderedSet *allAlbums;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  objc_msgSend(v4, "albumList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  childAlbumLists = self->_childAlbumLists;
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__PLAggregateAlbumList_assetContainerListDidChange___block_invoke;
  v22[3] = &unk_1E366E278;
  v8 = v5;
  v23 = v8;
  v24 = &v25;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](childAlbumLists, "enumerateObjectsUsingBlock:", v22);
  +[PLAggregateAlbumListChangeNotification notificationForAggregateAlbumList:fromAlbumListChangeNotification:indexOffset:](PLAggregateAlbumListChangeNotification, "notificationForAggregateAlbumList:fromAlbumListChangeNotification:indexOffset:", self, v4, v26[3]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __52__PLAggregateAlbumList_assetContainerListDidChange___block_invoke_2;
  v17[3] = &unk_1E366E2A0;
  v17[4] = &v18;
  objc_msgSend(v9, "enumerateMovesWithBlock:", v17);
  if ((objc_msgSend(v4, "shouldReload") & 1) != 0 || *((_BYTE *)v19 + 24))
  {
    -[PLAggregateAlbumList willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("albums"));
    -[PLAggregateAlbumList _invalidateAllAlbums](self, "_invalidateAllAlbums");
    -[PLAggregateAlbumList didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("albums"));
  }
  else
  {
    v11 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(v9, "deletedIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      -[PLAggregateAlbumList willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3, v12, CFSTR("albums"));
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_allAlbums, "removeObjectsAtIndexes:", v12);
      -[PLAggregateAlbumList didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3, v12, CFSTR("albums"));
    }
    objc_msgSend(v9, "insertedIndexes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      -[PLAggregateAlbumList willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2, v13, CFSTR("albums"));
      allAlbums = self->_allAlbums;
      objc_msgSend(v9, "insertedObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet insertObjects:atIndexes:](allAlbums, "insertObjects:atIndexes:", v15, v13);

      -[PLAggregateAlbumList didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2, v13, CFSTR("albums"));
    }
    objc_msgSend(v9, "changedIndexes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      -[PLAggregateAlbumList willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 1, v16, CFSTR("albums"));
      -[PLAggregateAlbumList didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 1, v16, CFSTR("albums"));
    }

    objc_autoreleasePoolPop(v11);
  }
  +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enqueueNotification:", v9);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v25, 8);

}

- (id)identifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
}

- (id)albums
{
  NSMutableOrderedSet *allAlbums;
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableOrderedSet *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  allAlbums = self->_allAlbums;
  if (!allAlbums)
  {
    v4 = (NSMutableOrderedSet *)objc_opt_new();
    v5 = self->_allAlbums;
    self->_allAlbums = v4;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_childAlbumLists;
    v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = self->_allAlbums;
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "albums", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableOrderedSet unionOrderedSet:](v11, "unionOrderedSet:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    allAlbums = self->_allAlbums;
  }
  return (id)-[NSMutableOrderedSet mutableCopy](allAlbums, "mutableCopy", (_QWORD)v14);
}

- (unint64_t)albumsCount
{
  void *v2;
  unint64_t v3;

  -[PLAggregateAlbumList albums](self, "albums");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)hasAtLeastOneAlbum
{
  return -[PLAggregateAlbumList albumsCount](self, "albumsCount") != 0;
}

- (unint64_t)unreadAlbumsCount
{
  return 0;
}

- (id)managedObjectContext
{
  void *v2;
  void *v3;

  -[NSMutableOrderedSet lastObject](self->_childAlbumLists, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (signed)albumListType
{
  return 5;
}

- (BOOL)canEditAlbums
{
  return 0;
}

- (BOOL)isFolder
{
  return 0;
}

- (BOOL)albumHasFixedOrder:(id)a3
{
  return 1;
}

- (id)albumsSortingComparator
{
  return 0;
}

- (BOOL)needsReordering
{
  return 0;
}

- (id)photoLibrary
{
  void *v2;
  void *v3;

  -[NSMutableOrderedSet lastObject](self->_childAlbumLists, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)_prettyDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSMutableOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nAll Albums = \n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_childAlbumLists;
  v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "_prettyDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return (NSString *)v6;
}

- (NSString)_typeDescription
{
  return (NSString *)CFSTR("All Albums");
}

- (BOOL)isEmpty
{
  return !-[PLAggregateAlbumList hasAtLeastOneAlbum](self, "hasAtLeastOneAlbum");
}

- (id)containersRelationshipName
{
  return CFSTR("albums");
}

- (int)filter
{
  return self->_filter;
}

- (void)setFilter:(int)a3
{
  self->_filter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAlbumLists, 0);
  objc_storeStrong((id *)&self->_allAlbums, 0);
}

void __52__PLAggregateAlbumList_assetContainerListDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;

  if (*(void **)(a1 + 32) == a2)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(a2, "albums");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v5, "count");

  }
}

uint64_t __52__PLAggregateAlbumList_assetContainerListDidChange___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

+ (PLAggregateAlbumList)albumListWithFilter:(int)a3 inPhotoLibrary:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFilter:inPhotoLibrary:", v4, v6);

  return (PLAggregateAlbumList *)v7;
}

@end
