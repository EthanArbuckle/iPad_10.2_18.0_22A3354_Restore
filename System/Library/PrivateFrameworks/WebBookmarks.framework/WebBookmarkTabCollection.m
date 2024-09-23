@implementation WebBookmarkTabCollection

- (int)_windowIDForUUID:(id)a3
{
  id v4;
  int v5;
  _BYTE v7[8];
  sqlite3_stmt *v8;
  char v9;
  unsigned int v10;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->super._db, (const char *)objc_msgSend(CFSTR("SELECT windows.id FROM windows WHERE windows.uuid = ?"), "UTF8String"));
  if (!v9)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to fetch window id"), v10);
    goto LABEL_5;
  }
  sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v8) != 100)
  {
LABEL_5:
    v5 = -1;
    goto LABEL_6;
  }
  v5 = sqlite3_column_int(v8, 0);
LABEL_6:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);

  return v5;
}

+ (id)inMemoryChangeSet
{
  return (id)inMemoryTabChangeSet;
}

BOOL __54__WebBookmarkTabCollection__tabGroupForBookmark_kind___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  _BOOL8 v5;

  objc_msgSend(a2, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "identifier");
  v5 = v4 == objc_msgSend(*(id *)(a1 + 32), "lastSelectedChildID");

  return v5;
}

- (id)devicesForProfile:(id)a3
{
  id v4;
  WebBookmarkListQuery *v5;
  WebBookmarkList *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:]([WebBookmarkListQuery alloc], "initWithFolderID:inCollection:usingFilter:options:", objc_msgSend(v4, "databaseIdentifier"), self, 0, 36);
  v6 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v5, 0, self);
  -[WebBookmarkList bookmarkArray](v6, "bookmarkArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__WebBookmarkTabCollection_devicesForProfile___block_invoke;
  v13[3] = &unk_24CB31FE0;
  v13[4] = self;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v7, "safari_mapObjectsUsingBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = (void *)MEMORY[0x24BDBD1A8];
  v11 = v9;

  return v11;
}

- (id)_tabGroupForBookmark:(id)a3 kind:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  WBMutableTabGroup *v10;
  void *v11;
  WBMutableTabGroup *v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  if (v6)
  {
    -[WebBookmarkTabCollection tabsForTabGroupBookmark:](self, "tabsForTabGroupBookmark:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __54__WebBookmarkTabCollection__tabGroupForBookmark_kind___block_invoke;
    v14[3] = &unk_24CB31F90;
    v8 = v6;
    v15 = v8;
    objc_msgSend(v7, "safari_firstObjectPassingTest:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [WBMutableTabGroup alloc];
    objc_msgSend(v9, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WBMutableTabGroup initWithBookmark:tabs:lastSelectedTabUUID:kind:](v10, "initWithBookmark:tabs:lastSelectedTabUUID:kind:", v8, v7, v11, a4);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)tabsForTabGroupBookmark:(id)a3
{
  id v4;
  WebBookmarkListQuery *v5;
  WebBookmarkList *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:]([WebBookmarkListQuery alloc], "initWithFolderID:inCollection:usingFilter:options:", objc_msgSend(v4, "identifier"), self, 0, 2);
  v6 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v5, 0, self);
  -[WebBookmarkList bookmarkArray](v6, "bookmarkArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_144);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = (void *)MEMORY[0x24BDBD1A8];
  v10 = v8;

  return v10;
}

WBMutableTab *__52__WebBookmarkTabCollection_tabsForTabGroupBookmark___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBMutableTab *v3;

  v2 = a2;
  v3 = -[WBTab initWithBookmark:]([WBMutableTab alloc], "initWithBookmark:", v2);

  return v3;
}

- (BOOL)maintainsSyncMetadata
{
  return 1;
}

- (BOOL)bookmarkRequiresParent:(id)a3 specialID:(int)a4
{
  id v4;
  int v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isSyncable") & 1) != 0)
    LOBYTE(v5) = 1;
  else
    v5 = objc_msgSend(v4, "isFolder") ^ 1;

  return v5;
}

- (void)_setupInMemoryChangeSet
{
  _QWORD block[5];

  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed](self, "_trackChangesInMemoryIfDatabaseWriteIsNotAllowed"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__WebBookmarkTabCollection__setupInMemoryChangeSet__block_invoke;
    block[3] = &unk_24CB31DC8;
    block[4] = self;
    if (-[WebBookmarkTabCollection _setupInMemoryChangeSet]::onceToken != -1)
      dispatch_once(&-[WebBookmarkTabCollection _setupInMemoryChangeSet]::onceToken, block);
  }
}

void __51__WebBookmarkTabCollection__setupInMemoryChangeSet__block_invoke()
{
  WebBookmarkChangeSet *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [WebBookmarkChangeSet alloc];
  objc_msgSend((id)objc_opt_class(), "inMemoryChangesFileURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[WebBookmarkChangeSet initWithFileURL:](v0, "initWithFileURL:");
  v2 = (void *)inMemoryTabChangeSet;
  inMemoryTabChangeSet = v1;

}

+ (id)inMemoryChangesFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a1, "safariDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("TabChanges.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)frequentlyVisitedSitesFolderIDForProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE82E70]) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fvs-%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v7 = objc_msgSend(v5, "identifier");
  else
    v7 = 0x7FFFFFFFLL;
  -[WebBookmarkTabCollection _createFrequentlyVisitedSitesFolderWithUUIDIfNeeded:withParentID:](self, "_createFrequentlyVisitedSitesFolderWithUUIDIfNeeded:withParentID:", v6, v7);
  -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "identifier");

  return v9;
}

- (void)_createFrequentlyVisitedSitesFolderWithUUIDIfNeeded:(id)a3 withParentID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v4 = *(_QWORD *)&a4;
  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = -[WebBookmark initFolderWithParentID:collectionType:]([WebBookmark alloc], "initFolderWithParentID:collectionType:", v4, 1);
    objc_msgSend(v8, "setSubtype:", 5);
    objc_msgSend(v8, "setTitle:", v6);
    objc_msgSend(v8, "_setUUID:", v6);
    objc_msgSend(v8, "_setSyncable:", 0);
    v10 = CFSTR("com.apple.bookmarks.OmitFromUI");
    v11[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExtraAttributes:", v9);

    -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v8, 0, 1);
  }

}

- (BOOL)_saveWindowState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  int v31;
  _QWORD v32[6];
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "localTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v6, 0, 1))
  {
    objc_msgSend(v4, "privateTabGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bookmark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v8, 0, 1))
    {
      objc_msgSend(v4, "activeTabGroupUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v10;
      if (-[WebBookmarkTabCollection _saveWindowState:activeTabGroupID:localTabGroupID:privateTabGroupID:](self, "_saveWindowState:activeTabGroupID:localTabGroupID:privateTabGroupID:", v4, objc_msgSend(v10, "identifier"), objc_msgSend(v6, "identifier"), objc_msgSend(v8, "identifier")))
      {
        objc_msgSend(v4, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[WebBookmarkTabCollection _windowIDForUUID:](self, "_windowIDForUUID:", v11);

        objc_msgSend(v4, "setIdentifier:", v12);
        v34 = 0;
        v35 = &v34;
        v36 = 0x2020000000;
        v37 = 0;
        objc_msgSend(v4, "tabGroupsToActiveTabs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = MEMORY[0x24BDAC760];
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __45__WebBookmarkTabCollection__saveWindowState___block_invoke;
        v32[3] = &unk_24CB32030;
        v33 = v12;
        v32[4] = self;
        v32[5] = &v34;
        objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v32);

        objc_msgSend(v4, "profilesToActiveTabGroups");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v14;
        v30[1] = 3221225472;
        v30[2] = __45__WebBookmarkTabCollection__saveWindowState___block_invoke_2;
        v30[3] = &unk_24CB32030;
        v31 = v12;
        v30[4] = self;
        v30[5] = &v34;
        objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v30);

        if (-[WebBookmarkTabCollection _clearUnnamedTabGroupsInWindowWithID:](self, "_clearUnnamedTabGroupsInWindowWithID:", v12))
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v4, "unnamedTabGroupUUIDs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v27;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v27 != v18)
                  objc_enumerationMutation(v16);
                -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v20, "identifier")
                  && !-[WebBookmarkTabCollection _saveUnnamedTabGroupID:inWindowWithID:](self, "_saveUnnamedTabGroupID:inWindowWithID:", objc_msgSend(v20, "identifier"), v12))
                {
                  *((_BYTE *)v35 + 24) = 1;

                  goto LABEL_24;
                }

              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
              if (v17)
                continue;
              break;
            }
          }
LABEL_24:

          v22 = *((_BYTE *)v35 + 24) == 0;
        }
        else
        {
          v22 = 0;
        }
        _Block_object_dispose(&v34, 8);
      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v23 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[WebBookmarkTabCollection _saveWindowState:].cold.1();
      v22 = 0;
    }

  }
  else
  {
    v21 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[WebBookmarkTabCollection _saveWindowState:].cold.2();
    v22 = 0;
  }

  return v22;
}

+ (BOOL)isLockedSync
{
  return 1;
}

uint64_t __72__WebBookmarkTabCollection__saveWindowState_forApplyingInMemoryChanges___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveWindowState:", *(_QWORD *)(a1 + 40));
}

- (void)_saveWindowState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to save local tab group while trying to save window state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)_restoreMissingSpecialBookmarksWithChangeNotification:(BOOL)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebBookmarkTabCollection;
  v4 = -[WebBookmarkCollection _restoreMissingSpecialBookmarksWithChangeNotification:](&v6, sel__restoreMissingSpecialBookmarksWithChangeNotification_, a3);
  if (v4)
  {
    -[WebBookmarkTabCollection _createSpecialTabsFolderWithUUIDIfNeeded:](self, "_createSpecialTabsFolderWithUUIDIfNeeded:", CFSTR("pinned"));
    -[WebBookmarkTabCollection _createSpecialTabsFolderWithUUIDIfNeeded:](self, "_createSpecialTabsFolderWithUUIDIfNeeded:", CFSTR("privatePinned"));
    -[WebBookmarkTabCollection _createSpecialTabsFolderWithUUIDIfNeeded:](self, "_createSpecialTabsFolderWithUUIDIfNeeded:", CFSTR("recentlyClosed"));
  }
  return v4;
}

- (void)_createSpecialTabsFolderWithUUIDIfNeeded:(id)a3 withParentID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v4 = *(_QWORD *)&a4;
  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = -[WebBookmark initFolderWithParentID:collectionType:]([WebBookmark alloc], "initFolderWithParentID:collectionType:", v4, 1);
    objc_msgSend(v8, "setTitle:", v6);
    objc_msgSend(v8, "_setUUID:", v6);
    objc_msgSend(v8, "_setSyncable:", 0);
    v10 = CFSTR("com.apple.bookmarks.OmitFromUI");
    v11[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExtraAttributes:", v9);

    -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v8, 0, 1);
  }

}

- (void)_createSpecialTabsFolderWithUUIDIfNeeded:(id)a3
{
  -[WebBookmarkTabCollection _createSpecialTabsFolderWithUUIDIfNeeded:withParentID:](self, "_createSpecialTabsFolderWithUUIDIfNeeded:withParentID:", a3, 0x7FFFFFFFLL);
}

- (WebBookmarkTabCollection)initWithConfiguration:(id)a3 checkIntegrity:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebBookmarkTabCollection;
  return -[WebBookmarkCollection initWithConfiguration:checkIntegrity:](&v5, sel_initWithConfiguration_checkIntegrity_, a3, a4);
}

+ (BOOL)lockSync
{
  return 1;
}

- (NSArray)windowStates
{
  return (NSArray *)-[WebBookmarkTabCollection _windowStatesWithFilter:](self, "_windowStatesWithFilter:", CFSTR("WHERE windows.date_closed IS NULL"));
}

- (NSArray)privatePinnedTabs
{
  return (NSArray *)-[WebBookmarkTabCollection _specialTabsWithUUID:privateBrowsing:](self, "_specialTabsWithUUID:privateBrowsing:", CFSTR("privatePinned"), 1);
}

- (NSArray)pinnedTabs
{
  return (NSArray *)-[WebBookmarkTabCollection _specialTabsWithUUID:privateBrowsing:](self, "_specialTabsWithUUID:privateBrowsing:", CFSTR("pinned"), 0);
}

- (id)_windowStatesWithFilter:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  sqlite3 *db;
  sqlite3_stmt *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  WBWindowState *v23;
  WBWindowState *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  __CFString *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  WebBookmarkTabCollection *v35;
  char v36[8];
  sqlite3_stmt *v37;
  char v38;
  unsigned int v39;
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFString *)a3;
  v5 = &stru_24CB35168;
  if (v4)
    v5 = v4;
  v30 = (__CFString *)v4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT tab_group_bookmarks.external_uuid, profile_bookmarks.external_uuid, windows.local_tab_group_id, windows.private_tab_group_id, windows.scene_id, windows.uuid, windows.id, windows.extra_attributes FROM windows INNER JOIN bookmarks AS tab_group_bookmarks ON windows.active_tab_group_id = tab_group_bookmarks.id LEFT JOIN bookmarks AS profile_bookmarks ON windows.active_profile_id = profile_bookmarks.id %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self;
  db = self->super._db;
  v31 = objc_retainAutorelease(v6);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v36, db, (const char *)objc_msgSend(v31, "UTF8String"));
  if (v38)
  {
    v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v32 = (void *)*MEMORY[0x24BE82E70];
    while (sqlite3_step(v37) == 100)
    {
      v8 = v37;
      WBUTF8StringFromSQLStatement(v37, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      WBUTF8StringFromSQLStatement(v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = sqlite3_column_int(v8, 2);
      v11 = sqlite3_column_int(v8, 3);
      WBUTF8StringFromSQLStatement(v8, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      WBUTF8StringFromSQLStatement(v8, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = sqlite3_column_int(v8, 6);
      WBDataFromNullableColumn(v8, 7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v15, 2, 0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      -[WebBookmarkTabCollection _tabGroupWithID:kind:](v35, "_tabGroupWithID:kind:", v10, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "tabs");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");
        *(_DWORD *)buf = 134217984;
        v41 = v20;
        _os_log_impl(&dword_211022000, v18, OS_LOG_TYPE_INFO, "Window state local tab group count: %zu", buf, 0xCu);

      }
      -[WebBookmarkTabCollection _tabGroupWithID:kind:](v35, "_tabGroupWithID:kind:", v11, 1);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v17 && v21)
      {
        v23 = -[WBWindowState initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:]([WBWindowState alloc], "initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:", v13, v34, v17, v21, v12, v14);
        v24 = v23;
        if (v9)
          v25 = v9;
        else
          v25 = v32;
        -[WBWindowState setActiveProfileIdentifier:](v23, "setActiveProfileIdentifier:", v25);
        -[WBWindowState setExtraAttributes:](v24, "setExtraAttributes:", v16);
        -[WebBookmarkTabCollection _addActiveTabsToWindowState:](v35, "_addActiveTabsToWindowState:", v24);
        -[WebBookmarkTabCollection _addActiveTabGroupsToWindowState:](v35, "_addActiveTabGroupsToWindowState:", v24);
        -[WebBookmarkTabCollection _addUnnamedTabGroupsToWindowState:](v35, "_addUnnamedTabGroupsToWindowState:", v24);
        objc_msgSend(v33, "addObject:", v24);

      }
      else
      {
        v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211022000, v26, OS_LOG_TYPE_INFO, "Skipped window state from DB due to missing tab group.", buf, 2u);
        }
      }

    }
    v27 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = objc_msgSend(v33, "count");
      *(_DWORD *)buf = 134217984;
      v41 = v28;
      _os_log_impl(&dword_211022000, v27, OS_LOG_TYPE_INFO, "Fetched %zu window states with filter", buf, 0xCu);
    }

  }
  else
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](v35, "_logErrorWithMessage:result:", CFSTR("Failed to fetch window states"), v39);
    v33 = (id)MEMORY[0x24BDBD1A8];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v36);

  return v33;
}

- (id)_tabGroupWithID:(int)a3 kind:(int64_t)a4
{
  void *v6;
  void *v7;

  -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[WebBookmarkTabCollection _tabGroupForBookmark:kind:](self, "_tabGroupForBookmark:kind:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_addUnnamedTabGroupsToWindowState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[8];
  _BYTE v11[8];
  sqlite3_stmt *v12;
  char v13;
  unsigned int v14;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->super._db, (const char *)objc_msgSend(CFSTR("SELECT external_uuid FROM bookmarks INNER JOIN windows_unnamed_tab_groups ON bookmarks.id = windows_unnamed_tab_groups.tab_group_id WHERE windows_unnamed_tab_groups.window_id = ?"), "UTF8String"));
  if (v13)
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WebBookmarkTabCollection _windowIDForUUID:](self, "_windowIDForUUID:", v5);

    sqlite3_bind_int(v12, 1, v6);
    v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "Setting unnamed tab groups on window state", v10, 2u);
    }
    while (sqlite3_step(v12) == 100)
    {
      WBUTF8StringFromSQLStatement(v12, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addUnnamedTabGroupUUID:", v8);
      v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Unnamed tab group set on window state", v10, 2u);
      }

    }
  }
  else
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to fetch unnamed tab groups"), v14);
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

}

- (void)_addActiveTabsToWindowState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  sqlite3_stmt *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[8];
  _BYTE v13[8];
  sqlite3_stmt *v14;
  char v15;
  unsigned int v16;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13, self->super._db, (const char *)objc_msgSend(CFSTR("SELECT tab_bookmarks.external_uuid, tab_group_bookmarks.external_uuid FROM bookmarks AS tab_bookmarks INNER JOIN windows_tab_groups ON tab_bookmarks.id = windows_tab_groups.active_tab_id INNER JOIN bookmarks AS tab_group_bookmarks ON windows_tab_groups.tab_group_id = tab_group_bookmarks.id WHERE windows_tab_groups.window_id = ?"), "UTF8String"));
  if (v15)
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WebBookmarkTabCollection _windowIDForUUID:](self, "_windowIDForUUID:", v5);

    sqlite3_bind_int(v14, 1, v6);
    v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "Setting active tab on window state", v12, 2u);
    }
    while (sqlite3_step(v14) == 100)
    {
      v8 = v14;
      WBUTF8StringFromSQLStatement(v14, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WBUTF8StringFromSQLStatement(v8, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setActiveTabUUID:forTabGroupWithUUID:", v9, v10);
      v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "Active tab set on window state", v12, 2u);
      }

    }
  }
  else
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to fetch active tabs"), v16);
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);

}

- (void)_addActiveTabGroupsToWindowState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  sqlite3_stmt *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[8];
  _BYTE v13[8];
  sqlite3_stmt *v14;
  char v15;
  unsigned int v16;

  v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13, self->super._db, (const char *)objc_msgSend(CFSTR("SELECT tab_group_bookmarks.external_uuid, profile_bookmarks.external_uuid FROM bookmarks AS tab_group_bookmarks INNER JOIN windows_profiles ON tab_group_bookmarks.id = windows_profiles.active_tab_group_id INNER JOIN bookmarks AS profile_bookmarks ON windows_profiles.profile_id = profile_bookmarks.id WHERE windows_profiles.window_id = ?"), "UTF8String"));
  if (v15)
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WebBookmarkTabCollection _windowIDForUUID:](self, "_windowIDForUUID:", v5);

    sqlite3_bind_int(v14, 1, v6);
    v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "Setting active tab groups on window state", v12, 2u);
    }
    while (sqlite3_step(v14) == 100)
    {
      v8 = v14;
      WBUTF8StringFromSQLStatement(v14, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WBUTF8StringFromSQLStatement(v8, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setActiveTabGroupUUID:forProfileWithIdentifier:", v9, v10);
      v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "Active tab group set on window state", v12, 2u);
      }

    }
  }
  else
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to fetch active tab groups"), v16);
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);

}

- (BOOL)saveWindowState:(id)a3
{
  return -[WebBookmarkTabCollection _saveWindowState:forApplyingInMemoryChanges:](self, "_saveWindowState:forApplyingInMemoryChanges:", a3, 0);
}

- (BOOL)_saveWindowState:(id)a3 forApplyingInMemoryChanges:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __72__WebBookmarkTabCollection__saveWindowState_forApplyingInMemoryChanges___block_invoke;
    v11[3] = &unk_24CB32008;
    v11[4] = self;
    v12 = v6;
    v8 = -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:applyInMemoryChanges:secureDelete:](self, "performDatabaseUpdatesWithTransaction:applyInMemoryChanges:secureDelete:", v11, !v4, 0);

  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WebBookmarkTabCollection _saveWindowState:forApplyingInMemoryChanges:].cold.1();
    v8 = 0;
  }

  return v8;
}

- (id)profileForBookmark:(id)a3
{
  id v4;
  void *v5;
  WBMutableProfile *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[WebBookmarkTabCollection _slowDownFetchingForTabsCycler](self, "_slowDownFetchingForTabsCycler");
    -[WebBookmarkTabCollection tabGroupsChildrenForBookmark:](self, "tabGroupsChildrenForBookmark:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WBMutableProfile initWithBookmark:tabGroups:]([WBMutableProfile alloc], "initWithBookmark:tabGroups:", v4, v5);
    if (!-[WBProfile isDefault](v6, "isDefault"))
    {
      -[WebBookmarkTabCollection devicesForProfile:](self, "devicesForProfile:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBMutableProfile setDevices:](v6, "setDevices:", v7);

    }
    -[WebBookmarkTabCollection settingsForBookmarkWithID:](self, "settingsForBookmarkWithID:", objc_msgSend(v4, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBMutableProfile setSettingsDictionary:](v6, "setSettingsDictionary:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tabGroupsChildrenForBookmark:(id)a3
{
  id v4;
  WebBookmarkListQuery *v5;
  void *v6;
  uint64_t v7;
  WebBookmarkListQuery *v8;
  WebBookmarkList *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];

  v4 = a3;
  v5 = [WebBookmarkListQuery alloc];
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE82E70]))
    v7 = 0;
  else
    v7 = objc_msgSend(v4, "identifier");
  v8 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:](v5, "initWithFolderID:inCollection:usingFilter:options:", v7, self, 0, 260);

  v9 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v8, 0, self);
  -[WebBookmarkList bookmarkArray](v9, "bookmarkArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__WebBookmarkTabCollection_tabGroupsChildrenForBookmark___block_invoke;
  v15[3] = &unk_24CB31FB8;
  v15[4] = self;
  objc_msgSend(v10, "safari_mapObjectsUsingBlock:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = (void *)MEMORY[0x24BDBD1A8];
  v13 = v11;

  return v13;
}

- (id)settingsForBookmarkWithID:(int)a3
{
  uint64_t v3;
  void *v5;
  sqlite3 *db;
  id v7;
  void *v8;
  sqlite3_stmt *v9;
  void *v10;
  void *v11;
  sqlite3_int64 v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  _BYTE v21[8];
  sqlite3_stmt *v22;
  char v23;
  unsigned int v24;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT key, value, generation, device_identifier FROM settings WHERE parent = %d"), *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->super._db;
  v7 = objc_retainAutorelease(v5);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, db, (const char *)objc_msgSend(v7, "UTF8String"));
  if (v23)
  {
    v20 = v7;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    while (sqlite3_step(v22) == 100)
    {
      v9 = v22;
      WBUTF8StringFromSQLStatement(v22, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      WBObjectFromColumn(v9, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = sqlite3_column_int64(v9, 2);
      WBUTF8StringFromSQLStatement(v9, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE830D0]), "initWithDeviceIdentifier:generation:", v13, v12);
      v15 = objc_alloc(MEMORY[0x24BE830C8]);
      -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithValue:generation:deviceIdentifier:", v11, v14, v16);

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v10);
    }
    v7 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to fetch profile settings for profile %d"), v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", v18, v24);

    v8 = (void *)MEMORY[0x24BDBD1B8];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);

  return v8;
}

+ (id)collectionWithConfiguration:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "storeOwner");
  if (v4 >= 3)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(objc_alloc(*off_24CB32120[v4]), "initWithConfiguration:", v3);

  return v5;
}

+ (id)_syncLockFileName
{
  return CFSTR("com.apple.WebBookmarks.SafariTabs.lock");
}

- (void)_createSchema
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebBookmarkTabCollection;
  -[WebBookmarkCollection _createSchema](&v3, sel__createSchema);
  -[WebBookmarkTabCollection createWindowsTable](self, "createWindowsTable");
  -[WebBookmarkTabCollection createWindowsTabGroupsTable](self, "createWindowsTabGroupsTable");
  -[WebBookmarkTabCollection createWindowsProfilesTable](self, "createWindowsProfilesTable");
  -[WebBookmarkTabCollection createWindowsUnnamedTabGroupsTable](self, "createWindowsUnnamedTabGroupsTable");
  -[WebBookmarkTabCollection createSettingsTable](self, "createSettingsTable");
}

- (void)createWindowsTable
{
  -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS windows (id INTEGER PRIMARY KEY,active_tab_group_id INTEGER DEFAULT NULL,active_profile_id INTEGER DEFAULT NULL,date_closed REAL DEFAULT NULL,extra_attributes BLOB DEFAULT NULL,is_last_session INTEGER DEFAULT 0,local_tab_group_id INTEGER DEFAULT NULL,private_tab_group_id INTEGER DEFAULT NULL,scene_id TEXT DEFAULT NULL,uuid TEXT NOT NULL UNIQUE,FOREIGN KEY (active_tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE SET NULL,FOREIGN KEY (active_profile_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE SET NULL,FOREIGN KEY (local_tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (private_tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE)"));
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX IF NOT EXISTS uuid_index ON windows (uuid)");
}

- (void)createWindowsTabGroupsTable
{
  -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS windows_tab_groups (id INTEGER PRIMARY KEY,active_tab_id INTEGER DEFAULT NULL,tab_group_id INTEGER NOT NULL,window_id INTEGER NOT NULL,FOREIGN KEY (active_tab_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (window_id) REFERENCES windows (id) ON UPDATE CASCADE ON DELETE CASCADE,UNIQUE (tab_group_id, window_id))"));
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX IF NOT EXISTS window_index ON windows_tab_groups (window_id)");
}

- (void)createWindowsProfilesTable
{
  -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS windows_profiles (id INTEGER PRIMARY KEY,active_tab_group_id INTEGER DEFAULT NULL,profile_id INTEGER NOT NULL,window_id INTEGER NOT NULL,FOREIGN KEY (active_tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (profile_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (window_id) REFERENCES windows (id) ON UPDATE CASCADE ON DELETE CASCADE,UNIQUE (profile_id, window_id))"));
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX IF NOT EXISTS window_index ON windows_profiles (window_id)");
}

- (void)createWindowsUnnamedTabGroupsTable
{
  -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS windows_unnamed_tab_groups (id INTEGER PRIMARY KEY,tab_group_id INTEGER NOT NULL,window_id INTEGER NOT NULL,FOREIGN KEY (tab_group_id) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE CASCADE,FOREIGN KEY (window_id) REFERENCES windows (id) ON UPDATE CASCADE ON DELETE CASCADE,UNIQUE (tab_group_id, window_id))"));
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "CREATE INDEX IF NOT EXISTS window_index ON windows_unnamed_tab_groups (window_id)");
}

- (void)createSettingsTable
{
  -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS settings (id INTEGER PRIMARY KEY, key TEXT NOT NULL, value NUMERIC NOT NULL, generation INTEGER NOT NULL, device_identifier TEXT NOT NULL, parent INTEGER, sync_data BLOB, modified INTEGER NOT NULL, deleted INTEGER NOT NULL, server_id TEXT,FOREIGN KEY (parent) REFERENCES bookmarks (id) ON UPDATE CASCADE ON DELETE SET NULL, UNIQUE (key, parent))"));
  -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("CREATE TRIGGER delete_settings AFTER UPDATE OF parent ON settings BEGIN UPDATE settings SET deleted = 1 WHERE parent IS NULL; END"));
}

- (void)performMaintenance
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__WebBookmarkTabCollection_performMaintenance__block_invoke;
  v3[3] = &unk_24CB31E10;
  v3[4] = self;
  -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v3, 0);
  -[WebBookmarkCollection incrementalVacuumIfNeeded](self, "incrementalVacuumIfNeeded");
  -[WebBookmarkCollection truncateWAL](self, "truncateWAL");
}

uint64_t __46__WebBookmarkTabCollection_performMaintenance__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_deleteMatchingWindows:logAsError:", CFSTR("WHERE local_tab_group_id = 0 OR local_tab_group_id IS NULL OR private_tab_group_id = 0 OR private_tab_group_id IS NULL"), 1);
  objc_msgSend(*(id *)(a1 + 32), "_deleteMatchingWindows:logAsError:", CFSTR("WHERE local_tab_group_id IN (SELECT windows.local_tab_group_id FROM windows LEFT JOIN bookmarks ON windows.local_tab_group_id = bookmarks.id WHERE bookmarks.id IS NULL)"), 1);
  objc_msgSend(*(id *)(a1 + 32), "_deleteMatchingWindows:logAsError:", CFSTR("WHERE private_tab_group_id IN (SELECT windows.private_tab_group_id FROM windows LEFT JOIN bookmarks ON windows.private_tab_group_id = bookmarks.id WHERE bookmarks.id IS NULL)"), 1);
  objc_msgSend(*(id *)(a1 + 32), "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:", 0, 2, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_deleteBookmarks:leaveTombstone:", v2, 1);
  objc_msgSend(*(id *)(a1 + 32), "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:", 0, 4, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", &__block_literal_global_7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_deleteBookmarks:leaveTombstone:", v4, 0);
  return 1;
}

BOOL __46__WebBookmarkTabCollection_performMaintenance__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subtype") == 1;
}

- (void)_migrateWindowBookmark:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  WBWindowState *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WBWindowState *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;

  v28 = a3;
  objc_msgSend(v28, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkTabCollection windowStateWithUUID:](self, "windowStateWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[WebBookmarkCollection listWithID:skipOffset:includeHidden:](self, "listWithID:skipOffset:includeHidden:", objc_msgSend(v28, "identifier"), 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bookmarkArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
LABEL_9:

      goto LABEL_10;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkTabCollection tabGroupForBookmark:](self, "tabGroupForBookmark:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setKind:", 0);
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkTabCollection tabGroupForBookmark:](self, "tabGroupForBookmark:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setKind:", 1);
    v12 = objc_msgSend(v28, "lastSelectedChildID");
    if (v12 == objc_msgSend(v9, "identifier"))
    {
      v13 = v9;
    }
    else
    {
      if (v12 != objc_msgSend(v11, "identifier"))
      {
        if (v12 == 0x7FFFFFFF)
        {
          v14 = 0;
        }
        else
        {
          -[WebBookmarkCollection bookmarkWithID:includingInMemoryChanges:](self, "bookmarkWithID:includingInMemoryChanges:", objc_msgSend(v28, "lastSelectedChildID"), 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            -[WebBookmarkTabCollection tabGroupForBookmark:](self, "tabGroupForBookmark:", v27);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = 0;
          }

        }
        goto LABEL_8;
      }
      v13 = v11;
    }
    v14 = v13;
LABEL_8:
    v15 = [WBWindowState alloc];
    objc_msgSend(v28, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extraAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("sceneID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[WBWindowState initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:](v15, "initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:", v16, v17, v9, v11, v19, 0x7FFFFFFFLL);

    objc_msgSend(v28, "extraAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBWindowState setExtraAttributes:](v20, "setExtraAttributes:", v21);

    -[WebBookmarkTabCollection saveWindowState:](self, "saveWindowState:", v20);
    v22 = (void *)MEMORY[0x24BDD17C8];
    -[WBWindowState uuid](v20, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkTabCollection _uuidForQueries:](self, "_uuidForQueries:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("UPDATE windows SET is_last_session = 1 WHERE uuid = %@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_retainAutorelease(v25);
    -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", objc_msgSend(v26, "UTF8String"));

    goto LABEL_9;
  }
LABEL_10:

}

- (void)_migrateSchemaVersion43ToVersion44
{
  objc_msgSend((id)inMemoryTabChangeSet, "removeAllChanges");
  -[WebBookmarkTabCollection _restoreMissingSpecialBookmarksWithChangeNotification:](self, "_restoreMissingSpecialBookmarksWithChangeNotification:", 0);
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 44");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion44ToVersion45
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[WebBookmarkTabCollection createWindowsTable](self, "createWindowsTable");
  -[WebBookmarkTabCollection createWindowsTabGroupsTable](self, "createWindowsTabGroupsTable");
  -[WebBookmarkCollection applyInMemoryChangesToDatabase](self, "applyInMemoryChangesToDatabase");
  -[WebBookmarkCollection listWithSpecialID:](self, "listWithSpecialID:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "bookmarkCount"))
  {
    -[WebBookmarkTabCollection _deleteAllWindowStates](self, "_deleteAllWindowStates");
    -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:includingHiddenBookmarks:](self, "_fastFetchBookmarksInBookmarkFolder:includingHiddenBookmarks:", 0, 1);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v8, "isSyncable") & 1) == 0)
          {
            objc_msgSend(v8, "title");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Local")) & 1) != 0
              || objc_msgSend(v9, "isEqualToString:", CFSTR("Private")))
            {
              -[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v8, 0);
            }

          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v5);
    }

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "bookmarkArray", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        -[WebBookmarkTabCollection _migrateWindowBookmark:](self, "_migrateWindowBookmark:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j));
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 45");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");

}

- (void)_migrateSchemaVersion51ToVersion52
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE windows ADD COLUMN active_profile_id INTEGER DEFAULT NULL");
  -[WebBookmarkTabCollection createWindowsProfilesTable](self, "createWindowsProfilesTable");
  -[WebBookmarkTabCollection createWindowsUnnamedTabGroupsTable](self, "createWindowsUnnamedTabGroupsTable");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 52");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion52ToVersion53
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkTabCollection createSettingsTable](self, "createSettingsTable");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 53");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion53ToVersion54
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE settings ADD COLUMN server_id TEXT");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 54");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (void)_migrateSchemaVersion54ToVersion55
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "BEGIN");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "ALTER TABLE settings ADD COLUMN server_id TEXT");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "PRAGMA user_version = 55");
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "END");
}

- (BOOL)_deleteMatchingWindows:(id)a3 logAsError:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  sqlite3 *db;
  int v10;
  sqlite3_stmt *v11;
  sqlite3_int64 v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  sqlite3 *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  BOOL v21;
  id v23;
  __CFString *v24;
  uint8_t v25[4];
  int v26;
  __int16 v27;
  __CFString *v28;
  uint8_t v29[4];
  _BYTE v30[20];
  uint8_t buf[4];
  _BYTE v32[12];
  char v33;
  unsigned int v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v24 = (__CFString *)a3;
  v6 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v32 = v24;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "Deleting windows with condition: %@", buf, 0xCu);
  }
  if (v24)
    v7 = v24;
  else
    v7 = &stru_24CB35168;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT id, uuid FROM windows %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->super._db;
  v23 = objc_retainAutorelease(v8);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, db, (const char *)objc_msgSend(v23, "UTF8String"));
  if (v33)
  {
    v10 = 0;
    while (sqlite3_step(*(sqlite3_stmt **)&v32[4]) == 100)
    {
      v11 = *(sqlite3_stmt **)&v32[4];
      v12 = sqlite3_column_int64(*(sqlite3_stmt **)&v32[4], 0);
      WBUTF8StringFromSQLStatement(v11, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v29 = 134218242;
          *(_QWORD *)v30 = v12;
          *(_WORD *)&v30[8] = 2112;
          *(_QWORD *)&v30[10] = v13;
          _os_log_error_impl(&dword_211022000, v14, OS_LOG_TYPE_ERROR, "Delete invalid window %lli %@", v29, 0x16u);
        }
      }
      else
      {
        v15 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v29 = 134218242;
          *(_QWORD *)v30 = v12;
          *(_WORD *)&v30[8] = 2112;
          *(_QWORD *)&v30[10] = v13;
          _os_log_impl(&dword_211022000, v15, OS_LOG_TYPE_INFO, "Delete window %lli %@", v29, 0x16u);
        }
      }

      ++v10;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM windows %@"), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->super._db;
    v18 = objc_retainAutorelease(v16);
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v29, v17, (const char *)objc_msgSend(v18, "UTF8String"));
    if (v30[12])
    {
      v19 = sqlite3_step(*(sqlite3_stmt **)&v30[4]);
      if ((_DWORD)v19 == 101)
      {
        v20 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        v21 = 1;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v25 = 67109378;
          v26 = v10;
          v27 = 2112;
          v28 = v24;
          _os_log_impl(&dword_211022000, v20, OS_LOG_TYPE_INFO, "%i windows deleted using condition: %@", v25, 0x12u);
        }
        goto LABEL_23;
      }
      -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to delete windows"), v19);
    }
    else
    {
      -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to delete windows"), *(unsigned int *)&v30[16]);
    }
    v21 = 0;
LABEL_23:
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v29);

    goto LABEL_24;
  }
  -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to fetch windows"), v34);
  v21 = 0;
LABEL_24:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);

  return v21;
}

- (BOOL)_performOSVersionUpgradesFromPreviousVersion:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WebBookmarkTabCollection;
  if (-[WebBookmarkCollection _performOSVersionUpgradesFromPreviousVersion:](&v7, sel__performOSVersionUpgradesFromPreviousVersion_, v4)&& (objc_msgSend(CFSTR("16.0"), "compare:options:", v4, 64) != 1|| -[WebBookmarkTabCollection _removePlaceholderTabGroupRecordsOnUpgrade](self, "_removePlaceholderTabGroupRecordsOnUpgrade")))
  {
    -[WebBookmarkTabCollection _createParticipantPresenceTable](self, "_createParticipantPresenceTable");
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_createParticipantPresenceTable
{
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "DROP TABLE IF EXISTS participant_presence");
  -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", CFSTR("CREATE TABLE participant_presence (id INTEGER PRIMARY KEY, participant_id TEXT, tab_group_server_id TEXT, tab_server_id TEXT, UNIQUE(participant_id))"));
}

- (BOOL)_performSafariVersionUpgradesFromPreviousVersion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint8_t v25[16];
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WebBookmarkTabCollection;
  if (!-[WebBookmarkCollection _performSafariVersionUpgradesFromPreviousVersion:](&v26, sel__performSafariVersionUpgradesFromPreviousVersion_, v4))goto LABEL_54;
  if (objc_msgSend(CFSTR("614.1.25.0.1"), "compare:options:", v4, 64) == 1)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to fix local bookmarks in syncable folders", v25, 2u);
    }
    if (!-[WebBookmarkTabCollection _fixLocalBookmarksInSyncableFolders](self, "_fixLocalBookmarksInSyncableFolders"))
      goto LABEL_54;
    v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to regenerate sync positions", v25, 2u);
    }
    if (!-[WebBookmarkTabCollection _regenerateSyncPositionsIfNeeded](self, "_regenerateSyncPositionsIfNeeded"))
      goto LABEL_54;
  }
  if (objc_msgSend(CFSTR("614.1.25.0.9"), "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_DEFAULT, "Retrieving shared tab groups with missing CKShare records", v25, 2u);
    }
    if (!-[WebBookmarkTabCollection _saveTabGroupRecordsWithMissingCKShareRecord](self, "_saveTabGroupRecordsWithMissingCKShareRecord"))
    {
      v18 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:].cold.6();
      goto LABEL_54;
    }
    v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_DEFAULT, "Did finish retrieving shared tab groups with missing CKShare records", v25, 2u);
    }
  }
  if (objc_msgSend(CFSTR("616.1.21"), "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    v9 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_DEFAULT, "Resetting all current user-owned shared Tab Group zone server change tokens", v25, 2u);
    }
    if (!-[WebBookmarkTabCollection _resetCurrentUserOwnedSharedTabGroupZoneServerChangeTokens](self, "_resetCurrentUserOwnedSharedTabGroupZoneServerChangeTokens"))
    {
      v19 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:].cold.5();
      goto LABEL_54;
    }
    v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_DEFAULT, "Did reset all current user-owned shared Tab Group zone server change tokens", v25, 2u);
    }
  }
  if (objc_msgSend(CFSTR("614.2"), "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    v11 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_DEFAULT, "Finding any locally saved CKShare to enable presence", v25, 2u);
    }
    if (!-[WebBookmarkTabCollection updateContainsCKShareRecord](self, "updateContainsCKShareRecord"))
    {
      v20 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:].cold.4();
      goto LABEL_54;
    }
    v12 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_DEFAULT, "Did finish looking for locally saved CKShare to enable presence", v25, 2u);
    }
  }
  if (objc_msgSend(CFSTR("616.1.17.10.3"), "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    v13 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_DEFAULT, "Deleting extra personal profiles", v25, 2u);
    }
    if (!-[WebBookmarkTabCollection _deleteDuplicatePersonalProfilesWithInvalidUUID](self, "_deleteDuplicatePersonalProfilesWithInvalidUUID"))
    {
      v21 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:].cold.3();
      goto LABEL_54;
    }
    v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_DEFAULT, "Finished cleaning up personal profiles", v25, 2u);
    }
  }
  if (objc_msgSend(CFSTR("618.1.13"), "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    if (!-[WebBookmarkTabCollection _deleteDefaultProfileIfSavedAsTabGroup](self, "_deleteDefaultProfileIfSavedAsTabGroup"))
    {
      v22 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:].cold.2();
      goto LABEL_54;
    }
    v15 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_211022000, v15, OS_LOG_TYPE_DEFAULT, "Deleted personal profile which was mistakenly saved as a Tab Group.", v25, 2u);
    }
  }
  if (objc_msgSend(CFSTR("618.2.3"), "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    if (-[WebBookmarkTabCollection _removeClosedLocallyCreatedUnnamedTabGroups](self, "_removeClosedLocallyCreatedUnnamedTabGroups"))
    {
      v16 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_211022000, v16, OS_LOG_TYPE_DEFAULT, "Removed unnamed tab groups from windows that were already closed", v25, 2u);
      }
      goto LABEL_41;
    }
    v23 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[WebBookmarkTabCollection _performSafariVersionUpgradesFromPreviousVersion:].cold.1();
LABEL_54:
    v17 = 0;
    goto LABEL_55;
  }
LABEL_41:
  v17 = 1;
LABEL_55:

  return v17;
}

- (BOOL)_performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v9[16];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WebBookmarkTabCollection;
  if (!-[WebBookmarkCollection _performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:](&v10, sel__performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion_, v4))goto LABEL_9;
  if (objc_msgSend(CFSTR("618.1.16"), "safari_isVersionStringGreaterThanVersionString:", v4))
  {
    if (-[WebBookmarkTabCollection _reEncodeSessionStateDataIfNeeded](self, "_reEncodeSessionStateDataIfNeeded"))
    {
      v5 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_DEFAULT, "Re-encoded session state data to truncate large HTTP bodies.", v9, 2u);
      }
      goto LABEL_6;
    }
    v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WebBookmarkTabCollection _performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:].cold.1();
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
LABEL_6:
  v6 = 1;
LABEL_10:

  return v6;
}

- (BOOL)_deleteDuplicatePersonalProfilesWithInvalidUUID
{
  uint64_t v3;
  int v4;
  WebBookmark *v5;
  sqlite3_stmt *v6;
  void *v7;
  WebBookmark *v8;
  void *v9;
  NSObject *v10;
  _BYTE v12[8];
  sqlite3_stmt *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v12, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("server_id = 'DefaultProfile'")));
  v3 = *MEMORY[0x24BE82E70];
  while (1)
  {
    v4 = sqlite3_step(v13);
    if (v4 != 100)
      break;
    v5 = [WebBookmark alloc];
    v6 = v13;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v5, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v6, v7, 1);

    -[WebBookmark UUID](v8, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v9, "isEqualToString:", v3);

    if ((v6 & 1) == 0
      && !-[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v8, 0))
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[WebBookmark UUID](v8, "UUID");
        objc_claimAutoreleasedReturnValue();
        -[WebBookmarkTabCollection _deleteDuplicatePersonalProfilesWithInvalidUUID].cold.1();
      }

      break;
    }

  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
  return v4 != 100;
}

- (BOOL)_deleteDefaultProfileIfSavedAsTabGroup
{
  int v3;
  WebBookmark *v4;
  sqlite3_stmt *v5;
  void *v6;
  WebBookmark *v7;
  NSObject *v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v10, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("server_id = 'DefaultProfile' AND parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0")));
  while (1)
  {
    v3 = sqlite3_step(v11);
    if (v3 != 100)
      break;
    v4 = [WebBookmark alloc];
    v5 = v11;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v4, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v5, v6, 1);

    if (!-[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v7, 0))
    {
      v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[WebBookmarkTabCollection _deleteDefaultProfileIfSavedAsTabGroup].cold.1();

      break;
    }

  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v3 != 100;
}

- (BOOL)_removeClosedLocallyCreatedUnnamedTabGroups
{
  void *v3;
  int v4;
  WebBookmark *v5;
  sqlite3_stmt *v6;
  void *v7;
  WebBookmark *v8;
  void *v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;

  -[WebBookmarkTabCollection _allUnnamedTabGroupUUIDsFromCurrentWindowStates](self, "_allUnnamedTabGroupUUIDsFromCurrentWindowStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v11, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("type = 1 AND subtype = 0 AND parent in (SELECT id FROM bookmarks WHERE type = 1 AND subtype = 3)")));
  while (1)
  {
    v4 = sqlite3_step(v12);
    if (v4 != 100)
      break;
    v5 = [WebBookmark alloc];
    v6 = v12;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v5, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v6, v7, 1);

    -[WebBookmark UUID](v8, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v3, "containsObject:", v9);

    if ((v6 & 1) == 0
      && -[WebBookmark identifier](v8, "identifier")
      && !-[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v8, 1))
    {

      break;
    }

  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v4 != 100;
}

- (id)_allUnnamedTabGroupUUIDsFromCurrentWindowStates
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkTabCollection windowStates](self, "windowStates");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "unnamedTabGroupUUIDs", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v3;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v3;
}

- (BOOL)_reEncodeSessionStateDataIfNeeded
{
  void *v3;
  WebBookmark *v4;
  sqlite3_stmt *v5;
  void *v6;
  WebBookmark *v7;
  WBMutableTab *v8;
  void *v9;
  void *v10;
  _BYTE v12[8];
  sqlite3_stmt *v13;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("type = 0 AND subtype = 0 AND LENGTH(local_attributes) > %d"), 3145728);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v12, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", v3));

  while (sqlite3_step(v13) == 100)
  {
    v4 = [WebBookmark alloc];
    v5 = v13;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v4, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v5, v6, 1);

    v8 = -[WBTab initWithBookmark:]([WBMutableTab alloc], "initWithBookmark:", v7);
    -[WBTab localAttributes](v8, "localAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSessionStateData:", 0);
    -[WBMutableTab setLocalAttributes:](v8, "setLocalAttributes:", v9);
    -[WBTab bookmark](v8, "bookmark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v10, 0, 1);

  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
  return 1;
}

- (BOOL)_fixLocalBookmarksInSyncableFolders
{
  NSObject *v3;
  int v4;
  BOOL v5;
  WebBookmark *v6;
  sqlite3_stmt *v7;
  void *v8;
  WebBookmark *v9;
  WebBookmark *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  WebBookmark *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v21;
  NSObject *v22;
  uint8_t v24[16];
  uint8_t buf[8];
  sqlite3_stmt *v26;

  if (!-[WebBookmarkTabCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    return 1;
  v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "Fixing local bookmarks in syncable folders.", buf, 2u);
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)buf, -[WebBookmarkCollection _selectBookmarksWhere:](self, "_selectBookmarksWhere:", CFSTR("syncable = 0 AND parent IN (SELECT id FROM bookmarks WHERE parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0 AND hidden = 0 AND special_id = 0)")));
  while (1)
  {
    v4 = sqlite3_step(v26);
    v5 = v4 != 100;
    if (v4 != 100)
      break;
    v6 = [WebBookmark alloc];
    v7 = v26;
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v6, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v7, v8, 1);

    v10 = [WebBookmark alloc];
    -[WebBookmark title](v9, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark address](v9, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WebBookmark parentID](v9, "parentID");
    v14 = -[WebBookmark subtype](v9, "subtype");
    -[WebBookmark deviceIdentifier](v9, "deviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WebBookmark initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:](v10, "initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:", v11, v12, v13, v14, v15, 1);

    -[WebBookmark localAttributes](v9, "localAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark setLocalAttributes:](v16, "setLocalAttributes:", v17);

    -[WebBookmark extraAttributes](v9, "extraAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark setExtraAttributes:](v16, "setExtraAttributes:", v18);

    if (!-[WebBookmarkCollection _saveAndMoveBookmark:toFolderID:orderIndex:](self, "_saveAndMoveBookmark:toFolderID:orderIndex:", v16, -[WebBookmark parentID](v9, "parentID"), -[WebBookmark orderIndex](v9, "orderIndex")))
    {
      v21 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[WebBookmarkTabCollection _fixLocalBookmarksInSyncableFolders].cold.2();
      goto LABEL_17;
    }
    if (!-[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v9, 0))
    {
      v22 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[WebBookmarkTabCollection _fixLocalBookmarksInSyncableFolders].cold.1();
LABEL_17:

      goto LABEL_18;
    }

  }
  v19 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_211022000, v19, OS_LOG_TYPE_DEFAULT, "Successfully fixed local bookmarks in syncable folders.", v24, 2u);
  }
LABEL_18:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
  return v5;
}

- (BOOL)_regenerateSyncPositionsIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  int v31;
  BOOL v32;
  NSObject *v33;
  NSObject *v35;
  WebBookmarkList *v36;
  WebBookmarkListQuery *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[4];
  int v51;
  _BYTE buf[24];
  char v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if (!-[WebBookmarkTabCollection maintainsSyncMetadata](self, "maintainsSyncMetadata"))
    return 1;
  v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "Will begin regenerating sync positions", buf, 2u);
  }
  v37 = -[WebBookmarkListQuery initWithBookmarksWhere:folderID:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:folderID:orderBy:usingFilter:", CFSTR("parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0 AND hidden = 0 AND special_id = 0"));
  v36 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v37, 0, self);
  -[WebBookmarkList bookmarkArray](v36, "bookmarkArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_splitArrayUsingCondition:", &__block_literal_global_124);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_126);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncPosition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v39, "second");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v9)
  {
    v40 = *(_QWORD *)v47;
    while (2)
    {
      v10 = 0;
      v11 = v7;
      do
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v10);
        objc_msgSend((id)objc_opt_class(), "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", -[WBCollectionConfiguration collectionType](self->super._configuration, "collectionType"), 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE830D8], "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v11, 0, v15, -[WebBookmarkCollection nextDatabaseSyncChangeID](self, "nextDatabaseSyncChangeID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSyncPosition:", v16);

        objc_msgSend(v12, "syncPosition");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "privacyPreservingDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "syncPosition");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v19;
          _os_log_impl(&dword_211022000, v17, OS_LOG_TYPE_INFO, "Setting position of tab group %{public}@ to position: %{public}@", buf, 0x16u);

        }
        if (!-[WebBookmarkCollection updateBookmarkSyncPositionIfNeeded:](self, "updateBookmarkSyncPositionIfNeeded:", v12)|| !-[WebBookmarkCollection _incrementGeneration](self, "_incrementGeneration"))
        {
          v33 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WebBookmarkTabCollection _regenerateSyncPositionsIfNeeded].cold.2();
          }

          goto LABEL_32;
        }

        ++v10;
        v11 = v7;
      }
      while (v9 != v10);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(v39, "second");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "arrayByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = v21;
  v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(v8);
        v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v25, "serverID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26 == 0;

        if (v27)
          -[WebBookmarkTabCollection _generateServerIdIfNeededForTabGroupBookmark:](self, "_generateServerIdIfNeededForTabGroupBookmark:", v25);
      }
      v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v22);
  }

  objc_msgSend(v8, "valueForKey:", CFSTR("serverID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[WebBookmarkCollection _orderChildrenWithServerIDs:inFolderWithServerID:excludeDeletedBookmarks:](self, "_orderChildrenWithServerIDs:inFolderWithServerID:excludeDeletedBookmarks:", v28, 0, 1);

  if (v29)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v53 = 1;
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke_130;
    v41[3] = &unk_24CB31E98;
    v41[4] = self;
    v41[5] = buf;
    -[WebBookmarkCollection enumerateDescendantsOfBookmarkID:usingBlock:](self, "enumerateDescendantsOfBookmarkID:usingBlock:", 0, v41);
    v30 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
      *(_DWORD *)v50 = 67109120;
      v51 = v31;
      _os_log_impl(&dword_211022000, v30, OS_LOG_TYPE_DEFAULT, "Did finish regenerating sync positions, success: %d", v50, 8u);
    }
    v32 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v35 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[WebBookmarkTabCollection _regenerateSyncPositionsIfNeeded].cold.1();
LABEL_32:
    v32 = 0;
  }

  return v32;
}

BOOL __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "syncPosition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "syncPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

void __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke_130(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (objc_msgSend(v5, "isSyncable"))
  {
    objc_msgSend(v5, "syncPosition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "generateSyncPositionForBookmark:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSyncPosition:", v7);

      v8 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "privacyPreservingDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "syncPosition");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v9;
        v14 = 2114;
        v15 = v10;
        _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "Setting position of record %{public}@ to position: %{public}@", (uint8_t *)&v12, 0x16u);

      }
      if (!objc_msgSend(*(id *)(a1 + 32), "updateBookmarkSyncPositionIfNeeded:", v5)
        || (objc_msgSend(*(id *)(a1 + 32), "_incrementGeneration") & 1) == 0)
      {
        v11 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke_130_cold_1();
        }

        *a3 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }
    }
  }

}

- (BOOL)_saveTabGroupRecordsWithMissingCKShareRecord
{
  NSObject *v3;
  WebBookmarkListQuery *v4;
  WebBookmarkList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "Collecting tab groups that might be shared and missing a CKShare", buf, 2u);
  }
  v4 = -[WebBookmarkListQuery initWithBookmarksWhere:folderID:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:folderID:orderBy:usingFilter:", CFSTR("parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0 AND hidden = 0 AND special_id = 0"), 0, CFSTR("order_index ASC"), 0);
  v5 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v4, 0, self);
  -[WebBookmarkList bookmarkArray](v5, "bookmarkArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__WebBookmarkTabCollection__saveTabGroupRecordsWithMissingCKShareRecord__block_invoke;
  v13[3] = &unk_24CB31EC0;
  v13[4] = self;
  objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __72__WebBookmarkTabCollection__saveTabGroupRecordsWithMissingCKShareRecord__block_invoke_134;
    v11[3] = &unk_24CB31EE8;
    v12 = v8;
    v9 = -[WebBookmarkCollection updateDatabaseSyncDataUsingBlock:](self, "updateDatabaseSyncDataUsingBlock:", v11);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

id __72__WebBookmarkTabCollection__saveTabGroupRecordsWithMissingCKShareRecord__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "syncDataForBookmark:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "_primaryRecordZoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
  {

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "shareRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_5;
  v12 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "ckShortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v13;
    _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_DEFAULT, "TabGroup with recordID %{public}@ is potentially missing its CKShare record", (uint8_t *)&v15, 0xCu);

  }
  v14 = objc_alloc(MEMORY[0x24BDB91E8]);
  v10 = (void *)objc_msgSend(v14, "initWithRecordName:zoneID:", *MEMORY[0x24BDB8F18], v7);
LABEL_6:

  return v10;
}

id __72__WebBookmarkTabCollection__saveTabGroupRecordsWithMissingCKShareRecord__block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "recordIDsToRefresh");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setRecordIDsToRefresh:", v5);

  return v3;
}

- (BOOL)_resetCurrentUserOwnedSharedTabGroupZoneServerChangeTokens
{
  return -[WebBookmarkCollection updateDatabaseSyncDataUsingBlock:](self, "updateDatabaseSyncDataUsingBlock:", &__block_literal_global_136);
}

id __86__WebBookmarkTabCollection__resetCurrentUserOwnedSharedTabGroupZoneServerChangeTokens__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v2, "recordZoneIDsToLastServerChangeTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (!v4)
  {

LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  v6 = 0;
  v7 = *(_QWORD *)v16;
  *(_QWORD *)&v5 = 138543362;
  v14 = v5;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (objc_msgSend(v9, "safari_isInPrivateDatabase", v14)
        && (objc_msgSend(v9, "safari_isTabGroupSecondaryRecordZoneID") & 1) != 0)
      {
        v10 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "ckShortDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v14;
          v20 = v11;
          _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_DEFAULT, "Resetting last server change token for zone %{public}@", buf, 0xCu);

        }
        objc_msgSend(v2, "setLastServerChangeToken:forRecordZoneID:", 0, v9);
        v6 = 1;
      }
    }
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  }
  while (v4);

  if ((v6 & 1) == 0)
    goto LABEL_16;
  objc_msgSend(v2, "setLastPrivateDatabaseServerChangeToken:", 0);
  v12 = v2;
LABEL_17:

  return v12;
}

- (BOOL)containsCKShareRecord
{
  void *v2;
  char v3;

  -[WebBookmarkCollection syncStringForKey:](self, "syncStringForKey:", CFSTR("DatabaseContainsShareRecord"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setContainsCKShareRecord:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("1");
  else
    v3 = CFSTR("0");
  -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", v3, CFSTR("DatabaseContainsShareRecord"));
}

- (BOOL)updateContainsCKShareRecord
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__WebBookmarkTabCollection_updateContainsCKShareRecord__block_invoke;
  v3[3] = &unk_24CB31E10;
  v3[4] = self;
  return -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v3, 0);
}

uint64_t __55__WebBookmarkTabCollection_updateContainsCKShareRecord__block_invoke(uint64_t a1)
{
  WebBookmarkListQuery *v2;
  WebBookmarkList *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = -[WebBookmarkListQuery initWithBookmarksWhere:folderID:orderBy:usingFilter:]([WebBookmarkListQuery alloc], "initWithBookmarksWhere:folderID:orderBy:usingFilter:", CFSTR("parent = 0 AND syncable = 1 AND type = 1 AND subtype = 0 AND hidden = 0 AND special_id = 0"), 0, CFSTR("order_index ASC"), 0);
  v3 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v2, 0, *(_QWORD *)(a1 + 32));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[WebBookmarkList bookmarkArray](v3, "bookmarkArray", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hasShareRecord") & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(*(id *)(a1 + 32), "setContainsCKShareRecord:", v5);
  return 1;
}

- (BOOL)_clearAllSyncData
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebBookmarkTabCollection;
  v3 = -[WebBookmarkCollection _clearAllSyncData](&v5, sel__clearAllSyncData);
  if (v3)
  {
    -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", 0, CFSTR("DatabaseContainsShareRecord"));
    -[WebBookmarkTabCollection _resetSettingsSyncData](self, "_resetSettingsSyncData");
  }
  return v3;
}

- (BOOL)_clearAllSyncKeys
{
  return 1;
}

- (BOOL)_shouldGenerateNewServerIDWhenClearingSyncDataForBookmark:(id)a3
{
  return objc_msgSend(a3, "subtype") != 2;
}

- (id)tabGroupForBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "extraAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsUnnamed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    v8 = 3;
  else
    v8 = 2;
  -[WebBookmarkTabCollection _tabGroupForBookmark:kind:](self, "_tabGroupForBookmark:kind:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_uuidForQueries:(id)a3
{
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@'"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_logErrorWithMessage:(id)a3 result:(int)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WebBookmarkCollection _errorForMostRecentSQLiteError](self, "_errorForMostRecentSQLiteError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "safari_privacyPreservingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v6;
    v12 = 1024;
    v13 = a4;
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_211022000, v8, OS_LOG_TYPE_ERROR, "%@ with result: %d error: %{public}@", (uint8_t *)&v10, 0x1Cu);

  }
}

- (void)_slowDownFetchingForTabsCycler
{
  if (objc_msgSend(MEMORY[0x24BE830F8], "isTabCyclerEnabled"))
  {
    if (objc_msgSend(MEMORY[0x24BE830F8], "shouldTabCyclerSlowDown"))
      objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.2);
  }
}

id __57__WebBookmarkTabCollection_tabGroupsChildrenForBookmark___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "tabGroupForBookmark:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __46__WebBookmarkTabCollection_devicesForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceForBookmark:inProfileWithIdentifier:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)remoteDevicesForProfileBookmark:(id)a3
{
  id v4;
  WebBookmarkListQuery *v5;
  WebBookmarkList *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:]([WebBookmarkListQuery alloc], "initWithFolderID:inCollection:usingFilter:options:", objc_msgSend(v4, "identifier"), self, 0, 68);
  v6 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v5, 0, self);
  -[WebBookmarkList bookmarkArray](v6, "bookmarkArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__WebBookmarkTabCollection_remoteDevicesForProfileBookmark___block_invoke;
  v13[3] = &unk_24CB31FE0;
  v13[4] = self;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v7, "safari_mapObjectsUsingBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = (void *)MEMORY[0x24BDBD1A8];
  v11 = v9;

  return v11;
}

id __60__WebBookmarkTabCollection_remoteDevicesForProfileBookmark___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceForBookmark:inProfileWithIdentifier:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)deviceForBookmark:(id)a3 inProfileWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  WBDevice *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[WebBookmarkTabCollection tabGroupsChildrenForBookmark:](self, "tabGroupsChildrenForBookmark:", v6);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "setKind:", 3, (_QWORD)v16);
          objc_msgSend(v6, "UUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setDeviceUUIDString:", v13);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v14 = -[WBDevice initWithBookmark:unnamedTabGroups:profileIdentifier:]([WBDevice alloc], "initWithBookmark:unnamedTabGroups:profileIdentifier:", v6, v8, v7);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)settingChangeWithName:(id)a3 parentID:(int)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("settings.key = '%@' AND settings.parent = %d"), a3, *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkTabCollection allSettingsChangesWithWhereClause:](self, "allSettingsChangesWithWhereClause:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allSettingsChangesForParentWithID:(int)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(settings.modified = 1 OR settings.deleted = 1) AND settings.parent = %d"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkTabCollection allSettingsChangesWithWhereClause:](self, "allSettingsChangesWithWhereClause:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)settingsChangesForAllDeletedSettings
{
  sqlite3_stmt *v3;
  sqlite3_int64 v4;
  void *v5;
  sqlite3_int64 v6;
  void *v7;
  void *v8;
  sqlite3_int64 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  WBFieldChangeRecord *v19;
  WebBookmarkTabCollection *v21;
  id v22;
  void *v23;
  uint8_t buf[8];
  _BYTE v25[8];
  sqlite3_stmt *v26;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v21 = self;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v25, self->super._db, (const char *)objc_msgSend(CFSTR("SELECT settings.id, settings.key, settings.value, settings.generation, settings.device_identifier, settings.sync_data, settings.deleted, settings.server_id FROM settings WHERE deleted = 1"), "UTF8String"));
  while (sqlite3_step(v26) == 100)
  {
    v3 = v26;
    v4 = sqlite3_column_int64(v26, 0);
    WBUTF8StringFromSQLStatement(v3, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    WBObjectFromColumn(v3, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = sqlite3_column_int64(v3, 3);
    WBUTF8StringFromSQLStatement(v3, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WBDataFromNullableColumn(v3, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = sqlite3_column_int64(v3, 6);
    WBUTF8StringFromSQLStatement(v3, 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_DEFAULT, "Retrieving deleted profile setting change with no server ID.", buf, 2u);
      }
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE830D0]), "initWithDeviceIdentifier:generation:", v7, v6);
    v13 = objc_alloc(MEMORY[0x24BE830C8]);
    -[WebBookmarkCollection currentDeviceIdentifier](v21, "currentDeviceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithValue:generation:deviceIdentifier:", v5, v12, v14);

    if (v9)
      v16 = 2;
    else
      v16 = 1;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "safari_initWithEncodedRecordData:", v8);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("SettingName"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v5, CFSTR("Value"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, CFSTR("SettingServerID"));
    v19 = -[WBFieldChangeRecord initWithField:changeType:attributes:record:identifier:]([WBFieldChangeRecord alloc], "initWithField:changeType:attributes:record:identifier:", v15, v16, v18, v17, v4);
    objc_msgSend(v22, "addObject:", v19);

  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v25);
  return v22;
}

- (id)allSettingsChangesWithWhereClause:(id)a3
{
  id v3;
  void *v4;
  sqlite3 *db;
  sqlite3_stmt *v6;
  sqlite3_int64 v7;
  void *v8;
  sqlite3_int64 v9;
  void *v10;
  sqlite3_int64 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  WBFieldChangeRecord *v23;
  id v25;
  id v26;
  id v27;
  void *v29;
  void *v30;
  uint8_t buf[8];
  _BYTE v32[8];
  sqlite3_stmt *v33;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT settings.id, settings.key, settings.value, settings.generation, settings.device_identifier, settings.sync_data, settings.deleted, settings.server_id, bookmarks.server_id FROM settings INNER JOIN bookmarks ON settings.parent = bookmarks.id WHERE %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->super._db;
  v25 = objc_retainAutorelease(v4);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v32, db, (const char *)objc_msgSend(v25, "UTF8String"));
  v26 = v3;
  while (sqlite3_step(v33) == 100)
  {
    v6 = v33;
    v7 = sqlite3_column_int64(v33, 0);
    WBUTF8StringFromSQLStatement(v6, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    WBObjectFromColumn(v6, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = sqlite3_column_int64(v6, 3);
    WBUTF8StringFromSQLStatement(v6, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    WBDataFromNullableColumn(v6, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = sqlite3_column_int64(v6, 6);
    WBUTF8StringFromSQLStatement(v6, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_DEFAULT, "Retrieving profile setting change with no server ID.", buf, 2u);
      }
    }
    WBUTF8StringFromSQLStatement(v6, 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211022000, v15, OS_LOG_TYPE_DEFAULT, "Retrieving profile setting change with no parent server ID.", buf, 2u);
      }
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE830D0]), "initWithDeviceIdentifier:generation:", v30, v9);
    v17 = objc_alloc(MEMORY[0x24BE830C8]);
    -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithValue:generation:deviceIdentifier:", v8, v16, v18);

    if (v11)
      v20 = 2;
    else
      v20 = 1;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "safari_initWithEncodedRecordData:", v10);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, CFSTR("SettingName"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, CFSTR("Value"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v14, CFSTR("Parent"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, CFSTR("SettingServerID"));
    v23 = -[WBFieldChangeRecord initWithField:changeType:attributes:record:identifier:]([WBFieldChangeRecord alloc], "initWithField:changeType:attributes:record:identifier:", v19, v20, v22, v21, v7);
    objc_msgSend(v27, "addObject:", v23);

    v3 = v26;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v32);

  return v27;
}

- (BOOL)saveSettings:(id)a3 inParentWithID:(int)a4 parentServerID:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  sqlite3_int64 v15;
  void *v16;
  void *v17;
  sqlite3_stmt *v18;
  int v19;
  sqlite3_stmt *v20;
  int v21;
  sqlite3_stmt *v22;
  int v23;
  sqlite3_stmt *v24;
  int v25;
  id v26;
  sqlite3_stmt *v27;
  int v28;
  sqlite3_stmt *v29;
  int v30;
  id v31;
  sqlite3_stmt *v32;
  int v33;
  sqlite3_stmt *v34;
  int v35;
  id v36;
  uint64_t v37;
  BOOL v38;
  void *v39;
  uint64_t v41;
  id obj;
  uint64_t v43;
  sqlite3_int64 v44;
  uint64_t v45;
  id v47;
  void *v48;
  _BYTE v49[8];
  sqlite3_stmt *v50;
  char v51;
  unsigned int v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v6 = *(_QWORD *)&a4;
  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v47 = a5;
  v48 = v7;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v9)
  {
    v41 = v6;
    obj = v8;
    v44 = (int)v6;
    v45 = *(_QWORD *)v54;
    while (2)
    {
      v43 = v9;
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v54 != v45)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v48, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "generation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "generation");

        objc_msgSend(v12, "deviceIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%@"), CFSTR("Setting"), v11, v47);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v49, self->super._db, (const char *)objc_msgSend(CFSTR("INSERT INTO settings (key, value, generation, device_identifier, parent, modified, deleted, server_id) VALUES (@key, @value, @generation, @device_identifier, @parent, 1, 0, @server_id) ON CONFLICT (key, parent) DO UPDATE SET key = excluded.key, deleted = excluded.deleted, value = (CASE WHEN (@generation < generation) OR (@generation = generation AND @device_identifier < device_identifier) THEN excluded.value ELSE @value END), generation = (CASE WHEN (@generation < generation) OR (@generation = generation AND @device_identifier < device_identifier) THEN excluded.generation ELSE @generation END), device_identifier = (CASE WHEN (@generation < generation) OR (@generation = generation AND @device_identifier < device_identifier) THEN excluded.device_identifier ELSE @device_identifier END), modified = (CASE WHEN (@generation < generation) OR (@generation = generation AND @device_identifier < device_identifier) THEN excluded.modified ELSE 1 END)"), "UTF8String"));
        if (!v51)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to save profile settings for profile parent %d"), v41);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", v39, v52);

LABEL_20:
          WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v49);

          v38 = 0;
          v8 = obj;
          goto LABEL_21;
        }
        v18 = v50;
        v19 = sqlite3_bind_parameter_index(v50, "@key");
        sqlite3_bind_text(v18, v19, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v50;
          v21 = sqlite3_bind_parameter_index(v50, "@value");
          sqlite3_bind_int64(v20, v21, objc_msgSend(v13, "integerValue"));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = v50;
            v23 = sqlite3_bind_parameter_index(v50, "@value");
            sqlite3_bind_text(v22, v23, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_20;
            v24 = v50;
            v25 = sqlite3_bind_parameter_index(v50, "@value");
            v26 = objc_retainAutorelease(v13);
            sqlite3_bind_blob(v24, v25, (const void *)objc_msgSend(v26, "bytes"), objc_msgSend(v26, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
        }
        v27 = v50;
        v28 = sqlite3_bind_parameter_index(v50, "@generation");
        sqlite3_bind_int64(v27, v28, v15);
        v29 = v50;
        v30 = sqlite3_bind_parameter_index(v50, "@device_identifier");
        v31 = objc_retainAutorelease(v16);
        sqlite3_bind_text(v29, v30, (const char *)objc_msgSend(v31, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v32 = v50;
        v33 = sqlite3_bind_parameter_index(v50, "@parent");
        sqlite3_bind_int64(v32, v33, v44);
        v34 = v50;
        v35 = sqlite3_bind_parameter_index(v50, "@server_id");
        v36 = objc_retainAutorelease(v17);
        sqlite3_bind_text(v34, v35, (const char *)objc_msgSend(v36, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        v37 = sqlite3_step(v50);
        if ((_DWORD)v37 != 101)
        {
          -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to save settings"), v37);
          goto LABEL_20;
        }
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v49);

      }
      v8 = obj;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      v38 = 1;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v38 = 1;
  }
LABEL_21:

  return v38;
}

- (BOOL)resetModifiedStateForSetting:(id)a3 withRecord:(id)a4 value:(id)a5 forBookmarkWithID:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  sqlite3 *db;
  id v14;
  sqlite3_stmt *v15;
  void *v16;
  void *v17;
  sqlite3_stmt *v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  _BYTE v23[8];
  sqlite3_stmt *v24;
  char v25;
  unsigned int v26;

  v6 = *(_QWORD *)&a6;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE settings SET sync_data = ?, modified = (CASE WHEN value = ? THEN 0 ELSE 1 END) WHERE key = '%@' AND parent = %d"), a3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->super._db;
  v14 = objc_retainAutorelease(v12);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23, db, (const char *)objc_msgSend(v14, "UTF8String"));
  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to update profile settings for profile ID %d"), v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", v17, v26);

    goto LABEL_12;
  }
  v15 = v24;
  objc_msgSend(v10, "safari_encodedSystemFieldsData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  bindNullableDataToSQLStatement(v15, 1, v16);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sqlite3_bind_int64(v24, 2, objc_msgSend(v11, "integerValue"));
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sqlite3_bind_text(v24, 2, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_12:
    v21 = 0;
    goto LABEL_13;
  }
  v18 = v24;
  v19 = objc_retainAutorelease(v11);
  sqlite3_bind_blob(v18, 2, (const void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_9:
  v20 = sqlite3_step(v24);
  if ((_DWORD)v20 != 101)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to update settings"), v20);
    goto LABEL_12;
  }
  v21 = 1;
LABEL_13:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23);

  return v21;
}

- (BOOL)deleteSettingsRecordWithServerID:(id)a3
{
  void *v4;
  sqlite3 *db;
  id v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;
  char v13;
  unsigned int v14;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM settings WHERE server_id = '%@'"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->super._db;
  v6 = objc_retainAutorelease(v4);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, db, (const char *)objc_msgSend(v6, "UTF8String"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to delete profile settings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", v9, v14);

LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v7 = sqlite3_step(v12);
  if ((_DWORD)v7 != 101)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to delete settings"), v7);
    goto LABEL_6;
  }
  v8 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v8;
}

- (BOOL)deleteSettingWithIdentifier:(int64_t)a3
{
  void *v5;
  sqlite3 *db;
  id v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  _BYTE v12[8];
  sqlite3_stmt *v13;
  char v14;
  unsigned int v15;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM settings WHERE id = %zu"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->super._db;
  v7 = objc_retainAutorelease(v5);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, db, (const char *)objc_msgSend(v7, "UTF8String"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to delete settings for id %zu"), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", v10, v15);

LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v8 = sqlite3_step(v13);
  if ((_DWORD)v8 != 101)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to delete settings"), v8);
    goto LABEL_6;
  }
  v9 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v9;
}

- (BOOL)_resetSettingsSyncData
{
  uint64_t v3;
  BOOL v4;
  _BYTE v6[8];
  sqlite3_stmt *v7;
  char v8;
  unsigned int v9;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->super._db, (const char *)objc_msgSend(CFSTR("UPDATE settings SET sync_data = null, modified = (CASE WHEN deleted = 1 THEN settings.modified ELSE 1 END)"), "UTF8String"));
  if (!v8)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to clear sync data"), v9);
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v3 = sqlite3_step(v7);
  if ((_DWORD)v3 != 101)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to update settings sync data and modified values"), v3);
    goto LABEL_6;
  }
  v4 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  return v4;
}

- (id)windowStateWithUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[WebBookmarkTabCollection _uuidForQueries:](self, "_uuidForQueries:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("WHERE uuid = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WebBookmarkTabCollection _windowStatesWithFilter:](self, "_windowStatesWithFilter:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WBWindowState)lastClosedWindowState
{
  void *v2;
  void *v3;

  -[WebBookmarkTabCollection _windowStatesWithFilter:](self, "_windowStatesWithFilter:", CFSTR("WHERE windows.date_closed = (SELECT MAX(date_closed) from windows)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBWindowState *)v3;
}

- (NSArray)lastSessionWindowStates
{
  return (NSArray *)-[WebBookmarkTabCollection _windowStatesWithFilter:](self, "_windowStatesWithFilter:", CFSTR("WHERE windows.is_last_session = 1"));
}

- (NSArray)recentlyClosedWindowStates
{
  return (NSArray *)-[WebBookmarkTabCollection _windowStatesWithFilter:](self, "_windowStatesWithFilter:", CFSTR("WHERE windows.date_closed > 0"));
}

- (BOOL)_saveWindowState:(id)a3 activeTabGroupID:(int)a4 localTabGroupID:(int)a5 privateTabGroupID:(int)a6
{
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  sqlite3_stmt *v16;
  void *v17;
  double v18;
  BOOL v19;
  sqlite3_stmt *v20;
  void *v21;
  sqlite3_stmt *v22;
  id v23;
  sqlite3_stmt *v24;
  id v25;
  uint64_t v26;
  _BYTE v28[8];
  sqlite3_stmt *v29;
  char v30;
  unsigned int v31;

  v10 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28, self->super._db, (const char *)objc_msgSend(CFSTR("INSERT INTO windows (active_tab_group_id, active_profile_id, date_closed, extra_attributes, is_last_session, local_tab_group_id, private_tab_group_id, scene_id, uuid) VALUES (?, ?, ?, ?, 1, ?, ?, ?, ?) ON CONFLICT (uuid) DO UPDATE SET active_tab_group_id = excluded.active_tab_group_id, active_profile_id = excluded.active_profile_id, date_closed = excluded.date_closed, extra_attributes = excluded.extra_attributes, local_tab_group_id = excluded.local_tab_group_id, private_tab_group_id = excluded.private_tab_group_id, is_last_session = 1"), "UTF8String"));
  if (v30)
  {
    if (a4)
      v11 = a4;
    else
      v11 = a5;
    sqlite3_bind_int(v29, 1, v11);
    objc_msgSend(v10, "activeProfileIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12
      && (objc_msgSend(v10, "activeProfileIdentifier"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v13),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v14))
    {
      sqlite3_bind_int(v29, 2, objc_msgSend(v14, "identifier"));
    }
    else
    {
      v14 = 0;
      sqlite3_bind_null(v29, 2);
    }
    objc_msgSend(v10, "dateClosed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v29;
    if (v15)
    {
      objc_msgSend(v10, "dateClosed");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      sqlite3_bind_double(v16, 3, v18);

    }
    else
    {
      sqlite3_bind_null(v29, 3);
    }
    v20 = v29;
    objc_msgSend(v10, "extraAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    bindAttributesToSQLStatement(v20, 4, v21);

    sqlite3_bind_int(v29, 5, a5);
    sqlite3_bind_int(v29, 6, a6);
    v22 = v29;
    objc_msgSend(v10, "sceneID");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v22, 7, (const char *)objc_msgSend(v23, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    v24 = v29;
    objc_msgSend(v10, "uuid");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v24, 8, (const char *)objc_msgSend(v25, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    v26 = sqlite3_step(v29);
    v19 = (_DWORD)v26 == 101;
    if ((_DWORD)v26 != 101)
      -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to add a window"), v26);

  }
  else
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to add a window"), v31);
    v19 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28);

  return v19;
}

- (BOOL)_saveActiveTabID:(int)a3 inTabGroupWithID:(int)a4 windowID:(int)a5
{
  uint64_t v9;
  BOOL v10;
  _BYTE v12[8];
  sqlite3_stmt *v13;
  char v14;
  unsigned int v15;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, self->super._db, (const char *)objc_msgSend(CFSTR("INSERT INTO windows_tab_groups (active_tab_id, tab_group_id, window_id) VALUES (?, ?, ?) ON CONFLICT (tab_group_id, window_id) DO UPDATE SET active_tab_id = excluded.active_tab_id"), "UTF8String"));
  if (!v14)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to add an active tab"), v15);
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  sqlite3_bind_int(v13, 1, a3);
  sqlite3_bind_int(v13, 2, a4);
  sqlite3_bind_int(v13, 3, a5);
  v9 = sqlite3_step(v13);
  if ((_DWORD)v9 != 101)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to add an active tab"), v9);
    goto LABEL_6;
  }
  v10 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
  return v10;
}

- (BOOL)_saveActiveTabGroupID:(int)a3 inProfileWithID:(int)a4 windowID:(int)a5
{
  uint64_t v9;
  BOOL v10;
  _BYTE v12[8];
  sqlite3_stmt *v13;
  char v14;
  unsigned int v15;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, self->super._db, (const char *)objc_msgSend(CFSTR("INSERT INTO windows_profiles (active_tab_group_id, profile_id, window_id) VALUES (?, ?, ?) ON CONFLICT (profile_id, window_id) DO UPDATE SET active_tab_group_id = excluded.active_tab_group_id"), "UTF8String"));
  if (!v14)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to add an active tab group"), v15);
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  sqlite3_bind_int(v13, 1, a3);
  sqlite3_bind_int(v13, 2, a4);
  sqlite3_bind_int(v13, 3, a5);
  v9 = sqlite3_step(v13);
  if ((_DWORD)v9 != 101)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to add an active tab group"), v9);
    goto LABEL_6;
  }
  v10 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
  return v10;
}

- (BOOL)_clearUnnamedTabGroupsInWindowWithID:(int)a3
{
  uint64_t v5;
  BOOL v6;
  _BYTE v8[8];
  sqlite3_stmt *v9;
  char v10;
  unsigned int v11;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8, self->super._db, (const char *)objc_msgSend(CFSTR("DELETE FROM windows_unnamed_tab_groups WHERE window_id = ?"), "UTF8String"));
  if (!v10)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to clear unnamed tab groups"), v11);
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  sqlite3_bind_int(v9, 1, a3);
  v5 = sqlite3_step(v9);
  if ((_DWORD)v5 != 101)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to clear unnamed tab groups"), v5);
    goto LABEL_6;
  }
  v6 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);
  return v6;
}

- (BOOL)_saveUnnamedTabGroupID:(int)a3 inWindowWithID:(int)a4
{
  uint64_t v7;
  BOOL v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;
  char v12;
  unsigned int v13;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->super._db, (const char *)objc_msgSend(CFSTR("INSERT INTO windows_unnamed_tab_groups (tab_group_id, window_id) VALUES (?, ?)"), "UTF8String"));
  if (!v12)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to add an unnamed tab group"), v13);
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  sqlite3_bind_int(v11, 1, a3);
  sqlite3_bind_int(v11, 2, a4);
  v7 = sqlite3_step(v11);
  if ((_DWORD)v7 != 101)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to add an unnamed tab group"), v7);
    goto LABEL_6;
  }
  v8 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v8;
}

void __45__WebBookmarkTabCollection__saveWindowState___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "bookmarkWithUUID:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bookmarkWithUUID:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "_saveActiveTabID:inTabGroupWithID:windowID:", objc_msgSend(v8, "identifier"), objc_msgSend(v7, "identifier"), *(unsigned int *)(a1 + 48)) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __45__WebBookmarkTabCollection__saveWindowState___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "bookmarkWithUUID:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bookmarkWithUUID:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "_saveActiveTabGroupID:inProfileWithID:windowID:", objc_msgSend(v8, "identifier"), objc_msgSend(v7, "identifier"), *(unsigned int *)(a1 + 48)) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (BOOL)closeWindowState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateClosed:", v5);

  LOBYTE(self) = -[WebBookmarkTabCollection saveWindowState:](self, "saveWindowState:", v4);
  return (char)self;
}

- (BOOL)_deleteWindowState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkTabCollection _uuidForQueries:](self, "_uuidForQueries:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("WHERE uuid = %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WebBookmarkTabCollection _deleteMatchingWindows:logAsError:](self, "_deleteMatchingWindows:logAsError:", v8, 0))
  {
    objc_msgSend(v4, "localTabGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "identifier")
      && !-[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v11, 0))
    {
      v19 = 0;
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v4, "unnamedTabGroupUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v12);
            -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "identifier")
              && !-[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v16, 1))
            {

              v19 = 0;
              goto LABEL_19;
            }

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v13)
            continue;
          break;
        }
      }

      objc_msgSend(v4, "privateTabGroup");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "identifier"))
        v19 = -[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v12, 0);
      else
        v19 = 1;
LABEL_19:

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)deleteWindowState:(id)a3
{
  return -[WebBookmarkTabCollection _deleteWindowState:forApplyingInMemoryChanges:](self, "_deleteWindowState:forApplyingInMemoryChanges:", a3, 0);
}

- (BOOL)_deleteWindowState:(id)a3 forApplyingInMemoryChanges:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __74__WebBookmarkTabCollection__deleteWindowState_forApplyingInMemoryChanges___block_invoke;
    v11[3] = &unk_24CB32008;
    v11[4] = self;
    v12 = v6;
    v8 = -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:applyInMemoryChanges:secureDelete:](self, "performDatabaseUpdatesWithTransaction:applyInMemoryChanges:secureDelete:", v11, !v4, 1);

  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WebBookmarkTabCollection _deleteWindowState:forApplyingInMemoryChanges:].cold.1();
    v8 = 0;
  }

  return v8;
}

uint64_t __74__WebBookmarkTabCollection__deleteWindowState_forApplyingInMemoryChanges___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteWindowState:", *(_QWORD *)(a1 + 40));
}

- (BOOL)deleteWindowStates:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  WebBookmarkTabCollection *v9;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__WebBookmarkTabCollection_deleteWindowStates___block_invoke;
  v7[3] = &unk_24CB32008;
  v8 = v4;
  v9 = self;
  v5 = v4;
  LOBYTE(self) = -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v7, 1);

  return (char)self;
}

uint64_t __47__WebBookmarkTabCollection_deleteWindowStates___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(a1 + 40), "_deleteWindowState:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5), (_QWORD)v8) & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (BOOL)_deleteAllWindowStates
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WebBookmarkTabCollection windowStates](self, "windowStates", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        if (!-[WebBookmarkTabCollection _deleteWindowState:](self, "_deleteWindowState:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)deleteAllWindowStates
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__WebBookmarkTabCollection_deleteAllWindowStates__block_invoke;
  v3[3] = &unk_24CB31E10;
  v3[4] = self;
  return -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v3, 1);
}

uint64_t __49__WebBookmarkTabCollection_deleteAllWindowStates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteAllWindowStates");
}

- (BOOL)_deleteWindowsNotInLastSession
{
  WebBookmarkTabCollection *v2;
  void *v3;

  v2 = self;
  -[WebBookmarkTabCollection _windowStatesWithFilter:](self, "_windowStatesWithFilter:", CFSTR("WHERE is_last_session = 0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[WebBookmarkTabCollection deleteWindowStates:](v2, "deleteWindowStates:", v3);

  return (char)v2;
}

- (unint64_t)_countOfAllLocalTabsToBeDeleted
{
  uint64_t v3;
  unint64_t v4;
  _BYTE v6[8];
  sqlite3_stmt *v7;
  char v8;
  unsigned int v9;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->super._db, (const char *)objc_msgSend(CFSTR("SELECT COUNT(*) FROM bookmarks WHERE syncable = 0 AND hidden = 0 AND type = 0 AND parent != 0"), "UTF8String"));
  if (!v8)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to query number of tabs to be deleted"), v9);
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v3 = sqlite3_step(v7);
  if ((_DWORD)v3 != 100)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to query number of tabs to be deleted"), v3);
    goto LABEL_6;
  }
  v4 = sqlite3_column_int(v7, 0);
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  return v4;
}

- (BOOL)_deleteAllLocalTabsAndGroups
{
  void *v3;
  void *v4;
  void *v5;
  sqlite3 *db;
  id v7;
  uint64_t v8;
  BOOL v9;
  _BYTE v11[8];
  sqlite3_stmt *v12;
  char v13;
  unsigned int v14;

  -[WebBookmarkTabCollection _specialTabFolderUUIDsForQueries](self, "_specialTabFolderUUIDsForQueries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM bookmarks WHERE syncable = 0 AND (parent != 0 OR external_uuid NOT IN (%@))"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->super._db;
  v7 = objc_retainAutorelease(v5);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, db, (const char *)objc_msgSend(v7, "UTF8String"));
  if (!v13)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to delete all tabs"), v14);
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v8 = sqlite3_step(v12);
  if ((_DWORD)v8 != 101)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to delete all tabs"), v8);
    goto LABEL_6;
  }
  v9 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v9;
}

- (BOOL)_markTabsClosed:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  sqlite3 *db;
  id v9;
  int v10;
  _BYTE v12[16];
  unsigned __int8 v13;
  unsigned int v14;

  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_287);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE bookmarks SET date_closed = %f WHERE id in (%@)"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->super._db;
  v9 = objc_retainAutorelease(v7);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, db, (const char *)objc_msgSend(v9, "UTF8String"));
  v10 = v13;
  if (!v13)
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to update tab close date"), v14);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v10 != 0;
}

id __44__WebBookmarkTabCollection__markTabsClosed___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_markWindowStatesAsLastSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  sqlite3 *db;
  id v8;
  uint64_t v9;
  BOOL v10;
  _BYTE v12[8];
  sqlite3_stmt *v13;
  char v14;
  unsigned int v15;
  _QWORD v16[5];

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__WebBookmarkTabCollection__markWindowStatesAsLastSession___block_invoke;
  v16[3] = &unk_24CB32098;
  v16[4] = self;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPDATE windows SET is_last_session = CASE WHEN uuid in (%@) THEN 1 ELSE 0 END"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->super._db;
  v8 = objc_retainAutorelease(v6);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, db, (const char *)objc_msgSend(v8, "UTF8String"));
  if (!v14)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to update last session"), v15);
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v9 = sqlite3_step(v13);
  if ((_DWORD)v9 != 101)
  {
    -[WebBookmarkTabCollection _logErrorWithMessage:result:](self, "_logErrorWithMessage:result:", CFSTR("Failed to update last session"), v9);
    goto LABEL_6;
  }
  v10 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v10;
}

id __59__WebBookmarkTabCollection__markWindowStatesAsLastSession___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_uuidForQueries:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)allowsScopedBookmarksInTabGroup:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "supportsTabGroupFavorites") & 1) != 0 && objc_msgSend(v3, "isSyncable"))
  {
    objc_msgSend(v3, "bookmark");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "specialID"))
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      objc_msgSend(v3, "bookmark");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isHidden") ^ 1;

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_generateServerIdIfNeededForTabGroup:(id)a3
{
  void *v4;

  objc_msgSend(a3, "bookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WebBookmarkTabCollection _generateServerIdIfNeededForTabGroupBookmark:](self, "_generateServerIdIfNeededForTabGroupBookmark:", v4);

  return (char)self;
}

- (BOOL)_generateServerIdIfNeededForTabGroupBookmark:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "serverID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else if (objc_msgSend(v4, "identifier") == 0x7FFFFFFF)
  {
    v6 = 0;
  }
  else
  {
    -[WebBookmarkCollection serverIDForBookmarkID:](self, "serverIDForBookmarkID:", objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "setServerID:", v7);
      v6 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WebBookmarkCollection setServerID:forBookmark:](self, "setServerID:forBookmark:", v9, v4);

      if (v10)
      {
        -[WebBookmarkCollection serverIDForBookmarkID:](self, "serverIDForBookmarkID:", objc_msgSend(v4, "identifier"));
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setServerID:", v11);
      }
      else
      {
        v11 = 0;
      }
      v6 = v11 != 0;
      v7 = (void *)v11;
    }

  }
  return v6;
}

- (id)_generateNewServerIDForBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isFolder") && objc_msgSend(v4, "subtype") == 1)
  {
    -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", objc_msgSend(v4, "parentID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isFolder") && !objc_msgSend(v5, "subtype"))
    {
      objc_msgSend(v5, "serverID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("TopScopedBookmarkList_"), "stringByAppendingString:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)WebBookmarkTabCollection;
  -[WebBookmarkCollection _generateNewServerIDForBookmark:](&v9, sel__generateNewServerIDForBookmark_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (id)_topScopedBookmarkListServerIdForTabGroup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("TopScopedBookmarkList_"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)createTopScopedBookmarkListForTabGroup:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v12;
  int v13;
  WebBookmark *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;
  _DWORD v21[2];
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[WebBookmarkTabCollection allowsScopedBookmarksInTabGroup:](self, "allowsScopedBookmarksInTabGroup:", v4))
    goto LABEL_5;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WebBookmarkCollection identifierOfBookmarkWithUUID:](self, "identifierOfBookmarkWithUUID:", v5);

  if (v6 == 0x7FFFFFFF)
    goto LABEL_5;
  if (-[WebBookmarkTabCollection _generateServerIdIfNeededForTabGroup:](self, "_generateServerIdIfNeededForTabGroup:", v4)&& (-[WebBookmarkTabCollection _listOfScopedBookmarkFoldersInTabGroup:](self, "_listOfScopedBookmarkFoldersInTabGroup:", v4), v7 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v7, "bookmarkArray"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "count"), v8, v7, !v9))
  {
    -[WebBookmarkTabCollection _topScopedBookmarkListServerIdForTabGroup:](self, "_topScopedBookmarkListServerIdForTabGroup:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WebBookmarkCollection bookmarkIDForServerID:excludeDeletedBookmarks:](self, "bookmarkIDForServerID:excludeDeletedBookmarks:", v12, 0);
    if (v13 == 0x7FFFFFFF)
    {
      v14 = [WebBookmark alloc];
      v15 = objc_msgSend(v4, "identifier");
      -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[WebBookmark initFolderWithParentID:subtype:deviceIdentifier:collectionType:](v14, "initFolderWithParentID:subtype:deviceIdentifier:collectionType:", v15, 1, v16, 1);

      objc_msgSend(v17, "setTitle:", CFSTR("TopScopedBookmarkList"));
      objc_msgSend(v17, "setServerID:", v12);
      v10 = -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v17, 0, 1);

    }
    else
    {
      v18 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_msgSend(v4, "identifier");
        objc_msgSend(v4, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = 67109635;
        v21[1] = v13;
        v22 = 1024;
        v23 = v19;
        v24 = 2113;
        v25 = v20;
        _os_log_error_impl(&dword_211022000, v18, OS_LOG_TYPE_ERROR, "Detected orphaned TopScopedBookmarkList %d that belongs to Tab Group %d(%{private}@).", (uint8_t *)v21, 0x18u);

      }
      v10 = 0;
    }

  }
  else
  {
LABEL_5:
    v10 = 0;
  }

  return v10;
}

- (id)topScopedBookmarkListForTabGroup:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  WebBookmarkList *v17;
  NSObject *v18;
  WebBookmarkListQuery *v19;

  v6 = a3;
  v7 = a4;
  if (-[WebBookmarkTabCollection allowsScopedBookmarksInTabGroup:](self, "allowsScopedBookmarksInTabGroup:", v6))
  {
    -[WebBookmarkTabCollection _listOfScopedBookmarkFoldersInTabGroup:](self, "_listOfScopedBookmarkFoldersInTabGroup:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bookmarkArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      if (!-[WebBookmarkTabCollection createTopScopedBookmarkListForTabGroup:](self, "createTopScopedBookmarkListForTabGroup:", v6))goto LABEL_14;
      -[WebBookmarkTabCollection _listOfScopedBookmarkFoldersInTabGroup:](self, "_listOfScopedBookmarkFoldersInTabGroup:", v6);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    objc_msgSend(v8, "bookmarkArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(v8, "bookmarkArray");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "identifier");

    }
    else
    {
      -[WebBookmarkTabCollection _topScopedBookmarkListServerIdForTabGroup:](self, "_topScopedBookmarkListServerIdForTabGroup:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[WebBookmarkCollection bookmarkIDForServerID:excludeDeletedBookmarks:](self, "bookmarkIDForServerID:excludeDeletedBookmarks:", v14, 0);
    }

    if ((_DWORD)v16 && (_DWORD)v16 != 0x7FFFFFFF)
    {
      v19 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:]([WebBookmarkListQuery alloc], "initWithFolderID:inCollection:usingFilter:options:", v16, self, 0, 0);
      v17 = -[WebBookmarkList initWithQuery:skipOffset:collection:queue:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:queue:", v19, 0, self, v7);

      goto LABEL_16;
    }
    v18 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "identifier");
      objc_msgSend(v6, "uuid");
      objc_claimAutoreleasedReturnValue();
      -[WebBookmarkTabCollection topScopedBookmarkListForTabGroup:onQueue:].cold.1();
    }

LABEL_14:
    v17 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v17 = 0;
LABEL_17:

  return v17;
}

- (id)_listOfScopedBookmarkFoldersInTabGroup:(id)a3
{
  id v4;
  WebBookmarkListQuery *v5;
  WebBookmarkList *v6;

  v4 = a3;
  v5 = -[WebBookmarkListQuery initWithFolderID:inCollection:usingFilter:options:]([WebBookmarkListQuery alloc], "initWithFolderID:inCollection:usingFilter:options:", objc_msgSend(v4, "identifier"), self, 0, 13);
  v6 = -[WebBookmarkList initWithQuery:skipOffset:collection:]([WebBookmarkList alloc], "initWithQuery:skipOffset:collection:", v5, 0, self);

  return v6;
}

- (id)_specialTabFolderUUIDs
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("pinned");
  v3[1] = CFSTR("privatePinned");
  v3[2] = CFSTR("recentlyClosed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_specialTabFolderUUIDsForQueries
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[WebBookmarkTabCollection _specialTabFolderUUIDs](self, "_specialTabFolderUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__WebBookmarkTabCollection__specialTabFolderUUIDsForQueries__block_invoke;
  v6[3] = &unk_24CB320C0;
  v6[4] = self;
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __60__WebBookmarkTabCollection__specialTabFolderUUIDsForQueries__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_uuidForQueries:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_createSpecialFolderWithIDIfNeeded:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v3 = *(_QWORD *)&a3;
  v9[1] = *MEMORY[0x24BDAC8D0];
  -[WebBookmarkCollection bookmarkWithSpecialID:](self, "bookmarkWithSpecialID:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = -[WebBookmark initFolderWithParentID:collectionType:]([WebBookmark alloc], "initFolderWithParentID:collectionType:", 0, 1);
    objc_msgSend(v6, "setTitle:", CFSTR("Windows"));
    v8 = CFSTR("com.apple.bookmarks.OmitFromUI");
    v9[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExtraAttributes:", v7);

    objc_msgSend(v6, "_setSyncable:", 0);
    -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v6, v3, 1);

  }
}

- (id)_specialTabsWithUUID:(id)a3 privateBrowsing:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  BOOL v13;

  -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[WebBookmarkCollection listWithID:](self, "listWithID:", objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bookmarkArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __65__WebBookmarkTabCollection__specialTabsWithUUID_privateBrowsing___block_invoke;
    v12[3] = &__block_descriptor_33_e28___WBTab_16__0__WebBookmark_8l;
    v13 = a4;
    objc_msgSend(v9, "safari_mapObjectsUsingBlock:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

WBTab *__65__WebBookmarkTabCollection__specialTabsWithUUID_privateBrowsing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WBTab *v4;

  v3 = a2;
  v4 = -[WBTab initWithBookmark:isPrivateBrowsing:]([WBTab alloc], "initWithBookmark:isPrivateBrowsing:", v3, *(unsigned __int8 *)(a1 + 32));

  return v4;
}

- (int)pinnedTabsFolderID
{
  int result;
  void *v4;

  result = self->_cachedPinnedTabsFolderID;
  if (!result)
  {
    -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", CFSTR("pinned"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cachedPinnedTabsFolderID = objc_msgSend(v4, "identifier");

    return self->_cachedPinnedTabsFolderID;
  }
  return result;
}

- (int)privatePinnedTabsFolderID
{
  int result;
  void *v4;

  result = self->_cachedPrivatePinnedTabsFolderID;
  if (!result)
  {
    -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", CFSTR("privatePinned"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cachedPrivatePinnedTabsFolderID = objc_msgSend(v4, "identifier");

    return self->_cachedPrivatePinnedTabsFolderID;
  }
  return result;
}

- (NSArray)recentlyClosedTabs
{
  return (NSArray *)-[WebBookmarkTabCollection _specialTabsWithUUID:privateBrowsing:](self, "_specialTabsWithUUID:privateBrowsing:", CFSTR("recentlyClosed"), 0);
}

- (WebBookmarkList)recentlyClosedTabList
{
  void *v3;
  void *v4;

  -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", CFSTR("recentlyClosed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection listWithID:](self, "listWithID:", objc_msgSend(v3, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (WebBookmarkList *)v4;
}

- (int)_cachedPinnedTabsFolderIDForProfileWithIdentifier:(id)a3
{
  int v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedPinnedTabsFolderIDByProfileIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 = objc_msgSend(v4, "intValue");

  if (v5)
    return v3;
  else
    return 0x7FFFFFFF;
}

- (void)_cachePinnedTabsFolderID:(int)a3 forProfileWithIdentifier:(id)a4
{
  uint64_t v4;
  NSMutableDictionary *v6;
  NSMutableDictionary *cachedPinnedTabsFolderIDByProfileIdentifier;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a3;
  v9 = a4;
  if (!self->_cachedPinnedTabsFolderIDByProfileIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    cachedPinnedTabsFolderIDByProfileIdentifier = self->_cachedPinnedTabsFolderIDByProfileIdentifier;
    self->_cachedPinnedTabsFolderIDByProfileIdentifier = v6;

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedPinnedTabsFolderIDByProfileIdentifier, "setObject:forKeyedSubscript:", v8, v9);

}

- (int)pinnedTabsFolderIDForProfileWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  LODWORD(v5) = -[WebBookmarkTabCollection _cachedPinnedTabsFolderIDForProfileWithIdentifier:](self, "_cachedPinnedTabsFolderIDForProfileWithIdentifier:", v4);
  if ((_DWORD)v5 == 0x7FFFFFFF)
  {
    -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pinned-%@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkTabCollection _createSpecialTabsFolderWithUUIDIfNeeded:withParentID:](self, "_createSpecialTabsFolderWithUUIDIfNeeded:withParentID:", v7, objc_msgSend(v6, "identifier"));
    -[WebBookmarkCollection bookmarkWithUUID:](self, "bookmarkWithUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "identifier");

    -[WebBookmarkTabCollection _cachePinnedTabsFolderID:forProfileWithIdentifier:](self, "_cachePinnedTabsFolderID:forProfileWithIdentifier:", v5, v4);
  }

  return v5;
}

- (id)pinnedTabsForProfileWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pinned-%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkTabCollection _specialTabsWithUUID:privateBrowsing:](self, "_specialTabsWithUUID:privateBrowsing:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)generatePositionBeforeFirstRecordInParentWithServerID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BYTE v16[8];
  sqlite3_stmt *v17;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)*MEMORY[0x24BE82E60];
  v7 = -[WebBookmarkCollection bookmarkIDForServerID:excludeDeletedBookmarks:](self, "bookmarkIDForServerID:excludeDeletedBookmarks:", v6, 1);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16, self->super._db, (const char *)objc_msgSend(CFSTR("SELECT sync_data FROM bookmarks WHERE parent = ? AND server_id IS NOT NULL"), "UTF8String"));
  sqlite3_bind_int(v17, 1, v7);
  v8 = 0;
  while (sqlite3_step(v17) == 100)
  {
    WBDataFromNullableColumn(v17, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBookmarkSyncData positionFromContentsOfData:](WBBookmarkSyncData, "positionFromContentsOfData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (objc_msgSend(v10, "compare:", v8) == -1)
      {
        v11 = v10;

        v8 = v11;
      }
    }
    else
    {
      v8 = v10;
    }

  }
  v12 = (void *)MEMORY[0x24BE830D8];
  -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", 0, v8, v13, -[WebBookmarkCollection nextDatabaseSyncChangeID](self, "nextDatabaseSyncChangeID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16);
  return v14;
}

- (int)createLegacyPlaceholderTabGroupBookmarksForSharedTabGroup:(id)a3
{
  id v4;
  WebBookmark *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WebBookmark *v14;
  uint64_t v15;
  void *v16;
  WebBookmark *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;

  v4 = a3;
  v5 = [WebBookmark alloc];
  -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WebBookmark initFolderWithParentID:deviceIdentifier:collectionType:](v5, "initFolderWithParentID:deviceIdentifier:collectionType:", 0, v6, 1);

  objc_msgSend(v4, "serverID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE83260];
  objc_msgSend((id)*MEMORY[0x24BE83260], "stringByAppendingString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServerID:", v10);

  objc_msgSend(v4, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v11);

  objc_msgSend(v7, "_setHidden:", 1);
  if (!-[WebBookmarkCollection _saveAndMoveBookmark:toFolderID:](self, "_saveAndMoveBookmark:toFolderID:", v7, 0))
    goto LABEL_6;
  if (!-[WebBookmarkCollection _reorderBookmark:afterBookmark:](self, "_reorderBookmark:afterBookmark:", v7, v4))
  {
    -[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v7, 0);
LABEL_6:
    v21 = 0x7FFFFFFF;
    goto LABEL_9;
  }
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://www.icloud.com/%@/unsupported-safari-version"), *MEMORY[0x24BE83148]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [WebBookmark alloc];
  v15 = objc_msgSend(v7, "identifier");
  -[WebBookmarkCollection currentDeviceIdentifier](self, "currentDeviceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WebBookmark initWithTitle:address:parentID:deviceIdentifier:collectionType:](v14, "initWithTitle:address:parentID:deviceIdentifier:collectionType:", v12, v13, v15, v16, 1);

  v18 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "serverID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@TabGroupTab_%@"), v9, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark setServerID:](v17, "setServerID:", v20);

  -[WebBookmark _setHidden:](v17, "_setHidden:", 1);
  if (-[WebBookmarkCollection _saveAndMoveBookmark:toFolderID:](self, "_saveAndMoveBookmark:toFolderID:", v17, objc_msgSend(v7, "identifier")))
  {
    v21 = objc_msgSend(v7, "identifier");
  }
  else
  {
    -[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v7, 0);
    v21 = 0x7FFFFFFF;
  }

LABEL_9:
  return v21;
}

- (BOOL)_removePlaceholderTabGroupRecordsOnUpgrade
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__WebBookmarkTabCollection__removePlaceholderTabGroupRecordsOnUpgrade__block_invoke;
  v3[3] = &unk_24CB31E10;
  v3[4] = self;
  return -[WebBookmarkCollection performDatabaseUpdatesWithTransaction:secureDelete:](self, "performDatabaseUpdatesWithTransaction:secureDelete:", v3, 1);
}

uint64_t __70__WebBookmarkTabCollection__removePlaceholderTabGroupRecordsOnUpgrade__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  WebBookmark *v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  WebBookmark *v7;
  uint64_t v8;
  _BYTE v10[8];
  sqlite3_stmt *v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("server_id LIKE '%@%%'"), *MEMORY[0x24BE83260]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v10, (sqlite3_stmt *)objc_msgSend(v2, "_selectBookmarksWhere:", v3));

  while (sqlite3_step(v11) == 100)
  {
    v4 = [WebBookmark alloc];
    v5 = v11;
    objc_msgSend(*(id *)(a1 + 32), "currentDeviceIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v4, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v5, v6, 1);

    LOBYTE(v6) = objc_msgSend(*(id *)(a1 + 32), "deleteBookmark:leaveTombstone:", v7, 0);
    if ((v6 & 1) == 0)
    {
      v8 = 0;
      goto LABEL_6;
    }
  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "updateDatabaseSyncDataUsingBlock:", &__block_literal_global_317);
LABEL_6:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v8;
}

id __70__WebBookmarkTabCollection__removePlaceholderTabGroupRecordsOnUpgrade__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "clearAllLastServerChangeTokens");
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPinnedTabsFolderIDByProfileIdentifier, 0);
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to remove unnamed tab groups from windows that were already closed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to delete personal profile which was saved as a Tab Group.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to delete extra personal profiles", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to check locally saved CKShare records", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to reset current user-owned shared Tab Group zone server change tokens", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_performSafariVersionUpgradesFromPreviousVersion:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to retrieve CKShare records to refresh", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to re-encode session state data to truncate large HTTP bodies.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteDuplicatePersonalProfilesWithInvalidUUID
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_3(&dword_211022000, v1, v3, "Failed to delete extra personal profile with mismatched UUID: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)_deleteDefaultProfileIfSavedAsTabGroup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to delete personal profile that was saved as a Tab Group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fixLocalBookmarksInSyncableFolders
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to save updated syncable bookmark", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_regenerateSyncPositionsIfNeeded
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_3(&dword_211022000, v1, v3, "Failed to save generated position for record %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

void __60__WebBookmarkTabCollection__regenerateSyncPositionsIfNeeded__block_invoke_130_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_3(&dword_211022000, v1, v3, "Setting position failed for bookmark %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)_saveWindowState:forApplyingInMemoryChanges:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Attempted to save a nil window state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_saveWindowState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Failed to save private tab group while trying to save window state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteWindowState:forApplyingInMemoryChanges:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_211022000, v0, v1, "Attempted to delete a nil window state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)topScopedBookmarkListForTabGroup:onQueue:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint8_t *v4;
  os_log_t v5;

  OUTLINED_FUNCTION_5_0();
  *(_DWORD *)v1 = 67109379;
  *(_DWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 8) = 2113;
  *(_QWORD *)(v1 + 10) = v3;
  _os_log_error_impl(&dword_211022000, v5, OS_LOG_TYPE_ERROR, "Tab Group %d(%{private}@) does not have a scoped bookmark folder.", v4, 0x12u);

  OUTLINED_FUNCTION_4();
}

@end
