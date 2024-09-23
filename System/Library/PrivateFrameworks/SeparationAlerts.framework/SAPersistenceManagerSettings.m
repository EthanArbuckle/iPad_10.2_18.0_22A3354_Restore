@implementation SAPersistenceManagerSettings

- (SAPersistenceManagerSettings)init
{
  return -[SAPersistenceManagerSettings initWithDirectoryURLOrDefault:storeFileNameOrDefault:](self, "initWithDirectoryURLOrDefault:storeFileNameOrDefault:", 0, 0);
}

- (SAPersistenceManagerSettings)initWithDirectoryURLOrDefault:(id)a3 storeFileNameOrDefault:(id)a4
{
  id v6;
  __CFString *v7;
  SAPersistenceManagerSettings *v8;
  NSURL *v9;
  NSURL *persistenceDirectoryURL;
  __CFString *v11;
  objc_super v13;

  v6 = a3;
  v7 = (__CFString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SAPersistenceManagerSettings;
  v8 = -[SAPersistenceManagerSettings init](&v13, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = (NSURL *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/root/Library/Caches/locationd/TrackingAvoidance/"), 1);
      v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    persistenceDirectoryURL = v8->_persistenceDirectoryURL;
    v8->_persistenceDirectoryURL = v9;

    if (v7)
      v11 = v7;
    else
      v11 = CFSTR("separationalerts.bin");
    objc_storeStrong((id *)&v8->_persistenceStoreFileName, v11);
  }

  return v8;
}

- (id)_getStoreURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", self->_persistenceStoreFileName, self->_persistenceDirectoryURL);
}

- (NSURL)persistenceDirectoryURL
{
  return self->_persistenceDirectoryURL;
}

- (void)setPersistenceDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceDirectoryURL, a3);
}

- (NSString)persistenceStoreFileName
{
  return self->_persistenceStoreFileName;
}

- (void)setPersistenceStoreFileName:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceStoreFileName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceStoreFileName, 0);
  objc_storeStrong((id *)&self->_persistenceDirectoryURL, 0);
}

@end
