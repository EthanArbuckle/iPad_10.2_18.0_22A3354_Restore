@implementation WebBookmarkReadonlyCollection

- (id)initReadonlySafariBookmarkCollection
{
  WebBookmarkReadonlyCollection *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  WebBookmarkReadonlyCollection *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WebBookmarkReadonlyCollection;
  v2 = -[WebBookmarkReadonlyCollection init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.WebBookmarks.WebBookmarkReadonlyCollection.%@.%p.%@"), objc_opt_class(), v2, CFSTR("InternalQueue"));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2(v4, v5, v6);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

- (id)_collection
{
  WebBookmarkCollection *collection;
  WebBookmarkCollection *v4;
  void *v5;
  WebBookmarkCollection *v6;
  WebBookmarkCollection *v7;

  collection = self->_collection;
  if (!collection)
  {
    v4 = [WebBookmarkCollection alloc];
    +[WBCollectionConfiguration readonlySafariBookmarkCollectionConfiguration](WBCollectionConfiguration, "readonlySafariBookmarkCollectionConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WebBookmarkCollection initWithConfiguration:checkIntegrity:](v4, "initWithConfiguration:checkIntegrity:", v5, 0);
    v7 = self->_collection;
    self->_collection = v6;

    collection = self->_collection;
  }
  return collection;
}

- (void)enumerateBookmarks:(BOOL)a3 andReadingListItems:(BOOL)a4 matchingString:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *internalQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a5;
  v11 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__WebBookmarkReadonlyCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke;
  block[3] = &unk_24CB33988;
  v18 = a3;
  v19 = a4;
  block[4] = self;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_sync(internalQueue, block);

}

void __98__WebBookmarkReadonlyCollection_enumerateBookmarks_andReadingListItems_matchingString_usingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateBookmarks:andReadingListItems:matchingString:usingBlock:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)readingListBookmarksMatchingString:(id)a3 maxResults:(unsigned int)a4 onlyArchivedBookmarks:(BOOL)a5
{
  id v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  unsigned int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __101__WebBookmarkReadonlyCollection_readingListBookmarksMatchingString_maxResults_onlyArchivedBookmarks___block_invoke;
  v13[3] = &unk_24CB339B0;
  v14 = v8;
  v15 = &v18;
  v13[4] = self;
  v16 = a4;
  v17 = a5;
  v10 = v8;
  dispatch_sync(internalQueue, v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __101__WebBookmarkReadonlyCollection_readingListBookmarksMatchingString_maxResults_onlyArchivedBookmarks___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readingListBookmarksMatchingString:maxResults:onlyArchivedBookmarks:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 60));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)bookmarksMatchingString:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__WebBookmarkReadonlyCollection_bookmarksMatchingString___block_invoke;
  block[3] = &unk_24CB339D8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__WebBookmarkReadonlyCollection_bookmarksMatchingString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bookmarksMatchingString:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)readingListWithUnreadOnly:(BOOL)a3 filteredUsingString:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v20 = 0;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__WebBookmarkReadonlyCollection_readingListWithUnreadOnly_filteredUsingString___block_invoke;
  v11[3] = &unk_24CB33A00;
  v12 = v6;
  v13 = &v15;
  v14 = a3;
  v11[4] = self;
  v8 = v6;
  dispatch_sync(internalQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __79__WebBookmarkReadonlyCollection_readingListWithUnreadOnly_filteredUsingString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readingListWithUnreadOnly:filteredUsingString:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)bookmarkWithID:(int)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WebBookmarkReadonlyCollection_bookmarkWithID___block_invoke;
  block[3] = &unk_24CB322F0;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __48__WebBookmarkReadonlyCollection_bookmarkWithID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bookmarkWithID:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)databaseHealthInformation
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__WebBookmarkReadonlyCollection_databaseHealthInformation__block_invoke;
  v5[3] = &unk_24CB31610;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__WebBookmarkReadonlyCollection_databaseHealthInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseHealthInformation");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)leafChildCountForBookmarksInFolderWithID:(int)a3
{
  NSObject *internalQueue;
  unint64_t v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__WebBookmarkReadonlyCollection_leafChildCountForBookmarksInFolderWithID___block_invoke;
  block[3] = &unk_24CB322F0;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(internalQueue, block);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __74__WebBookmarkReadonlyCollection_leafChildCountForBookmarksInFolderWithID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "leafChildCountForBookmarksInFolderWithID:", *(unsigned int *)(a1 + 48));

}

- (id)leafChildCountForFoldersInFolderWithID:(int)a3
{
  NSObject *internalQueue;
  id v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__WebBookmarkReadonlyCollection_leafChildCountForFoldersInFolderWithID___block_invoke;
  block[3] = &unk_24CB322F0;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(internalQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __72__WebBookmarkReadonlyCollection_leafChildCountForFoldersInFolderWithID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_collection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leafChildCountForFoldersInFolderWithID:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
