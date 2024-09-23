@implementation GKCDContactInfoList

+ (id)_gkPrimaryListWithContext:(id)a3
{
  id v4;
  void *v5;
  GKCDContactInfoList *v6;
  GKCDContactInfoList *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDContactInfoList _gkObjectsMatchingPredicate:withContext:](GKCDContactInfoList, "_gkObjectsMatchingPredicate:withContext:", 0, v4));
  v6 = (GKCDContactInfoList *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (!v6)
  {
    v7 = [GKCDContactInfoList alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entity"));
    v6 = -[GKCDContactInfoList initWithEntity:insertIntoManagedObjectContext:](v7, "initWithEntity:insertIntoManagedObjectContext:", v8, v4);

    -[GKCDContactInfoList setVersion:](v6, "setVersion:", &off_1002DB9E8);
  }

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("ContactInfoList"));
}

@end
