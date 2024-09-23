@implementation _DASGroupManagedObject

- (void)willSave
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupManagedObject activities](self, "activities"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[_DASGroupManagedObject managedObjectContext](self, "managedObjectContext"));
    objc_msgSend(v5, "deleteObject:", self);

  }
}

@end
