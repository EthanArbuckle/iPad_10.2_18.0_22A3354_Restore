@implementation ICRecentNotesCoreDataIndexer

- (ICRecentNotesCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  ICRecentNotesCoreDataIndexer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICRecentNotesCoreDataIndexer;
  v4 = -[ICCoreDataIndexer initWithLegacyManagedObjectContext:modernManagedObjectContext:](&v6, sel_initWithLegacyManagedObjectContext_modernManagedObjectContext_, a3, a4);
  if (v4)
    -[ICRecentNotesCoreDataIndexer setSortType:](v4, "setSortType:", objc_msgSend(MEMORY[0x1E0D64230], "currentNoteListSortType"));
  return v4;
}

- (void)setShouldIncludeOutlineParentItems:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v3 = a3;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[ICRecentNotesCoreDataIndexer setShouldIncludeOutlineParentItems:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v13.receiver = self;
  v13.super_class = (Class)ICRecentNotesCoreDataIndexer;
  -[ICCoreDataIndexer setShouldIncludeOutlineParentItems:](&v13, sel_setShouldIncludeOutlineParentItems_, v3);
}

- (void)setMaximumNumberOfNotesPerAccount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  self->_maximumNumberOfNotesPerAccount = a3;
  -[ICRecentNotesCoreDataIndexer legacyNoteFetchedResultsController](self, "legacyNoteFetchedResultsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchBatchSize:", a3);

  -[ICRecentNotesCoreDataIndexer modernNoteFetchedResultsController](self, "modernNoteFetchedResultsController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchBatchSize:", a3);

}

- (void)setChecklistsOnly:(BOOL)a3
{
  NSFetchedResultsController *legacyNoteFetchedResultsController;
  NSFetchedResultsController *modernNoteFetchedResultsController;

  if (self->_checklistsOnly != a3)
  {
    self->_checklistsOnly = a3;
    legacyNoteFetchedResultsController = self->_legacyNoteFetchedResultsController;
    self->_legacyNoteFetchedResultsController = 0;

    modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
    self->_modernNoteFetchedResultsController = 0;

  }
}

- (void)setPinnedOnly:(BOOL)a3
{
  NSFetchedResultsController *legacyNoteFetchedResultsController;
  NSFetchedResultsController *modernNoteFetchedResultsController;

  if (self->_pinnedOnly != a3)
  {
    self->_pinnedOnly = a3;
    legacyNoteFetchedResultsController = self->_legacyNoteFetchedResultsController;
    self->_legacyNoteFetchedResultsController = 0;

    modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
    self->_modernNoteFetchedResultsController = 0;

  }
}

- (void)setPasswordProtectedOnly:(BOOL)a3
{
  NSFetchedResultsController *legacyNoteFetchedResultsController;
  NSFetchedResultsController *modernNoteFetchedResultsController;

  if (self->_passwordProtectedOnly != a3)
  {
    self->_passwordProtectedOnly = a3;
    legacyNoteFetchedResultsController = self->_legacyNoteFetchedResultsController;
    self->_legacyNoteFetchedResultsController = 0;

    modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
    self->_modernNoteFetchedResultsController = 0;

  }
}

- (void)setNonPasswordProtectedOnly:(BOOL)a3
{
  NSFetchedResultsController *legacyNoteFetchedResultsController;
  NSFetchedResultsController *modernNoteFetchedResultsController;

  if (self->_nonPasswordProtectedOnly != a3)
  {
    self->_nonPasswordProtectedOnly = a3;
    legacyNoteFetchedResultsController = self->_legacyNoteFetchedResultsController;
    self->_legacyNoteFetchedResultsController = 0;

    modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
    self->_modernNoteFetchedResultsController = 0;

  }
}

- (void)setSortType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  self->_sortType = a3;
  objc_msgSend(MEMORY[0x1E0D64230], "legacySortDescriptorsForType:", -[ICRecentNotesCoreDataIndexer sortType](self, "sortType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRecentNotesCoreDataIndexer legacyNoteFetchedResultsController](self, "legacyNoteFetchedResultsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v4);

  objc_msgSend(MEMORY[0x1E0D64230], "sortDescriptorsForType:", -[ICRecentNotesCoreDataIndexer sortType](self, "sortType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ICRecentNotesCoreDataIndexer modernNoteFetchedResultsController](self, "modernNoteFetchedResultsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v9);

}

- (OS_dispatch_queue)indexAccessQueue
{
  OS_dispatch_queue *indexAccessQueue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  indexAccessQueue = self->_indexAccessQueue;
  if (!indexAccessQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notes.recent-notes-index-access-queue", v4);
    v6 = self->_indexAccessQueue;
    self->_indexAccessQueue = v5;

    indexAccessQueue = self->_indexAccessQueue;
  }
  return indexAccessQueue;
}

- (NSFetchedResultsController)legacyNoteFetchedResultsController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSFetchedResultsController *v10;
  NSFetchedResultsController *legacyNoteFetchedResultsController;

  if (!self->_legacyNoteFetchedResultsController
    && !-[ICRecentNotesCoreDataIndexer pinnedOnly](self, "pinnedOnly")
    && !-[ICRecentNotesCoreDataIndexer checklistsOnly](self, "checklistsOnly"))
  {
    v3 = (void *)MEMORY[0x1E0C97B48];
    ICLegacyEntityNameNote();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(MEMORY[0x1E0D64230], "legacySortDescriptorsForType:", -[ICRecentNotesCoreDataIndexer sortType](self, "sortType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSortDescriptors:", v6);

    objc_msgSend(MEMORY[0x1E0D629F0], "visibleNotesPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v7);

    v8 = objc_alloc(MEMORY[0x1E0C97B68]);
    -[ICCoreDataIndexer legacyManagedObjectContext](self, "legacyManagedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSFetchedResultsController *)objc_msgSend(v8, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v5, v9, 0, 0);
    legacyNoteFetchedResultsController = self->_legacyNoteFetchedResultsController;
    self->_legacyNoteFetchedResultsController = v10;

  }
  return self->_legacyNoteFetchedResultsController;
}

- (NSFetchedResultsController)modernNoteFetchedResultsController
{
  NSFetchedResultsController *modernNoteFetchedResultsController;
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSFetchedResultsController *v32;
  NSFetchedResultsController *v33;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
  if (!modernNoteFetchedResultsController)
  {
    v4 = (void *)MEMORY[0x1E0CB3528];
    v5 = (void *)MEMORY[0x1E0D63BB8];
    -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForVisibleNotesInContext:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v7;
    objc_msgSend(MEMORY[0x1E0D63BB8], "predicateForSystemPaperNotesNotInTrash");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ICRecentNotesCoreDataIndexer checklistsOnly](self, "checklistsOnly"))
    {
      v11 = (void *)MEMORY[0x1E0CB3528];
      v38[0] = v10;
      objc_msgSend(MEMORY[0x1E0D63BB8], "predicateForNotesWithChecklists");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }
    if (-[ICRecentNotesCoreDataIndexer pinnedOnly](self, "pinnedOnly"))
    {
      v15 = (void *)MEMORY[0x1E0CB3528];
      v37[0] = v10;
      objc_msgSend(MEMORY[0x1E0D63BB8], "predicateForPinnedNotes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "andPredicateWithSubpredicates:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v18;
    }
    if (-[ICRecentNotesCoreDataIndexer passwordProtectedOnly](self, "passwordProtectedOnly"))
    {
      v19 = (void *)MEMORY[0x1E0CB3528];
      v36[0] = v10;
      objc_msgSend(MEMORY[0x1E0D63A90], "predicateForPasswordProtectedObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "andPredicateWithSubpredicates:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v22;
    }
    if (-[ICRecentNotesCoreDataIndexer nonPasswordProtectedOnly](self, "nonPasswordProtectedOnly"))
    {
      v23 = (void *)MEMORY[0x1E0CB3528];
      v35[0] = v10;
      objc_msgSend(MEMORY[0x1E0D63A90], "predicateForPasswordProtectedObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "notPredicateWithSubpredicate:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "andPredicateWithSubpredicates:", v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v27;
    }
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *MEMORY[0x1E0D637D0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(MEMORY[0x1E0D64230], "sortDescriptorsForType:", -[ICRecentNotesCoreDataIndexer sortType](self, "sortType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSortDescriptors:", v29);

    objc_msgSend(v28, "setPredicate:", v10);
    v30 = objc_alloc(MEMORY[0x1E0C97B68]);
    -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (NSFetchedResultsController *)objc_msgSend(v30, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v28, v31, 0, 0);
    v33 = self->_modernNoteFetchedResultsController;
    self->_modernNoteFetchedResultsController = v32;

    modernNoteFetchedResultsController = self->_modernNoteFetchedResultsController;
  }
  return modernNoteFetchedResultsController;
}

- (NSMutableDictionary)sectionIdentifiersToManagedObjectIDs
{
  NSMutableDictionary *sectionIdentifiersToManagedObjectIDs;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  sectionIdentifiersToManagedObjectIDs = self->_sectionIdentifiersToManagedObjectIDs;
  if (!sectionIdentifiersToManagedObjectIDs)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sectionIdentifiersToManagedObjectIDs;
    self->_sectionIdentifiersToManagedObjectIDs = v4;

    sectionIdentifiersToManagedObjectIDs = self->_sectionIdentifiersToManagedObjectIDs;
  }
  return sectionIdentifiersToManagedObjectIDs;
}

- (id)activeFetchedResultsControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRecentNotesCoreDataIndexer legacyNoteFetchedResultsController](self, "legacyNoteFetchedResultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICRecentNotesCoreDataIndexer legacyNoteFetchedResultsController](self, "legacyNoteFetchedResultsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[ICRecentNotesCoreDataIndexer modernNoteFetchedResultsController](self, "modernNoteFetchedResultsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICRecentNotesCoreDataIndexer modernNoteFetchedResultsController](self, "modernNoteFetchedResultsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (void)willIndex
{
  NSObject *v3;
  _QWORD block[5];

  -[ICRecentNotesCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ICRecentNotesCoreDataIndexer_willIndex__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __41__ICRecentNotesCoreDataIndexer_willIndex__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersToManagedObjectIDs");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v14;
  ICRecentNotesCoreDataIndexer *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  v8 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__62;
  v21 = __Block_byref_object_dispose__62;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[ICRecentNotesCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__ICRecentNotesCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke;
  block[3] = &unk_1E5C1DC18;
  v10 = v7;
  v14 = v10;
  v15 = self;
  v16 = &v17;
  dispatch_sync(v9, block);

  v11 = (void *)objc_msgSend((id)v18[5], "copy");
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __92__ICRecentNotesCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  ICFolderListSectionIdentifier *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  __int128 v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v29;
    *(_QWORD *)&v3 = 138412290;
    v26 = v3;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        objc_opt_class();
        ICDynamicCast();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isSystemPaper");
        v10 = [ICFolderListSectionIdentifier alloc];
        if ((v9 & 1) != 0)
          v11 = -[ICFolderListSectionIdentifier initWithSectionType:](v10, "initWithSectionType:", 1);
        else
          v11 = -[ICFolderListSectionIdentifier initWithObject:](v10, "initWithObject:", v7);
        v12 = (void *)v11;

        if (!v12)
        {
          v25 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v26;
            v33 = v7;
            _os_log_debug_impl(&dword_1AC7A1000, v25, OS_LOG_TYPE_DEBUG, "Cannot create folder list section identifier from object %@", buf, 0xCu);
          }
          goto LABEL_16;
        }
        objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v12);

        }
        objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs", v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");
        v20 = objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfNotesPerAccount");

        if (v19 < v20)
        {
          objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v23);

          v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(v7, "objectID");
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);
LABEL_16:

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v4);
  }

}

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  ICRecentNotesCoreDataIndexer *v12;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[ICRecentNotesCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __110__ICRecentNotesCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v10[3] = &unk_1E5C1D9A8;
  v7 = v5;
  v11 = v7;
  v12 = self;
  dispatch_sync(v6, v10);

  v8 = v7;
  return v8;
}

void __110__ICRecentNotesCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sortedSectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendSectionsWithIdentifiers:", v3);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = *(void **)(a1 + 32);
        objc_msgSend(v12, "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v14, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRecentNotesCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __117__ICRecentNotesCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v12[3] = &unk_1E5C1D9A8;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  dispatch_sync(v7, v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __117__ICRecentNotesCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersToManagedObjectIDs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = objc_alloc_init(MEMORY[0x1E0DC3390]);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v8);

        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersToManagedObjectIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendItems:", v13);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (NSArray)sortedSectionIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ICRecentNotesCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICFolderListSectionIdentifier sortDescriptors](ICFolderListSectionIdentifier, "sortDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)sectionIdentifierForHeaderInSection:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3 < 0
    || (-[ICRecentNotesCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "count"), v5, v6 <= a3))
  {
    -[ICRecentNotesCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[ICRecentNotesCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)firstRelevantItemIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICRecentNotesCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRecentNotesCoreDataIndexer sortedSectionIdentifiers](self, "sortedSectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[ICRecentNotesCoreDataIndexer nextRelevantItemIdentifierAfter:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

- (int64_t)sortType
{
  return self->_sortType;
}

- (unint64_t)maximumNumberOfNotesPerAccount
{
  return self->_maximumNumberOfNotesPerAccount;
}

- (BOOL)checklistsOnly
{
  return self->_checklistsOnly;
}

- (BOOL)pinnedOnly
{
  return self->_pinnedOnly;
}

- (BOOL)passwordProtectedOnly
{
  return self->_passwordProtectedOnly;
}

- (BOOL)nonPasswordProtectedOnly
{
  return self->_nonPasswordProtectedOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifiersToManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_modernNoteFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_legacyNoteFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_indexAccessQueue, 0);
}

- (void)setShouldIncludeOutlineParentItems:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_9(&dword_1AC7A1000, a1, a3, "[ICRecentNotesCoreDataIndexer setShouldIncludeOutlineParentItems:] is not implemented", a5, a6, a7, a8, 0);
}

- (void)nextRelevantItemIdentifierAfter:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_9(&dword_1AC7A1000, a1, a3, "[ICRecentNotesCoreDataIndexer nextRelevantItemIdentifierAfter:] is not implemented", a5, a6, a7, a8, 0);
}

@end
