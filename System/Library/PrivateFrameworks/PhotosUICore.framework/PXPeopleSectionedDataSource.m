@implementation PXPeopleSectionedDataSource

- (PXPeopleSectionedDataSource)initWithSections:(id)a3
{
  id v4;
  PXPeopleSectionedDataSource *v5;
  void *v6;
  uint64_t v7;
  PXPhotoLibraryLocalDefaults *localDefaults;
  PXPeopleSectionedDataSource *v9;
  uint64_t v10;
  NSArray *dataSources;
  uint64_t v12;
  NSHashTable *changeObservers;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *reloadQueue;
  _QWORD v18[4];
  PXPeopleSectionedDataSource *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXPeopleSectionedDataSource;
  v5 = -[PXPeopleSectionedDataSource init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_localDefaults");
    v7 = objc_claimAutoreleasedReturnValue();
    localDefaults = v5->_localDefaults;
    v5->_localDefaults = (PXPhotoLibraryLocalDefaults *)v7;

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __48__PXPeopleSectionedDataSource_initWithSections___block_invoke;
    v18[3] = &unk_1E5147F70;
    v9 = v5;
    v19 = v9;
    objc_msgSend(v4, "_pl_map:", v18);
    v10 = objc_claimAutoreleasedReturnValue();
    dataSources = v9->_dataSources;
    v9->_dataSources = (NSArray *)v10;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    changeObservers = v9->_changeObservers;
    v9->_changeObservers = (NSHashTable *)v12;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.Photos.PeopleHomeDataSourceReloadQueue", v14);
    reloadQueue = v9->_reloadQueue;
    v9->_reloadQueue = (OS_dispatch_queue *)v15;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PXPeopleSectionedDataSource stopListeningToLibraryNotifications](self, "stopListeningToLibraryNotifications");
  -[PXPeopleSectionedDataSource resumeListeningForChanges](self, "resumeListeningForChanges");
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleSectionedDataSource;
  -[PXPeopleSectionedDataSource dealloc](&v3, sel_dealloc);
}

- (unint64_t)numberOfSections
{
  void *v2;
  unint64_t v3;

  -[PXPeopleSectionedDataSource dataSources](self, "dataSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)numberOfDisclosedSections
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  -[PXPeopleSectionedDataSource dataSources](self, "dataSources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isDisclosed");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfPersonsInSection:(int64_t)a3
{
  void *v3;
  unint64_t v4;

  -[PXPeopleSectionedDataSource _dataSourceForSection:](self, "_dataSourceForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfMembers");

  return v4;
}

- (id)localizedTitleForSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PXPeopleSectionedDataSource _dataSourceForSection:](self, "_dataSourceForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedDisclosedTitleForSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PXPeopleSectionedDataSource _dataSourceForSection:](self, "_dataSourceForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDisclosedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canReorderMembersInSection:(int64_t)a3
{
  return 1;
}

- (unint64_t)fetchTypeForSection:(int64_t)a3
{
  void *v3;
  unint64_t v4;

  -[PXPeopleSectionedDataSource _dataSourceForSection:](self, "_dataSourceForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "personFetchType");

  return v4;
}

- (int64_t)indexForSection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXPeopleSectionedDataSource dataSources](self, "dataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PXPeopleSectionedDataSource_indexForSection___block_invoke;
  v9[3] = &unk_1E5147F98;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)memberAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PXPeopleSectionedDataSource _dataSourceForIndexPath:](self, "_dataSourceForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "memberAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)personAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[PXPeopleSectionedDataSource memberAtIndexPath:](self, "memberAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)faceTileAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PXPeopleSectionedDataSource _dataSourceForIndexPath:](self, "_dataSourceForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "faceTileAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)personsAtIndexPaths:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PXPeopleSectionedDataSource_personsAtIndexPaths___block_invoke;
  v4[3] = &unk_1E5147FC0;
  v4[4] = self;
  objc_msgSend(a3, "_pl_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)personsForType:(int64_t)a3
{
  void *v3;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  switch(a3)
  {
    case 0:
      -[PXPeopleSectionedDataSource dataSources](self, "dataSources");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 1;
LABEL_7:
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "persons");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    case 1:
      -[PXPeopleSectionedDataSource dataSources](self, "dataSources");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0;
      goto LABEL_7;
    case -1:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSectionedDataSource.m"), 176, CFSTR("Hidden is not a supported section"));

      abort();
  }
  return v3;
}

- (id)titleAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PXPeopleSectionedDataSource _dataSourceForIndexPath:](self, "_dataSourceForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "titleAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)photoQuantityAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  -[PXPeopleSectionedDataSource _dataSourceForIndexPath:](self, "_dataSourceForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  v7 = objc_msgSend(v5, "photoQuantityAtIndex:", v6);
  return v7;
}

- (unint64_t)totalPersonCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXPeopleSectionedDataSource dataSources](self, "dataSources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "members");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "count");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfPersonsWithContactName
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXPeopleSectionedDataSource allPersons](self, "allPersons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "px_localizedName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v8, "contactMatchingDictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");

          if (v11)
            ++v5;
        }
        else
        {

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfPersonsWithStringName
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXPeopleSectionedDataSource allPersons](self, "allPersons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "px_localizedName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v8, "contactMatchingDictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");

          if (!v11)
            ++v5;
        }
        else
        {

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)allPersons
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXPeopleSectionedDataSource dataSources](self, "dataSources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "persons");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSIndexPath)leadingFavoritePersonIndexPath
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleSectionedDataSource personAtIndexPath:](self, "personAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "type") != 1)
  {

    v3 = 0;
  }

  return (NSIndexPath *)v3;
}

- (NSIndexPath)trailingFavoritePersonIndexPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  -[PXPeopleSectionedDataSource leadingFavoritePersonIndexPath](self, "leadingFavoritePersonIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "section");
    v6 = -[PXPeopleSectionedDataSource numberOfPersonsInSection:](self, "numberOfPersonsInSection:", v5);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6 - 1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSIndexPath *)v7;
}

- (id)indexPathOfPerson:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPeopleSectionedDataSource numberOfSections](self, "numberOfSections");
  if (v5 < 1)
  {
LABEL_8:
    v15 = 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[PXPeopleSectionedDataSource _dataSourceForSection:](self, "_dataSourceForSection:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "persons");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "count");
      if (v10 >= 1)
        break;
LABEL_7:

      if (++v7 == v6)
        goto LABEL_8;
    }
    v11 = v10;
    v12 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "isEqualToString:", v14))
        break;

      if (v11 == ++v12)
        goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (void)setPeopleHomeSortingType:(unint64_t)a3
{
  PXPhotoLibraryLocalDefaults *localDefaults;
  id v4;

  localDefaults = self->_localDefaults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoLibraryLocalDefaults setNumber:forKey:](localDefaults, "setNumber:forKey:", v4, CFSTR("PXPeopleHomeSortingType"));

}

- (void)_setPeopleHomeSortingType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  self->_peopleHomeSortingType = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PXPeopleSectionedDataSource dataSources](self, "dataSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        +[PXPeopleUtilities comparatorByPeopleHomeSortingType:](PXPeopleUtilities, "comparatorByPeopleHomeSortingType:", self->_peopleHomeSortingType);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSortComparator:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXPeopleSectionedDataSource changeObservers](self, "changeObservers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "peopleSectionedDataSourceMembersChangedNonIncrementally:", self);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)movePersonAtIndexPath:(id)a3 toIndexPath:(id)a4 undoManager:(id)a5 shouldUpdateImmediately:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PXMovePersonAction *v20;
  void *v21;
  PXMovePersonAction *v22;
  id v23;
  id v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  id v32;
  BOOL v33;
  BOOL v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
  {
    v13 = objc_msgSend(v10, "section");
    v14 = objc_msgSend(v11, "section");
    v27 = objc_msgSend(v11, "item");
    v29 = v13 == v14;
    -[PXPeopleSectionedDataSource _dataSourceForSection:](self, "_dataSourceForSection:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSectionedDataSource _dataSourceForSection:](self, "_dataSourceForSection:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "persons");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSectionedDataSource personAtIndexPath:](self, "personAtIndexPath:", v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = a6;
    v17 = objc_msgSend(v16, "_personTypeForFetchType:", objc_msgSend(v16, "personFetchType"));
    -[PXPeopleSectionedDataSource _dataSourceForFetchType:](self, "_dataSourceForFetchType:", v17 == 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "persons");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [PXMovePersonAction alloc];
    v35[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PXMovePersonAction initWithSourcePeople:destinationPeople:destinationManualOrder:destinationType:otherPeople:](v20, "initWithSourcePeople:destinationPeople:destinationManualOrder:destinationType:otherPeople:", v21, v26, v27, v17, v19);

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __101__PXPeopleSectionedDataSource_movePersonAtIndexPath_toIndexPath_undoManager_shouldUpdateImmediately___block_invoke;
    v30[3] = &unk_1E5147FE8;
    v33 = v25;
    v34 = v29;
    v31 = v15;
    v32 = v16;
    v23 = v16;
    v24 = v15;
    -[PXAction executeWithUndoManager:completionHandler:](v22, "executeWithUndoManager:completionHandler:", v12, v30);

  }
}

- (void)changePersonsAtIndexPaths:(id)a3 toPersonType:(int64_t)a4 undoManager:(id)a5
{
  id v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXChangePeopleTypeAction *v17;
  id v18;
  _QWORD v19[5];

  v18 = a3;
  v8 = a5;
  if (objc_msgSend(v18, "count"))
  {
    v9 = -[PXPeopleSectionedDataSource _sectionForFetchType:](self, "_sectionForFetchType:", -[PXPeopleSectionedDataSource _fetchTypeForPersonType:](self, "_fetchTypeForPersonType:", a4));
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PXPeopleSectionedDataSource _dataSourceForSection:](self, "_dataSourceForSection:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "members");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "modelObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v14, "manualOrder") + 1;
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__PXPeopleSectionedDataSource_changePersonsAtIndexPaths_toPersonType_undoManager___block_invoke;
    v19[3] = &__block_descriptor_40_e21_B16__0__NSIndexPath_8l;
    v19[4] = v9;
    objc_msgSend(v18, "_pl_filter:", v19, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSectionedDataSource personsAtIndexPaths:](self, "personsAtIndexPaths:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PXChangePeopleTypeAction initWithPeople:type:]([PXChangePeopleTypeAction alloc], "initWithPeople:type:", v16, a4);
    -[PXChangePeopleTypeAction setFirstManualOrder:](v17, "setFirstManualOrder:", v10);
    -[PXAction executeWithUndoManager:completionHandler:](v17, "executeWithUndoManager:completionHandler:", v8, &__block_literal_global_297667);

  }
}

- (void)reloadFromDatabase
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXPeopleSectionedDataSource dataSources](self, "dataSources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1A85CE17C]();
        objc_msgSend(v7, "generateFetchResult");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObjects:", v9);

        objc_msgSend(v7, "_cacheFacesAndAssets");
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)addChangeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPeopleSectionedDataSource changeObservers](self, "changeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeChangeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPeopleSectionedDataSource changeObservers](self, "changeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)loadAndStartListeningToLibraryNotifications
{
  id v3;
  id location;

  objc_initWeak(&location, self);
  -[PXPeopleSectionedDataSource reloadFromDatabase](self, "reloadFromDatabase");
  objc_copyWeak(&v3, &location);
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)startListeningToLibraryNotifications
{
  void *v3;
  id v4;

  -[PXPeopleSectionedDataSource localDefaults](self, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerChangeObserver:context:", self, PXPhotoLibraryLocalDefaultsObservationContext_297665);

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_registerChangeObserver:", self);

}

- (void)stopListeningToLibraryNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_unregisterChangeObserver:", self);

}

- (void)pauseListeningForChangesWithTimeout:(double)a3 identifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CD16F8];
  v7 = a4;
  objc_msgSend(v6, "px_deprecated_appPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_beginPausingChangesWithTimeout:identifier:", v7, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPeopleSectionedDataSource resumeListeningForChanges](self, "resumeListeningForChanges");
  -[PXPeopleSectionedDataSource setPauseToken:](self, "setPauseToken:", v9);

}

- (void)resumeListeningForChanges
{
  void *v3;
  id v4;

  -[PXPeopleSectionedDataSource pauseToken](self, "pauseToken");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_endPausingChanges:", v4);

    -[PXPeopleSectionedDataSource setPauseToken:](self, "setPauseToken:", 0);
  }

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "containsChangesForEntityClass:", objc_opt_class()))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[PXPeopleSectionedDataSource dataSources](self, "dataSources", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      v9 = MEMORY[0x1E0C9AA60];
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v11, "objects");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "generateFetchResult");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD1588], "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v12, v13, v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "count") || objc_msgSend(v13, "count"))
            && ((objc_msgSend(v14, "hasDiffs") & 1) != 0 || (objc_msgSend(v14, "hasIncrementalChanges") & 1) != 0))
          {

            v15 = 1;
            goto LABEL_17;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        v15 = 0;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_17:

  }
  else
  {
    v15 = 0;
  }
  v23 = CFSTR("PXPeopleSectionedDataSourceHasChangeDiff");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXPeopleSectionedDataSource changeObservers](self, "changeObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PXPeopleSectionedDataSourceHasChangeDiff"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");
  if (objc_msgSend(v8, "count") && v10)
  {
    -[PXPeopleSectionedDataSource _generateChangeDetailsForChangeInstance:](self, "_generateChangeDetailsForChangeInstance:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "peopleSectionedDataSource:didApplyIncrementalChanges:", self, v11, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

- (id)_generateChangeDetailsForChangeInstance:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PXPeopleSectionedDataSource dataSources](self, "dataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PXPeopleSectionedDataSource__generateChangeDetailsForChangeInstance___block_invoke;
  v9[3] = &unk_1E5148100;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "_pl_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)photoLibraryLocalDefaults:(id)a3 didChangeValueForKey:(id)a4
{
  id v5;
  void *v6;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("PXPeopleHomeSortingType")))
  {
    -[PXPhotoLibraryLocalDefaults numberForKey:](self->_localDefaults, "numberForKey:", CFSTR("PXPeopleHomeSortingType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    px_dispatch_on_main_queue();

  }
}

- (void)imageAtIndexPath:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  -[PXPeopleSectionedDataSource _dataSourceForIndexPath:](self, "_dataSourceForIndexPath:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "item");

  objc_msgSend(v14, "imageAtIndex:targetSize:displayScale:resultHandler:", v13, v11, width, height, a5);
}

- (void)cancelImageLoadingForItem:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "faceImageRequestID");
  if ((_DWORD)v3)
  {
    v4 = v3;
    +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelRequestForRequestID:", v4);

    objc_msgSend(v6, "setFaceImageRequestID:", 0);
  }

}

- (id)_dataSourceForFetchType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXPeopleSectionedDataSource dataSources](self, "dataSources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "personFetchType") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_dataSourceForSection:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;

  -[PXPeopleSectionedDataSource dataSources](self, "dataSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") <= (unint64_t)a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSectionedDataSource.m"), 546, CFSTR("Unexpected section index"));

    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_dataSourceForIndexPath:(id)a3
{
  return -[PXPeopleSectionedDataSource _dataSourceForSection:](self, "_dataSourceForSection:", objc_msgSend(a3, "section"));
}

- (int64_t)_sectionForFetchType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;

  -[PXPeopleSectionedDataSource dataSources](self, "dataSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 < 1)
  {
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "personFetchType");

      if (v9 == a3)
        break;
      if (v6 == ++v7)
        goto LABEL_5;
    }
  }

  return v7;
}

- (unint64_t)_fetchTypeForPersonType:(int64_t)a3
{
  unint64_t v3;

  v3 = 1;
  if (a3)
    v3 = 2;
  if (a3 == 1)
    return 0;
  else
    return v3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)peopleHomeSortingType
{
  return self->_peopleHomeSortingType;
}

- (NSArray)dataSources
{
  return self->_dataSources;
}

- (PXPhotoLibraryLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (OS_dispatch_queue)reloadQueue
{
  return self->_reloadQueue;
}

- (id)pauseToken
{
  return self->_pauseToken;
}

- (void)setPauseToken:(id)a3
{
  objc_storeStrong(&self->_pauseToken, a3);
}

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

- (void)setChangeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_changeObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong(&self->_pauseToken, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

uint64_t __78__PXPeopleSectionedDataSource_photoLibraryLocalDefaults_didChangeValueForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPeopleHomeSortingType:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
}

id __71__PXPeopleSectionedDataSource__generateChangeDetailsForChangeInstance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objects");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateFetchResult");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v3;
  v35 = v4;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "persons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v50 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v11, "objectID", v35);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(a1 + 32), "keyFaceChangedForPersonOID:", v12))
          {
            objc_msgSend(v5, "addObject:", v11);
            +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "invalidateCacheForPerson:", v11);

            objc_msgSend(v38, "updateKeyFace:forPerson:", 0, v11);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v8);
    }
    v4 = v35;
    objc_msgSend(*(id *)(a1 + 32), "changeDetailsForFetchResult:", v35, v35);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "changedObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v15);

    v3 = v38;
  }
  v16 = (void *)MEMORY[0x1E0CD1588];
  objc_msgSend(v5, "allObjects", v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v4, v37, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "members");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObjects:", v37);
  objc_msgSend(v3, "members");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __71__PXPeopleSectionedDataSource__generateChangeDetailsForChangeInstance___block_invoke_3;
  v46[3] = &unk_1E51480B0;
  v48 = &__block_literal_global_162_297654;
  v22 = v18;
  v47 = v22;
  objc_msgSend(v19, "indexesOfObjectsPassingTest:", v46);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v21;
  v43[1] = 3221225472;
  v43[2] = __71__PXPeopleSectionedDataSource__generateChangeDetailsForChangeInstance___block_invoke_4;
  v43[3] = &unk_1E51480B0;
  v45 = &__block_literal_global_162_297654;
  v24 = v22;
  v44 = v24;
  objc_msgSend(v20, "indexesOfObjectsPassingTest:", v43);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v21;
  v39[1] = 3221225472;
  v39[2] = __71__PXPeopleSectionedDataSource__generateChangeDetailsForChangeInstance___block_invoke_5;
  v39[3] = &unk_1E51480D8;
  v42 = &__block_literal_global_162_297654;
  v26 = v24;
  v40 = v26;
  v27 = v23;
  v41 = v27;
  objc_msgSend(v19, "indexesOfObjectsPassingTest:", v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_alloc((Class)off_1E50B1608);
  objc_msgSend(v26, "movedIndexes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v27, v25, v30, objc_msgSend(v26, "movedFromIndexes"), v28);

  if (v31)
  {
    v32 = v31;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  v33 = v32;

  return v33;
}

uint64_t __71__PXPeopleSectionedDataSource__generateChangeDetailsForChangeInstance___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "removedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *, id))(v2 + 16))(v2, v5, v4);

  return v6;
}

uint64_t __71__PXPeopleSectionedDataSource__generateChangeDetailsForChangeInstance___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "insertedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *, id))(v2 + 16))(v2, v5, v4);

  return v6;
}

uint64_t __71__PXPeopleSectionedDataSource__generateChangeDetailsForChangeInstance___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "changedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *, id))(v5 + 16))(v5, v8, v7);

  if ((_DWORD)v5)
    v9 = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a3) ^ 1;
  else
    v9 = 0;

  return v9;
}

uint64_t __71__PXPeopleSectionedDataSource__generateChangeDetailsForChangeInstance___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "localIdentifier", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "modelObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

void __74__PXPeopleSectionedDataSource_loadAndStartListeningToLibraryNotifications__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "changeObservers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
          v10 = objc_loadWeakRetained(v1);
          objc_msgSend(v9, "peopleSectionedDataSourceMembersChangedNonIncrementally:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    v11 = objc_loadWeakRetained(v1);
    objc_msgSend(v11, "startListeningToLibraryNotifications");

  }
}

BOOL __82__PXPeopleSectionedDataSource_changePersonsAtIndexPaths_toPersonType_undoManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "section") != *(_QWORD *)(a1 + 32);
}

void __82__PXPeopleSectionedDataSource_changePersonsAtIndexPaths_toPersonType_undoManager___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 136315394;
      v6 = "-[PXPeopleSectionedDataSource changePersonsAtIndexPaths:toPersonType:undoManager:]_block_invoke_2";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "An error occurred in %s while changing a person in People Home %@", (uint8_t *)&v5, 0x16u);
    }

  }
}

void __101__PXPeopleSectionedDataSource_movePersonAtIndexPath_toIndexPath_undoManager_shouldUpdateImmediately___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2 && *(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "generateFetchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObjects:", v7);

    if (!*(_BYTE *)(a1 + 49))
    {
      objc_msgSend(*(id *)(a1 + 40), "generateFetchResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObjects:", v8);

    }
  }
  else if (v5)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315394;
      v11 = "-[PXPeopleSectionedDataSource movePersonAtIndexPath:toIndexPath:undoManager:shouldUpdateImmediately:]_block_invoke";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "An error occurred in %s while moving a person in People Home %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

uint64_t __51__PXPeopleSectionedDataSource_personsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "personAtIndexPath:", a2);
}

void __47__PXPeopleSectionedDataSource_indexForSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "dataSourceSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

PXPeoplePersonDataSource *__48__PXPeopleSectionedDataSource_initWithSections___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PXPeoplePersonDataSource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = -[PXPeoplePersonDataSource initWithName:personFetchType:]([PXPeoplePersonDataSource alloc], "initWithName:personFetchType:", &stru_1E5149688, objc_msgSend(v3, "personFetchType"));
  -[PXPeoplePersonDataSource setDataSourceSection:](v4, "setDataSourceSection:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "numberForKey:", CFSTR("PXPeopleHomeSortingType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v5 = (void *)objc_msgSend(v5, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v5;
  +[PXPeopleUtilities comparatorByPeopleHomeSortingType:](PXPeopleUtilities, "comparatorByPeopleHomeSortingType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDataSource setSortComparator:](v4, "setSortComparator:", v7);

  -[PXPeopleDataSource setDisclosed:](v4, "setDisclosed:", objc_msgSend(v3, "isDisclosed"));
  objc_msgSend(v3, "unDisclosedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDataSource setLocalizedUndisclosedTitle:](v4, "setLocalizedUndisclosedTitle:", v8);

  objc_msgSend(v3, "disclosedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDataSource setLocalizedDisclosedTitle:](v4, "setLocalizedDisclosedTitle:", v9);

  return v4;
}

@end
