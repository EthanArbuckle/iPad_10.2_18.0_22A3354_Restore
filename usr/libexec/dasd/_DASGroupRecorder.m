@implementation _DASGroupRecorder

- (id)entityName
{
  return CFSTR("Group");
}

+ (id)predicateForUniqueRecord:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("name == %@"), v3));

  return v4;
}

+ (id)predicateForName:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("name == %@"), a3);
}

- (id)getGroupFromManagedObject:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = objc_msgSend(v3, "maxConcurrent");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityGroup groupWithName:maxConcurrent:](_DASActivityGroup, "groupWithName:maxConcurrent:", v4, v5));
  return v6;
}

- (void)copyGroup:(id)a3 toManagedObject:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  objc_msgSend(v8, "setName:", v6);

  v7 = objc_msgSend(v5, "maxConcurrent");
  objc_msgSend(v8, "setMaxConcurrent:", v7);

}

- (id)createGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder entityName](self, "entityName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v5, v4));

  return v6;
}

- (id)createOrUpdateGroup:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSFetchRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_opt_new(NSFetchRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder entityName](self, "entityName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v9, v7));
    -[NSFetchRequest setEntity:](v8, "setEntity:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASGroupRecorder predicateForUniqueRecord:](_DASGroupRecorder, "predicateForUniqueRecord:", v6));
    -[NSFetchRequest setPredicate:](v8, "setPredicate:", v11);

    v15 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v15));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));

    if (!v13)
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder createGroup:](self, "createGroup:", v7));
    -[_DASGroupRecorder copyGroup:toManagedObject:](self, "copyGroup:toManagedObject:", v6, v13);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)fetchGroupsUsingPredicate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSFetchRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(NSFetchRequest);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder entityName](self, "entityName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v9, v6));
  -[NSFetchRequest setEntity:](v8, "setEntity:", v10);

  -[NSFetchRequest setPredicate:](v8, "setPredicate:", v7);
  v13 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v8, &v13));

  return v11;
}

- (id)fetchAllGroups:(id)a3
{
  return -[_DASGroupRecorder fetchGroupsUsingPredicate:context:](self, "fetchGroupsUsingPredicate:context:", 0, a3);
}

@end
