@implementation MTFetchedResultsController

- (BOOL)performFetch:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeAllObjects](self->_propertyCache, "removeAllObjects");
  v5 = -[NSFetchedResultsController performFetch:](self->_frc, "performFetch:", a3);
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSFetchedResultsController fetchedObjects](self->_frc, "fetchedObjects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[MTFetchedResultsController _updateCacheWithManagedObject:](self, "_updateCacheWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (void)_updateCacheWithManagedObject:(id)a3
{
  void *v4;
  NSMutableDictionary *propertyCache;
  void *v6;
  id v7;

  v7 = a3;
  -[MTFetchedResultsController _dictionaryForObject:](self, "_dictionaryForObject:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    propertyCache = self->_propertyCache;
    objc_msgSend(v7, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](propertyCache, "setObject:forKeyedSubscript:", v4, v6);

  }
}

- (id)_dictionaryForObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MTFetchedResultsController propertyKeys](self, "propertyKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _MTLogCategoryDatabase();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[MTFetchedResultsController fetchRequest](self, "fetchRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "entityName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTFetchedResultsController fetchRequest](self, "fetchRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1A904E000, v6, OS_LOG_TYPE_ERROR, "MTFetchedResultsController with null property keys detected - entity %{public}@ - predicate %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }
  -[MTFetchedResultsController propertyKeys](self, "propertyKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithValuesForKeys:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (MTFetchedResultsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4 sectionNameKeyPath:(id)a5 cacheName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MTFetchedResultsController *v14;
  uint64_t v15;
  NSMutableDictionary *propertyCache;
  uint64_t v17;
  NSFetchedResultsController *frc;
  uint64_t v19;
  NSMutableArray *changes;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MTFetchedResultsController;
  v14 = -[MTFetchedResultsController init](&v22, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    propertyCache = v14->_propertyCache;
    v14->_propertyCache = (NSMutableDictionary *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B68]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v10, v11, v12, v13);
    frc = v14->_frc;
    v14->_frc = (NSFetchedResultsController *)v17;

    -[NSFetchedResultsController setDelegate:](v14->_frc, "setDelegate:", v14);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    changes = v14->_changes;
    v14->_changes = (NSMutableArray *)v19;

  }
  return v14;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)fetchedObjects
{
  return -[NSFetchedResultsController fetchedObjects](self->_frc, "fetchedObjects");
}

- (void)setPropertyKeys:(id)a3
{
  NSArray *v5;
  NSArray *propertyKeys;
  NSArray **p_propertyKeys;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  p_propertyKeys = &self->_propertyKeys;
  propertyKeys = self->_propertyKeys;
  if (propertyKeys != v5 && !-[NSArray isEqualToArray:](propertyKeys, "isEqualToArray:", v5))
  {
    if (-[NSArray containsObject:](v5, "containsObject:", CFSTR("episodes")))
    {
      _MTLogCategoryDatabase();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[MTFetchedResultsController fetchRequest](self, "fetchRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "entityName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTFetchedResultsController fetchRequest](self, "fetchRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "predicate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v10;
        v15 = 2114;
        v16 = v12;
        _os_log_impl(&dword_1A904E000, v8, OS_LOG_TYPE_ERROR, "MTFetchedResultsController with episodes within property keys detected - entity %{public}@ - predicate %{public}@", (uint8_t *)&v13, 0x16u);

      }
    }
    objc_storeStrong((id *)p_propertyKeys, a3);
  }

}

- (NSManagedObjectContext)managedObjectContext
{
  return -[NSFetchedResultsController managedObjectContext](self->_frc, "managedObjectContext");
}

- (NSFetchRequest)fetchRequest
{
  return -[NSFetchedResultsController fetchRequest](self->_frc, "fetchRequest");
}

- (NSArray)sections
{
  return -[NSFetchedResultsController sections](self->_frc, "sections");
}

- (id)objectAtIndexPath:(id)a3
{
  return -[NSFetchedResultsController objectAtIndexPath:](self->_frc, "objectAtIndexPath:", a3);
}

- (id)indexPathForObject:(id)a3
{
  return -[NSFetchedResultsController indexPathForObject:](self->_frc, "indexPathForObject:", a3);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t v25[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  -[MTFetchedResultsController propertyKeys](self, "propertyKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    switch(a6)
    {
      case 1uLL:
      case 3uLL:
        goto LABEL_8;
      case 2uLL:
        objc_msgSend(v13, "objectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTFetchedResultsController _removeObjectFromCacheWithId:](self, "_removeObjectFromCacheWithId:", v18);

        goto LABEL_9;
      case 4uLL:
        if (!-[MTFetchedResultsController _hasManagedObjectChanged:](self, "_hasManagedObjectChanged:", v13))
        {
          _MTLogCategoryDatabase();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl(&dword_1A904E000, v21, OS_LOG_TYPE_DEBUG, "Managed object was updated, but none of the properties we care about changed", v25, 2u);
          }
          goto LABEL_6;
        }
LABEL_8:
        -[MTFetchedResultsController _updateCacheWithManagedObject:](self, "_updateCacheWithManagedObject:", v13);
LABEL_9:
        v22 = (void *)objc_opt_new();
        v23 = v22;
        if (v13)
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v13, CFSTR("object"));
        if (v14)
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("indexPath"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("type"));

        if (v15)
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v15, CFSTR("newIndexPath"));
        -[NSMutableArray addObject:](self->_changes, "addObject:", v23);

        break;
      default:
        goto LABEL_9;
    }
  }
  else
  {
    -[MTFetchedResultsController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[MTFetchedResultsController delegate](self, "delegate");
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:](v21, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", v12, v13, v14, a6, v15);
LABEL_6:

    }
  }

}

- (void)controllerWillChangeContent:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MTFetchedResultsController propertyKeys](self, "propertyKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[MTFetchedResultsController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[MTFetchedResultsController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "controllerWillChangeContent:", v9);

    }
  }

}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
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
  uint64_t v18;
  void *v19;
  MTFetchedResultsController *v20;
  NSMutableArray *obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  -[MTFetchedResultsController propertyKeys](self, "propertyKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    if (-[NSMutableArray count](self->_changes, "count"))
    {
      -[MTFetchedResultsController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "controllerWillChangeContent:", v22);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v20 = self;
        obj = self->_changes;
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v24 != v9)
                objc_enumerationMutation(obj);
              v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("object"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("indexPath"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("type"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "unsignedIntegerValue");
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("newIndexPath"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", v22, v12, v13, v15, v16);

            }
            v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v8);
        }

        self = v20;
      }
      -[NSMutableArray removeAllObjects](self->_changes, "removeAllObjects");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "controllerDidChangeContent:", v22);

    }
  }
  else
  {
    -[MTFetchedResultsController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[MTFetchedResultsController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "controllerDidChangeContent:", v22);

    }
  }

}

- (id)_dictionaryFromCacheForObjectID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_propertyCache, "objectForKeyedSubscript:", a3);
}

- (void)_removeObjectFromCacheWithId:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_propertyCache, "removeObjectForKey:", a3);
}

- (BOOL)_hasManagedObjectChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTFetchedResultsController _dictionaryFromCacheForObjectID:](self, "_dictionaryFromCacheForObjectID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTFetchedResultsController _dictionaryForObject:](self, "_dictionaryForObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToDictionary:", v7) ^ 1;
  return (char)v4;
}

- (NSFetchedResultsControllerDelegate)delegate
{
  return (NSFetchedResultsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_propertyKeys, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_propertyCache, 0);
  objc_storeStrong((id *)&self->_frc, 0);
}

@end
