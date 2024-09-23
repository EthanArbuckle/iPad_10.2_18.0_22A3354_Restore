@implementation PLManagedAlbumList

- (unint64_t)unreadAlbumsCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CloudSharedAlbum"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3880];
  -[PLManagedAlbumList objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%@ IN albumLists"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudNotificationsEnabled == YES"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("hasUnseenContent == YES"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v21[0] = v6;
  v21[1] = v7;
  v21[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setPredicate:", v11);
  -[PLManagedAlbumList managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13 = objc_msgSend(v12, "countForFetchRequest:error:", v3, &v18);
  v14 = v18;

  if (v14)
  {
    PLMigrationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch unread albums count: %@", buf, 0xCu);

    }
  }

  return v13;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    pl_dispatch_once();
}

+ (id)_albumListWithType:(signed __int16)a3 inManagedObjectContext:(id)a4
{
  int v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x19AEC1554]();
  v8 = objc_alloc(MEMORY[0x1E0C97B48]);
  objc_msgSend(a1, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntityName:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier = %d"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);
  v17 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v10, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (v12)
  {
    objc_msgSend(v12, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLMigrationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Error fetching album list: %@", buf, 0xCu);
    }

    v14 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v14;
}

- (void)unregisterAllDerivedAlbums
{
  uint64_t v2;
  PLIndexMappingCache **derivedAlbumLists;

  v2 = 0;
  derivedAlbumLists = self->_derivedAlbumLists;
  do
    objc_storeWeak((id *)&derivedAlbumLists[v2++], 0);
  while (v2 != 5);
}

- (void)registerDerivedAlbumList:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PLIndexMappingCache **derivedAlbumLists;
  id WeakRetained;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = 0;
  derivedAlbumLists = self->_derivedAlbumLists;
  do
  {
    WeakRetained = objc_loadWeakRetained((id *)&derivedAlbumLists[v6]);

    if (!WeakRetained)
    {
      objc_storeWeak((id *)&derivedAlbumLists[v6], v4);
      goto LABEL_8;
    }
    ++v6;
  }
  while (v6 != 5);
  PLMigrationGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 134217984;
    v11 = 5;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "More than maximum %ld derived album lists trying to register. This will fail.", (uint8_t *)&v10, 0xCu);
  }

LABEL_8:
  objc_autoreleasePoolPop(v5);

}

- (void)dealloc
{
  objc_super v3;

  -[PLManagedAlbumList unregisterAllDerivedAlbums](self, "unregisterAllDerivedAlbums");
  v3.receiver = self;
  v3.super_class = (Class)PLManagedAlbumList;
  -[PLManagedAlbumList dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  PLIndexMappingCache **derivedAlbumLists;
  uint64_t i;

  derivedAlbumLists = self->_derivedAlbumLists;
  for (i = 4; i != -1; --i)
    objc_destroyWeak((id *)&derivedAlbumLists[i]);
}

+ (id)_singletonListWithType:(signed __int16)a3 library:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v4 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLManagedAlbumList.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aPhotoLibrary"));

  }
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_albumListWithType:inManagedObjectContext:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v7, "repairSingletonObjects");
    objc_msgSend(a1, "_albumListWithType:inManagedObjectContext:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLManagedAlbumList;
  -[PLManagedAlbumList awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAlbumList setUuid:](self, "setUuid:", v3);

  -[PLManagedAlbumList registerForChanges](self, "registerForChanges");
}

- (void)awakeFromFetch
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLManagedAlbumList;
  -[PLManagedAlbumList awakeFromFetch](&v3, sel_awakeFromFetch);
  -[PLManagedAlbumList registerForChanges](self, "registerForChanges");
}

- (void)willTurnIntoFault
{
  objc_super v3;

  -[PLManagedAlbumList unregisterForChanges](self, "unregisterForChanges");
  v3.receiver = self;
  v3.super_class = (Class)PLManagedAlbumList;
  -[PLManagedAlbumList willTurnIntoFault](&v3, sel_willTurnIntoFault);
}

- (signed)albumListType
{
  void *v2;
  signed __int16 v3;

  -[PLManagedAlbumList identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shortValue");

  return v3;
}

- (void)setAlbumListType:(signed __int16)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLManagedAlbumList setIdentifier:](self, "setIdentifier:", v4);

}

- (NSMutableOrderedSet)albums
{
  void *v3;

  -[PLManagedAlbumList willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("albums"));
  -[PLManagedAlbumList mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("albums"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAlbumList didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("albums"));
  return (NSMutableOrderedSet *)v3;
}

- (id)_albumsCountFetchRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3880];
  -[PLManagedAlbumList objectID](self, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%@ IN albumLists"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  return v5;
}

- (unint64_t)albumsCount
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[PLManagedAlbumList _albumsCountFetchRequest](self, "_albumsCountFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAlbumList managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countForFetchRequest:error:", v3, 0);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

- (BOOL)hasAtLeastOneAlbum
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  if ((-[PLManagedAlbumList hasFaultForRelationshipNamed:](self, "hasFaultForRelationshipNamed:", CFSTR("albums")) & 1) != 0)
  {
    -[PLManagedAlbumList _albumsCountFetchRequest](self, "_albumsCountFetchRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFetchLimit:", 1);
    -[PLManagedAlbumList managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countForFetchRequest:error:", v3, 0);

    v6 = v5 == 0x7FFFFFFFFFFFFFFFLL || v5 == 0;
  }
  else
  {
    -[PLManagedAlbumList albums](self, "albums");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "count") == 0;
  }
  v7 = !v6;

  return v7;
}

- (BOOL)canEditAlbums
{
  return (-[PLManagedAlbumList albumListType](self, "albumListType") & 0xFFFFFFFB) == 0;
}

- (BOOL)isFolder
{
  return 0;
}

- (int)filter
{
  return 0;
}

- (NSString)_prettyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  if (-[PLManagedAlbumList isFault](self, "isFault"))
  {
    -[PLManagedObject shortObjectIDURI](self, "shortObjectIDURI");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[PLManagedObject shortObjectIDURI](self, "shortObjectIDURI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedAlbumList _typeDescription](self, "_typeDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v3);
  return (NSString *)v4;
}

- (NSString)_typeDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "_typeDescriptionForAlbumListType:", -[PLManagedAlbumList albumListType](self, "albumListType"));
}

- (BOOL)isEmpty
{
  return !-[PLManagedAlbumList hasAtLeastOneAlbum](self, "hasAtLeastOneAlbum");
}

- (id)containersRelationshipName
{
  return CFSTR("albums");
}

- (BOOL)albumHasFixedOrder:(id)a3
{
  return +[PLManagedAlbumList albumKindHasFixedOrder:](PLManagedAlbumList, "albumKindHasFixedOrder:", objc_msgSend(a3, "kindValue"));
}

- (id)albumsSortingComparator
{
  return (id)objc_msgSend(&__block_literal_global_23916, "copy");
}

- (void)insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PLManagedAlbumList albums](self, "albums");
    v5 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x2020000000;
    v19 = 0;
    -[PLManagedAlbumList albumsSortingComparator](self, "albumsSortingComparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__PLManagedAlbumList_insertIntoOrderedAlbumsAtIndexByPriorityForAlbum___block_invoke;
    v13[3] = &unk_1E3666C40;
    v7 = v6;
    v15 = v7;
    v8 = v4;
    v14 = v8;
    p_buf = &buf;
    -[NSObject enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v13);
    v9 = -[NSObject indexOfObject:](v5, "indexOfObject:", v8);
    v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v10 >= -[NSObject count](v5, "count"))
        -[NSObject addObject:](v5, "addObject:", v8);
      else
        -[NSObject insertObject:atIndex:](v5, "insertObject:atIndex:", v8, *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
    }
    else if (v9 != v10)
    {
      if (v9 < v10)
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v10 - 1;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject moveObjectsAtIndexes:toIndex:](v5, "moveObjectsAtIndexes:toIndex:", v12, *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));

    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[PLManagedAlbumList uuid](self, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "Attempted to insert nil album into album list: %{public}@", (uint8_t *)&buf, 0xCu);

    }
  }

}

- (void)setNeedsReordering
{
  void *v3;
  char v4;
  id v5;

  -[PLManagedAlbumList needsReorderingNumber](self, "needsReorderingNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PLManagedAlbumList setNeedsReorderingNumber:](self, "setNeedsReorderingNumber:", v5);

  }
}

- (BOOL)needsReordering
{
  void *v2;
  char v3;

  -[PLManagedAlbumList needsReorderingNumber](self, "needsReorderingNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)updateAlbumsOrderIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  -[PLManagedAlbumList needsReorderingNumber](self, "needsReorderingNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    if (-[PLManagedAlbumList albumListType](self, "albumListType") == 4)
    {
      -[PLManagedAlbumList albumsSortingComparator](self, "albumsSortingComparator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedAlbumList albums](self, "albums");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sortWithOptions:usingComparator:", 16, v5);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PLManagedAlbumList setNeedsReorderingNumber:](self, "setNeedsReorderingNumber:", v7);

  }
}

- (void)preheatAlbumsForProperties:(id)a3 relationships:(id)a4
{
  -[PLManagedAlbumList preheatAlbumsAtIndexes:forProperties:relationships:](self, "preheatAlbumsAtIndexes:forProperties:relationships:", 0, a3, a4);
}

- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PLManagedAlbumList hasFaultForRelationshipNamed:](self, "hasFaultForRelationshipNamed:", CFSTR("albums")))
  {
    -[PLManagedAlbumList albums](self, "albums");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v12, "objectsAtIndexes:", v8);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    v14 = objc_alloc(MEMORY[0x1E0C97B48]);
    +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithEntityName:", v15);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v17);

    objc_msgSend(v16, "setIncludesPropertyValues:", 1);
    objc_msgSend(v16, "setReturnsObjectsAsFaults:", 0);
    if (v9)
      objc_msgSend(v16, "setPropertiesToFetch:", v9);
    if (v10)
      objc_msgSend(v16, "setRelationshipKeyPathsForPrefetching:", v10);
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    objc_msgSend(v19, "executeFetchRequest:error:", v16, &v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    if (!v20)
    {
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        -[PLManagedAlbumList uuid](self, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v23;
        v27 = 2112;
        v28 = v21;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Error fetching albums for album list %{public}@: %@", buf, 0x16u);

      }
    }

  }
}

- (void)enumerateDerivedAlbumLists:(id)a3
{
  uint64_t v4;
  PLIndexMappingCache **derivedAlbumLists;
  id WeakRetained;
  void (**v7)(id, id);

  v7 = (void (**)(id, id))a3;
  v4 = 0;
  derivedAlbumLists = self->_derivedAlbumLists;
  do
  {
    WeakRetained = objc_loadWeakRetained((id *)&derivedAlbumLists[v4]);
    if (v7 && WeakRetained)
      v7[2](v7, WeakRetained);

    ++v4;
  }
  while (v4 != 5);

}

- (BOOL)hasDerivedIndexMappers
{
  id WeakRetained;
  id *v5;
  unint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)self->_derivedAlbumLists);

  if (WeakRetained)
    return 1;
  v5 = (id *)&self->_derivedAlbumLists[1];
  v6 = -1;
  while (v6 != 3)
  {
    v7 = objc_loadWeakRetained(v5);

    ++v6;
    ++v5;
    if (v7)
      return v6 < 4;
  }
  v6 = 4;
  return v6 < 4;
}

- (void)registerForChanges
{
  void *v3;

  if (-[PLManagedObject isRegisteredWithUserInterfaceContext](self, "isRegisteredWithUserInterfaceContext"))
  {
    if (!-[PLManagedAlbumList isRegisteredForChanges](self, "isRegisteredForChanges"))
    {
      +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedAlbumList addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v3, CFSTR("albums"), 8, &PLChangeNotificationCenterKVOContext);

      -[PLManagedAlbumList setIsRegisteredForChanges:](self, "setIsRegisteredForChanges:", 1);
    }
  }
}

- (void)unregisterForChanges
{
  void *v3;

  if (-[PLManagedAlbumList isRegisteredForChanges](self, "isRegisteredForChanges"))
  {
    +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedAlbumList removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v3, CFSTR("albums"), &PLChangeNotificationCenterKVOContext);

    -[PLManagedAlbumList setIsRegisteredForChanges:](self, "setIsRegisteredForChanges:", 0);
  }
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLManagedAlbumList;
  -[PLManagedObject willSave](&v10, sel_willSave);
  -[PLManagedAlbumList managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "isDatabaseCreationContext") & 1) == 0)
  {
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PLManagedAlbumList albumListType](self, "albumListType"))
    {
      -[PLManagedAlbumList changedValues](self, "changedValues");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("albums"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (v4)
        {
          +[PLGenericAlbum rootFolderInLibrary:](PLManagedFolder, "rootFolderInLibrary:", v4);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "updatedObjects");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "containsObject:", v7);

          if ((v9 & 1) == 0)
            +[PLManagedAlbumList pushChangesFromAlbumContainer:toAlbumContainer:](PLManagedAlbumList, "pushChangesFromAlbumContainer:toAlbumContainer:", self, v7);

        }
      }
    }

  }
}

- (void)didSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PLManagedAlbumList;
  -[PLManagedAlbumList didSave](&v22, sel_didSave);
  -[PLManagedAlbumList managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "isDatabaseCreationContext") & 1) == 0
    && PLIsAssetsd())
  {
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryServicesManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[PLManagedAlbumList isValidTypeForPersistence:](PLManagedAlbumList, "isValidTypeForPersistence:", -[PLManagedAlbumList albumListType](self, "albumListType"))&& (-[PLManagedAlbumList hasFaultForRelationshipNamed:](self, "hasFaultForRelationshipNamed:", CFSTR("albums")) & 1) == 0)
    {
      objc_msgSend(v5, "modelMigrator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isPostProcessingLightweightMigration"))
      {

LABEL_9:
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        -[PLManagedAlbumList albums](self, "albums", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "uuid");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
                objc_msgSend(v9, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          }
          while (v12);
        }

        v16 = -[PLManagedAlbumList albumListType](self, "albumListType");
        objc_msgSend(v5, "pathManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAlbumList persistAlbumListUUIDs:type:pathManager:allowsOverwrite:](PLManagedAlbumList, "persistAlbumListUUIDs:type:pathManager:allowsOverwrite:", v9, v16, v17, 1);

        goto LABEL_19;
      }
      -[PLManagedAlbumList managedObjectContext](self, "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isInitializingSingletons");

      if ((v8 & 1) == 0)
        goto LABEL_9;
    }
LABEL_19:

  }
}

- (BOOL)isRegisteredForChanges
{
  return self->isRegisteredForChanges;
}

- (void)setIsRegisteredForChanges:(BOOL)a3
{
  self->isRegisteredForChanges = a3;
}

uint64_t __71__PLManagedAlbumList_insertIntoOrderedAlbumsAtIndexByPriorityForAlbum___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (result == -1)
    *a4 = 1;
  else
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return result;
}

uint64_t __45__PLManagedAlbumList_albumsSortingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = +[PLManagedAlbumList priorityForAlbumKind:](PLManagedAlbumList, "priorityForAlbumKind:", objc_msgSend(v4, "kindValue"));
  v7 = +[PLManagedAlbumList priorityForAlbumKind:](PLManagedAlbumList, "priorityForAlbumKind:", objc_msgSend(v5, "kindValue"));
  if (v6 >= v7)
  {
    if (v6 <= v7)
    {
      if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE3B1010)
        && objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3B1010))
      {
        objc_msgSend(v4, "cloudLastInterestingChangeDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cloudLastInterestingChangeDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
        {
          if (v10)
            v8 = objc_msgSend(v10, "compare:", v9);
          else
            v8 = -1;
        }
        else
        {
          v8 = 1;
        }

      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

+ (id)entityName
{
  return CFSTR("AlbumList");
}

+ (id)albumListInPhotoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonListWithType:library:", 0, a3);
}

+ (id)importListInPhotoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonListWithType:library:", 7, a3);
}

+ (id)eventListInPhotoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonListWithType:library:", 1, a3);
}

+ (id)facesAlbumListInPhotoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonListWithType:library:", 2, a3);
}

+ (id)placesAlbumListInPhotoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonListWithType:library:", 3, a3);
}

+ (id)scenesAlbumListInPhotoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonListWithType:library:", 10, a3);
}

+ (id)allStreamedAlbumsListInPhotoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonListWithType:library:", 4, a3);
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PLManagedAlbumList;
  v3 = a3;
  objc_msgSendSuper2(&v9, sel_keyPathsForValuesAffectingValueForKey_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("adjustmentFormatIdentifier"), v9.receiver, v9.super_class);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObjectsFromSet:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

+ (BOOL)albumKindHasFixedOrder:(int)a3
{
  BOOL result;

  result = 0;
  if (a3 <= 1551)
  {
    if (a3 == 1000 || a3 == 1500 || a3 == 1502)
      return 1;
  }
  else
  {
    switch(a3)
    {
      case 1552:
      case 1600:
      case 1602:
      case 1603:
      case 1604:
      case 1605:
      case 1606:
      case 1609:
      case 1610:
      case 1611:
      case 1612:
      case 1613:
      case 1614:
      case 1615:
      case 1616:
      case 1617:
      case 1618:
      case 1619:
      case 1620:
      case 1621:
      case 1622:
      case 1623:
      case 1624:
      case 1625:
      case 1626:
      case 1627:
      case 1628:
      case 1630:
      case 1631:
      case 1632:
      case 1634:
      case 1636:
      case 1637:
      case 1639:
      case 1640:
      case 1641:
        return 1;
      case 1553:
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1601:
      case 1607:
      case 1608:
      case 1629:
      case 1633:
      case 1635:
      case 1638:
        return result;
      default:
        if ((a3 - 4004) < 3)
          return 1;
        break;
    }
  }
  return result;
}

+ (unint64_t)priorityForAlbumKind:(int)a3
{
  unint64_t result;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = -1;
  if (a3 <= 1504)
  {
    v4 = 180;
    v5 = 210;
    if (a3 != 1502)
      v5 = -1;
    if (a3 != 1500)
      v4 = v5;
    v6 = 240;
    v7 = 10;
    if (a3 != 1000)
      v7 = -1;
    if (a3 != 16)
      v6 = v7;
    if (a3 <= 1499)
      v4 = v6;
    v8 = 400;
    v9 = 222;
    v10 = 230;
    if (a3 != 15)
      v10 = -1;
    if (a3 != 12)
      v9 = v10;
    if (a3 != 2)
      v8 = v9;
    if (a3 <= 15)
      return v8;
    else
      return v4;
  }
  else
  {
    switch(a3)
    {
      case 1550:
        result = 220;
        break;
      case 1551:
        result = 221;
        break;
      case 1552:
        result = 170;
        break;
      case 1553:
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1601:
      case 1607:
      case 1608:
      case 1629:
      case 1633:
      case 1635:
      case 1638:
        return result;
      case 1600:
        result = 250;
        break;
      case 1602:
        result = 130;
        break;
      case 1603:
        result = 65;
        break;
      case 1604:
        result = 66;
        break;
      case 1605:
        result = 80;
        break;
      case 1606:
        result = 60;
        break;
      case 1609:
        result = 30;
        break;
      case 1610:
        result = 91;
        break;
      case 1611:
        result = 270;
        break;
      case 1612:
        result = 280;
        break;
      case 1613:
        result = 12;
        break;
      case 1614:
        result = 100;
        break;
      case 1615:
        result = 92;
        break;
      case 1616:
        result = 15;
        break;
      case 1617:
        result = 70;
        break;
      case 1618:
        result = 110;
        break;
      case 1619:
        result = 50;
        break;
      case 1620:
        result = 76;
        break;
      case 1621:
        result = 75;
        break;
      case 1622:
        result = 115;
        break;
      case 1623:
        result = 78;
        break;
      case 1624:
        result = 275;
        break;
      case 1625:
        result = 13;
        break;
      case 1626:
        result = 285;
        break;
      case 1627:
        result = 112;
        break;
      case 1628:
        result = 11;
        break;
      case 1630:
        result = 117;
        break;
      case 1631:
        result = 93;
        break;
      case 1632:
        result = 94;
        break;
      case 1634:
        result = 290;
        break;
      case 1636:
        result = 21;
        break;
      case 1637:
        result = 95;
        break;
      case 1639:
        result = 79;
        break;
      case 1640:
        result = 291;
        break;
      case 1641:
        result = 295;
        break;
      default:
        switch(a3)
        {
          case 4001:
            result = 160;
            break;
          case 4002:
            result = 140;
            break;
          case 4003:
            result = 150;
            break;
          case 4004:
            result = 141;
            break;
          case 4005:
            result = 161;
            break;
          case 4006:
            result = 33;
            break;
          default:
            if (a3 == 1505)
              result = 120;
            break;
        }
        break;
    }
  }
  return result;
}

+ (id)_typeDescriptionForAlbumListType:(signed __int16)a3
{
  __CFString *v3;

  if (a3 < 0xB && ((0x4BFu >> a3) & 1) != 0)
  {
    v3 = off_1E3666C88[(unsigned __int16)a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown %d>"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (void)addSingletonObjectsToContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void (**v40)(_QWORD, _QWORD);
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  _QWORD v85[4];
  id v86;
  id v87;

  v5 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLManagedAlbumList.m"), 791, CFSTR("%@ can only be called from assetsd"), v61);

  }
  objc_msgSend(a1, "_albumListWithType:inManagedObjectContext:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(a1, "insertInManagedObjectContext:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIdentifier:", v7);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1616, v5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v8);
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1613, v5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v9);
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1614, v5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v10);
  v81 = (void *)v10;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1605, v5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v11);
  v80 = (void *)v11;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1639, v5);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v12);
  v84 = a1;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1606, v5);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v13);
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1615, v5);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v14);
  v77 = (void *)v14;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1610, v5);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v15);
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1617, v5);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v16);
  v75 = (void *)v16;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1618, v5);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v17);
  v74 = (void *)v17;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1611, v5);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v18);
  v73 = (void *)v18;
  v83 = (void *)v8;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1609, v5);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v19);
  v79 = (void *)v12;
  v72 = (void *)v19;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1552, v5);
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v6, "albums");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v20);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedAlbum, "albumWithKind:inManagedObjectContext:", 4001, v5);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v22);
  v70 = (void *)v22;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedAlbum, "albumWithKind:inManagedObjectContext:", 4003, v5);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v23);
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedAlbum, "albumWithKind:inManagedObjectContext:", 4002, v5);
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v24);
  v78 = (void *)v13;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1612, v5);
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v25);
  v67 = (void *)v25;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 4004, v5);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v26);
  v27 = (void *)v9;
  v66 = (void *)v26;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 4005, v5);
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v28);
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 4006, v5);
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v29);
  v64 = (void *)v29;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1619, v5);
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v30);
  v63 = (void *)v30;
  v82 = v27;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1620, v5);
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v31);
  v62 = (void *)v31;
  v76 = (void *)v15;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1621, v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v32);
  v69 = (void *)v23;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1622, v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v33);
  v68 = (void *)v24;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1623, v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v34);
  v71 = (void *)v20;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1624, v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v35);
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1634, v5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v36);
  v65 = (void *)v28;
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1636, v5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    objc_msgSend(v6, "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v37);
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __51__PLManagedAlbumList_addSingletonObjectsToContext___block_invoke;
  v85[3] = &unk_1E3666C68;
  v38 = v5;
  v86 = v38;
  v39 = v6;
  v87 = v39;
  v40 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v85);
  v40[2](v40, 1626);
  v40[2](v40, 1627);
  v40[2](v40, 1630);
  v40[2](v40, 1631);
  v40[2](v40, 1637);
  v40[2](v40, 1632);
  v40[2](v40, 1640);
  v40[2](v40, 1641);
  v40[2](v40, 1628);
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 3999, v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAlbumList pushChangesFromAlbumContainer:toAlbumContainer:](PLManagedAlbumList, "pushChangesFromAlbumContainer:toAlbumContainer:", v39, v41);

  objc_msgSend(v84, "_albumListWithType:inManagedObjectContext:", 7, v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    objc_msgSend(v84, "insertInManagedObjectContext:", v38);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setIdentifier:", v44);

  }
  objc_msgSend(v84, "_albumListWithType:inManagedObjectContext:", 1, v38);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    objc_msgSend(v84, "insertInManagedObjectContext:", v38);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setIdentifier:", v47);

  }
  objc_msgSend(v84, "_albumListWithType:inManagedObjectContext:", 2, v38);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v48)
  {
    objc_msgSend(v84, "insertInManagedObjectContext:", v38);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setIdentifier:", v50);

  }
  objc_msgSend(v84, "_albumListWithType:inManagedObjectContext:", 3, v38);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v51)
  {
    objc_msgSend(v84, "insertInManagedObjectContext:", v38);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setIdentifier:", v53);

  }
  objc_msgSend(v84, "_albumListWithType:inManagedObjectContext:", 10, v38);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    objc_msgSend(v84, "insertInManagedObjectContext:", v38);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setIdentifier:", v56);

  }
  objc_msgSend(v84, "_albumListWithType:inManagedObjectContext:", 4, v38);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v57)
  {
    objc_msgSend(v84, "insertInManagedObjectContext:", v38);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setIdentifier:", v59);

  }
}

+ (id)albumListInManagedObjectContext:(id)a3
{
  return (id)objc_msgSend(a1, "_albumListWithType:inManagedObjectContext:", 0, a3);
}

+ (id)importListInManagedObjectContext:(id)a3
{
  return (id)objc_msgSend(a1, "_albumListWithType:inManagedObjectContext:", 7, a3);
}

+ (id)eventListInManagedObjectContext:(id)a3
{
  return (id)objc_msgSend(a1, "_albumListWithType:inManagedObjectContext:", 1, a3);
}

+ (id)facesAlbumListInManagedObjectContext:(id)a3
{
  return (id)objc_msgSend(a1, "_albumListWithType:inManagedObjectContext:", 2, a3);
}

+ (id)placesAlbumListInManagedObjectContext:(id)a3
{
  return (id)objc_msgSend(a1, "_albumListWithType:inManagedObjectContext:", 3, a3);
}

+ (id)scenesAlbumListInManagedObjectContext:(id)a3
{
  return (id)objc_msgSend(a1, "_albumListWithType:inManagedObjectContext:", 10, a3);
}

+ (id)allStreamedAlbumsListInManagedObjectContext:(id)a3
{
  return (id)objc_msgSend(a1, "_albumListWithType:inManagedObjectContext:", 4, a3);
}

+ (BOOL)_albumOrderMatchesFrom:(id)a3 inDestination:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      v12 = 0;
      v13 = v11;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v14 = objc_msgSend(v6, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), (_QWORD)v17);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL || (v11 = v14, v13 != 0x7FFFFFFFFFFFFFFFLL) && v14 <= v13)
        {
          v15 = 0;
          goto LABEL_14;
        }
        ++v12;
        v13 = v14;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v15 = 1;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v15 = 1;
  }
LABEL_14:

  return v15;
}

+ (id)_validAlbumsFromSource:(id)a3 destination:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = v5;
  objc_msgSend(v5, "albums");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isDeleted") & 1) == 0)
        {
          objc_msgSend(v13, "parentFolder");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14
            || (v15 = (void *)v14,
                objc_msgSend(v6, "albums"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v16, "containsObject:", v13),
                v16,
                v15,
                v17))
          {
            objc_msgSend(v7, "addObject:", v13);
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v7;
}

+ (void)pushChangesFromAlbumContainer:(id)a3 toAlbumContainer:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = v6;
  if (a3 && v6)
  {
    v12 = v6;
    objc_msgSend(a1, "_validAlbumsFromSource:destination:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "albums");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "_albumOrderMatchesFrom:inDestination:", v8, v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v12, "albums");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pl_insertObjects:atIndex:", v8, 0);

    }
    v7 = v12;
  }

}

+ (BOOL)isValidTypeForPersistence:(signed __int16)a3
{
  return (a3 < 8) & (0x86u >> a3);
}

+ (BOOL)isValidPathForPersistence:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("albumlistmetadata"));

  return v4;
}

+ (void)persistAlbumListUUIDs:(id)a3 type:(signed __int16)a4 pathManager:(id)a5 allowsOverwrite:(BOOL)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v8 = a4;
  v23 = a3;
  v10 = a5;
  if (objc_msgSend(a1, "isValidTypeForPersistence:", v8))
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "privateDirectoryWithSubType:createIfNeeded:error:", 4, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.albumlistmetadata"), (int)v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "path"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v16, "fileExistsAtPath:", v17),
          v17,
          v16,
          (v18 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v23, CFSTR("albums"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v19, 100, 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D73200], "persistMetadata:fileURL:", v20, v15);
      v21 = (void *)MEMORY[0x1E0D73208];
      objc_msgSend(v15, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "changeFileOwnerToMobileAtPath:error:", v22, 0);

    }
  }

}

+ (BOOL)restoreAlbumListFromPersistedDataAtPath:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __int16 v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  v11 = v10;
  if (objc_msgSend(a1, "isValidTypeForPersistence:", v10)
    && objc_msgSend(a1, "isValidPathForPersistence:", v6))
  {
    objc_msgSend(a1, "_singletonListWithType:library:", v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_14:

      v20 = 1;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v13, "objectForKey:", CFSTR("albums"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "orderedSetWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "albums");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", CFSTR("uuid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "isEqual:", v18))
    {
      PLMigrationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v29 = v11;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "Persisted albumList %d UUIDs match existing UUID ordering", buf, 8u);
      }
    }
    else
    {
      if (!objc_msgSend(v16, "count"))
      {
LABEL_13:

        goto LABEL_14;
      }
      PLMigrationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v29 = v11;
        v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_INFO, "Sorting albumList %d to match UUID ordering %@", buf, 0x12u);
      }

      objc_msgSend(v12, "albumsSortingComparator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "albums");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __70__PLManagedAlbumList_restoreAlbumListFromPersistedDataAtPath_library___block_invoke;
      v25[3] = &unk_1E36670F8;
      v27 = v22;
      v26 = v16;
      v19 = v22;
      objc_msgSend(v23, "sortUsingComparator:", v25);

    }
    goto LABEL_13;
  }
  v20 = 0;
LABEL_15:

  return v20;
}

uint64_t __70__PLManagedAlbumList_restoreAlbumListFromPersistedDataAtPath_library___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "indexOfObject:", v9);

    v11 = *(void **)(a1 + 32);
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "indexOfObject:", v12);

    if (v10 >= v13)
      v7 = v10 > v13;
    else
      v7 = -1;
  }

  return v7;
}

void __51__PLManagedAlbumList_addSingletonObjectsToContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", a2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v3);
    v3 = v4;
  }

}

- (id)payloadID
{
  void *v2;
  void *v3;

  -[PLManagedAlbumList uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLAlbumListJournalEntryPayload *v5;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isValidTypeForPersistence:", -[PLManagedAlbumList albumListType](self, "albumListType")))v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLAlbumListJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (id)payloadIDForTombstone:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
