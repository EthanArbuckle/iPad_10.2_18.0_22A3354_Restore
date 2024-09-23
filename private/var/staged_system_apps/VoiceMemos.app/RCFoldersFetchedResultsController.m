@implementation RCFoldersFetchedResultsController

+ (NSString)builtinFoldersSectionIdentifier
{
  return (NSString *)CFSTR("0");
}

+ (NSString)userFoldersSectionIdentifier
{
  return (NSString *)CFSTR("1");
}

- (RCFoldersFetchedResultsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  RCFoldersFetchedResultsController *v8;
  RCFoldersFetchedResultsController *v9;
  NSFetchedResultsController *v10;
  NSFetchedResultsController *userFoldersController;
  NSMutableArray *v12;
  NSMutableArray *pendingUpdates;
  __RCFolderContentsDelegate *v14;
  __RCFolderContentsDelegate *folderContentsDelegate;
  uint64_t v16;
  NSHashTable *observers;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RCFoldersFetchedResultsController;
  v8 = -[RCFoldersFetchedResultsController init](&v19, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a4);
    v10 = (NSFetchedResultsController *)objc_msgSend(objc_alloc((Class)NSFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v6, v7, 0, 0);
    userFoldersController = v9->_userFoldersController;
    v9->_userFoldersController = v10;

    -[NSFetchedResultsController setDelegate:](v9->_userFoldersController, "setDelegate:", v9);
    v12 = objc_opt_new(NSMutableArray);
    pendingUpdates = v9->_pendingUpdates;
    v9->_pendingUpdates = v12;

    v14 = objc_opt_new(__RCFolderContentsDelegate);
    folderContentsDelegate = v9->_folderContentsDelegate;
    v9->_folderContentsDelegate = v14;

    -[__RCFolderContentsDelegate setFoldersController:](v9->_folderContentsDelegate, "setFoldersController:", v9);
    v16 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v16;

  }
  return v9;
}

- (NSMutableDictionary)userContentControllers
{
  NSMutableDictionary *userContentControllers;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  userContentControllers = self->_userContentControllers;
  if (!userContentControllers)
  {
    v4 = objc_opt_new(NSMutableDictionary);
    v5 = self->_userContentControllers;
    self->_userContentControllers = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController userFolders](self, "userFolders", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingsControllerWithFolder:", v12));
          v14 = self->_userContentControllers;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "folderControllerID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

          objc_msgSend(v13, "setDelegate:", self->_folderContentsDelegate);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    userContentControllers = self->_userContentControllers;
  }
  return userContentControllers;
}

- (NSMutableDictionary)builtInContentControllers
{
  NSDictionary *builtInContentControllers;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  builtInContentControllers = self->_builtInContentControllers;
  if (!builtInContentControllers)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v5 = objc_opt_new(NSMutableDictionary);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCBuiltinRecordingsFolder allBuiltInFolders](RCBuiltinRecordingsFolder, "allBuiltInFolders", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingsControllerWithFolder:", v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "folderControllerID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, v13);

          objc_msgSend(v12, "setDelegate:", self->_folderContentsDelegate);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v14 = self->_builtInContentControllers;
    self->_builtInContentControllers = &v5->super;

    builtInContentControllers = self->_builtInContentControllers;
  }
  return (NSMutableDictionary *)builtInContentControllers;
}

- (id)_contentControllerForId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "__rc_folderType") == (id)4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController userContentControllers](self, "userContentControllers"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController builtInContentControllers](self, "builtInContentControllers"));
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v7;
}

- (id)playableRecordingsInFolder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "folderControllerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController _contentControllerForId:](self, "_contentControllerForId:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchedRecordings"));
  return v6;
}

- (void)addContentObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeContentObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *userContentControllers;
  void *v23;
  id v24;

  v24 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (a6 - 3 < 2)
  {
    -[NSMutableArray addObject:](self->_pendingUpdates, "addObject:", v12);
  }
  else if (a6 == 1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "recordingsControllerWithFolder:", v12));

    userContentControllers = self->_userContentControllers;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "folderControllerID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](userContentControllers, "setObject:forKeyedSubscript:", v21, v23);

    objc_msgSend(v21, "setDelegate:", self->_folderContentsDelegate);
  }
  else if (a6 == 2)
  {
    v15 = self->_userContentControllers;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "folderControllerID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16));

    objc_msgSend(v17, "setDelegate:", 0);
    v18 = self->_userContentControllers;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "folderControllerID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", 0, v19);

  }
}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSHashTable *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController currentSnapshot](self, "currentSnapshot", a3));
  if (v4)
  {
    if (-[NSMutableArray count](self->_pendingUpdates, "count"))
    {
      v5 = sub_100074760(self->_pendingUpdates);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      objc_msgSend(v4, "reconfigureItemsWithIdentifiers:", v6);

      -[NSMutableArray removeAllObjects](self->_pendingUpdates, "removeAllObjects");
    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_observers;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "controller:didChangeContentWithSnapshot:", self, v4, (_QWORD)v12);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  const __CFString *v14;
  const __CFString *v15;

  v3 = NSClassFromString(CFSTR("NSDiffableDataSourceSnapshot"));
  v4 = (void *)objc_opt_new(v3);
  if (v4)
  {
    v15 = CFSTR("0");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController builtinFolders](self, "builtinFolders"));
    v7 = sub_100074760(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v8, CFSTR("0"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController userFolders](self, "userFolders"));
    if (objc_msgSend(v9, "count"))
    {
      v14 = CFSTR("1");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      objc_msgSend(v4, "appendSectionsWithIdentifiers:", v10);

      v11 = sub_100074760(v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, CFSTR("1"));

    }
  }
  return (NSDiffableDataSourceSnapshot *)v4;
}

- (NSArray)builtinFolders
{
  NSArray *builtinFolders;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  _QWORD v8[5];

  builtinFolders = self->_builtinFolders;
  if (!builtinFolders)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCBuiltinRecordingsFolder allBuiltInFolders](RCBuiltinRecordingsFolder, "allBuiltInFolders"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100074A88;
    v8[3] = &unk_1001ACC80;
    v8[4] = self;
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_filter:", v8));
    v6 = self->_builtinFolders;
    self->_builtinFolders = v5;

    builtinFolders = self->_builtinFolders;
  }
  return builtinFolders;
}

- (void)reloadBuiltinFolder:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *builtinFolders;
  void *v8;
  void *v9;
  void *v10;
  NSHashTable *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  _BYTE v21[128];
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCBuiltinRecordingsFolder allBuiltInFolders](RCBuiltinRecordingsFolder, "allBuiltInFolders"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100074CB8;
  v20[3] = &unk_1001ACC80;
  v20[4] = self;
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_filter:", v20));
  builtinFolders = self->_builtinFolders;
  self->_builtinFolders = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController currentSnapshot](self, "currentSnapshot"));
  if (v8)
  {
    if (!objc_msgSend(v4, "folderType")
      || -[RCFoldersFetchedResultsController playableCountForFolder:](self, "playableCountForFolder:", v4))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "folderControllerID"));
      v22 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
      objc_msgSend(v8, "reconfigureItemsWithIdentifiers:", v10);

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_observers;
    v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "controller:didChangeContentWithSnapshot:", self, v8, (_QWORD)v16);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v13);
    }

  }
}

- (void)reloadUserFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSHashTable *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController currentSnapshot](self, "currentSnapshot"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "folderControllerID"));
    v18 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    objc_msgSend(v5, "reconfigureItemsWithIdentifiers:", v7);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_observers;
    v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "controller:didChangeContentWithSnapshot:", self, v5, (_QWORD)v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (NSArray)userFolders
{
  NSFetchedResultsController *userFoldersController;
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v9;

  if (!self->_hasPerformedUserControllerFetch)
  {
    userFoldersController = self->_userFoldersController;
    v9 = 0;
    v4 = -[NSFetchedResultsController performFetch:](userFoldersController, "performFetch:", &v9);
    v5 = v9;
    self->_hasPerformedUserControllerFetch = v4;
    if ((v4 & 1) == 0)
    {
      v6 = OSLogForCategory(kVMLogCategoryDefault);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10010D224((uint64_t)v5, v7);

    }
  }
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsController _fetchedObjects](self->_userFoldersController, "_fetchedObjects"));
}

- (id)folderWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "__rc_folderType");
  if (v5 == (id)4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext existingObjectWithID:error:](self->_context, "existingObjectWithID:error:", v4, 0));
  }
  else
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCBuiltinRecordingsFolder allBuiltInFolders](RCBuiltinRecordingsFolder, "allBuiltInFolders"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));

  }
  return v6;
}

- (id)folderAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "section"))
    v5 = objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController userFolders](self, "userFolders"));
  else
    v5 = objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController builtinFolders](self, "builtinFolders"));
  v6 = (void *)v5;
  v7 = objc_msgSend(v4, "row");

  if (v7 >= objc_msgSend(v6, "count"))
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));

  return v8;
}

- (id)indexPathForFolder:(id)a3
{
  id v4;
  BOOL v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "folderType") == (id)4;
  v6 = v5;
  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController userFolders](self, "userFolders"));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController builtinFolders](self, "builtinFolders"));
  v8 = v7;
  v9 = objc_msgSend(v7, "indexOfObject:", v4);

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    v10 = 0;
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, v6));

  return v10;
}

- (unint64_t)playableCountForFolder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "folderControllerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController _contentControllerForId:](self, "_contentControllerForId:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchedObjects"));
  v7 = objc_msgSend(v6, "count");

  return (unint64_t)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_builtinFolders, 0);
  objc_storeStrong((id *)&self->_folderContentsDelegate, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_userContentControllers, 0);
  objc_storeStrong((id *)&self->_builtInContentControllers, 0);
  objc_storeStrong((id *)&self->_userFoldersController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
