@implementation MOFSMMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOFSMMO"));
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOFSMMO *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MOFSMMO initWithContext:]([MOFSMMO alloc], "initWithContext:", v5);

  +[MOFSMMO setPropertiesOfFSMMO:withFSM:](MOFSMMO, "setPropertiesOfFSMMO:withFSM:", v7, v6);
  return v7;
}

+ (void)setPropertiesOfFSMMO:(id)a3 withFSM:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  objc_msgSend(v6, "setName:", v7);

  objc_msgSend(v6, "setMode:", objc_msgSend(v5, "mode"));
  objc_msgSend(v6, "setState:", objc_msgSend(v5, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substate"));
  objc_msgSend(v6, "setSubstate:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeRangeStartDate"));
  objc_msgSend(v6, "setTimeRangeStartDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeRangeEndDate"));
  objc_msgSend(v6, "setTimeRangeEndDate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastProcessedDate"));
  objc_msgSend(v6, "setLastProcessedDate:", v11);

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metaData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", v13));
  objc_msgSend(v6, "setMetaData:", v12);

}

@end
