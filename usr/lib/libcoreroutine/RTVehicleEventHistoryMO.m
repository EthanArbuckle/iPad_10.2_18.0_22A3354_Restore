@implementation RTVehicleEventHistoryMO

+ (id)managedObjectWithVehicleEvent:(id)a3 inManagedObjectContext:(id)a4
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = (void *)MEMORY[0x1E0C97B20];
  v6 = a4;
  v7 = a3;
  +[NSManagedObject entityName](RTVehicleEventHistoryMO, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertNewObjectForEntityForName:inManagedObjectContext:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDate:", v10);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "latitude");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocLatitude:", v13);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "longitude");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocLongitude:", v16);

  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "horizontalUncertainty");
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocUncertainty:", v19);

  objc_msgSend(v7, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocDate:", v21);

  objc_msgSend(v7, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", v23);

  return v9;
}

@end
