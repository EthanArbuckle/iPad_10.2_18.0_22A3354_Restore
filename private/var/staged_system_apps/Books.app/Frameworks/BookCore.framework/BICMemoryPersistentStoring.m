@implementation BICMemoryPersistentStoring

- (BICMemoryPersistentStoring)initWithURL:(id)a3
{
  BICMemoryPersistentStoring *v3;
  uint64_t v4;
  NSMutableDictionary *imageSets;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BICMemoryPersistentStoring;
  v3 = -[BICMemoryPersistentStoring init](&v7, "init", a3);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    imageSets = v3->_imageSets;
    v3->_imageSets = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (id)imageSetForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)addNewImageSetWithIdentifier:(id)a3
{
  id v4;
  BICMemoryImageSet *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(BICMemoryImageSet);
  -[BICMemoryImageSet setIdentifier:](v5, "setIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v4);

  return v5;
}

- (id)addNewImageEntryToSet:(id)a3
{
  id v3;
  BICMemoryImageEntry *v4;

  v3 = a3;
  v4 = objc_alloc_init(BICMemoryImageEntry);
  objc_msgSend(v3, "addEntry:", v4);

  return v4;
}

- (void)performBlock:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)performBlockAndWait:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)deleteObject:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_opt_class(BICMemoryImageSet);
  v5 = BUDynamicCast(v4, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

  }
  v9 = objc_opt_class(BICMemoryImageEntry);
  v10 = BUDynamicCast(v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "deleteEntry");

}

- (id)fetchAllImageSets
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return v3;
}

- (id)fetchImageSetsWithIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
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
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets", (_QWORD)v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  return v14;
}

- (id)fetchImageSetsWithDescribedImages:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("identifier")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring fetchImageSetsWithIDs:](self, "fetchImageSetsWithIDs:", v4));

  return v5;
}

- (void)removeImageSets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)fetchToBeDeletedImageEntriesInLevelID:(signed __int16)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageEntries"));
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v18, "state") == 3 && objc_msgSend(v18, "level") == v3)
                objc_msgSend(v5, "addObject:", v18);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v15);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)fetchImageEntriesMatchingAddedEntries:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("entryLocation")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring fetchImageEntriesWithLocations:](self, "fetchImageEntriesWithLocations:", v4));

  return v5;
}

- (id)fetchImageEntriesWithLocations:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  void *v16;
  unsigned int v17;
  id obj;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  obj = v7;
  v21 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageEntries"));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "entryLocation"));
              v17 = objc_msgSend(v4, "containsObject:", v16);

              if (v17)
                objc_msgSend(v5, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v12);
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }

  return v5;
}

- (void)clean:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets"));
  objc_msgSend(v5, "removeAllObjects");

  v7 = objc_retainBlock(v4);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (int64_t)totalNumberOfImageSets
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (int64_t)totalNumberOfImageEntries
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryPersistentStoring imageSets](self, "imageSets", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "imageEntries"));
        v6 += (int64_t)objc_msgSend(v9, "count");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSMutableDictionary)imageSets
{
  return self->_imageSets;
}

- (void)setImageSets:(id)a3
{
  objc_storeStrong((id *)&self->_imageSets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSets, 0);
}

@end
