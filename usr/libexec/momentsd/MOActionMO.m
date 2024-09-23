@implementation MOActionMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOActionMO"));
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOActionMO *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = -[MOActionMO initWithContext:]([MOActionMO alloc], "initWithContext:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  -[MOActionMO setIdentifier:](v7, "setIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionName"));
  -[MOActionMO setAction:](v7, "setAction:", v9);

  -[MOActionMO setActionType:](v7, "setActionType:", objc_msgSend(v6, "actionType"));
  -[MOActionMO setActionSubType:](v7, "setActionSubType:", objc_msgSend(v6, "actionSubtype"));
  objc_msgSend(v6, "actionNameConfidence");
  -[MOActionMO setActionNameConfidence:](v7, "setActionNameConfidence:");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionMetaData"));
  -[MOActionMO setActionMetaData:](v7, "setActionMetaData:", v10);

  -[MOActionMO setSourceEventAccessType:](v7, "setSourceEventAccessType:", objc_msgSend(v6, "sourceEventAccessType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceEventIdentifier"));

  -[MOActionMO setSourceEventIdentifier:](v7, "setSourceEventIdentifier:", v11);
  return v7;
}

@end
