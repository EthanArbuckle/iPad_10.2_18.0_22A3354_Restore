@implementation RTEventModelUserInteractionMO

+ (id)managedObjectWithFeedback:(id)a3 interaction:(id)a4 locationOfInterestIdentifier:(id)a5 date:(id)a6 inManagedObjectContext:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v11 = (void *)MEMORY[0x1E0C97B20];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[NSManagedObject entityName](RTEventModelUserInteractionMO, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertNewObjectForEntityForName:inManagedObjectContext:", v17, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setFeedback:", v16);
  objc_msgSend(v18, "setInteraction:", v15);

  objc_msgSend(v18, "setLocationOfInterestIdentifier:", v14);
  objc_msgSend(v18, "setDate:", v13);

  return v18;
}

@end
