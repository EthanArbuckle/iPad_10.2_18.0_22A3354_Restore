@implementation NSManagedObjectContext

- (id)uppMetadataForMetadataIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("MTUPPMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("metadataIdentifier"), v4));

    objc_msgSend(v5, "setPredicate:", v6);
    objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v5, "setFetchLimit:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext executeFetchRequest:](self, "executeFetchRequest:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)uppMetadataForMetadataIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("metadataIdentifier"), v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext objectsInEntity:predicate:sortDescriptors:](self, "objectsInEntity:predicate:sortDescriptors:", CFSTR("MTUPPMetadata"), v5, 0));

  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (BOOL)deleteAllUPPMetadata
{
  id v2;
  id v3;
  void *v4;
  id v6;

  v6 = 0;
  v2 = +[MTUPPMetadata deleteAllContentInCtx:error:](MTUPPMetadata, "deleteAllContentInCtx:error:", self, &v6);
  v3 = v6;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    objc_msgSend(v4, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Models/Misc/MTUPPMetadata+Library.m", 102, CFSTR("Error deleting UPPMetadata: %@"), v3);

  }
  return v3 == 0;
}

@end
