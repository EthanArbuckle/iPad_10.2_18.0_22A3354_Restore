@implementation ICInvitationsCoreDataIndexer

- (void)willIndex
{
  NSObject *v3;
  _QWORD block[5];

  -[ICInvitationsCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ICInvitationsCoreDataIndexer_willIndex__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)setExpansionStateContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setAccount:(id)a3
{
  NSFetchedResultsController *fetchedResultsController;
  id v6;

  objc_storeStrong((id *)&self->_account, a3);
  v6 = a3;
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = 0;

}

- (ICInvitationsCoreDataIndexer)initWithModernManagedObjectContext:(id)a3 sectionIdentifier:(id)a4
{
  id v7;
  ICInvitationsCoreDataIndexer *v8;
  ICInvitationsCoreDataIndexer *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *indexAccessQueue;
  uint64_t v13;
  NSMutableOrderedSet *invitationObjectIDs;
  uint64_t v15;
  ICFolderCustomNoteSortType *sortType;
  uint64_t v17;
  NSDate *receivedSince;
  objc_super v20;

  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ICInvitationsCoreDataIndexer;
  v8 = -[ICCoreDataIndexer initWithLegacyManagedObjectContext:modernManagedObjectContext:](&v20, sel_initWithLegacyManagedObjectContext_modernManagedObjectContext_, 0, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sectionIdentifier, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.notes.invitations-index-access-queue", v10);
    indexAccessQueue = v9->_indexAccessQueue;
    v9->_indexAccessQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v13 = objc_claimAutoreleasedReturnValue();
    invitationObjectIDs = v9->_invitationObjectIDs;
    v9->_invitationObjectIDs = (NSMutableOrderedSet *)v13;

    objc_msgSend(MEMORY[0x1E0D64200], "noteSortTypeDefaultAscending");
    v15 = objc_claimAutoreleasedReturnValue();
    sortType = v9->_sortType;
    v9->_sortType = (ICFolderCustomNoteSortType *)v15;

    objc_msgSend((id)objc_opt_class(), "defaultReceivedSince");
    v17 = objc_claimAutoreleasedReturnValue();
    receivedSince = v9->_receivedSince;
    v9->_receivedSince = (NSDate *)v17;

  }
  return v9;
}

+ (NSDate)defaultReceivedSince
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, -30, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__27;
  v16 = __Block_byref_object_dispose__27;
  v17 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[ICInvitationsCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __110__ICInvitationsCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v11[3] = &unk_1E5C20078;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v8, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (OS_dispatch_queue)indexAccessQueue
{
  return self->_indexAccessQueue;
}

- (id)activeFetchedResultsControllers
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInvitationsCoreDataIndexer fetchedResultsController](self, "fetchedResultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (NSFetchedResultsController)fetchedResultsController
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
  id v12;
  void *v13;
  NSFetchedResultsController *v14;
  NSFetchedResultsController *fetchedResultsController;

  if (!self->_fetchedResultsController)
  {
    -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *MEMORY[0x1E0D63740]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
      v5 = (void *)MEMORY[0x1E0D64230];
      -[ICInvitationsCoreDataIndexer sortType](self, "sortType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sortDescriptorsForCurrentTypeIncludingPinnedNotes:folderNoteSortType:", 0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSortDescriptors:", v7);

      v8 = (void *)MEMORY[0x1E0D63B58];
      -[ICInvitationsCoreDataIndexer account](self, "account");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICInvitationsCoreDataIndexer receivedSince](self, "receivedSince");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicateForPendingInvitationsInAccount:receivedSince:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPredicate:", v11);

      v12 = objc_alloc(MEMORY[0x1E0C97B68]);
      -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (NSFetchedResultsController *)objc_msgSend(v12, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v4, v13, 0, 0);
      fetchedResultsController = self->_fetchedResultsController;
      self->_fetchedResultsController = v14;

    }
  }
  return self->_fetchedResultsController;
}

- (ICFolderCustomNoteSortType)sortType
{
  return self->_sortType;
}

- (NSDate)receivedSince
{
  return self->_receivedSince;
}

- (ICAccount)account
{
  return self->_account;
}

void __41__ICInvitationsCoreDataIndexer_willIndex__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "invitationObjectIDs");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

void __110__ICInvitationsCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "invitationObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v6);

    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "invitationObjectIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v9, v10);

  }
}

- (NSMutableOrderedSet)invitationObjectIDs
{
  return self->_invitationObjectIDs;
}

- (void)setSortType:(id)a3
{
  NSFetchedResultsController *fetchedResultsController;
  id v6;

  objc_storeStrong((id *)&self->_sortType, a3);
  v6 = a3;
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = 0;

}

- (void)setReceivedSince:(id)a3
{
  NSFetchedResultsController *fetchedResultsController;
  id v6;

  objc_storeStrong((id *)&self->_receivedSince, a3);
  v6 = a3;
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = 0;

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
  ICInvitationsCoreDataIndexer *v15;
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
  v20 = __Block_byref_object_copy__27;
  v21 = __Block_byref_object_dispose__27;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[ICInvitationsCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__ICInvitationsCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke;
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

void __92__ICInvitationsCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  objc_msgSend(*(id *)(a1 + 32), "objects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "invitationObjectIDs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(v7, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a4;
  v9 = a5;
  if (a3 == 5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__27;
    v18 = __Block_byref_object_dispose__27;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[ICInvitationsCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __117__ICInvitationsCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
    v13[3] = &unk_1E5C20078;
    v13[4] = self;
    v13[5] = &v14;
    dispatch_sync(v10, v13);

    v11 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA70];
  }

  return v11;
}

void __117__ICInvitationsCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "invitationObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3390]);
    v5 = objc_msgSend(*(id *)(a1 + 32), "shouldIncludeOutlineParentItems");
    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v6, "sectionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItems:", v8);

      objc_msgSend(*(id *)(a1 + 32), "invitationObjectIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItems:intoParentItem:", v10, v11);

      +[ICExpansionState sharedExpansionState](ICExpansionState, "sharedExpansionState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "expansionStateContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "isSectionIdentiferExpanded:inContext:", v13, v14);

      if (!objc_msgSend(*(id *)(a1 + 32), "shouldIncludeOutlineParentItems") || !v15)
        goto LABEL_8;
      objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "expandItems:", v17);
    }
    else
    {
      objc_msgSend(v6, "invitationObjectIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItems:", v17);
    }

LABEL_8:
    v18 = *(void **)(a1 + 32);
    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v18, "sectionIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v4, v20);

  }
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3 != 5)
    return MEMORY[0x1E0C9AA60];
  -[ICInvitationsCoreDataIndexer sectionIdentifier](self, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)totalInvitationsCount
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ICInvitationsCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__ICInvitationsCoreDataIndexer_totalInvitationsCount__block_invoke;
  v6[3] = &unk_1E5C1D9D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __53__ICInvitationsCoreDataIndexer_totalInvitationsCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "invitationObjectIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)firstRelevantItemIdentifier
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__27;
  v11 = __Block_byref_object_dispose__27;
  v12 = 0;
  -[ICInvitationsCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ICInvitationsCoreDataIndexer_firstRelevantItemIdentifier__block_invoke;
  v6[3] = &unk_1E5C1D9D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __59__ICInvitationsCoreDataIndexer_firstRelevantItemIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "invitationObjectIDs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  ICInvitationsCoreDataIndexer *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__27;
  v17 = __Block_byref_object_dispose__27;
  v18 = 0;
  -[ICInvitationsCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ICInvitationsCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke;
  block[3] = &unk_1E5C1E760;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __64__ICInvitationsCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "invitationObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ic_objectAfter:", v5);
  }
  else
  {
    objc_msgSend(v3, "firstObject");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
  if (v5)
  {

    v4 = v2;
  }

}

- (void)deleteObjectWithIDFromIndex:(id)a3 inSection:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  -[ICInvitationsCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ICInvitationsCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke;
  block[3] = &unk_1E5C1D9A8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __70__ICInvitationsCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "invitationObjectIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (NSString)expansionStateContext
{
  return self->_expansionStateContext;
}

- (ICSectionIdentifier)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationObjectIDs, 0);
  objc_storeStrong((id *)&self->_indexAccessQueue, 0);
  objc_storeStrong((id *)&self->_receivedSince, 0);
  objc_storeStrong((id *)&self->_sortType, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_expansionStateContext, 0);
}

@end
