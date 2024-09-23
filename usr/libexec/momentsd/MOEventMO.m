@implementation MOEventMO

+ (id)managedObjectWithEvent:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOEventMO *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MOEventMO initWithContext:]([MOEventMO alloc], "initWithContext:", v5);

  +[MOEventMO setPropertiesOfEventMO:withEvent:](MOEventMO, "setPropertiesOfEventMO:withEvent:", v7, v6);
  return v7;
}

+ (void)setPropertiesOfEventMO:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventIdentifier"));
  objc_msgSend(v6, "setEventIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  objc_msgSend(v6, "setStartDate:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
  objc_msgSend(v6, "setEndDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "creationDate"));
  objc_msgSend(v6, "setCreationDate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceCreationDate"));
  objc_msgSend(v6, "setSourceCreationDate:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "expirationDate"));
  objc_msgSend(v6, "setExpirationDate:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "provider")));
  objc_msgSend(v6, "setProvider:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "category")));
  objc_msgSend(v6, "setCategory:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifierFromProvider"));
  objc_msgSend(v6, "setIdentifierFromProvider:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "mode")));
  objc_msgSend(v6, "setMode:", v16);

  objc_msgSend(v6, "setIsInvalid:", objc_msgSend(v5, "isInvalid"));
  objc_msgSend(v6, "setIsHighConfidence:", objc_msgSend(v5, "isHighConfidence"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trends"));
  objc_msgSend(v6, "setTrends:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "patterns"));
  objc_msgSend(v6, "setPatterns:", v18);

  objc_msgSend(v6, "setIsGatheringComplete:", objc_msgSend(v5, "isGComplete"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "timeAtHomeSubType")));
  objc_msgSend(v6, "setTimeAtHomeSubType:", v19);

  v20 = objc_msgSend(v5, "rehydrationFailCount");
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v20));
  objc_msgSend(v6, "setRehydrationFailCount:", v21);

}

- (id)clonedObjectWithContext:(id)a3
{
  id v4;
  MOEvent *v5;
  void *v6;

  v4 = a3;
  v5 = -[MOEvent initWithEventMO:]([MOEvent alloc], "initWithEventMO:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO managedObjectWithEvent:inManagedObjectContext:](MOEventMO, "managedObjectWithEvent:inManagedObjectContext:", v5, v4));

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOEventMO"));
}

@end
