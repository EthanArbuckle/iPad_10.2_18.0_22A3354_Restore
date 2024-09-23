@implementation PLFilteredAlbumList

- (PLFilteredAlbumList)initWithBackingAlbumList:(id)a3 filter:(int)a4
{
  uint64_t v4;
  id v6;
  PLFilteredAlbumList *v7;
  PLIndexMapper *v8;
  PLIndexMapper *indexMapper;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
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
  objc_super v57;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)PLFilteredAlbumList;
  v7 = -[PLFilteredAlbumList init](&v57, sel_init);
  if (!v7)
    goto LABEL_46;
  v8 = -[PLIndexMapper initWithDataSource:]([PLIndexMapper alloc], "initWithDataSource:", v7);
  indexMapper = v7->_indexMapper;
  v7->_indexMapper = v8;

  -[PLFilteredAlbumList setBackingAlbumList:](v7, "setBackingAlbumList:", v6);
  -[PLFilteredAlbumList backingAlbumList](v7, "backingAlbumList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[PLFilteredAlbumList backingAlbumList](v7, "backingAlbumList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerDerivedAlbumList:", v7);

  }
  -[PLFilteredAlbumList setFilter:](v7, "setFilter:", v4);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("TRUEPREDICATE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFilteredAlbumList setPredicate:](v7, "setPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0C978B0];
  -[PLFilteredAlbumList backingAlbumList](v7, "backingAlbumList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__backingContextDidChange_, v15, v17);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("photosCount > 0"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

  }
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("videosCount > 0"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v20);

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isStandInAlbum == NO"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isEmpty == NO"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v21, v22, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "orPredicateWithSubpredicates:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v25);
  }
  else
  {
    objc_msgSend(v18, "addObject:", v21);
  }

  if ((v4 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isFolder == NO"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v27);

    if ((v4 & 0x400000) == 0)
    {
LABEL_13:
      if ((v4 & 0x200) == 0)
        goto LABEL_14;
      goto LABEL_33;
    }
  }
  else if ((v4 & 0x400000) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isRecentlyAddedAlbum == NO"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v28);

  if ((v4 & 0x200) == 0)
  {
LABEL_14:
    if ((v4 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isEmpty == NO"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v29);

  if ((v4 & 0x40000) == 0)
  {
LABEL_15:
    if ((v4 & 0x100000) != 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isSmartAlbum == NO OR isEmpty == NO OR kind == %d"), 1612);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v30);

  if ((v4 & 0x100000) != 0)
  {
LABEL_16:
    if ((v4 & 0x200000) != 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("trashedState == %d"), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v31);

  if ((v4 & 0x200000) != 0)
  {
LABEL_17:
    if ((v4 & 0x1000000) != 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind != %d"), 1612);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v32);

  if ((v4 & 0x1000000) != 0)
  {
LABEL_18:
    if ((v4 & 0x800000) == 0)
      goto LABEL_19;
LABEL_38:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isCameraAlbum == NO"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v34);
    goto LABEL_40;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind != %d"), 1619);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v33);

  if ((v4 & 0x800000) != 0)
    goto LABEL_38;
LABEL_19:
  if ((v4 & 0x400) == 0 && (MGGetBoolAnswer() & 1) != 0)
  {
    if ((v4 & 0x2000) == 0)
      goto LABEL_22;
LABEL_41:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isPhotoStreamAlbum == NO"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v43);

    if ((v4 & 0x1000) == 0)
      goto LABEL_23;
LABEL_42:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isLibrary == NO"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v44);
    goto LABEL_48;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isCameraAlbum == NO"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isCameraAlbum == YES"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isEmpty == NO"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v35, v36, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "andPredicateWithSubpredicates:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v34, v39, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "orPredicateWithSubpredicates:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addObject:", v42);
LABEL_40:

  if ((v4 & 0x2000) != 0)
    goto LABEL_41;
LABEL_22:
  if ((v4 & 0x1000) != 0)
    goto LABEL_42;
LABEL_23:
  if ((v4 & 0x800) == 0)
  {
    if ((v4 & 0x4000) == 0)
      goto LABEL_25;
    goto LABEL_49;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isLibrary == NO"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isLibrary == YES"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isEmpty == NO    "));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v47, v48, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "andPredicateWithSubpredicates:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v44, v51, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "orPredicateWithSubpredicates:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addObject:", v54);
LABEL_48:

  if ((v4 & 0x4000) == 0)
  {
LABEL_25:
    if ((v4 & 0x10000) == 0)
      goto LABEL_26;
LABEL_50:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("( isPendingPhotoStreamAlbum == NO)"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v56);

    if ((v4 & 0x8000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("( (isOwnedCloudSharedAlbum == YES) OR (isMultipleContributorCloudSharedAlbum == YES))"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v55);

  if ((v4 & 0x10000) != 0)
    goto LABEL_50;
LABEL_26:
  if ((v4 & 0x8000) != 0)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isCloudSharedAlbum == NO"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v26);

  }
LABEL_28:
  if (objc_msgSend(v18, "count"))
  {
    if (objc_msgSend(v18, "count") == 1)
      objc_msgSend(v18, "objectAtIndex:", 0);
    else
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v18);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLFilteredAlbumList setPredicate:](v7, "setPredicate:", v45);

  }
LABEL_46:

  return v7;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->predicate, a3);
}

- (PLManagedAlbumList)backingAlbumList
{
  return self->backingAlbumList;
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

- (unint64_t)unreadAlbumsCount
{
  void *v2;
  unint64_t v3;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unreadAlbumsCount");

  return v3;
}

- (void)set_albums:(id)a3
{
  objc_storeWeak((id *)&self->_weak_albums, a3);
}

- (void)setFilter:(int)a3
{
  self->filter = a3;
}

- (void)setBackingAlbumList:(id)a3
{
  objc_storeStrong((id *)&self->backingAlbumList, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PLFilteredAlbumList unregisterAllDerivedAlbums](self, "unregisterAllDerivedAlbums");
  -[PLFilteredAlbumList _invalidateFilteredIndexes](self, "_invalidateFilteredIndexes");
  v4.receiver = self;
  v4.super_class = (Class)PLFilteredAlbumList;
  -[PLFilteredAlbumList dealloc](&v4, sel_dealloc);
}

- (void)_invalidateFilteredIndexes
{
  NSMutableIndexSet *filteredIndexes;

  -[PLFilteredAlbumList set_albums:](self, "set_albums:", 0);
  filteredIndexes = self->_filteredIndexes;
  self->_filteredIndexes = 0;

}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->predicate, 0);
  objc_storeStrong((id *)&self->backingAlbumList, 0);
  for (i = 64; i != 24; i -= 8)
    objc_destroyWeak((id *)((char *)&self->super.isa + i));
  objc_destroyWeak((id *)&self->_weak_albums);
  objc_storeStrong((id *)&self->_filteredIndexes, 0);
  objc_storeStrong((id *)&self->_indexMapper, 0);
}

+ (id)filteredAlbumList:(id)a3 filter:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBackingAlbumList:filter:", v6, v4);

  return v7;
}

- (signed)albumListType
{
  void *v2;
  signed __int16 v3;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "albumListType");

  return v3;
}

- (BOOL)canEditAlbums
{
  void *v2;
  char v3;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canEditAlbums");

  return v3;
}

- (BOOL)isFolder
{
  return 0;
}

- (BOOL)albumHasFixedOrder:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "albumHasFixedOrder:", v4);

  return v6;
}

- (id)albumsSortingComparator
{
  void *v2;
  void *v3;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albumsSortingComparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setNeedsReordering
{
  id v2;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsReordering");

}

- (BOOL)needsReordering
{
  void *v2;
  char v3;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsReordering");

  return v3;
}

- (void)updateAlbumsOrderIfNeeded
{
  id v2;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
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
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preheatAlbumsForProperties:relationships:", v7, v6);

}

- (void)preheatAlbumsAtIndexes:(id)a3 forProperties:(id)a4 relationships:(id)a5
{
  PLIndexMapper *indexMapper;
  id v9;
  id v10;
  void *v11;
  id v12;

  indexMapper = self->_indexMapper;
  v9 = a5;
  v10 = a4;
  -[PLIndexMapper backingIndexesForIndexes:](indexMapper, "backingIndexesForIndexes:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preheatAlbumsAtIndexes:forProperties:relationships:", v12, v10, v9);

}

- (NSMutableOrderedSet)albums
{
  void *v3;
  void *v4;

  -[PLFilteredAlbumList _albums](self, "_albums");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PLFilteredAlbumList mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("filteredAlbums"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLFilteredAlbumList set_albums:](self, "set_albums:", v4);

  }
  return -[PLFilteredAlbumList _albums](self, "_albums");
}

- (unint64_t)albumsCount
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
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3880];
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%@ IN albumLists"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kind != %d) OR (cachedCount > 0)"), 1552);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind != %d"), 1602);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C97B48];
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setPredicate:", v10);
  objc_msgSend(v13, "setFetchLimit:", 1);
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countForFetchRequest:error:", v13, 0);

  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    v17 = 0;
  else
    v17 = v16;

  return v17;
}

- (BOOL)hasAtLeastOneAlbum
{
  return -[PLFilteredAlbumList albumsCount](self, "albumsCount") != 0;
}

- (PLPhotoLibrary)photoLibrary
{
  void *v2;
  void *v3;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLPhotoLibrary *)v3;
}

- (NSString)description
{
  void *v3;
  char v4;
  void *v5;
  __CFString *v6;
  void *v7;
  NSMutableIndexSet *filteredIndexes;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_typeDescription");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("[]");
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p> type: %@"), objc_opt_class(), self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  filteredIndexes = self->_filteredIndexes;
  if (filteredIndexes)
  {
    -[NSMutableIndexSet pl_shortDescription](filteredIndexes, "pl_shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(", filtered items: %@ (count: %lu)"), v9, -[NSMutableIndexSet count](self->_filteredIndexes, "count"));

  }
  else
  {
    objc_msgSend(v7, "appendString:", CFSTR(", filtered items not calculated"));
  }
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR(", backing list: %p"), v10);

  if (self->_filteredIndexes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLFilteredAlbumList albums](self, "albums");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __34__PLFilteredAlbumList_description__block_invoke;
    v16[3] = &unk_1E36775E8;
    v17 = v11;
    v13 = v11;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(", albums: {%@}"), v14);

  }
  return (NSString *)v7;
}

- (BOOL)isEmpty
{
  return !-[PLFilteredAlbumList hasAtLeastOneAlbum](self, "hasAtLeastOneAlbum");
}

- (id)containersRelationshipName
{
  return CFSTR("albums");
}

- (void)_backingContextDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C97840]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "containsObject:", v5);

  if (v6)
  {
    -[PLFilteredAlbumList willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("albums"));
    -[PLFilteredAlbumList setBackingAlbumList:](self, "setBackingAlbumList:", 0);
    -[PLFilteredAlbumList _invalidateFilteredIndexes](self, "_invalidateFilteredIndexes");
    -[PLFilteredAlbumList didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("albums"));
  }

}

- (id)identifier
{
  void *v2;
  void *v3;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)managedObjectContext
{
  void *v2;
  void *v3;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
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
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
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
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nBacking album list = %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (PLIndexMapper)indexMapper
{
  return self->_indexMapper;
}

- (NSIndexSet)filteredIndexes
{
  NSMutableIndexSet *filteredIndexes;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSMutableIndexSet *v14;
  NSMutableIndexSet *v15;
  NSMutableIndexSet *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  PLFilteredAlbumList *v23;
  NSMutableIndexSet *v24;
  _QWORD *v25;
  uint64_t v26;
  SEL v27;
  _QWORD v28[4];

  filteredIndexes = self->_filteredIndexes;
  if (!filteredIndexes)
  {
    v5 = (void *)MEMORY[0x19AEC1554]();
    -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "albums");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLFilteredAlbumList predicate](self, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "count");
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __38__PLFilteredAlbumList_filteredIndexes__block_invoke;
    v21 = &unk_1E366B488;
    v25 = v28;
    v26 = v12;
    v13 = v8;
    v27 = a2;
    v22 = v13;
    v23 = self;
    v14 = v11;
    v24 = v14;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v18);
    v15 = self->_filteredIndexes;
    self->_filteredIndexes = v14;
    v16 = v14;

    _Block_object_dispose(v28, 8);
    objc_autoreleasePoolPop(v5);
    filteredIndexes = self->_filteredIndexes;
  }
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](filteredIndexes, "copy", v18, v19, v20, v21);
}

- (NSObject)cachedIndexMapState
{
  return self->_filteredIndexes;
}

- (BOOL)shouldIncludeObjectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[PLFilteredAlbumList predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "albums");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "evaluateWithObject:", v8);

  return v9;
}

- (BOOL)mappedDataSourceChanged:(id)a3 remoteNotificationData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _BOOL4 v16;
  NSMutableIndexSet *filteredIndexes;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PLFilteredAlbumList set_albums:](self, "set_albums:", 0);
  if (-[PLIndexMapper applyContainerChangeNotification:changeTypes:toFilteredIndexes:](self->_indexMapper, "applyContainerChangeNotification:changeTypes:toFilteredIndexes:", v5, 15, self->_filteredIndexes))
  {
    -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "albums");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v15, "kindValue", (_QWORD)v20) == 4003
            || objc_msgSend(v15, "kindValue") == 4002
            || objc_msgSend(v15, "kindValue") == 4001)
          {
            v16 = -[PLFilteredAlbumList shouldIncludeObjectAtIndex:](self, "shouldIncludeObjectAtIndex:", v12 + i);
            filteredIndexes = self->_filteredIndexes;
            v18 = v12 + i;
            if (v16)
              -[NSMutableIndexSet addIndex:](filteredIndexes, "addIndex:", v18);
            else
              -[NSMutableIndexSet removeIndex:](filteredIndexes, "removeIndex:", v18);
          }
        }
        v12 += i;
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

  }
  else
  {
    -[PLFilteredAlbumList _invalidateFilteredIndexes](self, "_invalidateFilteredIndexes");
  }

  return 1;
}

- (Class)derivedChangeNotificationClass
{
  return (Class)objc_opt_class();
}

- (NSMutableOrderedSet)_albums
{
  return (NSMutableOrderedSet *)objc_loadWeakRetained((id *)&self->_weak_albums);
}

- (unint64_t)countOfFilteredAlbums
{
  void *v2;
  unint64_t v3;

  -[PLFilteredAlbumList filteredIndexes](self, "filteredIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)indexInFilteredAlbumsOfObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = a3;
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  v8 = -[PLIndexMapper indexForBackingIndex:](self->_indexMapper, "indexForBackingIndex:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = v8;
  if (v8 >= -[NSMutableIndexSet count](self->_filteredIndexes, "count")
    || v7 != -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", v9))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9;
}

- (id)objectInFilteredAlbumsAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filteredAlbumsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIndexMapper backingIndexesForIndexes:](self->_indexMapper, "backingIndexesForIndexes:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)insertObject:(id)a3 inFilteredAlbumsAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "albums");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v6, -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a4));

}

- (void)removeObjectFromFilteredAlbumsAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;

  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "albums");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectAtIndex:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3));

}

- (void)insertFilteredAlbums:(id)a3 atIndexes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "albums");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIndexMapper backingIndexesForIndexes:](self->_indexMapper, "backingIndexesForIndexes:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "insertObjects:atIndexes:", v7, v9);
}

- (void)removeFilteredAlbumsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "albums");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIndexMapper backingIndexesForIndexes:](self->_indexMapper, "backingIndexesForIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObjectsAtIndexes:", v6);
}

- (void)replaceObjectInFilteredAlbumsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "albums");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3), v6);

}

- (void)replaceFilteredAlbumsAtIndexes:(id)a3 withFilteredValues:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PLFilteredAlbumList backingAlbumList](self, "backingAlbumList");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "albums");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIndexMapper backingIndexesForIndexes:](self->_indexMapper, "backingIndexesForIndexes:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "replaceObjectsAtIndexes:withObjects:", v9, v6);
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
  PLBackendGetLog();
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
    if (WeakRetained)
      v7[2](v7, WeakRetained);

    ++v4;
  }
  while (v4 != 5);

}

- (int)filter
{
  return self->filter;
}

- (NSPredicate)predicate
{
  return self->predicate;
}

uint64_t __38__PLFilteredAlbumList_filteredIndexes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v6;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:inRange:", a2, v3, *(_QWORD *)(a1 + 64) - v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("PLFilteredAlbumList.m"), 465, &stru_1E36789C0);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;
  return objc_msgSend(*(id *)(a1 + 48), "addIndex:", v4);
}

void __34__PLFilteredAlbumList_description__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  if (a3 >= 0x15)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("..."));
    *a4 = 1;
  }
}

@end
