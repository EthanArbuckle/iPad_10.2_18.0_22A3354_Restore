@implementation BKUserSortOrderManager

+ (id)nextSortKeyForCollection:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "maxSortKey"));
  v4 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", (char *)objc_msgSend(v3, "longLongValue") + 10000);

  return v4;
}

+ (void)saveSortedBooksArray:(id)a3 inCollection:(id)a4 inLibrary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKUserSortOrderManager.m", 40, "+[BKUserSortOrderManager saveSortedBooksArray:inCollection:inLibrary:]", "[NSThread isMainThread]", CFSTR("only call from main thread"));
  v24 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("collection == %@"), v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v16), "collectionMembers"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "filteredSetUsingPredicate:", v10));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "anyObject"));

        if (v19)
          objc_msgSend(v11, "addObject:", v19);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  if (+[BKUserSortOrderManager resortDescendingSortKeyedObjects:](BKUserSortOrderManager, "resortDescendingSortKeyedObjects:", v11))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uiChildContext"));
    v21 = objc_msgSend(v20, "hasChanges");

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uiChildContext"));
      objc_msgSend(v22, "setSaveContext:", 2);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uiChildContext"));
      objc_msgSend(v23, "save:", 0);

    }
  }

}

+ (void)saveSortedCollectionsArray:(id)a3 inLibraryManager:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4CF70;
  v7[3] = &unk_C17B8;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("collectionID")));
  v5 = v9;
  v6 = v8;
  objc_msgSend(v6, "performNamed:workerQueueBlock:", CFSTR("saveSortedCollectionsArray"), v7);

}

+ (BOOL)resortAscendingSortKeyedObjects:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "reverseObjectEnumerator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  LOBYTE(v3) = +[BKUserSortOrderManager resortDescendingSortKeyedObjects:](BKUserSortOrderManager, "resortDescendingSortKeyedObjects:", v4);
  return (char)v3;
}

+ (void)resetDescendingSortKeyedObjects:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 10000 * (_QWORD)v4;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc((Class)NSNumber);
        v13 = objc_msgSend(v12, "initWithLongLong:", v8, (_QWORD)v14);
        objc_msgSend(v11, "setValue:forKey:", v13, CFSTR("sortKey"));
        v8 -= 10000;

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

+ (BOOL)resortDescendingSortKeyedObjects:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BYTE *v23;
  void *v24;
  _BYTE *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  NSObject *v36;
  char *v38;
  char v39;
  id v40;
  char *v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  int v45;

  v3 = a3;
  v41 = (char *)objc_msgSend(v3, "count");
  v38 = v41 - 1;
  if ((uint64_t)v41 >= 1)
  {
    v39 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 1;
    v40 = v3;
    while (1)
    {
      v9 = v7;
      v7 = v6;

      v6 = v5;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v4));

      if (v6)
      {
        if (!v7 || !v5)
        {
          if (!v5)
            goto LABEL_24;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("sortKey")));
          v15 = objc_msgSend(v14, "longLongValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("sortKey")));
          v17 = objc_msgSend(v16, "longLongValue");

          v18 = (uint64_t)v15 <= (uint64_t)v17;
          v3 = v40;
          if (!v18)
            goto LABEL_24;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("sortKey")));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)objc_msgSend(v19, "longLongValue") + 5000));
          v21 = v6;
LABEL_22:
          objc_msgSend(v21, "setValue:forKey:", v20, CFSTR("sortKey"), v38);

          goto LABEL_23;
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("sortKey")));
        v11 = objc_msgSend(v10, "longLongValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("sortKey")));
        v13 = objc_msgSend(v12, "longLongValue");

        if ((uint64_t)v11 <= (uint64_t)v13)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("sortKey")));
          v23 = objc_msgSend(v22, "longLongValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("sortKey")));
          v25 = objc_msgSend(v24, "longLongValue");
          v26 = v23 - v25;

          if (v23 - v25 < 2)
          {
            v3 = v40;
            if (v23 == v25 || v26 == 1)
            {
LABEL_25:

              v34 = v39;
              goto LABEL_27;
            }
            if (v38 != v4)
            {
              if (v26 > -2)
                goto LABEL_25;
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("sortKey")));
              v31 = (uint64_t)objc_msgSend(v30, "longLongValue");

              if (v31 <= -v26)
                goto LABEL_25;
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("sortKey")));
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)objc_msgSend(v32, "longLongValue") - ((unint64_t)-v26 >> 1)));
              objc_msgSend(v6, "setValue:forKey:", v33, CFSTR("sortKey"));

              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("sortKey")));
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)objc_msgSend(v19, "longLongValue") + v26));
              v21 = v5;
              goto LABEL_22;
            }
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("sortKey")));
            v29 = (uint64_t)objc_msgSend(v28, "longLongValue");

            if (v29 < 2)
              goto LABEL_25;
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (unint64_t)v29 >> 1));
            objc_msgSend(v5, "setValue:forKey:", v19, CFSTR("sortKey"));
          }
          else
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("sortKey")));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)objc_msgSend(v19, "longLongValue") + ((unint64_t)v26 >> 1)));
            objc_msgSend(v6, "setValue:forKey:", v27, CFSTR("sortKey"));

            v3 = v40;
          }
LABEL_23:

          v39 = 1;
          goto LABEL_24;
        }
        v3 = v40;
      }
LABEL_24:
      v8 = (uint64_t)++v4 < (uint64_t)v41;
      if (v41 == v4)
        goto LABEL_25;
    }
  }
  v34 = 0;
  v8 = 0;
LABEL_27:
  v35 = BKLibraryCollectionLog();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v43 = v34 & 1;
    v44 = 1024;
    v45 = v8;
    _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "SortOrderManager - changes: %{BOOL}d, collision: %{BOOL}d", buf, 0xEu);
  }

  if (v8)
  {
    +[BKUserSortOrderManager resetDescendingSortKeyedObjects:](BKUserSortOrderManager, "resetDescendingSortKeyedObjects:", v3);
    v34 = 1;
  }

  return v34 & 1;
}

@end
