@implementation NSManagedObject

+ (id)ic_objectFromObjectID:(id)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  v6 = a3;
  v8 = a4;
  if (v6)
  {
    v9 = objc_opt_class(a1, v7);
    v24 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "existingObjectWithID:error:", v6, &v24));
    v11 = v24;
    v12 = REMCheckedDynamicCast(v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v11)
    {
      v14 = -[NSObject code](v11, "code");
      v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      if (v14 == (id)133000)
      {
        if (v16)
          sub_10067E9DC((uint64_t)v6, v15, v17, v18, v19, v20, v21, v22);
      }
      else if (v16)
      {
        sub_10067EA40();
      }

    }
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_10067E948(v11);
    v13 = 0;
  }

  return v13;
}

+ (id)ic_objectsFromObjectIDs:(id)a3 context:(id)a4
{
  return objc_msgSend(a1, "ic_objectsFromObjectIDs:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", a3, 0, 0, a4);
}

+ (id)ic_objectIDsFromObjects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "objectID", (_QWORD)v12));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)ic_permanentObjectIDsFromObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_objectsPassingTest:", &stru_1007D98C0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
    v19 = 0;
    v8 = objc_msgSend(v7, "obtainPermanentIDsForObjects:error:", v6, &v19);
    v9 = v19;

    if ((v8 & 1) == 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10067EAAC((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ic_objectIDsFromObjects:", v4));

  return v17;
}

- (BOOL)ic_obtainPermanentObjectIDIfNecessary
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  id v11;
  NSManagedObject *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObject objectID](self, "objectID"));
  v4 = objc_msgSend(v3, "isTemporaryID");

  if (!v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObject managedObjectContext](self, "managedObjectContext"));
  v12 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v11 = 0;
  v7 = objc_msgSend(v5, "obtainPermanentIDsForObjects:error:", v6, &v11);
  v8 = v11;

  if ((v7 & 1) == 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10067EB10((uint64_t)self, (uint64_t)v8, v9);

  }
  return v7;
}

- (id)ic_permanentObjectID
{
  -[NSManagedObject ic_obtainPermanentObjectIDIfNecessary](self, "ic_obtainPermanentObjectIDIfNecessary");
  return -[NSManagedObject objectID](self, "objectID");
}

- (void)ic_postNotificationOnMainThreadWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObject managedObjectContext](self, "managedObjectContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100059FB0;
  v7[3] = &unk_1007D7BF0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (id)ic_postNotificationOnMainThreadAfterSaveWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v15 = 0;
  v16 = (id *)&v15;
  v17 = 0x3042000000;
  v18 = sub_10005A240;
  v19 = sub_10005A24C;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObject managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005A254;
  v11[3] = &unk_1007D98E8;
  objc_copyWeak(&v14, &location);
  v7 = v4;
  v12 = v7;
  v13 = &v15;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", NSManagedObjectContextDidSaveObjectIDsNotification, v6, 0, v11));
  objc_storeWeak(v16 + 5, v8);

  WeakRetained = objc_loadWeakRetained(v16 + 5);
  _Block_object_dispose(&v15, 8);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return WeakRetained;
}

+ (id)ic_resultsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 resultType:(unint64_t)a5 fetchBatchSize:(unint64_t)a6 propertiesToFetch:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 context:(id)a9
{
  return objc_msgSend(a1, "_ic_resultsMatchingPredicate:sortDescriptors:resultType:fetchBatchSize:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", a3, a4, a5, a6, a7, a8);
}

+ (id)ic_objectsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 context:(id)a5
{
  return objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", a3, a4, 0, 0, a5);
}

+ (id)ic_objectsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 propertiesToFetch:(id)a5 relationshipKeyPathsForPrefetching:(id)a6 context:(id)a7
{
  return objc_msgSend(a1, "ic_resultsMatchingPredicate:sortDescriptors:resultType:fetchBatchSize:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", a3, a4, 0, 0, a5, a6, a7);
}

+ (id)ic_objectsMatchingPredicate:(id)a3 context:(id)a4
{
  return _objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", a3, 0, a4);
}

+ (id)ic_objectIDsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 context:(id)a5
{
  return objc_msgSend(a1, "ic_resultsMatchingPredicate:sortDescriptors:resultType:fetchBatchSize:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", a3, a4, 1, 0, 0, 0, a5);
}

+ (id)ic_objectIDsMatchingPredicate:(id)a3 context:(id)a4
{
  return _objc_msgSend(a1, "ic_objectIDsMatchingPredicate:sortDescriptors:context:", a3, 0, a4);
}

+ (id)ic_dictionariesMatchingPredicate:(id)a3 propertiesToFetch:(id)a4 context:(id)a5
{
  return objc_msgSend(a1, "ic_resultsMatchingPredicate:sortDescriptors:resultType:fetchBatchSize:propertiesToFetch:relationshipKeyPathsForPrefetching:context:", a3, 0, 2, 0, a4, 0, a5);
}

+ (id)_ic_objectsFromObjectIDs:(id)a3 propertiesToFetch:(id)a4 relationshipKeyPathsForPrefetching:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v22;
  id v23;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));

  if (!v15)
  {
    v22 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      sub_10067F93C(v22);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", v15));
  objc_msgSend(v16, "setIncludesSubentities:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF in %@"), v10));
  objc_msgSend(v16, "setPredicate:", v17);

  objc_msgSend(v16, "setPropertiesToFetch:", v13);
  objc_msgSend(v16, "setRelationshipKeyPathsForPrefetching:", v12);

  v23 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeFetchRequest:error:", v16, &v23));

  v19 = v23;
  if (v19)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10067F8A4(v10, (uint64_t)v19, v20);

  }
  return v18;
}

+ (id)_ic_resultsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 resultType:(unint64_t)a5 fetchBatchSize:(unint64_t)a6 propertiesToFetch:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 context:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_10005FA0C;
  v38 = sub_10005FA1C;
  v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequest"));
  v20 = (void *)v35[5];
  if (!v20)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10005FA24;
    v33[3] = &unk_1007D9A50;
    v33[4] = &v34;
    v33[5] = a1;
    objc_msgSend(v19, "performBlockAndWait:", v33);
    v20 = (void *)v35[5];
  }
  objc_msgSend(v20, "setPredicate:", v15);
  objc_msgSend((id)v35[5], "setResultType:", a5);
  objc_msgSend((id)v35[5], "setFetchBatchSize:", a6);
  objc_msgSend((id)v35[5], "setSortDescriptors:", v16);
  objc_msgSend((id)v35[5], "setRelationshipKeyPathsForPrefetching:", v18);
  if (v17)
    objc_msgSend((id)v35[5], "setPropertiesToFetch:", v17);
  v21 = v35[5];
  v32 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "executeFetchRequest:error:", v21, &v32));
  v23 = v32;
  if (v23)
  {
    v24 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_opt_class(a1, v25);
      *(_DWORD *)buf = 138544130;
      v41 = v30;
      v42 = 2112;
      v43 = v15;
      v44 = 2114;
      v45 = v16;
      v46 = 2114;
      v47 = v23;
      v31 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error fetching %{public}@ (predicate=%@ sortDescriptors=%{public}@): %{public}@", buf, 0x2Au);

    }
  }
  else
  {
    if (v22)
      goto LABEL_10;
    v24 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_opt_class(a1, v27);
      *(_DWORD *)buf = 138544130;
      v41 = v28;
      v42 = 2112;
      v43 = v15;
      v44 = 2114;
      v45 = v16;
      v46 = 2114;
      v47 = v19;
      v29 = v28;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Nil objects array fetching %{public}@ (predicate=%@ sortDescriptors=%{public}@ context=%{public}@)", buf, 0x2Au);

    }
  }

LABEL_10:
  _Block_object_dispose(&v34, 8);

  return v22;
}

@end
