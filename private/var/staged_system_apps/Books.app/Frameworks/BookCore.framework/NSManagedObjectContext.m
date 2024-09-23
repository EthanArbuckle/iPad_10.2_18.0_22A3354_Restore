@implementation NSManagedObjectContext

+ (id)mergePredicate:(id)a3 andPredicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v5, v6, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v8));

  }
  else
  {
    if (v5)
      v10 = v5;
    else
      v10 = v6;
    v9 = v10;
  }

  return v9;
}

- (unint64_t)countEntity:(id)a3 withPredicate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)NSFetchRequest);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v7, self));

  objc_msgSend(v8, "setEntity:", v9);
  objc_msgSend(v8, "setPredicate:", v6);

  v14 = 0;
  v10 = -[NSManagedObjectContext countForFetchRequest:error:](self, "countForFetchRequest:error:", v8, &v14);
  v11 = v14;
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "logRecursively");
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = 0;

  return v10;
}

- (id)copyEntityPropertiesArray:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5 sortBy:(id)a6 ascending:(BOOL)a7 distinct:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSManagedObjectContext *v23;
  _BOOL4 v24;
  id v25;
  id v26;
  _BOOL8 v27;
  void *v28;
  unsigned int v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v37;
  void *context;
  id v39;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  context = objc_autoreleasePoolPush();
  v18 = objc_alloc_init((Class)NSFetchRequest);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v15, self));
  objc_msgSend(v18, "setEntity:", v19);
  if (objc_msgSend(v14, "count") != (char *)&dword_0 + 1)
    goto LABEL_4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", 0));
  v37 = v14;
  v21 = v19;
  v22 = v17;
  v23 = self;
  v24 = v8;
  v25 = v16;
  v26 = v15;
  v27 = v9;
  v28 = v20;
  v29 = objc_msgSend(v20, "isEqualToString:", CFSTR("objectID"));

  v9 = v27;
  v15 = v26;
  v16 = v25;
  v8 = v24;
  self = v23;
  v17 = v22;
  v19 = v21;
  v14 = v37;
  if (v29)
  {
    objc_msgSend(v18, "setResultType:", 1);
  }
  else
  {
LABEL_4:
    objc_msgSend(v18, "setPropertiesToFetch:", v14);
    objc_msgSend(v18, "setResultType:", 2);
    if (v8)
      objc_msgSend(v18, "setReturnsDistinctResults:", 1);
  }
  objc_msgSend(v18, "setPredicate:", v16);
  if (v17)
  {
    v30 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", v17, v9);
    v31 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v30, 0);
    objc_msgSend(v18, "setSortDescriptors:", v31);

  }
  v39 = 0;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v18, &v39));
  v33 = v39;
  v34 = v33;
  if (v33)
    objc_msgSend(v33, "logRecursively");

  objc_autoreleasePoolPop(context);
  v35 = objc_msgSend(v32, "copy");

  return v35;
}

- (id)copyEntityPropertiesArray:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5 sortBy:(id)a6 ascending:(BOOL)a7
{
  return -[NSManagedObjectContext copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:distinct:](self, "copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:distinct:", a3, a4, a5, a6, a7, 0);
}

- (id)copyEntityPropertyArray:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5 sortBy:(id)a6 ascending:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
  v16 = -[NSManagedObjectContext copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:](self, "copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:", v15, v14, v13, v12, v7);

  return v16;
}

- (id)copyEntityProperty:(id)a3 fromEntityName:(id)a4 withPredicate:(id)a5
{
  id v5;
  void *v6;
  id v7;

  v5 = -[NSManagedObjectContext copyEntityPropertyArray:fromEntityName:withPredicate:sortBy:ascending:](self, "copyEntityPropertyArray:fromEntityName:withPredicate:sortBy:ascending:", a3, a4, a5, 0, 0);
  if (objc_msgSend(v5, "count") == (char *)&dword_0 + 1 || (unint64_t)objc_msgSend(v5, "count") >= 2)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  else
    v6 = 0;
  v7 = objc_msgSend(v6, "copy");

  return v7;
}

- (id)newByClass:(Class)a3
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v5, self));

  return v6;
}

- (id)objectIDsWithPredicate:(id)a3 forEntity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v9 = objc_alloc_init((Class)NSFetchRequest);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v7, self));
  objc_msgSend(v9, "setEntity:", v10);

  objc_msgSend(v9, "setPredicate:", v6);
  objc_msgSend(v9, "setResultType:", 1);
  objc_msgSend(v9, "setIncludesPropertyValues:", 0);
  v15 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v9, &v15));
  v12 = v15;
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "logRecursively");

  objc_autoreleasePoolPop(v8);
  return v11;
}

- (id)unbatchedObjectsWithPredicate:(id)a3 forEntity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v9 = objc_alloc_init((Class)NSFetchRequest);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v7, self));
  objc_msgSend(v9, "setEntity:", v10);

  objc_msgSend(v9, "setPredicate:", v6);
  objc_msgSend(v9, "setIncludesPropertyValues:", 1);
  v15 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v9, &v15));
  v12 = v15;
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "logRecursively");

  objc_autoreleasePoolPop(v8);
  return v11;
}

- (id)entity:(id)a3 withPredicate:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 prefetchRelationships:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = objc_autoreleasePoolPush();
  v17 = objc_alloc_init((Class)NSFetchRequest);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v12, self));
  objc_msgSend(v17, "setEntity:", v18);

  objc_msgSend(v17, "setPredicate:", v13);
  objc_msgSend(v17, "setSortDescriptors:", v14);
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v17, "setRelationshipKeyPathsForPrefetching:", v15);
  if (a6)
  {
    if (a6 <= 0xA)
      objc_msgSend(v17, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v17, "setFetchLimit:", a6);
  }
  else
  {
    objc_msgSend(v17, "setFetchBatchSize:", 100);
  }
  v23 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext executeFetchRequest:error:](self, "executeFetchRequest:error:", v17, &v23));
  v20 = v23;
  v21 = v20;
  if (v20)
    objc_msgSend(v20, "logRecursively");

  objc_autoreleasePoolPop(v16);
  return v19;
}

- (id)entity:(id)a3 withPredicate:(id)a4 sortBy:(id)a5 ascending:(BOOL)a6 fetchLimit:(unint64_t)a7 prefetchRelationships:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a8;
  if (a5)
  {
    v17 = a5;
    v18 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", v17, v10);

    v19 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v18, 0);
  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext entity:withPredicate:sortDescriptors:fetchLimit:prefetchRelationships:](self, "entity:withPredicate:sortDescriptors:fetchLimit:prefetchRelationships:", v14, v15, v19, a7, v16));

  return v20;
}

- (id)entity:(id)a3 withPredicate:(id)a4 sortBy:(id)a5 ascending:(BOOL)a6 fetchLimit:(unint64_t)a7
{
  return -[NSManagedObjectContext entity:withPredicate:sortBy:ascending:fetchLimit:prefetchRelationships:](self, "entity:withPredicate:sortBy:ascending:fetchLimit:prefetchRelationships:", a3, a4, a5, a6, a7, 0);
}

- (id)entity:(id)a3 withPredicate:(id)a4
{
  return -[NSManagedObjectContext entity:withPredicate:sortBy:ascending:fetchLimit:](self, "entity:withPredicate:sortBy:ascending:fetchLimit:", a3, a4, 0, 0, 0);
}

- (void)im_performSafeAccess:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[NSManagedObjectContext im_pushSafeAccessState](self, "im_pushSafeAccessState");
  v4[2]();
  -[NSManagedObjectContext im_popSafeAccessState](self, "im_popSafeAccessState");

}

- (void)batchDeleteEntity:(id)a3 matching:(id)a4 prefetchRelationships:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NSManagedObjectContext *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_55790;
  v13[3] = &unk_28C430;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext unbatchedObjectsWithPredicate:forEntity:](self, "unbatchedObjectsWithPredicate:forEntity:", v9, v8));
  v14 = v12;
  v15 = self;
  v16 = &v17;
  -[NSManagedObjectContext im_performSafeAccess:](self, "im_performSafeAccess:", v13);
  if (*((_DWORD *)v18 + 6))
    -[NSManagedObjectContext save:](self, "save:", 0);

  _Block_object_dispose(&v17, 8);
  objc_autoreleasePoolPop(v11);

}

@end
