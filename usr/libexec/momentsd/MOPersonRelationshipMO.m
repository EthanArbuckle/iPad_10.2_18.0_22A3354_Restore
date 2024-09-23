@implementation MOPersonRelationshipMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOPersonRelationshipMO"));
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOPersonRelationshipMO *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[MOPersonRelationshipMO initWithContext:]([MOPersonRelationshipMO alloc], "initWithContext:", v5);

  -[MOPersonRelationshipMO setRelationship:](v7, "setRelationship:", objc_msgSend(v6, "relationship"));
  objc_msgSend(v6, "score");
  -[MOPersonRelationshipMO setScore:](v7, "setScore:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "source"));

  -[MOPersonRelationshipMO setSource:](v7, "setSource:", v8);
  return v7;
}

@end
