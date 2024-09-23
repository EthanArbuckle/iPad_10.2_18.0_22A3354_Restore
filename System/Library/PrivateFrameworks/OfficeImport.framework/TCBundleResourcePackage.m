@implementation TCBundleResourcePackage

- (TCBundleResourcePackage)initWithZipArchive:(id)a3
{
  id v5;
  TCBundleResourcePackage *v6;
  TCBundleResourcePackage *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *mEntryMap;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TCBundleResourcePackage;
  v6 = -[TCBundleResourcePackage init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mZipArchive, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mEntryMap = v7->mEntryMap;
    v7->mEntryMap = v8;

  }
  return v7;
}

- (id)entryWithName:(id)a3 cacheResult:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  TCBundleResourcePackageEntry *v7;
  void *v8;
  NSMutableDictionary *v9;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->mEntryMap, "objectForKey:", v6);
  v7 = (TCBundleResourcePackageEntry *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[OISFUZipArchive entryWithName:](self->mZipArchive, "entryWithName:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = -[TCBundleResourcePackageEntry initWithZipEntry:]([TCBundleResourcePackageEntry alloc], "initWithZipEntry:", v8);
      if (v4)
      {
        v9 = self->mEntryMap;
        objc_sync_enter(v9);
        -[NSMutableDictionary setObject:forKey:](self->mEntryMap, "setObject:forKey:", v7, v6);
        objc_sync_exit(v9);

      }
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEntryMap, 0);
  objc_storeStrong((id *)&self->mZipArchive, 0);
}

@end
