@implementation STStorageSharedContainer

- (STStorageSharedContainer)initWithPath:(id)a3 owners:(id)a4
{
  id v7;
  id v8;
  STStorageSharedContainer *v9;
  STStorageSharedContainer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STStorageSharedContainer;
  v9 = -[STStorageSharedContainer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    -[STStorageSharedContainer setOwners:](v10, "setOwners:", v8);
  }

  return v10;
}

- (void)setOwners:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  id v18;
  NSArray **p_owners;
  void *v20;
  STStorageApp **p_appRep;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v30;
  id obj;
  void *v32;
  int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v3 = (void *)objc_msgSend(v30, "mutableCopy");
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    obj = 0;
    v5 = v3;
    do
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectAtIndex:", 0);
      objc_msgSend(v6, "vendorName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        v32 = v6;
        v33 = v4;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v8 = v5;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v35;
          v12 = 1;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v35 != v11)
                objc_enumerationMutation(v8);
              v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(v14, "vendorName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v7);

              if (v16)
                ++v12;
              else
                objc_msgSend(v3, "addObject:", v14);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v10);
        }
        else
        {
          v12 = 1;
        }

        v17 = v12 <= v33;
        v4 = v33;
        if (v17)
        {
          v6 = v32;
        }
        else
        {
          v4 = v33 + 1;
          v6 = v32;
          v18 = v32;

          obj = v18;
        }

        v5 = v3;
      }
      else
      {
        v3 = v5;
      }

    }
    while (objc_msgSend(v3, "count"));
  }
  else
  {
    obj = 0;
  }
  p_owners = &self->_owners;
  objc_storeStrong((id *)&self->_owners, a3);
  v20 = obj;
  if (!obj)
  {
    -[NSArray firstObject](*p_owners, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  p_appRep = &self->_appRep;
  objc_storeStrong((id *)&self->_appRep, v20);
  if (!obj)

  -[STStorageApp appIdentifier](*p_appRep, "appIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageApp setAppIdentifier:](self, "setAppIdentifier:", v22);

  -[STStorageApp bundleIdentifier](*p_appRep, "bundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageApp setBundleIdentifier:](self, "setBundleIdentifier:", v23);

  -[STStorageApp setAppKind:](self, "setAppKind:", 2);
  if (*p_appRep)
    -[STStorageApp vendorName](*p_appRep, "vendorName");
  else
    STStorageDataLocStr(CFSTR("SHARED_DATA"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageApp setName:](self, "setName:", v24);

  v25 = (void *)MEMORY[0x24BDD17C8];
  STStorageDataLocStr(CFSTR("SHARED_FMT %ld"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringWithFormat:", v26, -[NSArray count](*p_owners, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageApp setVendorName:](self, "setVendorName:", v27);

}

- (NSArray)owners
{
  return self->_owners;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (STStorageApp)appRep
{
  return (STStorageApp *)objc_getProperty(self, a2, 256, 1);
}

- (void)setAppRep:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_appRep, 0);
  objc_storeStrong((id *)&self->_owners, 0);
}

@end
