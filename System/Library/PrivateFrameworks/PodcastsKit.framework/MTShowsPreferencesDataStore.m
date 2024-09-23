@implementation MTShowsPreferencesDataStore

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__MTShowsPreferencesDataStore_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1[0] != -1)
    dispatch_once(sharedInstance_onceToken_1, block);
  return (id)sharedInstance_instance_0;
}

void __45__MTShowsPreferencesDataStore_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___MTShowsPreferencesDataStore;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = v1;

}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "sharedInstance", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sortDescriptors
{
  return (id)objc_msgSend(MEMORY[0x24BE73820], "sortDescriptorsForSortType:", -[MTShowsPreferencesDataStore sortOrder](self, "sortOrder"));
}

- (int64_t)sortOrder
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "_applePodcastsFoundationSharedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", *MEMORY[0x24BE73A20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MTShowsPreferencesDataStore _sortTypeForString:](self, "_sortTypeForString:", v4);
  return v5;
}

- (void)setSortOrder:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  -[MTShowsPreferencesDataStore _stringForSortType:](self, "_stringForSortType:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "_applePodcastsFoundationSharedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x24BE73A20]);

  objc_msgSend(MEMORY[0x24BDBCF50], "_applePodcastsFoundationSharedUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronize");

}

- (int64_t)_sortTypeForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("added")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("addedAscending")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("manual")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("title")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("titleAscending")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("updated")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("updatedAscending")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("recentlyUnfollowed")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)_stringForSortType:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return CFSTR("title");
  else
    return off_24FD62E50[a3];
}

@end
