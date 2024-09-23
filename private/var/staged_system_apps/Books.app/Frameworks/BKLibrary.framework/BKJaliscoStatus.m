@implementation BKJaliscoStatus

+ (id)statusValueHidden
{
  return CFSTR("hidden");
}

+ (id)statusValueLocal
{
  return CFSTR("local");
}

+ (id)allStoreIdsForStatus:(id)a3 inMOC:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  _BYTE v46[128];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKJaliscoStatus"), v6));
    v9 = objc_alloc_init((Class)NSFetchRequest);
    objc_msgSend(v9, "setEntity:", v8);
    objc_msgSend(v9, "setPredicate:", v7);
    objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
    v39 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v9, &v39));
    v11 = (char *)v39;
    if (objc_msgSend(v10, "count"))
    {
      v31 = v11;
      v33 = v8;
      v34 = v7;
      v13 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v32 = v10;
      v14 = v10;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "status"));
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "storeId"));
            v22 = (void *)v21;
            if (v20)
              v23 = v21 == 0;
            else
              v23 = 1;
            if (!v23)
            {
              if (objc_msgSend(v20, "isEqualToString:", v5))
                -[NSObject addObject:](v13, "addObject:", v22);
              else
                -[NSObject removeObject:](v13, "removeObject:", v22);
            }

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
        }
        while (v16);
      }

      v24 = -[NSObject copy](v13, "copy");
      v8 = v33;
      v7 = v34;
      v11 = v31;
      v10 = v32;
    }
    else
    {
      if (!v11)
      {
        v24 = 0;
        goto LABEL_26;
      }
      v25 = BCIMLog(0, v12);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "+[BKJaliscoStatus allStoreIdsForStatus:inMOC:]";
        v42 = 2080;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKJaliscoStatus.m";
        v44 = 1024;
        v45 = 75;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v29 = BCIMLog(v27, v28);
      v13 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v11;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "@\"Fetch Error: %@\", buf, 0xCu);
      }
      v24 = 0;
    }

LABEL_26:
    goto LABEL_27;
  }
  v24 = 0;
LABEL_27:

  return v24;
}

+ (id)allHiddenStoreIds:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus statusValueHidden](BKJaliscoStatus, "statusValueHidden"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus allStoreIdsForStatus:inMOC:](BKJaliscoStatus, "allStoreIdsForStatus:inMOC:", v4, v3));

  return v5;
}

+ (id)allLocalStoreIds:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus statusValueLocal](BKJaliscoStatus, "statusValueLocal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus allStoreIdsForStatus:inMOC:](BKJaliscoStatus, "allStoreIdsForStatus:inMOC:", v4, v3));

  return v5;
}

+ (id)serializeAllStatus:(id)a3 inMOC:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  if (a4)
  {
    v5 = a4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("status"), a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKJaliscoStatus"), v5));
    v8 = objc_alloc_init((Class)NSFetchRequest);
    objc_msgSend(v8, "setEntity:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("storeId"), CFSTR("timeIntervalSinceReferenceDate"), 0));
    objc_msgSend(v8, "setPropertiesToFetch:", v9);

    objc_msgSend(v8, "setResultType:", 2);
    objc_msgSend(v8, "setPredicate:", v6);
    v21 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v8, &v21));

    v11 = (char *)v21;
    v13 = v11;
    if (!v10 && v11)
    {
      v14 = BCIMLog(v11, v12);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "+[BKJaliscoStatus serializeAllStatus:inMOC:]";
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKJaliscoStatus.m";
        v26 = 1024;
        v27 = 110;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v18 = BCIMLog(v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v13;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "@\"Fetch Error: %@\", buf, 0xCu);
      }

    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)serializeAllHidden:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus statusValueHidden](BKJaliscoStatus, "statusValueHidden"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus serializeAllStatus:inMOC:](BKJaliscoStatus, "serializeAllStatus:inMOC:", v4, v3));

  return v5;
}

+ (id)serializeAllLocal:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus statusValueLocal](BKJaliscoStatus, "statusValueLocal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus serializeAllStatus:inMOC:](BKJaliscoStatus, "serializeAllStatus:inMOC:", v4, v3));

  return v5;
}

+ (BOOL)addStatus:(id)a3 forStoreIds:(id)a4 inMOC:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  id v24;
  uint64_t v25;
  char v26;
  BOOL v27;
  char *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *j;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  _BYTE v77[128];
  _BYTE v78[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 && objc_msgSend(v7, "length") && objc_msgSend(v8, "count"))
  {
    v10 = objc_autoreleasePoolPush();
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v56, "timeIntervalSinceReferenceDate");
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("storeId"), v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKJaliscoStatus"), v9));
    v14 = objc_alloc_init((Class)NSFetchRequest);
    objc_msgSend(v14, "setEntity:", v13);
    objc_msgSend(v14, "setPredicate:", v12);
    objc_msgSend(v14, "setReturnsObjectsAsFaults:", 0);
    v70 = 0;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v14, &v70));
    v16 = v70;
    v55 = v14;
    if (v15)
    {
      v53 = v13;
      v54 = v16;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](v15, "valueForKey:", CFSTR("storeId")));
      v18 = objc_msgSend(v57, "count");
      v59 = v9;
      v51 = v10;
      if (v18 <= objc_msgSend(v8, "count"))
      {
        v26 = 0;
        v25 = (uint64_t)v57;
      }
      else
      {
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v19 = v15;
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(_QWORD *)v67 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(v9, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i));
            }
            v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
          }
          while (v21);
        }

        v65 = v54;
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v14, &v65));
        v24 = v65;

        v25 = objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](v15, "valueForKey:", CFSTR("storeId")));
        v26 = 1;
        v54 = v24;
      }
      v50 = v12;
      v49 = v15;
      v58 = (void *)v25;
      v36 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjects:forKeys:", v15, v25);
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v52 = v8;
      v37 = v8;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v62;
        do
        {
          for (j = 0; j != v39; j = (char *)j + 1)
          {
            if (*(_QWORD *)v62 != v40)
              objc_enumerationMutation(v37);
            v42 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", v42));
            v44 = v43;
            if (v43)
            {
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "status"));
              v46 = objc_msgSend(v45, "isEqualToString:", v7);

              if ((v46 & 1) != 0)
                goto LABEL_32;
              objc_msgSend(v44, "setStatus:", v7);
              objc_msgSend(v44, "setTimeIntervalSinceReferenceDate:", v60);
            }
            else
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BKJaliscoStatus"), v59));
              objc_msgSend(v47, "setStoreId:", v42);
              objc_msgSend(v47, "setStatus:", v7);
              objc_msgSend(v47, "setTimeIntervalSinceReferenceDate:", v60);

            }
            v26 = 1;
LABEL_32:

          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
        }
        while (v39);
      }

      v10 = v51;
      v8 = v52;
      v9 = v59;
      v31 = v56;
      v35 = v49;
      v12 = v50;
      v13 = v53;
      v28 = (char *)v54;
    }
    else
    {
      if (!v16)
      {
        v26 = 0;
        v31 = v56;
        goto LABEL_36;
      }
      v28 = (char *)v16;
      v29 = BCIMLog(v16, v17);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      v31 = v56;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v72 = "+[BKJaliscoStatus addStatus:forStoreIds:inMOC:]";
        v73 = 2080;
        v74 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKJaliscoStatus.m";
        v75 = 1024;
        v76 = 188;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v34 = BCIMLog(v32, v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v28;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "@\"Fetch Error: %@\", buf, 0xCu);
      }
      v26 = 0;
    }

LABEL_36:
    objc_autoreleasePoolPop(v10);
    v27 = v26 & 1;
    goto LABEL_37;
  }
  v27 = 0;
LABEL_37:

  return v27;
}

+ (BOOL)addLocal:(id)a3 inMOC:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus statusValueLocal](BKJaliscoStatus, "statusValueLocal"));
  v8 = +[BKJaliscoStatus addStatus:forStoreIds:inMOC:](BKJaliscoStatus, "addStatus:forStoreIds:inMOC:", v7, v6, v5);

  return v8;
}

+ (BOOL)addHidden:(id)a3 inMOC:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus statusValueHidden](BKJaliscoStatus, "statusValueHidden"));
  v8 = +[BKJaliscoStatus addStatus:forStoreIds:inMOC:](BKJaliscoStatus, "addStatus:forStoreIds:inMOC:", v7, v6, v5);

  return v8;
}

+ (BOOL)mergedSerializedStatus:(id)a3 summaries:(id)a4 inMOC:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  void *v35;
  BOOL v36;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id obj;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  _BYTE v56[128];

  v7 = a3;
  v8 = a4;
  v47 = a5;
  if (v47 && objc_msgSend(v7, "length") && objc_msgSend(v8, "count"))
  {
    v9 = objc_autoreleasePoolPush();
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("storeId")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("storeId"), v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKJaliscoStatus"), v47));
    v13 = objc_alloc_init((Class)NSFetchRequest);
    objc_msgSend(v13, "setEntity:", v12);
    objc_msgSend(v13, "setPredicate:", v11);
    objc_msgSend(v13, "setReturnsObjectsAsFaults:", 0);
    v55 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "executeFetchRequest:error:", v13, &v55));
    v15 = v55;
    v16 = v15;
    if (v14)
    {
      v39 = v15;
      v41 = v13;
      v42 = v12;
      v43 = v11;
      v44 = v10;
      v45 = v9;
      v40 = v14;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("storeId")));
      v17 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjects:forKeys:", v14, v38);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v46 = v8;
      obj = v8;
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      v18 = 0;
      if (!v50)
        goto LABEL_18;
      v19 = *(_QWORD *)v52;
      while (1)
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("storeId")));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("timeIntervalSinceReferenceDate")));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v22));
          v25 = v24;
          if (!v24)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BKJaliscoStatus"), v47));
            objc_msgSend(v35, "setStoreId:", v22);
            objc_msgSend(v35, "setStatus:", v7);
            objc_msgSend(v35, "setTimeIntervalSinceReferenceDate:", v23);

            goto LABEL_15;
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "status"));
          v27 = objc_msgSend(v26, "isEqualToString:", v7);

          if ((v27 & 1) == 0)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "timeIntervalSinceReferenceDate"));
            v49 = objc_msgSend(v28, "unsignedLongValue");
            v29 = v19;
            v30 = v18;
            v31 = v17;
            v32 = v7;
            v33 = objc_msgSend(v23, "unsignedLongValue");

            v34 = v49 >= v33;
            v7 = v32;
            v17 = v31;
            v18 = v30;
            v19 = v29;
            if (!v34)
            {
              objc_msgSend(v25, "setStatus:", v7);
              objc_msgSend(v25, "setTimeIntervalSinceReferenceDate:", v23);
LABEL_15:
              v18 = 1;
            }
          }

        }
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (!v50)
        {
LABEL_18:

          v9 = v45;
          v8 = v46;
          v11 = v43;
          v10 = v44;
          v13 = v41;
          v12 = v42;
          v16 = v39;
          v14 = v40;
          goto LABEL_23;
        }
      }
    }
    if (v15)
      NSLog(CFSTR("Fetch Error: %@"), v15);
    LOBYTE(v18) = 0;
LABEL_23:

    objc_autoreleasePoolPop(v9);
    v36 = v18 & 1;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

+ (BOOL)mergeSerializedLocal:(id)a3 inMOC:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus statusValueLocal](BKJaliscoStatus, "statusValueLocal"));
  v8 = +[BKJaliscoStatus mergedSerializedStatus:summaries:inMOC:](BKJaliscoStatus, "mergedSerializedStatus:summaries:inMOC:", v7, v6, v5);

  return v8;
}

+ (BOOL)mergeSerializedHidden:(id)a3 inMOC:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus statusValueHidden](BKJaliscoStatus, "statusValueHidden"));
  v8 = +[BKJaliscoStatus mergedSerializedStatus:summaries:inMOC:](BKJaliscoStatus, "mergedSerializedStatus:summaries:inMOC:", v7, v6, v5);

  return v8;
}

+ (BOOL)hasStatusValues:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v11;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKJaliscoStatus"), v3));
    v5 = objc_alloc_init((Class)NSFetchRequest);
    objc_msgSend(v5, "setEntity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
    objc_msgSend(v5, "setPredicate:", v6);

    v11 = 0;
    v7 = objc_msgSend(v3, "countForFetchRequest:error:", v5, &v11);

    v8 = v11;
    v9 = v8;
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (v8)
        NSLog(CFSTR("Fetch Error: %@"), v8);
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7 != 0;
}

+ (void)dsidChangeCleanup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];

  v3 = a3;
  if (v3)
  {
    v4 = objc_autoreleasePoolPush();
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKJaliscoStatus"), v3));
    v7 = objc_alloc_init((Class)NSFetchRequest);
    objc_msgSend(v7, "setEntity:", v6);
    objc_msgSend(v7, "setPredicate:", v5);
    v20 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v7, &v20));
    v9 = v20;
    if (objc_msgSend(v8, "count"))
    {
      v15 = v4;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14));
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v12);
      }

      v4 = v15;
    }

    objc_autoreleasePoolPop(v4);
  }

}

+ (BOOL)mergeLocalAssets:(id)a3 inMOC:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  unsigned __int8 v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id obj;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  int v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = objc_alloc_init((Class)NSMutableArray);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[BKJaliscoStatus allLocalStoreIds:](BKJaliscoStatus, "allLocalStoreIds:", v6));
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v72 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storeID"));
        if ((uint64_t)objc_msgSend(v15, "longLongValue") >= 1
          && (objc_msgSend(v61, "containsObject:", v15) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v15);
          objc_msgSend(v8, "addObject:", v14);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    v16 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKJaliscoStatus"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "statusValueLocal"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@ AND %K IN %@"), CFSTR("status"), v17, CFSTR("storeId"), v7));
    objc_msgSend(v16, "setPredicate:", v18);

    objc_msgSend(v16, "setReturnsObjectsAsFaults:", 0);
    v70 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v16, &v70));
    v20 = (char *)v70;
    v22 = v20;
    v58 = v9;
    if (v19)
    {
      v52 = v20;
      v54 = v16;
      v56 = v6;
      v57 = v8;
      v23 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v19, "count"));
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v53 = v19;
      v24 = v19;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(_QWORD *)v67 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)j);
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "storeId"));
            if (objc_msgSend(v30, "length"))
              -[NSObject setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v29, v30);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        }
        while (v26);
      }
      v55 = v7;

      v31 = objc_alloc_init((Class)NSMutableArray);
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      obj = v57;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v63;
        do
        {
          for (k = 0; k != v33; k = (char *)k + 1)
          {
            if (*(_QWORD *)v63 != v34)
              objc_enumerationMutation(obj);
            v36 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)k);
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "storeID"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v37));
            v39 = v38;
            if (v38)
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "timeIntervalSinceReferenceDate"));
              v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)objc_msgSend(v40, "longLongValue")));

              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dataSourceInsertionDate"));
              v43 = v42;
              if (!v42 || objc_msgSend(v42, "compare:", v41) == (char *)&dword_0 + 1)
                objc_msgSend(v31, "addObject:", v37);

            }
            else
            {
              objc_msgSend(v31, "addObject:", v37);
            }

          }
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
        }
        while (v33);
      }

      if (objc_msgSend(v31, "count"))
      {
        v6 = v56;
        v45 = objc_msgSend((id)objc_opt_class(a1, v44), "addLocal:inMOC:", v31, v56);
      }
      else
      {
        v45 = 0;
        v6 = v56;
      }
      v16 = v54;
      v7 = v55;
      v22 = v52;
      v19 = v53;

      v8 = v57;
    }
    else
    {
      v46 = BCIMLog(v20, v21);
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v76 = "+[BKJaliscoStatus mergeLocalAssets:inMOC:]";
        v77 = 2080;
        v78 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKJaliscoStatus.m";
        v79 = 1024;
        v80 = 392;
        _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v50 = BCIMLog(v48, v49);
      v23 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v76 = v22;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "@\"Failed to get jalico statuses {%@}\", buf, 0xCu);
      }
      v45 = 0;
    }

    v9 = v58;
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

@end
