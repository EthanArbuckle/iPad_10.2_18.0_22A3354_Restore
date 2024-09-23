@implementation PDSCDRegistration

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("PDSCDRegistration"));
}

+ (id)insertIntoManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBB658];
  v5 = a3;
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("PDSCDRegistration"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntity:insertIntoManagedObjectContext:", v6, v5);

  return v7;
}

+ (id)registrationFromEntry:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  +[PDSCDRegistration insertIntoManagedObjectContext:](PDSCDRegistration, "insertIntoManagedObjectContext:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryState:", objc_msgSend(v5, "state"));
  objc_msgSend(v5, "registration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnvironment:", objc_msgSend(v7, "pushEnvironment"));

  objc_msgSend(v5, "registration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topicString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTopic:", v9);

  objc_msgSend(v5, "registration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "qualifierString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQualifier:", v11);

  objc_msgSend(v5, "clientID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setClientID:", v12);
  return v6;
}

+ (id)pendingRegistrations
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("entryState != %d"), 3);
}

+ (id)activeRegistrations
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("entryState != %d"), 2);
}

+ (id)activeRegistrationsForClientID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("clientID == %@ && entryState != %d"), a3, 2);
}

+ (id)registrationsForClientID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("clientID == %@"), a3);
}

+ (id)registrationsWithState:(unsigned __int8)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("entryState == %d"), a3);
}

+ (id)uniquenessPredicateForEntry:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  objc_msgSend(v4, "registration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "qualifierString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topicString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "predicateWithFormat:", CFSTR("qualifier == %@ && topic == %@ && environment == %d"), v6, v8, (int)objc_msgSend(v9, "pushEnvironment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)entryWithUserCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  v4 = a3;
  -[PDSCDRegistration user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PDSCDRegistration user](self, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_8:
      v10 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v7, "userID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v9);

  }
  if (-[PDSCDRegistration environment](self, "environment") != 1
    && -[PDSCDRegistration environment](self, "environment")
    || (-[PDSCDRegistration entryState](self, "entryState") & 0x80000000) != 0
    || (int)-[PDSCDRegistration entryState](self, "entryState") > 3)
  {
    goto LABEL_8;
  }
  v12 = objc_alloc(MEMORY[0x24BE6E4F0]);
  -[PDSCDRegistration topic](self, "topic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSCDRegistration qualifier](self, "qualifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithTopic:qualifier:pushEnvironment:", v13, v14, (char)-[PDSCDRegistration environment](self, "environment"));

  v16 = objc_alloc(MEMORY[0x24BE6E4E8]);
  -[PDSCDRegistration clientID](self, "clientID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v16, "initWithUser:registration:clientID:", v7, v15, v17);

  LODWORD(v17) = objc_msgSend(v10, "state");
  if ((_DWORD)v17 != -[PDSCDRegistration entryState](self, "entryState"))
  {
    objc_msgSend(v10, "entryWithUpdatedState:", -[PDSCDRegistration entryState](self, "entryState"));
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v18;
  }

LABEL_9:
  return v10;
}

@end
