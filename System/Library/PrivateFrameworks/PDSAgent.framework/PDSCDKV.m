@implementation PDSCDKV

+ (id)insertIntoManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBB658];
  v5 = a3;
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("PDSCDKV"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntity:insertIntoManagedObjectContext:", v6, v5);

  return v7;
}

+ (id)predicateForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("key == %@"), a3);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("PDSCDKV"));
}

@end
