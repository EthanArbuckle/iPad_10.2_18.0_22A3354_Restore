@implementation NSError(SUInstaller)

- (id)errorWithExtendedUserInfoFromOptions:()SUInstaller
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors"));

  if (v6)
  {
    objc_msgSend(a1, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDBCED8];
    if (v7)
    {
      objc_msgSend(a1, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithDictionary:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "clientName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("dmd"));

    if (v13)
      objc_msgSend(v10, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SUMDMInstallationRequest"));
    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(a1, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, objc_msgSend(a1, "code"), v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = a1;
  }

  return v11;
}

@end
