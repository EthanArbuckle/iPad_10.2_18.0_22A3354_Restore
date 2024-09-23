@implementation WebBookmarkInMemoryChangeFilterUnreadOnly

- (id)bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "modifiedBookmarksInBookmarkFolder:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkInMemoryChangeFilterUnreadOnly _bookmarksIDsFromBookmarks:fromChangeSet:withFilter:](self, "_bookmarksIDsFromBookmarks:fromChangeSet:withFilter:", v7, v6, &__block_literal_global_4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __108__WebBookmarkInMemoryChangeFilterUnreadOnly_bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet_inFolder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "dateLastViewed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "modifiedBookmarksInBookmarkFolder:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkInMemoryChangeFilterUnreadOnly _bookmarksIDsFromBookmarks:fromChangeSet:withFilter:](self, "_bookmarksIDsFromBookmarks:fromChangeSet:withFilter:", v7, v6, &__block_literal_global_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __111__WebBookmarkInMemoryChangeFilterUnreadOnly_bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet_inFolder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "dateLastViewed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_bookmarksIDsFromBookmarks:(id)a3 fromChangeSet:(id)a4 withFilter:(id)a5
{
  id v6;
  unsigned int (**v7)(id, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (unsigned int (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "bookmark");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15
          && (objc_msgSend(v6, "replayChangesOnBookmark:", v15) & 0xFFFFFFFFFFFFFFFDLL) != 1
          && objc_msgSend(v14, "attributesMarkedAsModify:", 8)
          && v7[2](v7, v15))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v15, "identifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  objc_msgSend(v8, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
