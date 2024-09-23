@implementation RemovableSoftwareLookupTable

- (RemovableSoftwareLookupTable)init
{
  RemovableSoftwareLookupTable *v2;
  NSLock *v3;
  NSLock *lock;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RemovableSoftwareLookupTable;
  v2 = -[RemovableSoftwareLookupTable init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v3;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__invalidateLookupCache_, CFSTR("ISURLBagDidLoadNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RemovableSoftwareLookupTable;
  -[RemovableSoftwareLookupTable dealloc](&v4, sel_dealloc);
}

- (NSDictionary)bundleDictionary
{
  NSDictionary *bundleDictionary;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  bundleDictionary = self->_bundleDictionary;
  if (!bundleDictionary)
  {
    -[RemovableSoftwareLookupTable _populateBundleDictionary](self, "_populateBundleDictionary");
    bundleDictionary = self->_bundleDictionary;
  }
  v4 = (void *)-[NSDictionary copy](bundleDictionary, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v4;
}

+ (BOOL)isRestrictedAppBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = objc_msgSend(v5, "isRestricted");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_invalidateLookupCache:(id)a3
{
  NSDictionary *bundleDictionary;

  -[NSLock lock](self->_lock, "lock", a3);
  bundleDictionary = self->_bundleDictionary;
  self->_bundleDictionary = 0;

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_populateBundleDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSDictionary *v18;
  NSDictionary *bundleDictionary;
  void *v20;
  void *v21;
  RemovableSoftwareLookupTable *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLBagForContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForKey:", CFSTR("hideableSystemApps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v5;
    v22 = self;
    v20 = v6;
    v7 = v6;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            objc_msgSend(v13, "objectForKey:", CFSTR("id"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "integerValue"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", CFSTR("bundle-id"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              v17 = v15 == 0;
            else
              v17 = 1;
            if (!v17)
              objc_msgSend(v23, "setObject:forKey:", v15, v16);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    v5 = v21;
    self = v22;
    v6 = v20;
  }
  v18 = (NSDictionary *)objc_msgSend(v23, "copy", v20, v21, v22);
  bundleDictionary = self->_bundleDictionary;
  self->_bundleDictionary = v18;

}

- (id)_identifierForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[RemovableSoftwareLookupTable bundleDictionary](self, "bundleDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      +[RemovableSoftwareLookupTable _fallbackItemIdentifier:](RemovableSoftwareLookupTable, "_fallbackItemIdentifier:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_fallbackItemIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.calculator")) & 1) != 0)
  {
    v4 = &unk_24C452F50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) != 0)
  {
    v4 = &unk_24C452F68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.compass")) & 1) != 0)
  {
    v4 = &unk_24C452F80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.facetime")) & 1) != 0)
  {
    v4 = &unk_24C452F98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobileme.fmf1")) & 1) != 0)
  {
    v4 = &unk_24C452FB0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobileme.fmip1")) & 1) != 0)
  {
    v4 = &unk_24C452FC8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Home")) & 1) != 0)
  {
    v4 = &unk_24C452FE0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.iBooks")) & 1) != 0)
  {
    v4 = &unk_24C452FF8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.iCloudDriveApp")) & 1) != 0)
  {
    v4 = &unk_24C453010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileStore")) & 1) != 0)
  {
    v4 = &unk_24C453028;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
  {
    v4 = &unk_24C453040;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Maps")) & 1) != 0)
  {
    v4 = &unk_24C453058;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0)
  {
    v4 = &unk_24C453070;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0)
  {
    v4 = &unk_24C453088;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) != 0)
  {
    v4 = &unk_24C4530A0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) != 0)
  {
    v4 = &unk_24C4530B8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) != 0)
  {
    v4 = &unk_24C4530D0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.stocks")) & 1) != 0)
  {
    v4 = &unk_24C4530E8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.tips")) & 1) != 0)
  {
    v4 = &unk_24C453100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.videos")) & 1) != 0)
  {
    v4 = &unk_24C453118;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.VoiceMemos")) & 1) != 0)
  {
    v4 = &unk_24C453130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Bridge")) & 1) != 0)
  {
    v4 = &unk_24C453148;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.weather")))
  {
    v4 = &unk_24C453160;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_urlForBundleIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_fallbackItemIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v4, "setScheme:", CFSTR("https"));
    objc_msgSend(v4, "setHost:", CFSTR("itunes.apple.com"));
    objc_msgSend(v4, "setPath:", CFSTR("/WebObjects/MZStore.woa/wa/viewSoftware"));
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("id=%@&mt=8"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQuery:", v7);

    objc_msgSend(v4, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_bundleDictionary, 0);
}

@end
