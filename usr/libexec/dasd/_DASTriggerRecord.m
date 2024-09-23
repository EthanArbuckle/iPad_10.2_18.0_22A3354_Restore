@implementation _DASTriggerRecord

- (id)entityName
{
  return CFSTR("Trigger");
}

- (id)createTrigger:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTriggerRecord entityName](self, "entityName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v8, v6));

  -[_DASTriggerRecord copyTrigger:toManagedObject:](self, "copyTrigger:toManagedObject:", v7, v9);
  return v9;
}

- (id)fetchOrCreateTrigger:(id)a3 managedObjectContext:(id)a4
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
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTriggerRecord entityName](self, "entityName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v9, v7));
    -[NSFetchRequest setEntity:](v8, "setEntity:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier == %@"), v6));
    -[NSFetchRequest setPredicate:](v8, "setPredicate:", v11);

    v15 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v15));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));

    if (!v13)
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTriggerRecord createTrigger:managedObjectContext:](self, "createTrigger:managedObjectContext:", v6, v7));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)copyTrigger:(id)a3 toManagedObject:(id)a4
{
  objc_msgSend(a4, "setIdentifier:", a3);
}

@end
