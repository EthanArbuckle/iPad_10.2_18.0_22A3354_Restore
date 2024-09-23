@implementation MOTimeMO

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOTimeMO *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = -[MOTimeMO initWithContext:]([MOTimeMO alloc], "initWithContext:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  -[MOTimeMO setIdentifier:](v7, "setIdentifier:", v8);

  objc_msgSend(v6, "timestamp");
  -[MOTimeMO setTimestamp:](v7, "setTimestamp:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeString"));
  -[MOTimeMO setTimeString:](v7, "setTimeString:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));
  -[MOTimeMO setTimeZone:](v7, "setTimeZone:", v10);

  v11 = objc_msgSend(v6, "timeTag");
  -[MOTimeMO setTimeTag:](v7, "setTimeTag:", v11);
  return v7;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOTimeMO"));
}

@end
