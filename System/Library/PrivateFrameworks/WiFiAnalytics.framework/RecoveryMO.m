@implementation RecoveryMO

+ (id)entityName
{
  return CFSTR("Recovery");
}

+ (id)generateInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[RecoveryMO entityName](RecoveryMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mostRecentRecovery:(id)a3 reason:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  id v9;
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
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[RecoveryMO fetchRequest](RecoveryMO, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 0);
  v24[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v12);

  v13 = (void *)MEMORY[0x24BDD14C0];
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("recoveryType == %@"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("recoveryReason == %@"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v15;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("apple80211Return == 0"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("apple80211Return == 1"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "andPredicateWithSubpredicates:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("recoveryType == %@"), v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("apple80211Return == 1"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  +[AnalyticsStoreProxy fetchFirst:withPredicate:moc:](AnalyticsStoreProxy, "fetchFirst:withPredicate:moc:", v10, v18, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Recovery"));
}

@end
