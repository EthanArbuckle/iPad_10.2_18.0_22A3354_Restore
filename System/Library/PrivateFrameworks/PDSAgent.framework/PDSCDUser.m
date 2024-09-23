@implementation PDSCDUser

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("PDSCDUser"));
}

+ (id)predicateForUserID:(id)a3 userType:(signed __int16)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("userID == %@ && userType == %d"), a3, a4);
}

+ (id)insertIntoManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBB658];
  v5 = a3;
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("PDSCDUser"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntity:insertIntoManagedObjectContext:", v6, v5);

  return v7;
}

+ (id)userFromUser:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  objc_msgSend(a1, "insertIntoManagedObjectContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserID:", v8);

  v9 = objc_msgSend(v6, "userType");
  objc_msgSend(v7, "setUserType:", v9);
  return v7;
}

- (id)user
{
  id v3;
  void *v4;
  void *v5;

  if (-[PDSCDUser userType](self, "userType") == 1)
  {
    v3 = objc_alloc(MEMORY[0x24BE6E500]);
    -[PDSCDUser userID](self, "userID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithUserID:userType:", v4, (char)-[PDSCDUser userType](self, "userType"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
