@implementation MOPhotoTraitMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOPhotoTraitMO"));
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOPhotoTraitMO *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = -[MOPhotoTraitMO initWithContext:]([MOPhotoTraitMO alloc], "initWithContext:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  -[MOPhotoTraitMO setIdentifier:](v7, "setIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  -[MOPhotoTraitMO setName:](v7, "setName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relevantAssetUUIDs"));
  -[MOPhotoTraitMO setRelevantAssetUUIDs:](v7, "setRelevantAssetUUIDs:", v10);

  return v7;
}

- (id)clonedObjectWithContext:(id)a3
{
  id v4;
  MOPhotoTrait *v5;
  void *v6;

  v4 = a3;
  v5 = -[MOPhotoTrait initWithPhotoTraitMO:]([MOPhotoTrait alloc], "initWithPhotoTraitMO:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOPhotoTraitMO managedObjectWithObject:inManagedObjectContext:](MOPhotoTraitMO, "managedObjectWithObject:inManagedObjectContext:", v5, v4));

  return v6;
}

@end
