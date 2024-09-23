@implementation PSUsageBundleApp

+ (id)usageBundleAppForBundleWithIdentifier:(id)a3 withTotalSize:(float)a4
{
  return (id)objc_msgSend(a1, "usageBundleAppForBundleWithIdentifier:withTotalSize:andCategories:", a3, 0);
}

+ (id)usageBundleAppForBundleWithIdentifier:(id)a3 withTotalSize:(float)a4 andCategories:(id)a5
{
  id v7;
  id v8;
  PSUsageBundleApp *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(PSUsageBundleApp);
  -[PSUsageBundleApp setBundleIdentifier:](v9, "setBundleIdentifier:", v7);
  *(float *)&v10 = a4;
  -[PSUsageBundleApp setTotalSize:](v9, "setTotalSize:", v10);
  -[PSUsageBundleApp setCategories:](v9, "setCategories:", v8);

  v11 = (void *)MEMORY[0x1E0CA5860];
  -[PSUsageBundleApp bundleIdentifier](v9, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationProxyForIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
    {
      PS_LocalizedString(CFSTR("CONTACTS"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v7;
    }
    v14 = v15;
  }
  -[PSUsageBundleApp setName:](v9, "setName:", v14);

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PSUsageBundleApp name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageBundleApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageBundleApp categories](self, "categories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ (%@): %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setUsageBundleStorageReporter:(id)a3
{
  id v4;
  void *v5;
  PSWeakReference *v6;
  PSWeakReference *storageReporterReference;
  id v8;

  v8 = a3;
  -[PSUsageBundleApp usageBundleStorageReporter](self, "usageBundleStorageReporter");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    +[PSWeakReference weakReferenceWithObject:](PSWeakReference, "weakReferenceWithObject:", v8);
    v6 = (PSWeakReference *)objc_claimAutoreleasedReturnValue();
    storageReporterReference = self->_storageReporterReference;
    self->_storageReporterReference = v6;

    v5 = v8;
  }

}

- (PSStorageReporting)usageBundleStorageReporter
{
  return (PSStorageReporting *)-[PSWeakReference object](self->_storageReporterReference, "object");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (float)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(float)a3
{
  self->_totalSize = a3;
}

- (BOOL)isDeletionRestricted
{
  return self->_deletionRestricted;
}

- (void)setDeletionRestricted:(BOOL)a3
{
  self->_deletionRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storageReporterReference, 0);
}

@end
