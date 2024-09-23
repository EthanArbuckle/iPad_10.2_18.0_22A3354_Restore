@implementation MOResourceMO

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOResourceMO *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  v7 = -[MOResourceMO initWithContext:]([MOResourceMO alloc], "initWithContext:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  -[MOResourceMO setIdentifier:](v7, "setIdentifier:", v8);

  objc_msgSend(v6, "value");
  -[MOResourceMO setValue:](v7, "setValue:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  -[MOResourceMO setName:](v7, "setName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assets"));
  -[MOResourceMO setAssets:](v7, "setAssets:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));
  -[MOResourceMO setData:](v7, "setData:", v11);

  -[MOResourceMO setType:](v7, "setType:", objc_msgSend(v6, "type"));
  objc_msgSend(v6, "priorityScore");
  -[MOResourceMO setPriorityScore:](v7, "setPriorityScore:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "photoCurationScore"));
  -[MOResourceMO setPhotoCurationScore:](v7, "setPhotoCurationScore:", v12);

  -[MOResourceMO setPhotoFaceCount:](v7, "setPhotoFaceCount:", objc_msgSend(v6, "photoFaceCount"));
  -[MOResourceMO setPhotoAssetMediaType:](v7, "setPhotoAssetMediaType:", objc_msgSend(v6, "photoAssetMediaType"));
  -[MOResourceMO setSourceEventAccessType:](v7, "setSourceEventAccessType:", objc_msgSend(v6, "sourceEventAccessType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceEventIdentifier"));

  -[MOResourceMO setSourceEventIdentifier:](v7, "setSourceEventIdentifier:", v13);
  return v7;
}

- (id)clonedObjectWithContext:(id)a3
{
  id v4;
  MOResource *v5;
  void *v6;

  v4 = a3;
  v5 = -[MOResource initWithResourceMO:]([MOResource alloc], "initWithResourceMO:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOResourceMO managedObjectWithObject:inManagedObjectContext:](MOResourceMO, "managedObjectWithObject:inManagedObjectContext:", v5, v4));

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOResourceMO"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOResourceMO identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOResourceMO name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOResource getStringTypeForResources:](MOResource, "getStringTypeForResources:", -[MOResourceMO type](self, "type")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOResourceMO assets](self, "assets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOResourceMO getDedupeKeyError:](self, "getDedupeKeyError:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOResourceMO data](self, "data"));
  v10 = objc_msgSend(v9, "length");
  -[MOResourceMO value](self, "value");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOResourceMO sourceEventIdentifier](self, "sourceEventIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOResourceMO identifier, %@, name, %@, type, %@, assets, %@, dedupe key, %@, data.length, %lu, value, %f, sourceEventIdentifier, %@"), v4, v5, v6, v7, v8, v10, v12, v13));

  objc_autoreleasePoolPop(v3);
  return v14;
}

- (id)getDedupeKeyError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOResourceMO data](self, "data"));
  v10 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MOResource getDedupeKeyForResourceData:type:error:](MOResource, "getDedupeKeyForResourceData:type:error:", v6, -[MOResourceMO type](self, "type"), &v10));
  v8 = v10;

  objc_autoreleasePoolPop(v5);
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v7;
}

@end
