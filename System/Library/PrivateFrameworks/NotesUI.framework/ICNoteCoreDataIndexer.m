@implementation ICNoteCoreDataIndexer

void __39__ICNoteCoreDataIndexer_totalNoteCount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((unint64_t)(objc_msgSend(a2, "sectionType") - 3) <= 2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v5, "count");

}

- (void)updateModernFetchedResultsControllers
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
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
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[3];

  v63[2] = *MEMORY[0x1E0C80C00];
  -[ICNoteCoreDataIndexer noteContainer](self, "noteContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[ICNoteCoreDataIndexer noteQuery](self, "noteQuery"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[ICNoteCoreDataIndexer virtualSmartFolder](self, "virtualSmartFolder");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      -[ICNoteCoreDataIndexer setModernPinnedNoteFetchedResultsController:](self, "setModernPinnedNoteFetchedResultsController:", 0);
      -[ICNoteCoreDataIndexer setModernNoteFetchedResultsController:](self, "setModernNoteFetchedResultsController:", 0);
      return;
    }
  }
  v4 = (void *)MEMORY[0x1E0D64230];
  -[ICNoteCoreDataIndexer sortType](self, "sortType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptorsForCurrentTypeIncludingPinnedNotes:folderNoteSortType:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteCoreDataIndexer noteContainer](self, "noteContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteCoreDataIndexer noteContainer](self, "noteContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_existingObjectWithID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateForVisibleNotes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    goto LABEL_9;
  }
  -[ICNoteCoreDataIndexer noteQuery](self, "noteQuery");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3528];
    -[ICNoteCoreDataIndexer noteQuery](self, "noteQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v9;
    objc_msgSend(MEMORY[0x1E0D63BB8], "predicateForFetchedFromCloudObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[ICNoteCoreDataIndexer virtualSmartFolder](self, "virtualSmartFolder");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[ICNoteCoreDataIndexer virtualSmartFolder](self, "virtualSmartFolder");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "predicateForContext:", v39);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
LABEL_9:
  if (-[ICNoteCoreDataIndexer sortsByPinned](self, "sortsByPinned"))
  {
    v16 = (void *)MEMORY[0x1E0CB3528];
    v62[0] = v13;
    objc_msgSend(MEMORY[0x1E0D63BB8], "predicateForPinnedNotes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "andPredicateWithSubpredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0D63BB8], "predicateForPinnedNotes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "notPredicateWithSubpredicate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0CB3528];
    v61[0] = v13;
    v61[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v13;
  }
  -[ICNoteCoreDataIndexer noteQuery](self, "noteQuery");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "entityName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    v58 = v19;
    v59 = v25;
    v30 = v13;
    v31 = v6;
    -[ICNoteCoreDataIndexer virtualSmartFolder](self, "virtualSmartFolder");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "query");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "entityName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      v29 = v34;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D63BB8], "entity");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "name");
      v29 = (id)objc_claimAutoreleasedReturnValue();

    }
    v6 = v31;
    v13 = v30;
    v19 = v58;
    v25 = v59;
  }

  -[ICNoteCoreDataIndexer modernPinnedNoteFetchedResultsController](self, "modernPinnedNoteFetchedResultsController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[ICNoteCoreDataIndexer modernPinnedNoteFetchedResultsController](self, "modernPinnedNoteFetchedResultsController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "fetchRequest");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setPredicate:", v19);

    -[ICNoteCoreDataIndexer modernPinnedNoteFetchedResultsController](self, "modernPinnedNoteFetchedResultsController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "fetchRequest");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setSortDescriptors:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v29);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setPredicate:", v19);
    objc_msgSend(v44, "setSortDescriptors:", v6);
    v46 = objc_alloc(MEMORY[0x1E0C97B68]);
    -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v44, v45, 0, 0);
    -[ICNoteCoreDataIndexer setModernPinnedNoteFetchedResultsController:](self, "setModernPinnedNoteFetchedResultsController:", v47);

  }
  -[ICNoteCoreDataIndexer modernNoteFetchedResultsController](self, "modernNoteFetchedResultsController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[ICNoteCoreDataIndexer modernNoteFetchedResultsController](self, "modernNoteFetchedResultsController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "fetchRequest");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setPredicate:", v25);

    -[ICNoteCoreDataIndexer modernNoteFetchedResultsController](self, "modernNoteFetchedResultsController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "fetchRequest");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setSortDescriptors:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v29);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setPredicate:", v25);
    objc_msgSend(v51, "setSortDescriptors:", v6);
    -[ICNoteCoreDataIndexer modernDateHeadersAttribute](self, "modernDateHeadersAttribute");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      -[ICNoteCoreDataIndexer modernDateHeadersAttribute](self, "modernDateHeadersAttribute");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setPropertiesToFetch:", v55);

    }
    v56 = objc_alloc(MEMORY[0x1E0C97B68]);
    -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v56, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v51, v52, 0, 0);
    -[ICNoteCoreDataIndexer setModernNoteFetchedResultsController:](self, "setModernNoteFetchedResultsController:", v57);

  }
}

uint64_t __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "sortsByPinned");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)modernDateHeadersAttribute
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[ICNoteCoreDataIndexer resolvedDateHeadersType](self, "resolvedDateHeadersType");
  v3 = CFSTR("creationDate");
  if (v2 != 2)
    v3 = 0;
  if (v2 == 1)
    return CFSTR("modificationDate");
  else
    return (id)v3;
}

- (void)setModernPinnedNoteFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_modernPinnedNoteFetchedResultsController, a3);
}

- (void)setModernNoteFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_modernNoteFetchedResultsController, a3);
}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v16;
  id v17;
  ICNoteCoreDataIndexer *v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__28;
  v25 = __Block_byref_object_dispose__28;
  v26 = 0;
  -[ICNoteCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke;
  block[3] = &unk_1E5C200E8;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = &v21;
  v20 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_sync(v10, block);

  v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __34__ICNoteCoreDataIndexer_willIndex__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "folderIndexer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willIndex");

  objc_msgSend(*(id *)(a1 + 32), "invitationsIndexer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willIndex");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSectionIdentifiersToManagedObjectIDs:", v4);

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSectionIdentifiers:", v5);

}

- (NSOrderedSet)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (OS_dispatch_queue)indexAccessQueue
{
  return self->_indexAccessQueue;
}

- (void)setSectionIdentifiersToManagedObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifiersToManagedObjectIDs, a3);
}

- (void)willIndex
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNoteCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ICNoteCoreDataIndexer_willIndex__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __33__ICNoteCoreDataIndexer_didIndex__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "invitationsIndexer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didIndex");

  objc_msgSend(*(id *)(a1 + 32), "folderIndexer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didIndex");

}

- (void)didIndex
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNoteCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ICNoteCoreDataIndexer_didIndex__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)setShouldIncludeSubfolders:(BOOL)a3
{
  self->_shouldIncludeSubfolders = a3;
}

- (void)setPinnedNotesSectionMinimumCount:(unint64_t)a3
{
  self->_pinnedNotesSectionMinimumCount = a3;
}

uint64_t __52__ICNoteCoreDataIndexer_firstRelevantItemIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsRelevantIdentifiers");
}

- (void)setSortType:(id)a3
{
  -[ICNoteCoreDataIndexer setSortType:force:](self, "setSortType:force:", a3, 0);
}

- (void)setNoteContainer:(id)a3
{
  ICNoteContainer *v4;
  NoteCollectionObject *noteCollection;
  ICNoteContainer *noteContainer;
  ICNoteContainer *v7;
  ICQuery *noteQuery;
  ICVirtualSmartFolderItemIdentifier *virtualSmartFolder;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (ICNoteContainer *)a3;
  noteCollection = self->_noteCollection;
  self->_noteCollection = 0;

  noteContainer = self->_noteContainer;
  self->_noteContainer = v4;
  v7 = v4;

  noteQuery = self->_noteQuery;
  self->_noteQuery = 0;

  virtualSmartFolder = self->_virtualSmartFolder;
  self->_virtualSmartFolder = 0;

  objc_opt_class();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteCoreDataIndexer folderIndexer](self, "folderIndexer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAncestorObjectID:", v11);

  -[ICNoteCoreDataIndexer expansionStateContext](self, "expansionStateContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExpansionStateContext:", v13);

  objc_opt_class();
  ICDynamicCast();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccount:", v15);

  -[ICCoreDataIndexer setNeedsFetchedResultsControllerUpdate:](self, "setNeedsFetchedResultsControllerUpdate:", 1);
}

- (ICNoteCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  ICNoteCoreDataIndexer *v8;
  ICNoteCoreDataIndexer *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *indexAccessQueue;
  uint64_t v13;
  ICFolderCustomNoteSortType *sortType;
  ICNoteSectionIdentifier *v15;
  ICNoteSectionIdentifier *tagSectionIdentifier;
  ICNoteFolderSectionIdentifier *v17;
  ICNoteFolderSectionIdentifier *folderSectionIdentifier;
  ICNoteSectionIdentifier *v19;
  ICNoteSectionIdentifier *invitationsSectionIdentifier;
  ICNoteSectionIdentifier *v21;
  ICNoteSectionIdentifier *pinnedNoteSectionIdentifier;
  ICNoteSectionIdentifier *v23;
  ICNoteSectionIdentifier *noteSectionIdentifier;
  ICInvitationsCoreDataIndexer *v25;
  void *v26;
  uint64_t v27;
  ICInvitationsCoreDataIndexer *invitationsIndexer;
  ICFolderCoreDataIndexer *v29;
  ICFolderCoreDataIndexer *folderIndexer;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ICNoteCoreDataIndexer;
  v8 = -[ICCoreDataIndexer initWithLegacyManagedObjectContext:modernManagedObjectContext:](&v32, sel_initWithLegacyManagedObjectContext_modernManagedObjectContext_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_shouldIncludeSubfolders = 0;
    v8->_shouldIncludeTags = 0;
    v8->_shouldIncludeTagDetail = 0;
    v8->_shouldIncludeInvitations = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.notes.note-index-access-queue", v10);
    indexAccessQueue = v9->_indexAccessQueue;
    v9->_indexAccessQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0D64200], "noteSortTypeDefaultAscending");
    v13 = objc_claimAutoreleasedReturnValue();
    sortType = v9->_sortType;
    v9->_sortType = (ICFolderCustomNoteSortType *)v13;

    v9->_pinnedNotesSectionMinimumCount = 1;
    v15 = -[ICNoteSectionIdentifier initWithNoteSectionType:]([ICNoteSectionIdentifier alloc], "initWithNoteSectionType:", 0);
    tagSectionIdentifier = v9->_tagSectionIdentifier;
    v9->_tagSectionIdentifier = v15;

    v17 = objc_alloc_init(ICNoteFolderSectionIdentifier);
    folderSectionIdentifier = v9->_folderSectionIdentifier;
    v9->_folderSectionIdentifier = v17;

    v19 = -[ICNoteSectionIdentifier initWithNoteSectionType:]([ICNoteSectionIdentifier alloc], "initWithNoteSectionType:", 1);
    invitationsSectionIdentifier = v9->_invitationsSectionIdentifier;
    v9->_invitationsSectionIdentifier = v19;

    v21 = -[ICNoteSectionIdentifier initWithNoteSectionType:]([ICNoteSectionIdentifier alloc], "initWithNoteSectionType:", 3);
    pinnedNoteSectionIdentifier = v9->_pinnedNoteSectionIdentifier;
    v9->_pinnedNoteSectionIdentifier = v21;

    v23 = -[ICNoteSectionIdentifier initWithNoteSectionType:]([ICNoteSectionIdentifier alloc], "initWithNoteSectionType:", 4);
    noteSectionIdentifier = v9->_noteSectionIdentifier;
    v9->_noteSectionIdentifier = v23;

    v25 = [ICInvitationsCoreDataIndexer alloc];
    -[ICNoteCoreDataIndexer invitationsSectionIdentifier](v9, "invitationsSectionIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[ICInvitationsCoreDataIndexer initWithModernManagedObjectContext:sectionIdentifier:](v25, "initWithModernManagedObjectContext:sectionIdentifier:", v7, v26);
    invitationsIndexer = v9->_invitationsIndexer;
    v9->_invitationsIndexer = (ICInvitationsCoreDataIndexer *)v27;

    v29 = -[ICFolderCoreDataIndexer initWithLegacyManagedObjectContext:modernManagedObjectContext:]([ICFolderCoreDataIndexer alloc], "initWithLegacyManagedObjectContext:modernManagedObjectContext:", v6, v7);
    folderIndexer = v9->_folderIndexer;
    v9->_folderIndexer = v29;

    -[ICCoreDataIndexer setShouldIncludeOutlineParentItems:](v9->_folderIndexer, "setShouldIncludeOutlineParentItems:", 1);
    -[ICFolderCoreDataIndexer setShouldIncludeAccount:](v9->_folderIndexer, "setShouldIncludeAccount:", 2);
    -[ICFolderCoreDataIndexer setShouldIncludeSharedWithYou:](v9->_folderIndexer, "setShouldIncludeSharedWithYou:", 2);
    -[ICFolderCoreDataIndexer setShouldIncludeSystemPaper:](v9->_folderIndexer, "setShouldIncludeSystemPaper:", 2);
    -[ICFolderCoreDataIndexer setShouldIncludeMathNotes:](v9->_folderIndexer, "setShouldIncludeMathNotes:", 2);
    -[ICFolderCoreDataIndexer setShouldIncludeCallNotes:](v9->_folderIndexer, "setShouldIncludeCallNotes:", 2);
    -[ICFolderCoreDataIndexer setShouldAutoExpandSingleSection:](v9->_folderIndexer, "setShouldAutoExpandSingleSection:", 0);
  }

  return v9;
}

- (void)setShouldIncludeOutlineParentItems:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_shouldIncludeOutlineParentItems = a3;
  -[ICNoteCoreDataIndexer folderIndexer](self, "folderIndexer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldIncludeOutlineParentItems:", v3);

  -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldIncludeOutlineParentItems:", v3);

}

- (ICNoteSectionIdentifier)invitationsSectionIdentifier
{
  return self->_invitationsSectionIdentifier;
}

- (id)activeFetchedResultsControllers
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
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICNoteCoreDataIndexer shouldIncludeInvitations](self, "shouldIncludeInvitations"))
  {
    -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeFetchedResultsControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_addObjectsFromNonNilArray:", v6);

  }
  if (-[ICNoteCoreDataIndexer shouldIncludeSubfolders](self, "shouldIncludeSubfolders"))
  {
    -[ICNoteCoreDataIndexer folderIndexer](self, "folderIndexer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ancestorObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ICNoteCoreDataIndexer folderIndexer](self, "folderIndexer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activeFetchedResultsControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v11);

    }
  }
  -[ICNoteCoreDataIndexer noteContainer](self, "noteContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (-[ICNoteCoreDataIndexer noteQuery](self, "noteQuery"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[ICNoteCoreDataIndexer virtualSmartFolder](self, "virtualSmartFolder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_13;
  }
  -[ICNoteCoreDataIndexer modernPinnedNoteFetchedResultsController](self, "modernPinnedNoteFetchedResultsController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ICNoteCoreDataIndexer modernPinnedNoteFetchedResultsController](self, "modernPinnedNoteFetchedResultsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  -[ICNoteCoreDataIndexer modernNoteFetchedResultsController](self, "modernNoteFetchedResultsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ICNoteCoreDataIndexer modernNoteFetchedResultsController](self, "modernNoteFetchedResultsController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
LABEL_13:
  -[ICNoteCoreDataIndexer noteCollection](self, "noteCollection");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ICNoteCoreDataIndexer legacyNoteFetchedResultsController](self, "legacyNoteFetchedResultsController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[ICNoteCoreDataIndexer legacyNoteFetchedResultsController](self, "legacyNoteFetchedResultsController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v20);

    }
  }
  v21 = (void *)objc_msgSend(v3, "copy");

  return v21;
}

- (unint64_t)totalInvitationsCount
{
  void *v3;
  unint64_t v4;

  if (!-[ICNoteCoreDataIndexer shouldIncludeInvitations](self, "shouldIncludeInvitations"))
    return 0;
  -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "totalInvitationsCount");

  return v4;
}

- (BOOL)shouldIncludeInvitations
{
  return self->_shouldIncludeInvitations;
}

- (NSFetchedResultsController)modernNoteFetchedResultsController
{
  return self->_modernNoteFetchedResultsController;
}

void __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[4];
  id v62;
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_2;
  v61[3] = &unk_1E5C1D9D0;
  v63 = *(_QWORD *)(a1 + 56);
  v62 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performBlockAndWait:", v61);

  objc_msgSend(*(id *)(a1 + 48), "folderIndexer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeFetchedResultsControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v6, "containsObject:", *v2);

  v7 = *(void **)(a1 + 48);
  if ((_DWORD)v2)
  {
    objc_msgSend(v7, "folderIndexer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexObjectsInSection:sectionIndex:fetchedResultsController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v12, "folderSectionIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v28 = (void *)v14;
    objc_msgSend(v12, "addObjectIDs:toIndexInSection:", v13, v14);

    goto LABEL_11;
  }
  objc_msgSend(v7, "invitationsIndexer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activeFetchedResultsControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 48), "invitationsIndexer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "indexObjectsInSection:sectionIndex:fetchedResultsController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    v12 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v12, "invitationsSectionIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v22 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "modernPinnedNoteFetchedResultsController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22 == v23)
  {
    v12 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v12, "pinnedNoteSectionIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v24 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "modernNoteFetchedResultsController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24 == v25)
  {
    if (!objc_msgSend(*(id *)(a1 + 48), "resolvedDateHeadersType"))
      goto LABEL_8;
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__28;
    v59 = __Block_byref_object_dispose__28;
    v60 = 0;
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v4;
    v51[1] = 3221225472;
    v51[2] = __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_3;
    v51[3] = &unk_1E5C1E190;
    v54 = &v55;
    v30 = *(id *)(a1 + 40);
    v31 = *(_QWORD *)(a1 + 48);
    v52 = v30;
    v53 = v31;
    objc_msgSend(v29, "performBlockAndWait:", v51);

    v32 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    if (v32 != objc_msgSend((id)v56[5], "count"))
    {
      v33 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_cold_1(v33);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v36 = v56[5];
    objc_msgSend(*(id *)(a1 + 48), "sortType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNoteTimelineController timelineSectionsForNoteObjectIDs:dates:referenceDate:direction:](ICNoteTimelineController, "timelineSectionsForNoteObjectIDs:dates:referenceDate:direction:", v35, v36, v34, objc_msgSend(v37, "direction"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v39 = v38;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v48 != v41)
            objc_enumerationMutation(v39);
          v43 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v44 = *(void **)(a1 + 48);
          objc_msgSend(v43, "objectIDs", (_QWORD)v47);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObjectIDs:toIndexInSection:", v45, v46);

        }
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
      }
      while (v40);
    }

    _Block_object_dispose(&v55, 8);
  }
  else
  {
    v26 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "legacyNoteFetchedResultsController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 == v27)
    {
LABEL_8:
      v12 = *(void **)(a1 + 48);
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(v12, "noteSectionIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 48), "mergePinnedNotesAndNotesSectionIfNeeded", (_QWORD)v47);
  objc_msgSend(*(id *)(a1 + 48), "updateSectionIdentifiers");

}

- (NSFetchedResultsController)modernPinnedNoteFetchedResultsController
{
  return self->_modernPinnedNoteFetchedResultsController;
}

- (ICInvitationsCoreDataIndexer)invitationsIndexer
{
  return self->_invitationsIndexer;
}

- (unint64_t)totalFolderCount
{
  void *v3;
  unint64_t v4;

  if (!-[ICNoteCoreDataIndexer shouldIncludeSubfolders](self, "shouldIncludeSubfolders"))
    return 0;
  -[ICNoteCoreDataIndexer folderIndexer](self, "folderIndexer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "totalFolderCount");

  return v4;
}

- (ICFolderCoreDataIndexer)folderIndexer
{
  return self->_folderIndexer;
}

- (BOOL)shouldIncludeSubfolders
{
  return self->_shouldIncludeSubfolders;
}

- (void)addObjectIDs:(id)a3 toIndexInSection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "count"))
  {
    -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

    }
    objc_msgSend(v8, "addObjectsFromArray:", v10);

  }
}

- (unint64_t)totalNoteCount
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__ICNoteCoreDataIndexer_totalNoteCount__block_invoke;
  v5[3] = &unk_1E5C200C0;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSMutableDictionary)sectionIdentifiersToManagedObjectIDs
{
  return self->_sectionIdentifiersToManagedObjectIDs;
}

- (BOOL)shouldIncludeOutlineParentItems
{
  return self->_shouldIncludeOutlineParentItems;
}

- (void)updateSectionIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v4, "mutableCopy");

  if (-[ICNoteCoreDataIndexer shouldIncludeTags](self, "shouldIncludeTags")
    || -[ICNoteCoreDataIndexer shouldIncludeTagDetail](self, "shouldIncludeTagDetail"))
  {
    -[ICNoteCoreDataIndexer tagSectionIdentifier](self, "tagSectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v13, "containsObject:", v5);

    if ((v6 & 1) == 0)
    {
      -[ICNoteCoreDataIndexer tagSectionIdentifier](self, "tagSectionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insertObject:atIndex:", v7, 0);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNoteSectionIdentifier sortDescriptors](ICNoteSectionIdentifier, "sortDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  if (-[ICNoteCoreDataIndexer resolvedDateHeadersType](self, "resolvedDateHeadersType"))
  {
    -[ICNoteCoreDataIndexer sortType](self, "sortType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNoteTimelineSectionIdentifier sortDescriptorsWithDirection:](ICNoteTimelineSectionIdentifier, "sortDescriptorsWithDirection:", objc_msgSend(v10, "direction"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v11);

  }
  objc_msgSend(v13, "sortUsingDescriptors:", v8);
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteCoreDataIndexer setSectionIdentifiers:](self, "setSectionIdentifiers:", v12);

}

- (int64_t)resolvedDateHeadersType
{
  void *v3;
  unint64_t v4;

  if (!-[ICNoteCoreDataIndexer isShowingDateHeaders](self, "isShowingDateHeaders"))
    return 0;
  -[ICNoteCoreDataIndexer sortType](self, "sortType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "resolvedCustomSortTypeOrder");

  if (v4 > 3)
    return 1;
  else
    return qword_1ACA58618[v4];
}

- (ICFolderCustomNoteSortType)sortType
{
  return self->_sortType;
}

- (BOOL)isShowingDateHeaders
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[ICNoteCoreDataIndexer dateHeadersType](self, "dateHeadersType") == 2)
    return 1;
  -[ICNoteCoreDataIndexer noteContainer](self, "noteContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || -[ICNoteCoreDataIndexer dateHeadersType](self, "dateHeadersType")
    || objc_msgSend(MEMORY[0x1E0D641D8], "defaultDateHeadersType") == 1)
  {
    -[ICNoteCoreDataIndexer virtualSmartFolder](self, "virtualSmartFolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5
      || -[ICNoteCoreDataIndexer dateHeadersType](self, "dateHeadersType")
      || objc_msgSend(MEMORY[0x1E0D641D8], "defaultDateHeadersType") == 1)
    {
      -[ICNoteCoreDataIndexer noteQuery](self, "noteQuery");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && !-[ICNoteCoreDataIndexer dateHeadersType](self, "dateHeadersType"))
        v3 = objc_msgSend(MEMORY[0x1E0D641D8], "showsQueryDateHeaders");
      else
        v3 = 0;

    }
    else
    {
      v3 = 1;
    }

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (int)dateHeadersType
{
  return self->_dateHeadersType;
}

- (BOOL)shouldIncludeTags
{
  return self->_shouldIncludeTags;
}

- (BOOL)sortsByPinned
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[ICNoteCoreDataIndexer noteQuery](self, "noteQuery");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ICNoteCoreDataIndexer virtualSmartFolder](self, "virtualSmartFolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    v8 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    -[ICNoteCoreDataIndexer noteContainer](self, "noteContainer");
    v9 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v9;
    if (v8)
    {
      if (v9)
      {
        -[ICNoteCoreDataIndexer noteContainer](self, "noteContainer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v10, "isTrashFolder") ^ 1;

        goto LABEL_3;
      }
    }
    else
    {
      objc_opt_class();
      ICClassAndProtocolCast();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICNoteCoreDataIndexer noteContainer](self, "noteContainer", &unk_1EED499E0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        LOBYTE(v5) = 0;
        v4 = v11;
        goto LABEL_3;
      }
      -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ic_existingObjectWithID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      ICClassAndProtocolCast();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = objc_msgSend(v4, "isTrashFolder", &unk_1EED499E0) ^ 1;
        goto LABEL_3;
      }
    }
    LOBYTE(v5) = 0;
    goto LABEL_3;
  }
  v4 = (void *)v3;
  LOBYTE(v5) = 1;
LABEL_3:

  return v5;
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  return self->_virtualSmartFolder;
}

- (ICQuery)noteQuery
{
  return self->_noteQuery;
}

- (id)expansionStateContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[ICNoteCoreDataIndexer noteContainer](self, "noteContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URIRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[ICNoteCoreDataIndexer noteCollection](self, "noteCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URIRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v8 = v12;
    }
    else
    {
      -[ICNoteCoreDataIndexer virtualSmartFolder](self, "virtualSmartFolder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setSectionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifiers, a3);
}

- (BOOL)shouldIncludeTagDetail
{
  return self->_shouldIncludeTagDetail;
}

- (void)mergePinnedNotesAndNotesSectionIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  ICNoteCoreDataIndexer *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke;
  v17[3] = &unk_1E5C1D9D0;
  v17[4] = self;
  v17[5] = &v18;
  objc_msgSend(v3, "performBlockAndWait:", v17);

  if (*((_BYTE *)v19 + 24))
  {
    -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteCoreDataIndexer pinnedNoteSectionIdentifier](self, "pinnedNoteSectionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    if (v9)
    {
      v10 = objc_msgSend(v9, "count");
      if (v10 < -[ICNoteCoreDataIndexer pinnedNotesSectionMinimumCount](self, "pinnedNotesSectionMinimumCount"))
      {
        -[ICNoteCoreDataIndexer pinnedNoteSectionIdentifier](self, "pinnedNoteSectionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteCoreDataIndexer removeObjectIDs:fromIndexInSection:](self, "removeObjectIDs:fromIndexInSection:", v9, v11);

        if (-[ICNoteCoreDataIndexer resolvedDateHeadersType](self, "resolvedDateHeadersType"))
        {
          -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = v4;
          v14[1] = 3221225472;
          v14[2] = __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke_2;
          v14[3] = &unk_1E5C1D9A8;
          v15 = v9;
          v16 = self;
          objc_msgSend(v12, "performBlockAndWait:", v14);

          v13 = v15;
        }
        else
        {
          -[ICNoteCoreDataIndexer noteSectionIdentifier](self, "noteSectionIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICNoteCoreDataIndexer prependObjectIDs:toIndexInSection:](self, "prependObjectIDs:toIndexInSection:", v9, v13);
        }

      }
    }

  }
  _Block_object_dispose(&v18, 8);
}

- (ICNoteSectionIdentifier)pinnedNoteSectionIdentifier
{
  return self->_pinnedNoteSectionIdentifier;
}

- (void)updateLegacyFetchedResultsControllers
{
  void *v3;
  void *v4;
  char isKindOfClass;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[ICNoteCoreDataIndexer noteCollection](self, "noteCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteCoreDataIndexer noteCollection](self, "noteCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = CFSTR("store");
    if ((isKindOfClass & 1) != 0)
      v6 = CFSTR("store.account");
    v7 = v6;

    v8 = (void *)MEMORY[0x1E0CB3880];
    -[ICNoteCoreDataIndexer noteCollection](self, "noteCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K == %@ AND deletedFlag == NO AND isBookkeepingEntry == NO AND body.content != nil"), v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D64230], "legacySortDescriptorsForType:", objc_msgSend(MEMORY[0x1E0D64230], "currentNoteListSortType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteCoreDataIndexer legacyNoteFetchedResultsController](self, "legacyNoteFetchedResultsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[ICNoteCoreDataIndexer legacyNoteFetchedResultsController](self, "legacyNoteFetchedResultsController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fetchRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPredicate:", v10);

      -[ICNoteCoreDataIndexer legacyNoteFetchedResultsController](self, "legacyNoteFetchedResultsController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fetchRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSortDescriptors:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Note"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPredicate:", v10);
      objc_msgSend(v15, "setSortDescriptors:", v11);
      v17 = objc_alloc(MEMORY[0x1E0C97B68]);
      -[ICCoreDataIndexer legacyManagedObjectContext](self, "legacyManagedObjectContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v15, v16, 0, 0);
      -[ICNoteCoreDataIndexer setLegacyNoteFetchedResultsController:](self, "setLegacyNoteFetchedResultsController:", v18);

    }
    -[ICNoteCoreDataIndexer legacyDateHeadersAttribute](self, "legacyDateHeadersAttribute");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[ICNoteCoreDataIndexer legacyDateHeadersAttribute](self, "legacyDateHeadersAttribute");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteCoreDataIndexer legacyNoteFetchedResultsController](self, "legacyNoteFetchedResultsController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fetchRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPropertiesToFetch:", v21);

    }
  }
  else
  {
    -[ICNoteCoreDataIndexer setLegacyNoteFetchedResultsController:](self, "setLegacyNoteFetchedResultsController:", 0);
  }
}

- (NoteCollectionObject)noteCollection
{
  return self->_noteCollection;
}

- (ICNoteFolderSectionIdentifier)folderSectionIdentifier
{
  return self->_folderSectionIdentifier;
}

- (void)setShouldIncludeTags:(BOOL)a3
{
  self->_shouldIncludeTags = a3;
}

- (void)setShouldIncludeTagDetail:(BOOL)a3
{
  self->_shouldIncludeTagDetail = a3;
}

- (void)setShouldIncludeInvitations:(BOOL)a3
{
  self->_shouldIncludeInvitations = a3;
}

- (void)setDateHeadersType:(int)a3
{
  self->_dateHeadersType = a3;
}

- (void)setLegacyNoteFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_legacyNoteFetchedResultsController, a3);
}

void __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "modernDateHeadersAttribute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("objectID"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSortType:(id)a3 force:(BOOL)a4
{
  void *v7;
  id v8;

  v8 = a3;
  if (a4 || (-[ICFolderCustomNoteSortType isEqual:](self->_sortType, "isEqual:", v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sortType, a3);
    -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSortType:", v8);

    -[ICCoreDataIndexer setNeedsFetchedResultsControllerUpdate:](self, "setNeedsFetchedResultsControllerUpdate:", 1);
  }

}

- (id)firstRelevantItemIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICNoteCoreDataIndexer sectionIdentifiers](self, "sectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_objectPassingTest:", &__block_literal_global_39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setNoteCollection:(id)a3
{
  id v5;
  ICNoteContainer *noteContainer;
  ICQuery *noteQuery;
  ICVirtualSmartFolderItemIdentifier *virtualSmartFolder;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_storeStrong((id *)&self->_noteCollection, a3);
  v5 = a3;
  noteContainer = self->_noteContainer;
  self->_noteContainer = 0;

  noteQuery = self->_noteQuery;
  self->_noteQuery = 0;

  virtualSmartFolder = self->_virtualSmartFolder;
  self->_virtualSmartFolder = 0;

  objc_msgSend(v5, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteCoreDataIndexer folderIndexer](self, "folderIndexer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAncestorObjectID:", v9);

  -[ICNoteCoreDataIndexer expansionStateContext](self, "expansionStateContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExpansionStateContext:", v11);

  -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccount:", 0);

  -[ICCoreDataIndexer setNeedsFetchedResultsControllerUpdate:](self, "setNeedsFetchedResultsControllerUpdate:", 1);
}

- (void)setNoteQuery:(id)a3
{
  ICQuery *v4;
  NoteCollectionObject *noteCollection;
  ICNoteContainer *noteContainer;
  ICQuery *noteQuery;
  ICQuery *v8;
  ICVirtualSmartFolderItemIdentifier *virtualSmartFolder;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (ICQuery *)a3;
  noteCollection = self->_noteCollection;
  self->_noteCollection = 0;

  noteContainer = self->_noteContainer;
  self->_noteContainer = 0;

  noteQuery = self->_noteQuery;
  self->_noteQuery = v4;
  v8 = v4;

  virtualSmartFolder = self->_virtualSmartFolder;
  self->_virtualSmartFolder = 0;

  -[ICNoteCoreDataIndexer folderIndexer](self, "folderIndexer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAncestorObjectID:", 0);

  -[ICNoteCoreDataIndexer expansionStateContext](self, "expansionStateContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExpansionStateContext:", v11);

  -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccount:", 0);

  -[ICCoreDataIndexer setNeedsFetchedResultsControllerUpdate:](self, "setNeedsFetchedResultsControllerUpdate:", 1);
}

- (void)setVirtualSmartFolder:(id)a3
{
  ICVirtualSmartFolderItemIdentifier *v4;
  NoteCollectionObject *noteCollection;
  ICNoteContainer *noteContainer;
  ICQuery *noteQuery;
  ICVirtualSmartFolderItemIdentifier *virtualSmartFolder;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (ICVirtualSmartFolderItemIdentifier *)a3;
  noteCollection = self->_noteCollection;
  self->_noteCollection = 0;

  noteContainer = self->_noteContainer;
  self->_noteContainer = 0;

  noteQuery = self->_noteQuery;
  self->_noteQuery = 0;

  virtualSmartFolder = self->_virtualSmartFolder;
  self->_virtualSmartFolder = v4;

  -[ICNoteCoreDataIndexer folderIndexer](self, "folderIndexer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAncestorObjectID:", 0);

  -[ICNoteCoreDataIndexer expansionStateContext](self, "expansionStateContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setExpansionStateContext:", v10);

  -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccount:", 0);

  -[ICCoreDataIndexer setNeedsFetchedResultsControllerUpdate:](self, "setNeedsFetchedResultsControllerUpdate:", 1);
}

- (void)togglePinnedForNote:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isPinnable"))
  {
    if (-[ICNoteCoreDataIndexer sortsByPinned](self, "sortsByPinned"))
    {
      -[ICNoteCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__ICNoteCoreDataIndexer_togglePinnedForNote___block_invoke;
      block[3] = &unk_1E5C1D7C0;
      block[4] = self;
      v10 = v8;
      v11 = v5;
      dispatch_sync(v6, block);

    }
    else
    {
      objc_msgSend(v5, "changePinStatusIfPossible");
      objc_msgSend(v5, "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ic_save");

    }
  }

}

uint64_t __45__ICNoteCoreDataIndexer_togglePinnedForNote___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "unmergePinnedNotesAndNotesSectionIfNeeded");
  objc_msgSend(a1[4], "sectionIdentifiersToManagedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "pinnedNoteSectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
  {
    objc_msgSend(a1[6], "setIsPinned:", 0);
    objc_msgSend(a1[6], "updateChangeCountWithReason:", CFSTR("Toggled pin state"));
    objc_msgSend(a1[6], "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_save");

    objc_msgSend(a1[4], "unpinnedSectionIdentifierForObject:", a1[6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[4];
    objc_msgSend(a1[5], "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "pinnedNoteSectionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectIDs:fromIndexInSection:", v11, v12);

    v13 = a1[4];
    objc_msgSend(a1[5], "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectIDs:toIndexInSection:", v15, v8);

    objc_msgSend(a1[4], "sortSection:", v8);
  }
  else
  {
    objc_msgSend(a1[4], "unpinnedSectionIdentifierForObject:", a1[6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "sectionIdentifiersToManagedObjectIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "objectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "containsObject:", v18);

    if (v19)
    {
      objc_msgSend(a1[6], "setIsPinned:", 1);
      objc_msgSend(a1[6], "updateChangeCountWithReason:", CFSTR("Toggled pin state"));
      objc_msgSend(a1[6], "managedObjectContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ic_save");

      v21 = a1[4];
      objc_msgSend(a1[5], "objectID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "pinnedNoteSectionIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectIDs:toIndexInSection:", v23, v24);

      v25 = a1[4];
      objc_msgSend(a1[5], "objectID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObjectIDs:fromIndexInSection:", v27, v8);

      v28 = a1[4];
      objc_msgSend(v28, "pinnedNoteSectionIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sortSection:", v29);

    }
  }

  objc_msgSend(a1[4], "mergePinnedNotesAndNotesSectionIfNeeded");
  return objc_msgSend(a1[4], "updateSectionIdentifiers");
}

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[ICNoteCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__ICNoteCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v11[3] = &unk_1E5C1D9A8;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  dispatch_sync(v6, v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __103__ICNoteCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v5);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersToManagedObjectIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v14 = *(void **)(a1 + 40);
            objc_msgSend(v13, "array");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, v11);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  BOOL v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICNoteSectionIdentifier *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  _QWORD v23[5];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C9AA60];
  switch(a3)
  {
    case 1uLL:
      -[ICNoteCoreDataIndexer sectionIdentifiers](self, "sectionIdentifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ic_objectsPassingTest:", &__block_literal_global_34);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke_2;
      v23[3] = &unk_1E5C20150;
      v23[4] = self;
      objc_msgSend(v7, "ic_map:", v23);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    case 2uLL:
      -[ICNoteCoreDataIndexer sectionIdentifiers](self, "sectionIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ic_objectsPassingTest:", &__block_literal_global_30);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[ICNoteCoreDataIndexer shouldIncludeTags](self, "shouldIncludeTags");
      if (v12
        || (-[ICNoteCoreDataIndexer noteQuery](self, "noteQuery"),
            (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        if (objc_msgSend(v3, "count"))
        {
          v13 = 0;
          if (v12)
            goto LABEL_7;
        }
        else
        {
          v13 = -[ICNoteCoreDataIndexer totalInvitationsCount](self, "totalInvitationsCount") == 0;
          if (v12)
          {
LABEL_7:
            if (!v13)
              return v3;
            goto LABEL_16;
          }
        }

        if (!v13)
          return v3;
      }
      else
      {
        -[ICNoteCoreDataIndexer virtualSmartFolder](self, "virtualSmartFolder");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
          return v3;
        v21 = (void *)v20;
        if (objc_msgSend(v3, "count"))
        {

          return v3;
        }
        v22 = -[ICNoteCoreDataIndexer totalInvitationsCount](self, "totalInvitationsCount");

        if (v22)
          return v3;
      }
LABEL_16:
      v18 = -[ICNoteSectionIdentifier initWithNoteSectionType:]([ICNoteSectionIdentifier alloc], "initWithNoteSectionType:", 4);
      v24[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      return v19;
    case 4uLL:
      -[ICNoteCoreDataIndexer sectionIdentifiers](self, "sectionIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = &__block_literal_global_33;
      goto LABEL_11;
    case 5uLL:
      -[ICNoteCoreDataIndexer sectionIdentifiers](self, "sectionIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = &__block_literal_global_34;
LABEL_11:
      objc_msgSend(v15, "ic_objectsPassingTest:", v17);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    default:
      return v3;
  }
}

BOOL __58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sectionType") == 2;
}

ICNoteFolderSectionIdentifier *__58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  ICNoteFolderSectionIdentifier *v5;
  void *v6;
  void *v7;
  ICNoteFolderSectionIdentifier *v8;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [ICNoteFolderSectionIdentifier alloc];
    objc_msgSend(*(id *)(a1 + 32), "folderIndexer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ancestorObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ICNoteFolderSectionIdentifier initWithNoteContainerObjectID:](v5, "initWithNoteContainerObjectID:", v7);

  }
  else
  {
    v8 = (ICNoteFolderSectionIdentifier *)v3;
  }

  return v8;
}

BOOL __58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "sectionType") == 4
    || objc_msgSend(v2, "sectionType") == 3
    || objc_msgSend(v2, "sectionType") == 5;

  return v3;
}

BOOL __58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sectionType") == 0;
}

BOOL __58__ICNoteCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sectionType") == 1;
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C9AA70];
  if (a3 <= 5 && ((1 << a3) & 0x36) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__ICNoteCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
    block[3] = &unk_1E5C201D8;
    v19 = a3;
    block[4] = self;
    v16 = v11;
    v17 = v8;
    v18 = v9;
    v13 = v11;
    dispatch_sync(v12, block);

    v10 = (void *)objc_msgSend(v13, "copy");
  }

  return v10;
}

void __110__ICNoteCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id obj;
  id obja;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  void *v76;
  void *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  void *v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  switch(*(_QWORD *)(a1 + 64))
  {
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "folderIndexer");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "sectionSnapshotsForSectionType:legacyManagedObjectContext:modernManagedObjectContext:", 1, *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v1 + 32), "sectionIdentifiersForSectionType:", *(_QWORD *)(v1 + 64));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v69 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
            objc_msgSend(v3, "allValues");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "firstObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v1 + 40), "setObject:forKeyedSubscript:", v11, v9);

          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
        }
        while (v6);
      }
      goto LABEL_48;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersForSectionType:", 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v56 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
      if (v56)
      {
        v55 = *(_QWORD *)v61;
        obj = v3;
        do
        {
          for (j = 0; j != v56; ++j)
          {
            if (*(_QWORD *)v61 != v55)
              objc_enumerationMutation(v3);
            v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
            v59 = objc_alloc_init(MEMORY[0x1E0DC3390]);
            v14 = objc_msgSend(v3, "count");
            objc_msgSend(*(id *)(v1 + 32), "invitationsIndexer");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v15, "newSnapshotFromIndex");
            objc_msgSend(v16, "sectionIdentifiers");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");
            v19 = v1;
            v20 = v18 + v14;
            v21 = v19;
            objc_msgSend(*(id *)(v19 + 32), "folderIndexer");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v22, "newSnapshotFromIndex");
            objc_msgSend(v23, "sectionIdentifiers");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v20 + objc_msgSend(v24, "count");

            v26 = v25 > 1 || objc_msgSend(v13, "sectionType") != 4;
            v1 = v21;
            v3 = obj;
            if (objc_msgSend(*(id *)(v21 + 32), "shouldIncludeOutlineParentItems", v55) && v26)
            {
              v77 = v13;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v59;
              objc_msgSend(v59, "appendItems:", v27);

              +[ICExpansionState sharedExpansionState](ICExpansionState, "sharedExpansionState");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v1 + 32), "expansionStateContext");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v29, "isSectionIdentiferExpanded:inContext:", v13, v30);

              if (v31)
              {
                v76 = v13;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "expandItems:", v32);

              }
              objc_msgSend(*(id *)(v1 + 32), "sectionIdentifiersToManagedObjectIDs");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectForKeyedSubscript:", v13);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "array");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "appendItems:intoParent:", v35, v13);

            }
            else
            {
              objc_msgSend(*(id *)(v21 + 32), "sectionIdentifiersToManagedObjectIDs");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKeyedSubscript:", v13);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "array");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v59;
              objc_msgSend(v59, "appendItems:", v34);
            }

            objc_msgSend(*(id *)(v1 + 40), "setObject:forKeyedSubscript:", v28, v13);
          }
          v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
        }
        while (v56);
      }
      goto LABEL_49;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersForSectionType:", 4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v36 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v73;
        obja = v3;
        do
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v73 != v38)
              objc_enumerationMutation(obja);
            v40 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k);
            objc_opt_class();
            ICDynamicCast();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v41, "sectionType"))
            {
              v42 = objc_alloc_init(MEMORY[0x1E0DC3390]);
              if (objc_msgSend(*(id *)(v1 + 32), "shouldIncludeTags"))
              {
                +[ICTagContainerItemIdentifier sharedItemIdentifier](ICTagContainerItemIdentifier, "sharedItemIdentifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = v43;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "appendItems:", v44);

              }
              if (objc_msgSend(*(id *)(v1 + 32), "shouldIncludeTagDetail"))
              {
                +[ICTagDetailItemIdentifier sharedItemIdentifier](ICTagDetailItemIdentifier, "sharedItemIdentifier");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = v45;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "appendItems:", v46);

              }
              objc_msgSend(*(id *)(v1 + 40), "setObject:forKeyedSubscript:", v42, v40);

            }
          }
          v3 = obja;
          v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
        }
        while (v37);
      }
      goto LABEL_49;
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "invitationsIndexer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "sectionSnapshotsForSectionType:legacyManagedObjectContext:modernManagedObjectContext:", 5, *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(*(id *)(v1 + 32), "sectionIdentifiersForSectionType:", *(_QWORD *)(v1 + 64));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v65;
        do
        {
          for (m = 0; m != v49; ++m)
          {
            if (*(_QWORD *)v65 != v50)
              objc_enumerationMutation(v4);
            v52 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * m);
            objc_msgSend(v3, "allValues");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "firstObject");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v1 + 40), "setObject:forKeyedSubscript:", v54, v52);

          }
          v49 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
        }
        while (v49);
      }
LABEL_48:

LABEL_49:
      break;
    default:
      return;
  }
}

- (id)sectionIdentifierForHeaderInSection:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[ICNoteCoreDataIndexer sectionIdentifiers](self, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteCoreDataIndexer pinnedNoteSectionIdentifier](self, "pinnedNoteSectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteCoreDataIndexer sectionIdentifiers](self, "sectionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") < (unint64_t)a3)
  {
    v11 = 0;
LABEL_7:

    return v11;
  }

  if (v6 > 1 || v9)
  {
    -[ICNoteCoreDataIndexer sectionIdentifiers](self, "sectionIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v11 = 0;
  return v11;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  -[ICNoteCoreDataIndexer sortedNoteIdentifiers](self, "sortedNoteIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__ICNoteCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke;
  v20[3] = &unk_1E5C1F188;
  v7 = v4;
  v21 = v7;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsAtIndexes:", v8);
  v9 = objc_msgSend(v5, "count");
  if (v9 != objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "indexOfObject:", v11);

    objc_msgSend(v6, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "indexOfObject:", v13);

    v15 = (void *)MEMORY[0x1E0C9AA60];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v5, "count") > v14)
    {
      objc_msgSend(v5, "subarrayWithRange:", v12, v14 - v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v16, "removeObjectsInArray:", v7);
    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v16, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v5, "count") > v14 + 1)
        v18 = v14 + 1;
      else
        v18 = v12 - 1;
      if (objc_msgSend(v5, "count") <= v18)
        goto LABEL_15;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v18);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v17;
    if (v17)
    {
LABEL_16:

      goto LABEL_17;
    }
LABEL_15:
    -[ICNoteCoreDataIndexer firstRelevantItemIdentifier](self, "firstRelevantItemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v10 = 0;
LABEL_17:

  return v10;
}

uint64_t __57__ICNoteCoreDataIndexer_nextRelevantItemIdentifierAfter___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)deleteObjectWithIDFromIndex:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  void *v32;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ICNoteCoreDataIndexer folderSectionIdentifier](self, "folderSectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__28;
      v31 = __Block_byref_object_dispose__28;
      v32 = 0;
      -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __63__ICNoteCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke;
      v24[3] = &unk_1E5C1E190;
      v26 = &v27;
      v24[4] = self;
      v12 = v6;
      v25 = v12;
      objc_msgSend(v11, "performBlockAndWait:", v24);

      -[ICNoteCoreDataIndexer folderIndexer](self, "folderIndexer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deleteObjectWithIDFromIndex:inSection:", v12, v28[5]);

      -[ICNoteCoreDataIndexer updateSectionIdentifiers](self, "updateSectionIdentifiers");
      _Block_object_dispose(&v27, 8);
      v14 = v32;
LABEL_10:

      goto LABEL_11;
    }
    -[ICNoteCoreDataIndexer invitationsSectionIdentifier](self, "invitationsSectionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v8, "isEqual:", v16);

    if (!v17)
    {
      -[ICNoteCoreDataIndexer indexAccessQueue](self, "indexAccessQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __63__ICNoteCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke_2;
      v21[3] = &unk_1E5C1D7C0;
      v21[4] = self;
      v22 = v6;
      v23 = v8;
      dispatch_sync(v20, v21);

      v14 = v22;
      goto LABEL_10;
    }
    -[ICNoteCoreDataIndexer invitationsIndexer](self, "invitationsIndexer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteCoreDataIndexer invitationsSectionIdentifier](self, "invitationsSectionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deleteObjectWithIDFromIndex:inSection:", v6, v19);

    -[ICNoteCoreDataIndexer updateSectionIdentifiers](self, "updateSectionIdentifiers");
  }
  else
  {
    v15 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ICNoteCoreDataIndexer deleteObjectWithIDFromIndex:inSection:].cold.1((uint64_t)v6, (uint64_t)v7, v15);

  }
LABEL_11:

}

void __63__ICNoteCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke(uint64_t a1)
{
  ICFolderListSectionIdentifier *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = [ICFolderListSectionIdentifier alloc];
  objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICFolderListSectionIdentifier initWithObject:](v2, "initWithObject:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __63__ICNoteCoreDataIndexer_deleteObjectWithIDFromIndex_inSection___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectIDs:fromIndexInSection:", v3, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "mergePinnedNotesAndNotesSectionIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "updateSectionIdentifiers");
}

- (void)deleteWithDecisionController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  ICNoteCoreDataIndexer *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "sourceObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("objectID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__ICNoteCoreDataIndexer_deleteWithDecisionController_completion___block_invoke;
  v12[3] = &unk_1E5C20220;
  v14 = self;
  v15 = v6;
  v13 = v9;
  v10 = v9;
  v11 = v6;
  objc_msgSend(v7, "performDecisionWithCompletion:", v12);

}

uint64_t __65__ICNoteCoreDataIndexer_deleteWithDecisionController_completion___block_invoke(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t result;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v8, "ic_isFolderType", (_QWORD)v25))
          {
            objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "folderSectionIdentifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "containsObject:", v8);

            if (v12)
            {
              v13 = *(void **)(a1 + 40);
              objc_msgSend(v13, "folderSectionIdentifier");
              v14 = objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            }
          }
          if (objc_msgSend(v8, "ic_isNoteType"))
          {
            objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "pinnedNoteSectionIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "containsObject:", v8);

            if (v18)
            {
              v13 = *(void **)(a1 + 40);
              objc_msgSend(v13, "pinnedNoteSectionIdentifier");
              v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
              v19 = (void *)v14;
              v20 = v13;
LABEL_14:
              objc_msgSend(v20, "deleteObjectWithIDFromIndex:inSection:", v8, v19);
              goto LABEL_19;
            }
          }
          objc_msgSend(*(id *)(a1 + 40), "sectionForObjectID:", v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            if (objc_msgSend(v8, "ic_isNoteType"))
            {
              objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiersToManagedObjectIDs");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", v19);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "containsObject:", v8);

              if (v23)
              {
                v20 = *(void **)(a1 + 40);
                goto LABEL_14;
              }
            }
          }
LABEL_19:

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v5);
    }

    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  else
  {
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

- (void)unmergePinnedNotesAndNotesSectionIfNeeded
{
  void *v3;
  _QWORD v4[5];

  if (-[ICNoteCoreDataIndexer sortsByPinned](self, "sortsByPinned"))
  {
    -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__ICNoteCoreDataIndexer_unmergePinnedNotesAndNotesSectionIfNeeded__block_invoke;
    v4[3] = &unk_1E5C1D540;
    v4[4] = self;
    objc_msgSend(v3, "performBlockAndWait:", v4);

  }
}

void __66__ICNoteCoreDataIndexer_unmergePinnedNotesAndNotesSectionIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "unpinnedNoteIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__ICNoteCoreDataIndexer_unmergePinnedNotesAndNotesSectionIfNeeded__block_invoke_2;
  v9[3] = &unk_1E5C20248;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "ic_objectsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "pinnedNoteSectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectIDs:toIndexInSection:", v6, v8);

  objc_msgSend(*(id *)(a1 + 32), "removeUnpinnedNoteObjectIds:", v6);
}

uint64_t __66__ICNoteCoreDataIndexer_unmergePinnedNotesAndNotesSectionIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPinned");

  return v7;
}

void __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke_3;
  v17[3] = &unk_1E5C20270;
  v2 = *(void **)(a1 + 32);
  v17[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "ic_compactMap:", v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v8, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "unpinnedSectionIdentifierForObject:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectIDs:toIndexInSection:", v11, v12);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

}

id __64__ICNoteCoreDataIndexer_mergePinnedNotesAndNotesSectionIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)prependObjectIDs:(id)a3 toIndexInSection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v11, "count"))
  {
    -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

    }
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v11, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertObjects:atIndexes:", v11, v10);

  }
}

- (void)removeObjectIDs:(id)a3 fromIndexInSection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "count"))
  {
    -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "removeObjectsInArray:", v10);
      if (!objc_msgSend(v8, "count"))
      {
        -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v6);

      }
    }

  }
}

- (void)sortSection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  ICNoteCoreDataIndexer *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[5];
  NSObject *v22;
  id v23;

  v4 = a3;
  if (objc_msgSend(v4, "sectionType") != 2)
  {
    -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_10;
    -[ICNoteCoreDataIndexer noteContainer](self, "noteContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[ICNoteCoreDataIndexer noteQuery](self, "noteQuery"),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      -[ICNoteCoreDataIndexer virtualSmartFolder](self, "virtualSmartFolder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        -[ICNoteCoreDataIndexer noteCollection](self, "noteCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          goto LABEL_10;
        -[ICCoreDataIndexer legacyManagedObjectContext](self, "legacyManagedObjectContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __37__ICNoteCoreDataIndexer_sortSection___block_invoke_4;
        v17 = &unk_1E5C1D7C0;
        v18 = self;
        v9 = (id *)&v19;
        v19 = v5;
        v10 = &v20;
        v20 = v4;
        v11 = &v14;
        goto LABEL_9;
      }
    }
    -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __37__ICNoteCoreDataIndexer_sortSection___block_invoke;
    v21[3] = &unk_1E5C1D7C0;
    v21[4] = self;
    v9 = (id *)&v22;
    v22 = v5;
    v10 = &v23;
    v23 = v4;
    v11 = v21;
LABEL_9:
    objc_msgSend(v8, "performBlockAndWait:", v11, v14, v15, v16, v17, v18);

    goto LABEL_10;
  }
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[ICNoteCoreDataIndexer sortSection:].cold.1(v5);
LABEL_10:

}

void __37__ICNoteCoreDataIndexer_sortSection___block_invoke(uint64_t a1)
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
  void *v11;
  _QWORD v12[5];

  v2 = (void *)MEMORY[0x1E0D64230];
  v3 = objc_msgSend(*(id *)(a1 + 32), "sortsByPinned");
  objc_msgSend(*(id *)(a1 + 32), "sortType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortDescriptorsForCurrentTypeIncludingPinnedNotes:folderNoteSortType:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__ICNoteCoreDataIndexer_sortSection___block_invoke_2;
  v12[3] = &unk_1E5C20298;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "ic_map:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_map:", &__block_literal_global_191);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersToManagedObjectIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 48));

}

id __37__ICNoteCoreDataIndexer_sortSection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "modernManagedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __37__ICNoteCoreDataIndexer_sortSection___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __37__ICNoteCoreDataIndexer_sortSection___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0D64230], "sortDescriptorsForCurrentTypeIncludingPinnedNotes:", objc_msgSend(*(id *)(a1 + 32), "sortsByPinned"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__ICNoteCoreDataIndexer_sortSection___block_invoke_5;
  v9[3] = &unk_1E5C20298;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "ic_map:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_map:", &__block_literal_global_192);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersToManagedObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 48));

}

id __37__ICNoteCoreDataIndexer_sortSection___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "legacyManagedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __37__ICNoteCoreDataIndexer_sortSection___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

- (NSArray)sortedNoteIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ICNoteCoreDataIndexer sectionIdentifiers](self, "sectionIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "ic_compactMap:", &__block_literal_global_194);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v13;
}

id __46__ICNoteCoreDataIndexer_sortedNoteIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "ic_isNoteType"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)unpinnedSectionIdentifierForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ICNoteCoreDataIndexer dateHeadersValueForNote:](self, "dateHeadersValueForNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNoteTimelineController timelineSectionIdentifierForNoteObjectID:date:sectionIdentifiersToManagedObjectIDs:](ICNoteTimelineController, "timelineSectionIdentifierForNoteObjectID:date:sectionIdentifiersToManagedObjectIDs:", v6, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICNoteCoreDataIndexer noteSectionIdentifier](self, "noteSectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)sectionForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v4);

        if ((v14 & 1) != 0)
        {
          v15 = v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)unpinnedNoteIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ICNoteCoreDataIndexer_unpinnedNoteIdentifiers__block_invoke;
  v7[3] = &unk_1E5C20360;
  v7[4] = self;
  objc_msgSend(v4, "ic_flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __48__ICNoteCoreDataIndexer_unpinnedNoteIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "noteSectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v3) & 1) != 0)
  {

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifiersToManagedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

- (void)removeUnpinnedNoteObjectIds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[ICNoteCoreDataIndexer noteSectionIdentifier](self, "noteSectionIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqual:", v11) & 1) != 0)
        {

        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            goto LABEL_10;
        }
        -[ICNoteCoreDataIndexer removeObjectIDs:fromIndexInSection:](self, "removeObjectIDs:fromIndexInSection:", v4, v11);
LABEL_10:
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (id)legacyDateHeadersAttribute
{
  return 0;
}

- (id)dateHeadersValueForNote:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[ICNoteCoreDataIndexer resolvedDateHeadersType](self, "resolvedDateHeadersType");
  if (v5 == 2)
  {
    objc_msgSend(v4, "creationDate");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 1)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "modificationDate");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_7:

  return v7;
}

- (BOOL)dateHeadersAreStaleForNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[ICNoteCoreDataIndexer dateHeadersValueForNote:](self, "dateHeadersValueForNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v4, "isPinned"))
    {
      -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteCoreDataIndexer pinnedNoteSectionIdentifier](self, "pinnedNoteSectionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
    }
    else
    {
      objc_msgSend(v4, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICNoteTimelineController timelineSectionIdentifierForNoteObjectID:date:sectionIdentifiersToManagedObjectIDs:](ICNoteTimelineController, "timelineSectionIdentifierForNoteObjectID:date:sectionIdentifiersToManagedObjectIDs:", v11, v5, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICNoteCoreDataIndexer sectionIdentifiersToManagedObjectIDs](self, "sectionIdentifiersToManagedObjectIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      v9 = v6;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "containsObject:", v14) ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setInvitationsIndexer:(id)a3
{
  objc_storeStrong((id *)&self->_invitationsIndexer, a3);
}

- (void)setFolderIndexer:(id)a3
{
  objc_storeStrong((id *)&self->_folderIndexer, a3);
}

- (ICTagCoreDataIndexer)tagIndexer
{
  return self->_tagIndexer;
}

- (unint64_t)pinnedNotesSectionMinimumCount
{
  return self->_pinnedNotesSectionMinimumCount;
}

- (void)setIndexAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_indexAccessQueue, a3);
}

- (NSFetchedResultsController)legacyNoteFetchedResultsController
{
  return self->_legacyNoteFetchedResultsController;
}

- (ICNoteSectionIdentifier)tagSectionIdentifier
{
  return self->_tagSectionIdentifier;
}

- (void)setTagSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_tagSectionIdentifier, a3);
}

- (void)setFolderSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_folderSectionIdentifier, a3);
}

- (void)setInvitationsSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_invitationsSectionIdentifier, a3);
}

- (void)setPinnedNoteSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedNoteSectionIdentifier, a3);
}

- (ICNoteSectionIdentifier)noteSectionIdentifier
{
  return self->_noteSectionIdentifier;
}

- (void)setNoteSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_noteSectionIdentifier, a3);
}

- (void)setSortedNoteIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sortedNoteIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedNoteIdentifiers, 0);
  objc_storeStrong((id *)&self->_noteSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_pinnedNoteSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationsSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_folderSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_tagSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiersToManagedObjectIDs, 0);
  objc_storeStrong((id *)&self->_legacyNoteFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_modernNoteFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_modernPinnedNoteFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_indexAccessQueue, 0);
  objc_storeStrong((id *)&self->_sortType, 0);
  objc_storeStrong((id *)&self->_virtualSmartFolder, 0);
  objc_storeStrong((id *)&self->_noteQuery, 0);
  objc_storeStrong((id *)&self->_noteCollection, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);
  objc_storeStrong((id *)&self->_tagIndexer, 0);
  objc_storeStrong((id *)&self->_folderIndexer, 0);
  objc_storeStrong((id *)&self->_invitationsIndexer, 0);
}

void __85__ICNoteCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "indexObjectsInSection:sectionIndex:fetchedResultsController: objectsId count doesn't match dates count", v1, 2u);
}

- (void)deleteObjectWithIDFromIndex:(os_log_t)log inSection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_FAULT, "Invalid note section identifier — not deleting object from index {objectID: %@, section: %@}", (uint8_t *)&v3, 0x16u);
}

- (void)sortSection:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_FAULT, "Sorting the folder section is not supported.", v1, 2u);
}

@end
