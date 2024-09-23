@implementation SAUIAppPunchOutEvent(SiriUIFoundationAdditions)

+ (id)sruif_appPunchOutEventWithRefId:()SiriUIFoundationAdditions URL:appDisplayName:bundleId:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (a4)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a4, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@://%@"), v13, CFSTR("#TRUNCATED"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
    a4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = objc_alloc_init(MEMORY[0x24BE81868]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAceId:", v17);

  objc_msgSend(v15, "setRefId:", v9);
  objc_msgSend(v15, "setPunchOutUri:", a4);
  objc_msgSend(v15, "setAppDisplayName:", v10);
  objc_msgSend(v15, "setBundleId:", v11);

  return v15;
}

@end
