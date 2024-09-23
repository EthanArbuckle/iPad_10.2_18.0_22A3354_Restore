@implementation PXStoryExplicitChapterCollection

- (PXStoryExplicitChapterCollection)initWithAssets:(id)a3 configuration:(id)a4
{
  id v7;
  void (**v8)(id, PXStoryExplicitChapterCollection *);
  PXStoryExplicitChapterCollection *v9;
  NSMutableArray *v10;
  NSMutableArray *initializedChapters;
  id v12;
  id v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSArray *chapters;
  uint64_t v19;
  NSDictionary *chapterIndexesByIdentifier;
  uint64_t v21;
  NSSet *chapterBeginningAssetlocalIdentifiers;
  NSMutableArray *v23;
  PXDisplayAssetFetchResult *initializedAssets;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, uint64_t);
  void *v29;
  id v30;
  id v31;

  v7 = a3;
  v8 = (void (**)(id, PXStoryExplicitChapterCollection *))a4;
  v9 = -[PXStoryExplicitChapterCollection init](self, "init");
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    initializedChapters = v9->_initializedChapters;
    v9->_initializedChapters = v10;

    objc_storeStrong((id *)&v9->_initializedAssets, a3);
    v8[2](v8, v9);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = v9->_initializedChapters;
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __65__PXStoryExplicitChapterCollection_initWithAssets_configuration___block_invoke;
    v29 = &unk_1E513CF90;
    v30 = v12;
    v31 = v13;
    v15 = v13;
    v16 = v12;
    -[NSMutableArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", &v26);
    v17 = -[NSMutableArray copy](v9->_initializedChapters, "copy", v26, v27, v28, v29);
    chapters = v9->_chapters;
    v9->_chapters = (NSArray *)v17;

    v19 = objc_msgSend(v15, "copy");
    chapterIndexesByIdentifier = v9->_chapterIndexesByIdentifier;
    v9->_chapterIndexesByIdentifier = (NSDictionary *)v19;

    v21 = objc_msgSend(v16, "copy");
    chapterBeginningAssetlocalIdentifiers = v9->_chapterBeginningAssetlocalIdentifiers;
    v9->_chapterBeginningAssetlocalIdentifiers = (NSSet *)v21;

    v23 = v9->_initializedChapters;
    v9->_initializedChapters = 0;

    initializedAssets = v9->_initializedAssets;
    v9->_initializedAssets = 0;

  }
  return v9;
}

- (void)addChapterWithAssetRange:(_NSRange)a3 configuration:(id)a4
{
  NSUInteger length;
  int64_t location;
  id v7;
  id v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  length = a3.length;
  location = a3.location;
  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (location < (uint64_t)(location + length))
  {
    *(_QWORD *)&v9 = 138412290;
    v15 = v9;
    do
    {
      -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_initializedAssets, "objectAtIndexedSubscript:", location, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_initializedAssets, "objectAtIndexedSubscript:", location);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v8, "addObject:", v12);
      }
      else
      {
        PXAssertGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v15;
          v17 = v10;
          _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "missing uuid for %@", buf, 0xCu);
        }

      }
      ++location;
      --length;
    }
    while (length);
  }
  if (objc_msgSend(v8, "count"))
  {
    v14 = (void *)objc_msgSend(v8, "copy");
    -[PXStoryExplicitChapterCollection addChapterWithAssetUUIDs:configuration:](self, "addChapterWithAssetUUIDs:configuration:", v14, v7);

  }
}

- (void)addChapterWithAssetUUIDs:(id)a3 configuration:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  _PXStoryExplicitChapter *v9;
  void *v10;
  _PXStoryExplicitChapter *v11;
  NSObject *v12;
  __int16 v13[8];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
    v9 = [_PXStoryExplicitChapter alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_PXStoryExplicitChapter initWithFirstAssetUUID:assetUUIDs:](v9, "initWithFirstAssetUUID:assetUUIDs:", v10, v8);

    v7[2](v7, v11);
    -[NSMutableArray addObject:](self->_initializedChapters, "addObject:", v11);

  }
  else
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13[0] = 0;
      _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Empty assetUUIDs, unable to proceed in adding a chapter", (uint8_t *)v13, 2u);
    }

  }
}

- (int64_t)numberOfChapters
{
  void *v2;
  int64_t v3;

  -[PXStoryExplicitChapterCollection chapters](self, "chapters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)chapterAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXStoryExplicitChapterCollection chapters](self, "chapters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)indexOfChapterWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[PXStoryExplicitChapterCollection chapterIndexesByIdentifier](self, "chapterIndexesByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (BOOL)containsChapterBeginningWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXStoryExplicitChapterCollection chapterBeginningAssetlocalIdentifiers](self, "chapterBeginningAssetlocalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (id)chapterContainingAsset:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[PXStoryExplicitChapterCollection chapters](self, "chapters", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "assetUUIDs");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "containsObject:", v4);

          if (v11)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)chapters
{
  return self->_chapters;
}

- (NSDictionary)chapterIndexesByIdentifier
{
  return self->_chapterIndexesByIdentifier;
}

- (NSSet)chapterBeginningAssetlocalIdentifiers
{
  return self->_chapterBeginningAssetlocalIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterBeginningAssetlocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_chapterIndexesByIdentifier, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_initializedAssets, 0);
  objc_storeStrong((id *)&self->_initializedChapters, 0);
}

void __65__PXStoryExplicitChapterCollection_initWithAssets_configuration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  objc_msgSend(v5, "firstAssetUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);
}

@end
