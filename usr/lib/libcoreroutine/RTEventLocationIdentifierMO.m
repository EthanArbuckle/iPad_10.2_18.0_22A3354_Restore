@implementation RTEventLocationIdentifierMO

+ (id)managedObjectWithEventLocationIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C97B20];
  v6 = a4;
  v7 = a3;
  +[NSManagedObject entityName](RTEventLocationIdentifierMO, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertNewObjectForEntityForName:inManagedObjectContext:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "source"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSource:", v11);

  objc_msgSend(v7, "calendarIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCalendarIdentifier:", v12);
  return v9;
}

@end
