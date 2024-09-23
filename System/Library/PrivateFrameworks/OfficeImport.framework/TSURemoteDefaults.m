@implementation TSURemoteDefaults

+ (id)sharedDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__TSURemoteDefaults_sharedDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDefaults_onceToken != -1)
    dispatch_once(&sharedDefaults_onceToken, block);
  return (id)sharedDefaults_sharedDefaults;
}

void __35__TSURemoteDefaults_sharedDefaults__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initInternal");
  v2 = (void *)sharedDefaults_sharedDefaults;
  sharedDefaults_sharedDefaults = v1;

}

- (TSURemoteDefaults)initWithRemoteURL:(id)a3 localURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSURemoteDefaults initWithRemoteURL:localURL:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSURemoteDefaults.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 314, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v9 = (void *)MEMORY[0x24BDBCE88];
  v10 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[TSURemoteDefaults initWithRemoteURL:localURL:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (id)initInternal
{
  void *v3;
  TSURemoteDefaults *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://configuration.apple.com/configurations/internetservices/iworkapps/RemoteDefaults.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)TSURemoteDefaults;
  v4 = -[TSURemotePropertyList initWithRemoteURL:localURL:](&v6, sel_initWithRemoteURL_localURL_, v3, 0);

  if (v4)
    -[TSURemoteDefaults registerDefaults](v4, "registerDefaults");
  return v4;
}

- (void)registerDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("RemoteDefaults"), CFSTR("plist"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "registerDefaults:", v3);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSURemoteDefaults registerDefaults]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSURemoteDefaults.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 336, 0, "Can't parse local defaults plist");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSURemoteDefaults registerDefaults]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSURemoteDefaults.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 345, 0, "Don't have local defaults plist");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }

}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("TSURemoteDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "volatileDomainForName:", *MEMORY[0x24BDD11E0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("TSURemoteDefaults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v12.receiver = self;
      v12.super_class = (Class)TSURemoteDefaults;
      -[TSURemotePropertyList objectForKey:](&v12, sel_objectForKey_, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (void)processPropertyList:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = (void *)MEMORY[0x24BDBCF50];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("TSURemoteDefaults"));

  v7.receiver = self;
  v7.super_class = (Class)TSURemoteDefaults;
  -[TSURemotePropertyList processPropertyList:](&v7, sel_processPropertyList_, v5);

}

@end
