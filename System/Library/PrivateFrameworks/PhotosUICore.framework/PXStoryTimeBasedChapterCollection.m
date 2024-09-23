@implementation PXStoryTimeBasedChapterCollection

- (PXStoryTimeBasedChapterCollection)init
{
  return (PXStoryTimeBasedChapterCollection *)-[PXStoryTimeBasedChapterCollection _initWithChapters:usesAssetLocalCreationDates:](self, "_initWithChapters:usesAssetLocalCreationDates:", MEMORY[0x1E0C9AA60], 0);
}

- (PXStoryTimeBasedChapterCollection)initWithAssets:(id)a3 keyAsset:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  id v9;
  _PXStoryTimeBasedChapterCollectionConfiguration *v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _PXStoryTimeBasedAssetInfo *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  PXStoryTimeBasedChapterCollection *v43;
  _PXStoryTimeBasedChapterCollectionConfiguration *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id obj;
  id obja;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(_PXStoryTimeBasedChapterCollectionConfiguration);
  v47 = v9;
  (*((void (**)(id, _PXStoryTimeBasedChapterCollectionConfiguration *))v9 + 2))(v9, v10);
  -[_PXStoryTimeBasedChapterCollectionConfiguration chapters](v10, "chapters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(obj, "sortedArrayUsingComparator:", &__block_literal_global_26238);
  v45 = v10;
  v12 = -[_PXStoryTimeBasedChapterCollectionConfiguration usesAssetLocalCreationDates](v10, "usesAssetLocalCreationDates");
  v13 = objc_msgSend(v7, "count");
  v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (v13 <= 1)
    v15 = 1;
  else
    v15 = v13;
  v16 = (void *)objc_msgSend(v14, "initWithCapacity:", v15);
  v48 = v8;
  objc_msgSend(v8, "uuid");
  v17 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v17;
  if (v13 >= 1)
  {
    v18 = (void *)v17;
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _DateForAsset(v20, v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v21 && v22 && (objc_msgSend(v22, "isEqualToString:", v18) & 1) == 0)
      {
        v24 = -[_PXStoryTimeBasedAssetInfo initWithDate:uuid:]([_PXStoryTimeBasedAssetInfo alloc], "initWithDate:uuid:", v21, v23);
        objc_msgSend(v16, "addObject:", v24);

        v18 = v50;
      }

    }
  }
  v49 = v7;
  objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_4_26239);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obja = obj;
  v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v56;
    v28 = MEMORY[0x1E0C809B0];
    do
    {
      v29 = 0;
      v51 = v26;
      do
      {
        if (*(_QWORD *)v56 != v27)
          objc_enumerationMutation(obja);
        v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v29);
        objc_msgSend(v30, "extendedDateIntervalForComparisonWithAssetDates");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "startDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "count");
        v33 = v16;
        v54 = v33;
        v34 = v32;
        v35 = PXFirstIndexInSortedRangePassingTest();
        if (v35 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v36 = v16;
          v37 = v27;
          v38 = v28;
          objc_msgSend(v33, "objectAtIndexedSubscript:", v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "date");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v31, "containsDate:", v40);

          if (v41)
          {
            objc_msgSend(v39, "uuid");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setFirstAssetLocalIdentifier:", v42);

          }
          v28 = v38;
          v27 = v37;
          v16 = v36;
          v26 = v51;
        }

        ++v29;
      }
      while (v26 != v29);
      v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v26);
  }

  v43 = -[PXStoryTimeBasedChapterCollection _initWithChapters:usesAssetLocalCreationDates:](self, "_initWithChapters:usesAssetLocalCreationDates:", obja, -[_PXStoryTimeBasedChapterCollectionConfiguration usesAssetLocalCreationDates](v45, "usesAssetLocalCreationDates"));
  return v43;
}

- (id)_initWithChapters:(id)a3 usesAssetLocalCreationDates:(BOOL)a4
{
  id v6;
  PXStoryTimeBasedChapterCollection *v7;
  uint64_t v8;
  NSArray *chapters;
  id v10;
  id v11;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  NSDictionary *chapterIndexesByIdentifier;
  uint64_t v17;
  NSSet *chapterBeginningAssetLocalIdentifiers;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  id v24;
  id v25;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PXStoryTimeBasedChapterCollection;
  v7 = -[PXStoryTimeBasedChapterCollection init](&v26, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    chapters = v7->_chapters;
    v7->_chapters = (NSArray *)v8;

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v12 = v7->_chapters;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __83__PXStoryTimeBasedChapterCollection__initWithChapters_usesAssetLocalCreationDates___block_invoke;
    v23 = &unk_1E511A610;
    v24 = v10;
    v25 = v11;
    v13 = v11;
    v14 = v10;
    -[NSArray enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", &v20);
    v15 = objc_msgSend(v14, "copy", v20, v21, v22, v23);
    chapterIndexesByIdentifier = v7->_chapterIndexesByIdentifier;
    v7->_chapterIndexesByIdentifier = (NSDictionary *)v15;

    v17 = objc_msgSend(v13, "copy");
    chapterBeginningAssetLocalIdentifiers = v7->_chapterBeginningAssetLocalIdentifiers;
    v7->_chapterBeginningAssetLocalIdentifiers = (NSSet *)v17;

    v7->_usesAssetLocalCreationDates = a4;
  }

  return v7;
}

- (void)enumerateChaptersUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXStoryTimeBasedChapterCollection chapters](self, "chapters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PXStoryTimeBasedChapterCollection_enumerateChaptersUsingBlock___block_invoke;
  v7[3] = &unk_1E511A638;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (id)_dateForAsset:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[PXStoryTimeBasedChapterCollection usesAssetLocalCreationDates](self, "usesAssetLocalCreationDates"))
    objc_msgSend(v4, "localCreationDate");
  else
    objc_msgSend(v4, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfChapters
{
  void *v2;
  int64_t v3;

  -[PXStoryTimeBasedChapterCollection chapters](self, "chapters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)chapterAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXStoryTimeBasedChapterCollection chapters](self, "chapters");
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
  -[PXStoryTimeBasedChapterCollection chapterIndexesByIdentifier](self, "chapterIndexesByIdentifier");
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
  -[PXStoryTimeBasedChapterCollection chapterBeginningAssetLocalIdentifiers](self, "chapterBeginningAssetLocalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (id)chapterContainingAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _DateForAsset(v4, -[PXStoryTimeBasedChapterCollection usesAssetLocalCreationDates](self, "usesAssetLocalCreationDates"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PXStoryTimeBasedChapterCollection chapters](self, "chapters", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "extendedDateIntervalForComparisonWithAssetDates");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsDate:", v5);

          if (v12)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canApplyEdits:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void (**v9)(void *, void *);
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id obj;
  _QWORD aBlock[7];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__26225;
  v30 = __Block_byref_object_dispose__26226;
  v31 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__PXStoryTimeBasedChapterCollection_canApplyEdits_error___block_invoke;
        aBlock[3] = &unk_1E511A660;
        aBlock[4] = self;
        aBlock[5] = &v26;
        aBlock[6] = &v32;
        v9 = (void (**)(void *, void *))_Block_copy(aBlock);
        v10 = objc_msgSend(v8, "kind");
        if (v10)
        {
          if (v10 == 1)
          {
            v13 = v8;
            objc_msgSend(v13, "editedChapterIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v9[2](v9, v14);

          }
          else if (v10 == 3)
          {
            v11 = v8;
            objc_msgSend(v11, "deletedChapterIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v9[2](v9, v12);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXStoryChapterErrorDomain"), 1, 0);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v27[5];
          v27[5] = v15;

          *((_BYTE *)v33 + 24) = 0;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
    }
    while (v5);
  }

  if (a4)
    *a4 = objc_retainAutorelease((id)v27[5]);
  v17 = *((_BYTE *)v33 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v17;
}

- (id)copyByApplyingEdits:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t (**v13)(void *, void *);
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  id v20;
  void *v21;
  void *v22;
  _PXStoryTimeBasedChapter *v23;
  unint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void (**v30)(_QWORD, _QWORD);
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v50;
  SEL v51;
  PXStoryTimeBasedChapterCollection *v52;
  void *v53;
  id v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t (**v67)(void *, void *);
  id obj;
  void *v69;
  void *v70;
  uint64_t v71;
  _QWORD aBlock[4];
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;

  v51 = a2;
  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryTimeBasedChapterCollection chapters](self, "chapters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v52 = self;
  v56 = -[PXStoryTimeBasedChapterCollection usesAssetLocalCreationDates](self, "usesAssetLocalCreationDates");
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (v7)
  {
    v8 = v7;
    v71 = *(_QWORD *)v75;
    v9 = 0x1E0CB3000uLL;
    v55 = v6;
    do
    {
      v10 = 0;
      v65 = v8;
      do
      {
        if (*(_QWORD *)v75 != v71)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v10);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__PXStoryTimeBasedChapterCollection_copyByApplyingEdits___block_invoke;
        aBlock[3] = &unk_1E511A6B0;
        v12 = v6;
        v73 = v12;
        v13 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
        switch(objc_msgSend(v11, "kind"))
        {
          case 0:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", v51, v52, CFSTR("PXStoryTimeBasedChapterCollection.m"), 218, CFSTR("Code which should be unreachable has been reached"));

            abort();
          case 1:
            v14 = v11;
            objc_msgSend(v14, "editedChapterIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v13[2](v13, v15);

            v9 = 0x1E0CB3000;
            if (v16 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = (void *)objc_msgSend(v17, "copy");

              v9 = 0x1E0CB3000;
              objc_msgSend(v14, "chapterChangeRequest");
              v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v19)[2](v19, v18);

              objc_msgSend(v12, "setObject:atIndexedSubscript:", v18, v16);
              v8 = v65;
            }
            goto LABEL_16;
          case 2:
            v67 = v13;
            v20 = v11;
            objc_msgSend(v20, "firstAsset");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            _DateForAsset(v21, v56);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = [_PXStoryTimeBasedChapter alloc];
            v24 = v9;
            v25 = objc_alloc(*(Class *)(v9 + 1416));
            objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v22;
            v27 = (void *)objc_msgSend(v25, "initWithStartDate:endDate:", v22, v26);
            v66 = v21;
            objc_msgSend(v21, "uuid");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[_PXStoryTimeBasedChapter initWithDateInterval:firstAssetLocalIdentifier:](v23, "initWithDateInterval:firstAssetLocalIdentifier:", v27, v28);

            objc_msgSend(v20, "chapterConfiguration");
            v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v30[2](v30, v29);

            v69 = (void *)v29;
            v31 = objc_msgSend(v12, "indexOfObject:inSortedRange:options:usingComparator:", v29, 0, objc_msgSend(v12, "count"), 1024, &__block_literal_global_25);
            if (v31 >= 1)
            {
              v63 = v31 - 1;
              objc_msgSend(v12, "objectAtIndexedSubscript:", v31 - 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)objc_msgSend(v32, "copy");

              v59 = objc_alloc(*(Class *)(v24 + 1416));
              objc_msgSend(v33, "dateInterval");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "startDate");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "dateByAddingTimeInterval:", -1.0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "dateInterval");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "endDate");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "earlierDate:", v36);
              v37 = v31;
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)objc_msgSend(v59, "initWithStartDate:endDate:", v57, v38);
              objc_msgSend(v33, "setDateInterval:", v39);

              v31 = v37;
              objc_msgSend(v12, "setObject:atIndexedSubscript:", v33, v63);

            }
            if (v31 < (unint64_t)objc_msgSend(v12, "count", v51))
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", v31);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v69, "dateInterval");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "startDate");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "dateInterval");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "startDate");
              v64 = v31;
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "dateByAddingTimeInterval:", -1.0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "dateInterval");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "endDate");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "earlierDate:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = (void *)objc_msgSend(v54, "initWithStartDate:endDate:", v53, v44);
              objc_msgSend(v69, "setDateInterval:", v45);

              v31 = v64;
            }
            objc_msgSend(v12, "insertObject:atIndex:", v69, v31);

            v6 = v55;
            v8 = v65;
            v9 = 0x1E0CB3000;
            v13 = v67;
            goto LABEL_16;
          case 3:
            objc_msgSend(v11, "deletedChapterIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v13[2](v13, v46);

            if (v47 != 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v12, "removeObjectAtIndex:", v47);
LABEL_16:

            break;
          default:
            break;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    }
    while (v8);
  }

  v48 = -[PXStoryTimeBasedChapterCollection _initWithChapters:usesAssetLocalCreationDates:]([PXStoryTimeBasedChapterCollection alloc], "_initWithChapters:usesAssetLocalCreationDates:", v6, v56);
  return v48;
}

- (BOOL)usesAssetLocalCreationDates
{
  return self->_usesAssetLocalCreationDates;
}

- (NSArray)chapters
{
  return self->_chapters;
}

- (NSDictionary)chapterIndexesByIdentifier
{
  return self->_chapterIndexesByIdentifier;
}

- (NSSet)chapterBeginningAssetLocalIdentifiers
{
  return self->_chapterBeginningAssetLocalIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterBeginningAssetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_chapterIndexesByIdentifier, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
}

uint64_t __57__PXStoryTimeBasedChapterCollection_copyByApplyingEdits___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PXStoryTimeBasedChapterCollection_copyByApplyingEdits___block_invoke_2;
  v8[3] = &unk_1E511A688;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8);

  return v6;
}

uint64_t __57__PXStoryTimeBasedChapterCollection_copyByApplyingEdits___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareStartDateTo:");
}

uint64_t __57__PXStoryTimeBasedChapterCollection_copyByApplyingEdits___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __57__PXStoryTimeBasedChapterCollection_canApplyEdits_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "chapterIndexesByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2938];
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ has no chapter with identifier %@"), *(_QWORD *)(a1 + 32), v3);
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("PXStoryChapterErrorDomain"), 2, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void __65__PXStoryTimeBasedChapterCollection_enumerateChaptersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "dateInterval");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v5 + 16))(v5, v6, v7, a4);

}

void __83__PXStoryTimeBasedChapterCollection__initWithChapters_usesAssetLocalCreationDates___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  objc_msgSend(v6, "firstAssetLocalIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    v10 = v11;
  }

}

BOOL __75__PXStoryTimeBasedChapterCollection_initWithAssets_keyAsset_configuration___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 40)) != -1;

  return v5;
}

uint64_t __75__PXStoryTimeBasedChapterCollection_initWithAssets_keyAsset_configuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __75__PXStoryTimeBasedChapterCollection_initWithAssets_keyAsset_configuration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareStartDateTo:");
}

@end
