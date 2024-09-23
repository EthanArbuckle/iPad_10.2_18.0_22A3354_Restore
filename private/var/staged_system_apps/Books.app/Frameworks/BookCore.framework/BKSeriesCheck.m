@implementation BKSeriesCheck

+ (id)insertSeriesCheckWithAdamId:(id)a3 intoManagedObjectContext:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BKSeriesCheck"), a4));
  objc_msgSend(v6, "setAdamId:", v5);

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKSeriesCheck"));
}

+ (id)predicateForSeriesCheckWithAdamIDsInList:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("adamId"), a3);
}

+ (id)adamIDsNeedingToBeCheckedFromAdamIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t buf[16];
  _BYTE v31[128];
  _QWORD v32[2];

  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BKSeriesCheck: Filtering Adam IDs that need updating", buf, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v5, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKSeriesCheck")));
    objc_msgSend(v8, "setFetchBatchSize:", 100);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesCheck predicateForSeriesCheckWithAdamIDsInList:](BKSeriesCheck, "predicateForSeriesCheckWithAdamIDsInList:", v5));
    objc_msgSend(v8, "setPredicate:", v9);

    objc_msgSend(v8, "setResultType:", 2);
    v32[0] = CFSTR("objectID");
    v32[1] = CFSTR("adamId");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
    objc_msgSend(v8, "setPropertiesToFetch:", v10);

    v29 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v8, &v29));
    v12 = v29;
    v13 = v12;
    if (v11)
    {
      v23 = v12;
      v24 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("adamId")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = v5;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v15, "containsObject:", v21) & 1) == 0)
              objc_msgSend(v7, "addObject:", v21);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v18);
      }

      v13 = v23;
      v6 = v24;
    }

  }
  return v7;
}

+ (void)recordAdamIDsAsChecked:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  id v45;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BKSeriesCheck: recordAdamIDsAsChecked: %@", buf, 0xCu);
  }
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_msgSend((id)objc_opt_class(a1), "fetchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v9, "setFetchBatchSize:", 100);
    v10 = objc_msgSend((id)objc_opt_class(a1), "predicateForSeriesCheckWithAdamIDsInList:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "setPredicate:", v11);

    v41 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v9, &v41));
    v13 = v41;
    v14 = v13;
    if (v12)
    {
      v30 = v13;
      v32 = v9;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v6));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v31 = v12;
      v17 = v12;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v38;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v38 != v20)
              objc_enumerationMutation(v17);
            v22 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v21);
            if ((objc_msgSend(v22, "isDeleted") & 1) == 0)
            {
              objc_msgSend(v22, "setDateChecked:", v16);
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "adamId"));
              objc_msgSend(v15, "removeObject:", v23);

            }
            v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v19);
      }

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v24 = v15;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v34;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v34 != v27)
              objc_enumerationMutation(v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesCheck insertSeriesCheckWithAdamId:intoManagedObjectContext:](BKSeriesCheck, "insertSeriesCheckWithAdamId:intoManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v28), v7));
            objc_msgSend(v29, "setDateChecked:", v16);

            v28 = (char *)v28 + 1;
          }
          while (v26 != v28);
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v26);
      }

      v12 = v31;
      v9 = v32;
      v14 = v30;
    }

  }
}

+ (BOOL)shouldRecheckAdamID:(id)a3 withIntervalInDays:(double)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  id v27;
  int v28;
  BOOL v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  id v39;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = v10;
    v12 = a4 * -86400.0;
    if (a4 < 0.0)
      v12 = a4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", v12));

    v14 = objc_msgSend((id)objc_opt_class(a1), "fetchRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_opt_class(a1);
    v39 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "predicateForSeriesCheckWithAdamIDsInList:", v17));
    objc_msgSend(v15, "setPredicate:", v18);

    v37 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v15, &v37));
    v20 = v37;
    if (v19)
    {
      if (objc_msgSend(v19, "count"))
      {
        v32 = v9;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v22)
        {
          v23 = v22;
          v31 = v20;
          v24 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(_QWORD *)v34 != v24)
                objc_enumerationMutation(v21);
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1)
                                                                                 + 8 * (_QWORD)i), "dateChecked", v31));
              v27 = objc_msgSend(v26, "compare:", v13);

              if (v27 == (id)-1)
              {
                v28 = 1;
                goto LABEL_18;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
            if (v23)
              continue;
            break;
          }
          v28 = 0;
LABEL_18:
          v20 = v31;
        }
        else
        {
          v28 = 0;
        }

        v9 = v32;
      }
      else
      {
        v28 = 1;
      }
    }
    else
    {
      v28 = 0;
    }

    v29 = v28 != 0;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

@end
