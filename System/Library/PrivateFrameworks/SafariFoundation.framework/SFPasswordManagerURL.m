@implementation SFPasswordManagerURL

+ (id)passwordManagerURL
{
  return (id)objc_msgSend(MEMORY[0x24BE82D28], "passwordManagerURLWithDictionary:", 0);
}

+ (id)passwordManagerURLWithPrefsURL:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE82D28], "passwordManagerURLWithPrefsURL:", a3);
}

+ (id)passwordManagerURLWithParameters:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE82D28], "passwordManagerURLWithDictionary:", a3);
}

+ (id)passwordManagerURLForSharingGroupWithGroupID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE82D28];
  v9 = *MEMORY[0x24BE82F40];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passwordManagerURLWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)passwordManagerURLForFamilySharingGroupSetup
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE82D28];
  v6 = *MEMORY[0x24BE82F30];
  v7[0] = *MEMORY[0x24BE82F50];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passwordManagerURLWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
