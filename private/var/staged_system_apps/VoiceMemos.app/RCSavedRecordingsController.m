@implementation RCSavedRecordingsController

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  objc_super v5;

  WeakRetained = a3;
  if (!WeakRetained)
    WeakRetained = objc_loadWeakRetained((id *)&self->_defaultDelegate);
  v5.receiver = self;
  v5.super_class = (Class)RCSavedRecordingsController;
  -[RCSavedRecordingsController setDelegate:](&v5, "setDelegate:", WeakRetained);

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSFetchRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RCSavedRecordingsController *v9;
  void *v10;
  RCSavedRecordingsController *v11;

  v4 = objc_opt_new(NSFetchRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchRequest entity](self->_fetchRequest, "entity"));
  -[NSFetchRequest setEntity:](v4, "setEntity:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchRequest predicate](self->_fetchRequest, "predicate"));
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchRequest propertiesToFetch](self->_fetchRequest, "propertiesToFetch"));
  -[NSFetchRequest setPropertiesToFetch:](v4, "setPropertiesToFetch:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSFetchRequest sortDescriptors](self->_fetchRequest, "sortDescriptors"));
  -[NSFetchRequest setSortDescriptors:](v4, "setSortDescriptors:", v8);

  -[NSFetchRequest setFetchBatchSize:](v4, "setFetchBatchSize:", -[NSFetchRequest fetchBatchSize](self->_fetchRequest, "fetchBatchSize"));
  v9 = [RCSavedRecordingsController alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCSavedRecordingsController managedObjectContext](self, "managedObjectContext"));
  v11 = -[RCSavedRecordingsController initWithFetchRequest:managedObjectContext:](v9, "initWithFetchRequest:managedObjectContext:", v4, v10);

  return v11;
}

- (void)setDefaultDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_storeWeak((id *)&self->_defaultDelegate, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCSavedRecordingsController delegate](self, "delegate"));

  if (!v5)
  {
    v6.receiver = self;
    v6.super_class = (Class)RCSavedRecordingsController;
    -[RCSavedRecordingsController setDelegate:](&v6, "setDelegate:", v4);
  }

}

- (RCSavedRecordingsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v7;
  RCSavedRecordingsController *v8;
  RCSavedRecordingsController *v9;
  uint64_t v10;
  NSPredicate *fetchPredicate;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RCSavedRecordingsController;
  v8 = -[RCSavedRecordingsController initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:](&v13, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v7, a4, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fetchRequest, a3);
    v10 = objc_claimAutoreleasedReturnValue(-[NSFetchRequest predicate](v9->_fetchRequest, "predicate"));
    fetchPredicate = v9->_fetchPredicate;
    v9->_fetchPredicate = (NSPredicate *)v10;

  }
  return v9;
}

- (NSArray)fetchedRecordings
{
  return -[RCSavedRecordingsController cloudRecordings](self, "cloudRecordings");
}

- (NSArray)cloudRecordings
{
  unsigned __int8 v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v8;

  if (!self->_hasPerformedFetch)
  {
    v8 = 0;
    v3 = -[RCSavedRecordingsController performFetch:](self, "performFetch:", &v8);
    v4 = v8;
    if ((v3 & 1) == 0)
    {
      v5 = OSLogForCategory(kVMLogCategoryDefault);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10010E594();

    }
  }
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[RCSavedRecordingsController _fetchedObjects](self, "_fetchedObjects"));
}

- (void)setFolder:(id)a3
{
  objc_storeWeak((id *)&self->_folder, a3);
}

- (BOOL)performFetch:(id *)a3
{
  BOOL result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCSavedRecordingsController;
  result = -[RCSavedRecordingsController performFetch:](&v5, "performFetch:", a3);
  self->_hasPerformedFetch = result;
  return result;
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RCSavedRecordingsController;
  -[RCSavedRecordingsController setDelegate:](&v2, "setDelegate:", 0);
}

- (void)setSubPredicate:(id)a3 performingFetch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _QWORD v50[2];

  v4 = a4;
  v6 = a3;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RCSavedRecordingsController delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v38, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:");
  v8 = v7;
  v9 = 0;
  if (v4 && (v7 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCSavedRecordingsController fetchedObjects](self, "fetchedObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v10));

  }
  if (v6)
  {
    v50[0] = self->_fetchPredicate;
    v50[1] = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));
    -[NSFetchRequest setPredicate:](self->_fetchRequest, "setPredicate:", v12);

    if (!v4)
      goto LABEL_40;
  }
  else
  {
    -[NSFetchRequest setPredicate:](self->_fetchRequest, "setPredicate:", self->_fetchPredicate);
    if (!v4)
      goto LABEL_40;
  }
  v47 = 0;
  v13 = -[RCSavedRecordingsController performFetch:](self, "performFetch:", &v47);
  v14 = v47;
  if ((v13 & 1) == 0)
  {
    v15 = OSLogForCategory(kVMLogCategoryDefault);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10010E528();

  }
  if ((v8 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCSavedRecordingsController fetchedObjects](self, "fetchedObjects"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v17));

    if ((objc_msgSend(v9, "isEqual:", v18) & 1) == 0)
    {
      if ((objc_opt_respondsToSelector(v38, "controllerWillChangeContent:") & 1) != 0)
        objc_msgSend(v38, "controllerWillChangeContent:", self);
      v36 = v14;
      v37 = v6;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v35 = v18;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v44 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v9, "containsObject:", v24, v35, v36, v37) & 1) == 0)
            {
              v25 = objc_msgSend(v19, "indexOfObject:", v24);
              if (v25 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v25, 0));
                objc_msgSend(v38, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", self, v24, 0, 1, v26);

              }
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        }
        while (v21);
      }

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v27 = v9;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v29; j = (char *)j + 1)
          {
            if (*(_QWORD *)v40 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v19, "containsObject:", v32, v35, v36, v37) & 1) == 0)
            {
              v33 = objc_msgSend(v27, "indexOfObject:", v32);
              if (v33 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v33, 0));
                objc_msgSend(v38, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:", self, v32, v34, 2, 0);

              }
            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        }
        while (v29);
      }

      v14 = v36;
      v6 = v37;
      v18 = v35;
      if ((objc_opt_respondsToSelector(v38, "controllerDidChangeContent:") & 1) != 0)
        objc_msgSend(v38, "controllerDidChangeContent:", self);
    }

  }
LABEL_40:

}

- (id)fetchedObjects
{
  unsigned __int8 v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  objc_super v9;
  id v10;

  if (!self->_hasPerformedFetch)
  {
    v10 = 0;
    v3 = -[RCSavedRecordingsController performFetch:](self, "performFetch:", &v10);
    v4 = v10;
    if ((v3 & 1) == 0)
    {
      v5 = OSLogForCategory(kVMLogCategoryDefault);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10010E600();

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)RCSavedRecordingsController;
  v7 = -[RCSavedRecordingsController fetchedObjects](&v9, "fetchedObjects");
  return (id)objc_claimAutoreleasedReturnValue(v7);
}

- (NSPredicate)fetchPredicate
{
  return self->_fetchPredicate;
}

- (RCFolder)folder
{
  return (RCFolder *)objc_loadWeakRetained((id *)&self->_folder);
}

- (NSFetchedResultsControllerDelegate)defaultDelegate
{
  return (NSFetchedResultsControllerDelegate *)objc_loadWeakRetained((id *)&self->_defaultDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_folder);
  objc_destroyWeak((id *)&self->_defaultDelegate);
  objc_storeStrong((id *)&self->_fetchPredicate, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

@end
