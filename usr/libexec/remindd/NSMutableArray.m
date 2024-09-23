@implementation NSMutableArray

- (void)ic_addNonNilObject:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self, "addObject:");
}

- (void)ic_addObjectsFromNonNilArray:(id)a3
{
  if (a3)
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:");
}

- (void)ic_insertNonNilObject:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 < 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[REMLog utility](REMLog, "utility"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_1006825CC(a4, v8);

  }
  else if ((uint64_t)-[NSMutableArray count](self, "count") >= a4)
  {
    if (v6)
      -[NSMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v6, a4);
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[REMLog utility](REMLog, "utility"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_100682640(self, a4, v7);

  }
}

- (void)ic_removeRecordsWithSameCKRecordIDInRecords:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(CKRecord);
        v12 = REMDynamicCast(v11, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = v13;
        if (v13)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordName"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v16);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  v17 = objc_alloc_init((Class)NSMutableArray);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectEnumerator](self, "objectEnumerator"));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nextObject"));
  if (v19)
  {
    v20 = (void *)v19;
    do
    {
      v21 = objc_opt_class(CKRecord);
      v22 = REMDynamicCast(v21, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = v23;
      if (v23)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "recordID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "recordName"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v26));

        if (objc_msgSend(v25, "isEqual:", v27))
          objc_msgSend(v17, "addObject:", v24);

      }
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nextObject"));

      v20 = (void *)v28;
    }
    while (v28);
  }
  -[NSMutableArray removeObjectsInArray:](self, "removeObjectsInArray:", v17);

}

@end
