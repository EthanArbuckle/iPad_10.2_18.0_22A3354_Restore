@implementation WCRAppleAllowList

- (id)initFromFile:(id)a3
{
  id v5;
  WCRAppleAllowList *v6;
  WCRAppleAllowList *v7;
  NSString **p_localPath;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *allowList;
  WCRAppleAllowList *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WCRAppleAllowList;
  v6 = -[WCRAppleAllowList init](&v16, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  p_localPath = &v6->_localPath;
  objc_storeStrong((id *)&v6->_localPath, a3);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v7->_localPath);
  objc_msgSend(v9, "objectForKey:", CFSTR("Allow-List"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize Apple allow list at path %@: unknown format"), *p_localPath);
LABEL_8:
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v14, 0);

    v13 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  allowList = v7->_allowList;
  v7->_allowList = (NSSet *)v11;

  if (!v7->_allowList)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize Apple allow list at path %@"), *p_localPath);
    goto LABEL_8;
  }

LABEL_5:
  v13 = v7;
LABEL_9:

  return v13;
}

- (BOOL)contains:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WCRAppleAllowList allowList](self, "allowList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (NSString)localPath
{
  return self->_localPath;
}

- (NSSet)allowList
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllowList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowList, 0);
  objc_storeStrong((id *)&self->_localPath, 0);
}

@end
