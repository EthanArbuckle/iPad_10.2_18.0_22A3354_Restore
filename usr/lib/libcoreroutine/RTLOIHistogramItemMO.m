@implementation RTLOIHistogramItemMO

+ (id)managedObjectWithLOIHistogramItem:(id)a3 inManagedObjectContext:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;

  v5 = (void *)MEMORY[0x1E0C97B20];
  v6 = a4;
  v7 = a3;
  +[NSManagedObject entityName](RTLOIHistogramItemMO, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertNewObjectForEntityForName:inManagedObjectContext:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "locationOfInterest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocationOfInterestIdentifier:", v12);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "timeOfStay");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeOfStay:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "numOfEvents"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumOfEvents:", v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "probability");
  v18 = v17;

  objc_msgSend(v16, "numberWithDouble:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProbability:", v19);

  return v9;
}

@end
