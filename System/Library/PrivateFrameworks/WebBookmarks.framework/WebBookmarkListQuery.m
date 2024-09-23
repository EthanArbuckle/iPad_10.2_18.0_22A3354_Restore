@implementation WebBookmarkListQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inMemoryFilter, 0);
  objc_storeStrong((id *)&self->_urlFilter, 0);
  objc_storeStrong((id *)&self->_titleWordPrefixesForInMemoryFiltering, 0);
  objc_storeStrong((id *)&self->_titleWordPrefixes, 0);
  objc_storeStrong((id *)&self->_orderBy, 0);
  objc_storeStrong((id *)&self->_queryWithOrderBy, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (id)bookmarksInCollection:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5
{
  -[WebBookmarkListQuery bookmarksInCollection:fromIndex:toIndex:skipDecodingSyncData:](self, "bookmarksInCollection:fromIndex:toIndex:skipDecodingSyncData:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)folderID
{
  return self->_folderID;
}

- (int)_childCountInDatabaseForFolderFetchInCollection:(id)a3 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:(BOOL)a4 countShouldUseNumChildrenIfPossible:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v7;
  int64_t v8;
  _BOOL8 v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  NSArray *titleWordPrefixes;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  NSObject *v28;
  NSObject *v29;
  int v31;
  unsigned int *p_folderID;
  _BOOL4 v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[8];
  sqlite3_stmt *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v5 = a5;
  v33 = a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &stru_24CB35168;
  v8 = -[WebBookmarkListQuery _listQueryType](self, "_listQueryType");
  v9 = v8 == 1 && v33;
  if (self->_inMemoryFilter || v9)
  {
    -[WebBookmarkListQuery _sqliteNotInConditionForInMemoryModifiedAndDeleted:bookmarksInFolder:collection:](self, "_sqliteNotInConditionForInMemoryModifiedAndDeleted:bookmarksInFolder:collection:", v9, self->_folderID, v35);
    v11 = objc_claimAutoreleasedReturnValue();
    -[WebBookmarkListQuery _sqliteInConditionForInMemoryModifiedBookmarksInFolder:collection:](self, "_sqliteInConditionForInMemoryModifiedBookmarksInFolder:collection:", self->_folderID, v35);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = (__CFString *)v11;
  }
  else
  {
    v10 = &stru_24CB35168;
  }
  p_folderID = (unsigned int *)&self->_folderID;
  if (!self->_folderID
    || self->_includeHidden
    || self->_titleWordPrefixes
    || -[__CFString length](v10, "length")
    || !v5
    || self->_includeDescendantsAsChildren)
  {
    whereClauseWithAppendingINConditions(self->_query, &v7->isa, &v10->isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "appendFormat:", CFSTR("SELECT COUNT(*) FROM bookmarks WHERE %@"), v12);

    v31 = 0;
  }
  else
  {
    objc_msgSend(v34, "appendFormat:", CFSTR("SELECT num_children FROM bookmarks WHERE id = %d"), *p_folderID);
    v31 = 1;
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v44, (sqlite3_stmt *)objc_msgSend(v35, "_sqliteStatementWithQuery:", v34));
  titleWordPrefixes = self->_titleWordPrefixes;
  if (titleWordPrefixes)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v14 = titleWordPrefixes;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v41;
      v17 = 1;
      do
      {
        v18 = 0;
        v19 = v17;
        do
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(v14);
          sqlite3_bind_text(v45, v19 + v18, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v18)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          ++v18;
        }
        while (v15 != v18);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        v17 = v19 + v18;
      }
      while (v15);
      v20 = v19 + v18;
    }
    else
    {
      v20 = 1;
    }

    sqlite3_bind_text(v45, v20, -[NSString UTF8String](self->_urlFilter, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  v21 = sqlite3_step(v45);
  v22 = 0;
  if (v21 && v21 != 101)
  {
    if (v21 != 100)
    {
      v22 = -1;
      goto LABEL_45;
    }
    v22 = sqlite3_column_int(v45, 0);
  }
  if (v33 && !v8)
  {
    objc_msgSend(v35, "_inMemoryChangeSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "deletedBookmarkIDsInBookmarkFolder:", *p_folderID);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v37 != v26)
            objc_enumerationMutation(v24);
          v22 -= objc_msgSend(v23, "bookmarkIsAddedInMemory:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "intValue")) ^ 1;
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v25);
    }

  }
  if (v22 < 0)
  {
    v28 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[WebBookmarkListQuery _childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:countShouldUseNumChildrenIfPossible:].cold.2((int *)p_folderID, v22, v28);
    if (v31)
    {
      v29 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[WebBookmarkListQuery _childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:countShouldUseNumChildrenIfPossible:].cold.1((int *)p_folderID, v29);
      v22 = -[WebBookmarkListQuery _childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:countShouldUseNumChildrenIfPossible:](self, "_childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:countShouldUseNumChildrenIfPossible:", v35, v33, 0);
    }
  }
LABEL_45:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v44);

  return v22;
}

- (id)_sqliteNotInConditionForInMemoryModifiedAndDeleted:(BOOL)a3 bookmarksInFolder:(int)a4 collection:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;

  v5 = a3;
  v7 = a5;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_inMemoryChangeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    objc_msgSend(v9, "deletedBookmarkIDsInBookmarkFolder:", self->_folderID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    commaSeparatedIDStringForBookmarkIDs(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length"))
      objc_msgSend(v8, "appendString:", v13);

  }
  if (self->_inMemoryFilter && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WebBookmarkInMemoryChangeFilter bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:inFolder:](self->_inMemoryFilter, "bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:inFolder:", v10, self->_folderID);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    commaSeparatedIDStringForBookmarkIDs(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length") && objc_msgSend(v15, "length"))
      objc_msgSend(v8, "appendFormat:", CFSTR(",%@"), v15);
    else
      objc_msgSend(v8, "appendString:", v15);

  }
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("id NOT IN (%@)"), v8);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &stru_24CB35168;
  }

  return v16;
}

- (id)_sqliteInConditionForInMemoryModifiedBookmarksInFolder:(int)a3 collection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v5 = a4;
  v6 = v5;
  if (self->_inMemoryFilter)
  {
    objc_msgSend(v5, "_inMemoryChangeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[WebBookmarkInMemoryChangeFilter bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet:inFolder:](self->_inMemoryFilter, "bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet:inFolder:", v7, self->_folderID);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      commaSeparatedIDStringForBookmarkIDs(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("id IN (%@)"), v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = &stru_24CB35168;
      }

    }
    else
    {
      v10 = &stru_24CB35168;
    }

  }
  else
  {
    v10 = &stru_24CB35168;
  }

  return v10;
}

- (int)countInCollection:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  NSArray *titleWordPrefixes;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  sqlite3_stmt *v17;
  id v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  BOOL v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[8];
  sqlite3_stmt *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[WebBookmarkListQuery _listQueryType](self, "_listQueryType");
  objc_msgSend(v4, "_inMemoryChangeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "bookmarkIsAddedInMemory:", self->_folderID);
  if (v5 < 2)
    v8 = 1;
  else
    v8 = v7;
  if (v8 == 1)
  {
    if ((v7 & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v9 = -[WebBookmarkListQuery _childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:](self, "_childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:", v4, v5 == 1);
      if (v9 < 0)
      {
        v20 = -1;
        goto LABEL_33;
      }
    }
    v20 = -[WebBookmarkListQuery _inMemoryAddedChildrenCountForBookmarkFolder:collection:skipCountingBookmarksThatAreDeletedInMemory:](self, "_inMemoryAddedChildrenCountForBookmarkFolder:collection:skipCountingBookmarksThatAreDeletedInMemory:", self->_folderID, v4, v5 == 1)+ v9;
    if (v5 != 1)
    {
      objc_msgSend(v6, "deletedBookmarkIDsInBookmarkFolder:", self->_folderID);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 -= objc_msgSend(v21, "count");

    }
  }
  else
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v30, (sqlite3_stmt *)objc_msgSend(v4, "_selectBookmarksWhere:returnType:", self->_query, 1));
    titleWordPrefixes = self->_titleWordPrefixes;
    if (titleWordPrefixes)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = titleWordPrefixes;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v27;
        v14 = 1;
        do
        {
          v15 = 0;
          v16 = v14;
          do
          {
            if (*(_QWORD *)v27 != v13)
              objc_enumerationMutation(v11);
            v17 = v31;
            v18 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v15));
            sqlite3_bind_text(v17, v16 + v15++, (const char *)objc_msgSend(v18, "UTF8String", (_QWORD)v26), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
          while (v12 != v15);
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
          v14 = v16 + v15;
        }
        while (v12);
        v19 = v16 + v15;
      }
      else
      {
        v19 = 1;
      }

      sqlite3_bind_text(v31, v19, -[NSString UTF8String](self->_urlFilter, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    if (self->_customQuery)
      v22 = 0;
    else
      v22 = objc_msgSend(v6, "numberOfAddedBookmarksInBookmarkFolder:", self->_folderID);
    while (1)
    {
      v23 = sqlite3_step(v31);
      if (v23 != 100)
        break;
      v22 += objc_msgSend(v6, "isBookmarkDeleted:", sqlite3_column_int(v31, 0)) ^ 1;
    }
    if (v23)
      v24 = v23 == 101;
    else
      v24 = 1;
    if (v24)
      v20 = v22;
    else
      v20 = -1;
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v30);
  }
LABEL_33:

  return v20;
}

- (int64_t)_listQueryType
{
  if (self->_customQuery)
    return 2;
  else
    return self->_titleWordPrefixes != 0;
}

- (int)_inMemoryAddedChildrenCountForBookmarkFolder:(int)a3 collection:(id)a4 skipCountingBookmarksThatAreDeletedInMemory:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = -[WebBookmarkListQuery _listQueryType](self, "_listQueryType");
  objc_msgSend(v8, "_inMemoryChangeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 || v5)
  {
    objc_msgSend(v10, "addedBookmarksInBookmarkFolder:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v11, "applyModificationsToBookmarks:", v13);
      if (v9 == 1)
      {
        -[WebBookmarkListQuery _filterBookmarks:](self, "_filterBookmarks:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v14;
      }
      v12 = objc_msgSend(v13, "count");
      if (v5)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v13 = v13;
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v20 != v16)
                objc_enumerationMutation(v13);
              v12 -= objc_msgSend(v11, "isBookmarkDeleted:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "identifier", (_QWORD)v19));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v15);
        }

      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = objc_msgSend(v10, "numberOfAddedBookmarksInBookmarkFolder:", v6);
  }

  return v12;
}

- (int)_childCountInDatabaseForFolderFetchInCollection:(id)a3 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:(BOOL)a4
{
  return -[WebBookmarkListQuery _childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:countShouldUseNumChildrenIfPossible:](self, "_childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:countShouldUseNumChildrenIfPossible:", a3, a4, self->_countShouldUseNumChildrenIfPossible);
}

- (WebBookmarkListQuery)initWithFolderID:(int)a3 inCollection:(id)a4 usingFilter:(id)a5 options:(unint64_t)a6
{
  unsigned int v6;
  uint64_t v8;
  __CFString *v10;
  uint64_t v11;
  unint64_t v12;
  __CFString *v13;
  BOOL v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  __CFString *v19;
  void *v20;
  WebBookmarkListQuery *v21;
  WebBookmarkListQuery *v22;
  void *v23;
  WBInMemoryChangeFilterVisible *v24;
  WebBookmarkInMemoryChangeFilter *inMemoryFilter;
  WebBookmarkListQuery *v26;
  id v28;
  void *v29;
  id v30;

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  v28 = a4;
  v30 = a5;
  if ((v6 & 0x21) != 0)
  {
    v10 = &stru_24CB35168;
  }
  else
  {
    if ((_DWORD)v8)
    {
      v10 = CFSTR("AND hidden = 0");
    }
    else
    {
      objc_msgSend(v28, "_rootFolderHiddenChildrenClause");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if ((v6 & 0x18) == 0x10)
    {
      -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR(" AND hidden_ancestor_count = 0"));
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (__CFString *)v11;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("parent = %d"), v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6 & 0x10;
  if ((v6 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("OR parent IN (SELECT folder_id FROM folder_ancestors WHERE ancestor_id = %d)"), v8);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_24CB35168;
  }
  v14 = (v6 & 0x21) != 0;
  if ((v6 & 6) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AND type = %d"), (v6 & 2) == 0);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &stru_24CB35168;
  }
  if ((v6 & 0x140) != 0)
  {
    v16 = ~(v6 >> 6) & 4;
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AND subtype = %ld"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v19 = (__CFString *)v17;
    goto LABEL_23;
  }
  if ((v6 & 0xA0) != 0)
  {
    if ((v6 & 0x20) != 0)
      v18 = CFSTR("AND (subtype = %ld OR subtype = %ld)");
    else
      v18 = CFSTR("AND (subtype != %ld AND subtype != %ld)");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, 4, 3);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if ((v6 & 8) != 0)
  {
    v16 = 1;
    goto LABEL_16;
  }
  v19 = &stru_24CB35168;
LABEL_23:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ %@) %@ %@ %@"), v29, v13, v10, v15, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[WebBookmarkListQuery initWithBookmarksWhere:folderID:orderBy:usingFilter:](self, "initWithBookmarksWhere:folderID:orderBy:usingFilter:", v20, v8, CFSTR("order_index ASC"), v30);
  v22 = v21;
  if (v21)
  {
    v21->_customQuery = 0;
    v21->_includeHidden = v14;
    v21->_folderID = v8;
    objc_msgSend(v28, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_countShouldUseNumChildrenIfPossible = objc_msgSend(v23, "collectionType") == 0;

    v22->_includeDescendantsAsChildren = v12 >> 4;
    if (!v22->_includeHidden)
    {
      v24 = objc_alloc_init(WBInMemoryChangeFilterVisible);
      inMemoryFilter = v22->_inMemoryFilter;
      v22->_inMemoryFilter = (WebBookmarkInMemoryChangeFilter *)v24;

    }
    v26 = v22;
  }

  return v22;
}

- (WebBookmarkListQuery)initWithBookmarksWhere:(id)a3 folderID:(int)a4 orderBy:(id)a5 usingFilter:(id)a6
{
  id v11;
  id v12;
  id v13;
  WebBookmarkListQuery *v14;
  WebBookmarkListQuery *v15;
  _QWORD *p_query;
  uint64_t v17;
  NSString *orderBy;
  void *v19;
  uint64_t v20;
  NSString *urlFilter;
  id v22;
  NSArray *v23;
  void *v24;
  unint64_t i;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSString *queryWithOrderBy;
  WebBookmarkListQuery *v32;
  id v34;
  objc_super v35;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)WebBookmarkListQuery;
  v14 = -[WebBookmarkListQuery init](&v35, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_customQuery = 1;
    p_query = &v14->_query;
    objc_storeStrong((id *)&v14->_query, a3);
    v17 = objc_msgSend(v12, "copy");
    orderBy = v15->_orderBy;
    v15->_orderBy = (NSString *)v17;

    -[WebBookmarkListQuery _normalizeUserTypedString:](v15, "_normalizeUserTypedString:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[WebBookmarkListQuery _preparePrefixesFromNormalizedString:](v15, "_preparePrefixesFromNormalizedString:", v19);
      v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%%%@%%"), v19);
      urlFilter = v15->_urlFilter;
      v15->_urlFilter = (NSString *)v20;

    }
    if (v15->_titleWordPrefixes)
    {
      v22 = objc_alloc(MEMORY[0x24BDD17C8]);
      v34 = v11;
      v23 = v15->_titleWordPrefixes;
      v24 = (void *)objc_msgSend(CFSTR("id IN (SELECT bookmark_id FROM bookmark_title_words WHERE word GLOB ?)"), "mutableCopy");
      for (i = 1; i < -[NSArray count](v23, "count"); ++i)
        objc_msgSend(v24, "appendString:", CFSTR(" AND id IN (SELECT bookmark_id FROM bookmark_title_words WHERE word GLOB ?)"));

      v26 = v24;
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("((%@) OR url LIKE ?)"), v26);

      v28 = objc_msgSend(v22, "initWithFormat:", CFSTR("%@ AND %@"), v27, *p_query);
      v29 = (void *)*p_query;
      *p_query = v28;

      v11 = v34;
    }
    if (v12)
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ ORDER BY %@"), *p_query, v12);
      queryWithOrderBy = v15->_queryWithOrderBy;
      v15->_queryWithOrderBy = (NSString *)v30;

    }
    if (a4 != 0x7FFFFFFF)
    {
      v15->_folderID = a4;
      v15->_customQuery = 0;
    }
    v15->_countShouldUseNumChildrenIfPossible = 0;
    v32 = v15;
  }

  return v15;
}

- (id)_normalizeUserTypedString:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  const __CFLocale *v6;
  __CFString *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (__CFString *)objc_msgSend(v3, "mutableCopy");
    CFStringTrimWhitespace(v5);
    if (-[__CFString length](v5, "length"))
    {
      v6 = CFLocaleCopyCurrent();
      CFStringNormalize(v5, kCFStringNormalizationFormD);
      CFStringFold(v5, 0x181uLL, v6);
      CFRelease(v6);
      v7 = v5;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isCustomQuery
{
  return self->_customQuery;
}

- (WebBookmarkListQuery)initWithBookmarksWhere:(id)a3 orderBy:(id)a4 usingFilter:(id)a5
{
  return -[WebBookmarkListQuery initWithBookmarksWhere:folderID:orderBy:usingFilter:](self, "initWithBookmarksWhere:folderID:orderBy:usingFilter:", a3, 0x7FFFFFFFLL, a4, a5);
}

- (void)setInMemoryFilter:(id)a3
{
  objc_storeStrong((id *)&self->_inMemoryFilter, a3);
}

- (WebBookmarkListQuery)init
{

  return 0;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (!self->_customQuery)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; customQuery = %@; query = \"%@\"; orderBy = \"%@\"; titleWordPrefixes = %@>"),
    v5,
    self,
    v7,
    self->_query,
    self->_orderBy,
    self->_titleWordPrefixes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_filterBookmarks:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_titleWordPrefixes)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_inMemoryFilter)
      v7 = objc_opt_respondsToSelector();
    else
      v7 = 0;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (bookmarkMatchesFilter(v12, self->_titleWordPrefixesForInMemoryFiltering)
            && ((v7 & 1) == 0
             || -[WebBookmarkInMemoryChangeFilter shouldIncludeBookmarkAddedInMemory:](self->_inMemoryFilter, "shouldIncludeBookmarkAddedInMemory:", v12, (_QWORD)v14)))
          {
            objc_msgSend(v6, "addObject:", v12, (_QWORD)v14);
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)bookmarksInCollection:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5 skipDecodingSyncData:(BOOL)a6
{
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  unint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  NSString *orderBy;
  uint64_t v18;
  uint64_t v19;
  NSArray *titleWordPrefixes;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  int v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  unint64_t v37;
  int v38;
  int v39;
  WebBookmark *v40;
  sqlite3_stmt *v41;
  void *v42;
  void *v43;
  WebBookmark *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  unint64_t v64;
  int v65;
  unint64_t v67;
  BOOL v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  void *v72;
  char v73;
  void *v74;
  __CFString *v75;
  __CFString *v76;
  void *v77;
  char v78;
  uint64_t v79;
  int v80;
  unsigned int v81;
  _BOOL4 v82;
  unint64_t v83;
  unsigned int v84;
  int v85;
  void *v86;
  id v87;
  void *v88;
  _QWORD v89[4];
  id v90;
  WebBookmarkListQuery *v91;
  unint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[8];
  sqlite3_stmt *v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v82 = a6;
  v110 = *MEMORY[0x24BDAC8D0];
  v87 = a3;
  objc_msgSend(v87, "_inMemoryChangeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfReorderedBookmarksInBookmarkFolder:", self->_folderID);
  v81 = a4;
  v11 = objc_msgSend(v9, "folderHasReplaceChange:", self->_folderID);
  if (v10)
    v12 = 1;
  else
    v12 = v11;
  v80 = v12;
  v13 = -[WebBookmarkListQuery _listQueryType](self, "_listQueryType");
  if (v13 > 1)
  {
    v15 = &stru_24CB35168;
    v14 = &stru_24CB35168;
  }
  else
  {
    -[WebBookmarkListQuery _sqliteNotInConditionForInMemoryModifiedAndDeleted:bookmarksInFolder:collection:](self, "_sqliteNotInConditionForInMemoryModifiedAndDeleted:bookmarksInFolder:collection:", v80 ^ 1u, self->_folderID, v87);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkListQuery _sqliteInConditionForInMemoryModifiedBookmarksInFolder:collection:](self, "_sqliteInConditionForInMemoryModifiedBookmarksInFolder:collection:", self->_folderID, v87);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v75 = v14;
  v76 = v15;
  whereClauseWithAppendingINConditions(self->_query, &v15->isa, &v14->isa);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  orderBy = self->_orderBy;
  if (orderBy)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ ORDER BY %@"), v16, orderBy);
    v18 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v18;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ LIMIT ? OFFSET ?"), v16);
  v19 = objc_claimAutoreleasedReturnValue();
  v84 = a5;

  v77 = (void *)v19;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v105, (sqlite3_stmt *)objc_msgSend(v87, "_selectBookmarksWhere:", v19));
  titleWordPrefixes = self->_titleWordPrefixes;
  if (titleWordPrefixes)
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v21 = titleWordPrefixes;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v102;
      v24 = 1;
      do
      {
        v25 = 0;
        v26 = v24;
        do
        {
          if (*(_QWORD *)v102 != v23)
            objc_enumerationMutation(v21);
          sqlite3_bind_text(v106, v26 + v25, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v101 + 1) + 8 * v25)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          ++v25;
        }
        while (v22 != v25);
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
        v24 = v26 + v25;
      }
      while (v22);
      v27 = v26 + v25;
    }
    else
    {
      v27 = 1;
    }

    sqlite3_bind_text(v106, v27, -[NSString UTF8String](self->_urlFilter, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v28 = v27 + 1;
  }
  else
  {
    v28 = 1;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v81;
  v79 = v84 - v81 + 1;
  if (v13 > 1)
  {
    v78 = 0;
    v38 = v84 - v81 + 1;
  }
  else
  {
    v78 = objc_msgSend(v9, "bookmarkIsAddedInMemory:", self->_folderID);
    objc_msgSend(v9, "addedBookmarksInBookmarkFolder:", self->_folderID);
    v85 = v28;
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applyModificationsToBookmarks:", v74);
    v99 = 0u;
    v100 = 0u;
    v98 = 0u;
    v97 = 0u;
    v31 = v74;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v98 != v33)
            objc_enumerationMutation(v31);
          v35 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
          if ((objc_msgSend(v9, "replayChangesOnBookmark:", v35) & 0xFFFFFFFFFFFFFFFDLL) != 1
            && (v13 != 1 || bookmarkMatchesFilter(v35, self->_titleWordPrefixesForInMemoryFiltering))
            && (!self->_inMemoryFilter
             || (objc_opt_respondsToSelector() & 1) == 0
             || -[WebBookmarkInMemoryChangeFilter shouldIncludeBookmarkAddedInMemory:](self->_inMemoryFilter, "shouldIncludeBookmarkAddedInMemory:", v35)))
          {
            if (objc_msgSend(v35, "isFolder"))
              v36 = v88;
            else
              v36 = v29;
            objc_msgSend(v36, "addObject:", v35);
          }
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
      }
      while (v32);
    }

    v28 = v85;
    v37 = objc_msgSend(v88, "count");
    if (v80)
    {
      v30 = 0;
      v38 = -[WebBookmarkListQuery _childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:](self, "_childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:", v87, 0);
    }
    else if (v37 <= v81)
    {
      v30 = v81 - v37;
      v38 = v79;
    }
    else
    {
      v30 = 0;
      v38 = v79 + v81 - v37;
    }

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v78 & 1) != 0)
    goto LABEL_51;
  sqlite3_bind_int(v106, v28, v38);
  sqlite3_bind_int(v106, v28 + 1, v30);
  while (1)
  {
    v39 = sqlite3_step(v106);
    if (v39 != 100)
      break;
    v40 = [WebBookmark alloc];
    v41 = v106;
    objc_msgSend(v87, "currentDeviceIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "configuration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:skipDecodingSyncData:](v40, "initWithSQLiteStatement:deviceIdentifier:collectionType:skipDecodingSyncData:", v41, v42, objc_msgSend(v43, "collectionType"), v82);

    objc_msgSend(v86, "addObject:", v44);
  }
  if (v39 == 101)
  {
LABEL_51:
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v46 = v86;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v94;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v94 != v48)
            objc_enumerationMutation(v46);
          v50 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * j);
          if ((objc_msgSend(v9, "replayChangesOnBookmark:", v50) & 0xFFFFFFFFFFFFFFFDLL) != 1)
            objc_msgSend(v45, "addObject:", v50);
        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
      }
      while (v47);
    }

    v51 = v79;
    objc_msgSend(v9, "applyModificationsToBookmarks:", v45);
    if (v13 >= 2)
    {
      v55 = v45;
    }
    else if (v80)
    {
      objc_msgSend(v9, "bookmarksAfterReplayingChangesToBookmarks:inFolderWithID:", v46, self->_folderID);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = MEMORY[0x24BDAC760];
      v89[1] = 3221225472;
      v89[2] = __85__WebBookmarkListQuery_bookmarksInCollection_fromIndex_toIndex_skipDecodingSyncData___block_invoke;
      v89[3] = &unk_24CB32FD8;
      v90 = v9;
      v91 = self;
      v92 = v13;
      objc_msgSend(v52, "safari_filterObjectsUsingBlock:", v89);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v79 + (unint64_t)v81 >= objc_msgSend(v53, "count"))
      {
        v54 = v53;
      }
      else
      {
        objc_msgSend(v53, "subarrayWithRange:");
        v54 = (id)objc_claimAutoreleasedReturnValue();
      }
      v55 = v54;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v88, "count");
      if (v83 > v81 && (_DWORD)v79)
      {
        v56 = v81;
        do
        {
          objc_msgSend(v88, "objectAtIndexedSubscript:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v57);

          v58 = v51 - 1;
          if (++v56 >= v83)
            break;
          --v51;
        }
        while (v51);
      }
      else
      {
        v58 = v79;
      }
      v59 = objc_msgSend(v45, "count");
      if (v59 && v58)
      {
        v60 = 0;
        do
        {
          objc_msgSend(v45, "objectAtIndexedSubscript:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v61);

          v62 = v60 + 1;
          if (v60 + 1 >= v59)
            break;
        }
        while (v58 - 1 != v60++);
        v58 -= v62;
      }
      v64 = 0;
      if (!objc_msgSend(v45, "count") && v83 <= v81)
      {
        if ((v78 & 1) != 0)
          v65 = 0;
        else
          v65 = -[WebBookmarkListQuery _childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:](self, "_childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:", v87, 1);
        v67 = v83 + (v65 & ~(v65 >> 31));
        v68 = v81 >= v67;
        v69 = v81 - v67;
        if (v68)
          v64 = v69;
        else
          v64 = 0;
      }
      v70 = objc_msgSend(v29, "count");
      if (v64 < v70 && v58)
      {
        v71 = v58 - 1;
        do
        {
          objc_msgSend(v29, "objectAtIndexedSubscript:", v64);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v72);

          ++v64;
          v68 = v71-- != 0;
          v73 = v68;
        }
        while (v64 < v70 && (v73 & 1) != 0);
      }
    }

  }
  else
  {
    v55 = (id)MEMORY[0x24BDBD1A8];
  }

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v105);
  return v55;
}

uint64_t __85__WebBookmarkListQuery_bookmarksInCollection_fromIndex_toIndex_skipDecodingSyncData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "bookmarkIsAddedInMemory:", objc_msgSend(v3, "identifier"));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64)
    && (v4 & objc_opt_respondsToSelector()) == 1
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "shouldIncludeBookmarkAddedInMemory:", v3) & 1) == 0)
  {
    v5 = 0;
  }
  else if (*(_QWORD *)(a1 + 48) == 1)
  {
    v5 = bookmarkMatchesFilter(v3, *(void **)(*(_QWORD *)(a1 + 40) + 40));
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)_preparePrefixesFromNormalizedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *titleWordPrefixes;
  NSArray *v11;
  NSArray *titleWordPrefixesForInMemoryFiltering;
  NSArray *v13;
  id v14;
  _QWORD block[4];
  id v16;
  NSArray *v17;
  NSArray *v18;

  v4 = a3;
  if (-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::once != -1)
    dispatch_once(&-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::once, &__block_literal_global_13);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizerAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__WebBookmarkListQuery__preparePrefixesFromNormalizedString___block_invoke_2;
  block[3] = &unk_24CB316B8;
  v16 = v4;
  v8 = v6;
  v17 = v8;
  v9 = v5;
  v18 = v9;
  v14 = v4;
  dispatch_sync(v7, block);
  titleWordPrefixes = self->_titleWordPrefixes;
  self->_titleWordPrefixes = v9;
  v11 = v9;

  titleWordPrefixesForInMemoryFiltering = self->_titleWordPrefixesForInMemoryFiltering;
  self->_titleWordPrefixesForInMemoryFiltering = v8;
  v13 = v8;

}

void __61__WebBookmarkListQuery__preparePrefixesFromNormalizedString___block_invoke()
{
  WebBookmarkTitleWordTokenizer *v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_alloc_init(WebBookmarkTitleWordTokenizer);
  v1 = (void *)-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizer;
  -[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizer = (uint64_t)v0;

  v2 = dispatch_queue_create("com.apple.WebBookmarks.titleWordTokenizerAccess", 0);
  v3 = (void *)-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizerAccessQueue;
  -[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizerAccessQueue = (uint64_t)v2;

}

uint64_t __61__WebBookmarkListQuery__preparePrefixesFromNormalizedString___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizer, "setString:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend((id)-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizer, "advanceToNextToken");
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = result;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      v6 = *(void **)(a1 + 48);
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("*"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      result = objc_msgSend((id)-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizer, "advanceToNextToken");
      v4 = result;
    }
    while (result != 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (WebBookmarkInMemoryChangeFilter)inMemoryFilter
{
  return self->_inMemoryFilter;
}

- (void)_childCountInDatabaseForFolderFetchInCollection:(int *)a1 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:(NSObject *)a2 countShouldUseNumChildrenIfPossible:.cold.1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_211022000, a2, OS_LOG_TYPE_ERROR, "Retrying to fetch count without using num_children %i", (uint8_t *)v3, 8u);
}

- (void)_childCountInDatabaseForFolderFetchInCollection:(int *)a1 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:(int)a2 countShouldUseNumChildrenIfPossible:(os_log_t)log .cold.2(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_211022000, log, OS_LOG_TYPE_ERROR, "num_children for bookmark %i has an invalid value %i", (uint8_t *)v4, 0xEu);
}

@end
