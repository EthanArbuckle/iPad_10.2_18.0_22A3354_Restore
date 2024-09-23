@implementation NSError(PNRResourceManager)

+ (id)_PNRAssetQueryErrorWithUserInfo:()PNRResourceManager
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("asset query"), *MEMORY[0x24BDD0BA0]);
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = PNRResourceManagerErrorDomain;
  v8 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_PNRBadMagicErrorWithUserInfo:()PNRResourceManager
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("bad magic"), *MEMORY[0x24BDD0BA0]);
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = PNRResourceManagerErrorDomain;
  v8 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_PNRNotFoundErrorWithUserInfo:()PNRResourceManager
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("not found"), *MEMORY[0x24BDD0BA0]);
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = PNRResourceManagerErrorDomain;
  v8 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 2, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_PNRAssetUnavailableErrorWithUserInfo:()PNRResourceManager
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("asset unavailable"), *MEMORY[0x24BDD0BA0]);
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = PNRResourceManagerErrorDomain;
  v8 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
