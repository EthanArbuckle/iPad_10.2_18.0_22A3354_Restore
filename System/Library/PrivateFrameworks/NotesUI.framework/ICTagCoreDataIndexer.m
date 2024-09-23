@implementation ICTagCoreDataIndexer

- (ICTagCoreDataIndexer)initWithModernManagedObjectContext:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  ICTagCoreDataIndexer *v8;
  ICTagCoreDataIndexer *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *accessQueue;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSFetchedResultsController *fetchedResultsController;
  NSArray *hashtags;
  NSArray *v25;
  NSArray *objectIDs;
  objc_super v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)ICTagCoreDataIndexer;
  v8 = -[ICCoreDataIndexer initWithLegacyManagedObjectContext:modernManagedObjectContext:](&v28, sel_initWithLegacyManagedObjectContext_modernManagedObjectContext_, 0, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sectionIdentifier, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.notes.tag-index-access-queue", v10);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v11;

    *(_WORD *)&v9->_includesAllTagsItem = 1;
    v9->_visibleTagLimit = -1;
    v13 = (void *)MEMORY[0x1E0C97B48];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchRequestWithEntityName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D63B20], "predicateForVisibleObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v17);

    objc_msgSend(v16, "setReturnsObjectsAsFaults:", 0);
    v18 = (void *)MEMORY[0x1E0CB3928];
    NSStringFromSelector(sel_standardizedContent);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sortDescriptorWithKey:ascending:", v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSortDescriptors:", v21);

    if (v6)
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97B68]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v16, v6, 0, 0);
      fetchedResultsController = v9->_fetchedResultsController;
      v9->_fetchedResultsController = (NSFetchedResultsController *)v22;

    }
    hashtags = v9->_hashtags;
    v25 = (NSArray *)MEMORY[0x1E0C9AA60];
    v9->_hashtags = (NSArray *)MEMORY[0x1E0C9AA60];

    objectIDs = v9->_objectIDs;
    v9->_objectIDs = v25;

  }
  return v9;
}

- (id)activeFetchedResultsControllers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = (void *)MEMORY[0x1E0C99D20];
  -[ICTagCoreDataIndexer fetchedResultsController](self, "fetchedResultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_arrayFromNonNilObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  NSObject *v6;
  _QWORD block[5];

  -[ICTagCoreDataIndexer accessQueue](self, "accessQueue", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ICTagCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v6, block);

  return -[ICTagCoreDataIndexer objectIDs](self, "objectIDs");
}

- (void)willIndex
{
  NSObject *v3;
  _QWORD block[5];

  -[ICTagCoreDataIndexer accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ICTagCoreDataIndexer_willIndex__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

uint64_t __33__ICTagCoreDataIndexer_willIndex__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjectIDs:", MEMORY[0x1E0C9AA60]);
}

void __84__ICTagCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0D63B20];
  objc_msgSend(*(id *)(a1 + 32), "modernManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "canonicalHashtagsInContext:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ic_map:", &__block_literal_global_40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObjectIDs:", v4);

}

- (void)setObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDs, a3);
}

+ (BOOL)isTagItemIdentifier:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "ic_isHashtagType") & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (unint64_t)hiddenTagCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[ICTagCoreDataIndexer objectIDs](self, "objectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[ICTagCoreDataIndexer leadingVisibleObjectIDs](self, "leadingVisibleObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 - objc_msgSend(v5, "count");

  return v6;
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
  -[ICTagCoreDataIndexer accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__ICTagCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v11[3] = &unk_1E5C1D9A8;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  dispatch_sync(v6, v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __102__ICTagCoreDataIndexer_newSnapshotFromIndexWithLegacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v5);

    if (objc_msgSend(*(id *)(a1 + 32), "includesNewTagItem"))
    {
      v6 = *(void **)(a1 + 40);
      +[ICTagNewTagItemIdentifier sharedItemIdentifier](ICTagNewTagItemIdentifier, "sharedItemIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v8, v9);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "includesAllTagsItem"))
    {
      v10 = *(void **)(a1 + 40);
      +[ICTagAllTagsItemIdentifier sharedItemIdentifier](ICTagAllTagsItemIdentifier, "sharedItemIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, v13);

    }
    v14 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "leadingVisibleObjectIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, v16);

  }
}

uint64_t __84__ICTagCoreDataIndexer_indexObjectsInSection_sectionIndex_fetchedResultsController___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__34;
  v13 = __Block_byref_object_dispose__34;
  v14 = 0;
  -[ICTagCoreDataIndexer accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICTagCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke;
  block[3] = &unk_1E5C20748;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __57__ICTagCoreDataIndexer_sectionIdentifiersForSectionType___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  if (v3 == 4)
  {

  }
}

- (NSArray)leadingVisibleObjectIDs
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[ICTagCoreDataIndexer objectIDs](self, "objectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (-[ICTagCoreDataIndexer visibleTagLimit](self, "visibleTagLimit"))
  {
    -[ICTagCoreDataIndexer objectIDs](self, "objectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v7 = -[ICTagCoreDataIndexer visibleTagLimit](self, "visibleTagLimit");

    if (v6 > v7)
    {
      objc_msgSend(v4, "subarrayWithRange:", 0, -[ICTagCoreDataIndexer visibleTagLimit](self, "visibleTagLimit"));
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
  }
  return (NSArray *)v4;
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  ICTagCoreDataIndexer *v19;

  if (a3 != 4)
    return MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", 4, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  -[ICTagCoreDataIndexer accessQueue](self, "accessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __109__ICTagCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke;
  v17 = &unk_1E5C1D9A8;
  v9 = v7;
  v18 = v9;
  v19 = self;
  dispatch_sync(v8, &v14);

  -[ICTagCoreDataIndexer sectionIdentifier](self, "sectionIdentifier", v14, v15, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ICTagCoreDataIndexer sectionIdentifier](self, "sectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v11);

  }
  v12 = (void *)objc_msgSend(v6, "copy");

  return v12;
}

void __109__ICTagCoreDataIndexer_sectionSnapshotsForSectionType_legacyManagedObjectContext_modernManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[ICTagAllTagsItemIdentifier sharedItemIdentifier](ICTagAllTagsItemIdentifier, "sharedItemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItems:", v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "leadingVisibleObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItems:", v6);

}

- (id)sectionIdentifierForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  return 0;
}

- (BOOL)includesAllTagsItem
{
  return self->_includesAllTagsItem;
}

- (void)setIncludesAllTagsItem:(BOOL)a3
{
  self->_includesAllTagsItem = a3;
}

- (BOOL)includesNewTagItem
{
  return self->_includesNewTagItem;
}

- (void)setIncludesNewTagItem:(BOOL)a3
{
  self->_includesNewTagItem = a3;
}

- (unint64_t)visibleTagLimit
{
  return self->_visibleTagLimit;
}

- (void)setVisibleTagLimit:(unint64_t)a3
{
  self->_visibleTagLimit = a3;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (void)setFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedResultsController, a3);
}

- (NSArray)hashtags
{
  return self->_hashtags;
}

- (void)setHashtags:(id)a3
{
  objc_storeStrong((id *)&self->_hashtags, a3);
}

- (void)setLeadingVisibleObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_leadingVisibleObjectIDs, a3);
}

- (ICSectionIdentifier)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_leadingVisibleObjectIDs, 0);
  objc_storeStrong((id *)&self->_hashtags, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
}

@end
