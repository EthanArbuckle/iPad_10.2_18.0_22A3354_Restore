@implementation PLQuestion

+ (id)entityName
{
  return CFSTR("Question");
}

+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "setUuid:", v6);

  return v9;
}

- (void)delete
{
  id v3;

  -[PLQuestion managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

@end
