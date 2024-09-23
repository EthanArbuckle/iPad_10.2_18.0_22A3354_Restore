@implementation WebBookmarkList

- (int)folderID
{
  return -[WebBookmarkListQuery folderID](self->_query, "folderID");
}

- (id)bookmarkArray
{
  unsigned int bookmarkCount;
  id v4;
  WebBookmarkList *shadowBookmarkList;
  NSMutableArray *bookmarks;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  bookmarkCount = self->_bookmarkCount;
  if (bookmarkCount)
  {
    v4 = -[WebBookmarkList bookmarkAtIndex:](self, "bookmarkAtIndex:", bookmarkCount - 1);
    shadowBookmarkList = self->_shadowBookmarkList;
    bookmarks = self->_bookmarks;
    if (!shadowBookmarkList)
    {
      v11 = (void *)-[NSMutableArray copy](bookmarks, "copy");
      return v11;
    }
    -[WebBookmarkList bookmarkArray](shadowBookmarkList, "bookmarkArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray arrayByAddingObjectsFromArray:](bookmarks, "arrayByAddingObjectsFromArray:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WebBookmarkList bookmarkArray](self->_shadowBookmarkList, "bookmarkArray");
    v9 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v9;
    v10 = (void *)MEMORY[0x24BDBD1A8];
    if (v9)
      v10 = (void *)v9;
    v8 = v10;
  }
  v11 = v8;

  return v11;
}

- (id)bookmarkAtIndex:(unsigned int)a3
{
  return -[WebBookmarkList _bookmarkAtIndex:paginate:skipDecodingSyncData:](self, "_bookmarkAtIndex:paginate:skipDecodingSyncData:", *(_QWORD *)&a3, 1, 0);
}

- (unsigned)bookmarkCount
{
  unsigned int v3;

  v3 = -[WebBookmarkList _primaryBookmarkCount](self, "_primaryBookmarkCount");
  return -[WebBookmarkList bookmarkCount](self->_shadowBookmarkList, "bookmarkCount") + v3;
}

- (unsigned)_primaryBookmarkCount
{
  return self->_bookmarkCount - self->_skipOffset;
}

- (WebBookmarkList)initWithQuery:(id)a3 skipOffset:(unsigned int)a4 collection:(id)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  WebBookmarkList *v14;
  NSMutableArray *v15;
  NSMutableArray *bookmarks;
  unsigned int v17;
  WebBookmarkList *v18;
  objc_super v20;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WebBookmarkList;
  v14 = -[WebBookmarkList init](&v20, sel_init);
  if (!v14)
    goto LABEL_4;
  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  bookmarks = v14->_bookmarks;
  v14->_bookmarks = v15;

  objc_storeStrong((id *)&v14->_query, a3);
  v14->_skipOffset = a4;
  objc_storeStrong((id *)&v14->_collection, a5);
  objc_storeStrong((id *)&v14->_queue, a6);
  v17 = -[WebBookmarkListQuery countInCollection:](v14->_query, "countInCollection:", v14->_collection);
  if (v17 == -1)
  {
LABEL_4:
    v18 = 0;
  }
  else
  {
    v14->_bookmarkCount = v17;
    v18 = v14;
  }

  return v18;
}

- (WebBookmarkList)initWithQuery:(id)a3 skipOffset:(unsigned int)a4 collection:(id)a5
{
  return -[WebBookmarkList initWithQuery:skipOffset:collection:queue:](self, "initWithQuery:skipOffset:collection:queue:", a3, *(_QWORD *)&a4, a5, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowBookmarkList, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
}

- (id)bookmarkAtIndex:(unsigned int)a3 skipDecodingSyncData:(BOOL)a4
{
  return -[WebBookmarkList _bookmarkAtIndex:paginate:skipDecodingSyncData:](self, "_bookmarkAtIndex:paginate:skipDecodingSyncData:", *(_QWORD *)&a3, 1, a4);
}

- (id)_bookmarkAtIndex:(unsigned int)a3 paginate:(BOOL)a4 skipDecodingSyncData:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  NSObject *queue;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v21[6];
  int v22;
  int v23;
  BOOL v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a5;
  v6 = a4;
  v9 = -[WebBookmarkList _primaryBookmarkCount](self, "_primaryBookmarkCount");
  v10 = a3 - v9;
  if (a3 < v9)
  {
    v11 = self->_skipOffset + a3;
    v12 = -[NSMutableArray count](self->_bookmarks, "count", v10);
    if (v11 >= v12)
    {
      v13 = v11;
      if (v6)
      {
        if (-[WebBookmarkListQuery isCustomQuery](self->_query, "isCustomQuery"))
          v14 = self->_bookmarkCount - 1;
        else
          v14 = v12 + 64;
        if (v11 <= v14)
          v13 = v14;
        else
          v13 = v11;
      }
      queue = self->_queue;
      if (queue)
      {
        *(_QWORD *)buf = 0;
        v26 = buf;
        v27 = 0x3032000000;
        v28 = __Block_byref_object_copy__3;
        v29 = __Block_byref_object_dispose__3;
        v30 = 0;
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __66__WebBookmarkList__bookmarkAtIndex_paginate_skipDecodingSyncData___block_invoke;
        v21[3] = &unk_24CB32E90;
        v21[4] = self;
        v21[5] = buf;
        v22 = v12;
        v23 = v13;
        v24 = v5;
        dispatch_sync(queue, v21);
        v17 = *((id *)v26 + 5);
        _Block_object_dispose(buf, 8);

        if (!v17)
          goto LABEL_21;
      }
      else
      {
        -[WebBookmarkListQuery bookmarksInCollection:fromIndex:toIndex:skipDecodingSyncData:](self->_query, "bookmarksInCollection:fromIndex:toIndex:skipDecodingSyncData:", self->_collection, v12, v13, v5);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_21;
      }
      ct_green_tea_logger_create_static();
      getCTGreenTeaOsLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211022000, v19, OS_LOG_TYPE_INFO, "Read Safari bookmarks", buf, 2u);
      }

      -[NSMutableArray addObjectsFromArray:](self->_bookmarks, "addObjectsFromArray:", v17);
    }
    if (-[NSMutableArray count](self->_bookmarks, "count") > (unint64_t)v11)
    {
      -[NSMutableArray objectAtIndex:](self->_bookmarks, "objectAtIndex:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      return v15;
    }
LABEL_21:
    v15 = 0;
    return v15;
  }
  -[WebBookmarkList _bookmarkAtIndex:paginate:skipDecodingSyncData:](self->_shadowBookmarkList, "_bookmarkAtIndex:paginate:skipDecodingSyncData:", v10, v6, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  return v15;
}

void __66__WebBookmarkList__bookmarkAtIndex_paginate_skipDecodingSyncData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "bookmarksInCollection:fromIndex:toIndex:skipDecodingSyncData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned __int8 *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)bookmarkArraySkippingDecodeSyncData
{
  unsigned int bookmarkCount;
  id v4;
  WebBookmarkList *shadowBookmarkList;
  NSMutableArray *bookmarks;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  bookmarkCount = self->_bookmarkCount;
  if (bookmarkCount)
  {
    v4 = -[WebBookmarkList bookmarkAtIndex:skipDecodingSyncData:](self, "bookmarkAtIndex:skipDecodingSyncData:", bookmarkCount - 1, 1);
    shadowBookmarkList = self->_shadowBookmarkList;
    bookmarks = self->_bookmarks;
    if (!shadowBookmarkList)
    {
      v11 = (void *)-[NSMutableArray copy](bookmarks, "copy");
      return v11;
    }
    -[WebBookmarkList bookmarkArraySkippingDecodeSyncData](shadowBookmarkList, "bookmarkArraySkippingDecodeSyncData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray arrayByAddingObjectsFromArray:](bookmarks, "arrayByAddingObjectsFromArray:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WebBookmarkList bookmarkArraySkippingDecodeSyncData](self->_shadowBookmarkList, "bookmarkArraySkippingDecodeSyncData");
    v9 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v9;
    v10 = (void *)MEMORY[0x24BDBD1A8];
    if (v9)
      v10 = (void *)v9;
    v8 = v10;
  }
  v11 = v8;

  return v11;
}

- (id)bookmarkArrayRequestingCount:(unsigned int)a3
{
  unsigned int bookmarkCount;
  unsigned int v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  if (!a3 || (bookmarkCount = self->_bookmarkCount) == 0)
  {
    -[WebBookmarkList bookmarkArrayRequestingCount:](self->_shadowBookmarkList, "bookmarkArrayRequestingCount:", *(_QWORD *)&a3);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = (void *)MEMORY[0x24BDBD1A8];
    if (v11)
      v13 = (void *)v11;
    v14 = v13;
    goto LABEL_12;
  }
  v6 = bookmarkCount - 1;
  if (v6 >= a3 - 1)
    v7 = a3 - 1;
  else
    v7 = v6;
  v8 = -[WebBookmarkList bookmarkAtIndex:](self, "bookmarkAtIndex:", v7);
  v9 = a3 - v7;
  if (a3 != (_DWORD)v7)
  {
    -[WebBookmarkList bookmarkArrayRequestingCount:](self->_shadowBookmarkList, "bookmarkArrayRequestingCount:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray arrayByAddingObjectsFromArray:](self->_bookmarks, "arrayByAddingObjectsFromArray:", v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v10 = v14;

    return v10;
  }
  v10 = (void *)-[NSMutableArray copy](self->_bookmarks, "copy", v9);
  return v10;
}

- (id)_arrayForDifferenceCalculation
{
  unint64_t v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = -[WebBookmarkList _primaryBookmarkCount](self, "_primaryBookmarkCount");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_bookmarks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "UUID", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count") < v3)
  {
    v11 = 0;
    do
    {
      v12 = v11 + 1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (_QWORD)v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v13);

      v14 = objc_msgSend(v4, "count");
      v11 = v12;
    }
    while (v14 < v3);
  }
  return v4;
}

- (void)_loadBookmarksForDifferenceFromList:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  id *v9;

  v9 = (id *)a3;
  if (v9)
  {
    v4 = -[WebBookmarkList _primaryBookmarkCount](self, "_primaryBookmarkCount");
    v5 = v4 - objc_msgSend(v9, "_primaryBookmarkCount");
    v6 = objc_msgSend(v9[1], "count");
    v7 = (v5 + v6) & ~((uint64_t)(v5 + v6) >> 63);
    if (v7 >= v4)
      v7 = v4;
    if (v7)
      v8 = -[WebBookmarkList _bookmarkAtIndex:paginate:skipDecodingSyncData:](self, "_bookmarkAtIndex:paginate:skipDecodingSyncData:", (v7 - 1), 0, 0);
  }

}

- (id)differenceFromList:(id)a3 withOptions:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if ((v4 & 1) != 0)
    -[WebBookmarkList _loadBookmarksForDifferenceFromList:](self, "_loadBookmarksForDifferenceFromList:", v6);
  -[WebBookmarkList _arrayForDifferenceCalculation](self, "_arrayForDifferenceCalculation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "_arrayForDifferenceCalculation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(v7, "differenceFromArray:withOptions:", v8, (2 * v4) & 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (WebBookmarkList)shadowBookmarkList
{
  return self->_shadowBookmarkList;
}

- (void)setShadowBookmarkList:(id)a3
{
  objc_storeStrong((id *)&self->_shadowBookmarkList, a3);
}

- (void)_moveBookmarkAtIndex:(unsigned int)a3 toIndex:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  void *v12;
  NSMutableArray *bookmarks;
  id v14;

  v4 = *(_QWORD *)&a4;
  -[WebBookmarkList bookmarkAtIndex:](self, "bookmarkAtIndex:");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkList bookmarkAtIndex:](self, "bookmarkAtIndex:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "orderIndex");

  if (v4 >= a3)
    v9 = a3;
  else
    v9 = v4;
  if (v4 <= a3)
    v10 = a3;
  else
    v10 = v4;
  if (v4 < a3)
    v11 = 1;
  else
    v11 = -1;
  do
  {
    -[WebBookmarkList bookmarkAtIndex:](self, "bookmarkAtIndex:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setOrderIndex:", objc_msgSend(v12, "orderIndex") + v11);

    v9 = (v9 + 1);
  }
  while (v9 <= v10);
  objc_msgSend(v14, "_setOrderIndex:", v8);
  objc_msgSend(v14, "markAttributesAsModified:", 4);
  bookmarks = self->_bookmarks;
  if (v4 >= a3)
  {
    -[NSMutableArray insertObject:atIndex:](bookmarks, "insertObject:atIndex:", v14, (v4 + 1));
  }
  else
  {
    -[NSMutableArray insertObject:atIndex:](bookmarks, "insertObject:atIndex:", v14, v4);
    ++a3;
  }
  -[NSMutableArray removeObjectAtIndex:](self->_bookmarks, "removeObjectAtIndex:", a3);

}

- (unsigned)_reverseOrderIndex:(unsigned int)a3
{
  return self->_bookmarkCount + ~a3;
}

@end
