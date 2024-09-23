@implementation VSIdentityProviderStorefrontParser

- (VSIdentityProviderStorefrontParser)init
{
  VSIdentityProviderStorefrontParser *v2;
  NSArray *v3;
  NSArray *allIdentityProviders;
  NSArray *v5;
  NSArray *allStorefronts;
  NSDictionary *v7;
  NSDictionary *storefrontsByCountryCode;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSIdentityProviderStorefrontParser;
  v2 = -[VSIdentityProviderStorefrontParser init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    allIdentityProviders = v2->_allIdentityProviders;
    v2->_allIdentityProviders = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    allStorefronts = v2->_allStorefronts;
    v2->_allStorefronts = v5;

    v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    storefrontsByCountryCode = v2->_storefrontsByCountryCode;
    v2->_storefrontsByCountryCode = v7;

  }
  return v2;
}

- (void)setAllStorefronts:(id)a3
{
  -[VSIdentityProviderStorefrontParser setAllStorefronts:withCurrentStorefrontCode:](self, "setAllStorefronts:withCurrentStorefrontCode:", a3, 0);
}

- (void)setAllStorefronts:(id)a3 withCurrentStorefrontCode:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  VSStorefront *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[VSIdentityProviderStorefrontParser updateFeaturedStorefronts:withCurrentStorefrontCodeOrNil:](self, "updateFeaturedStorefronts:withCurrentStorefrontCodeOrNil:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_allStorefronts, v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "identitifer", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v14 = objc_alloc_init(VSStorefront);
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("REGIONS_PICKER_SETTINGS_DEVELOPER_PROVIDERS_DISPLAY_NAME"), 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSStorefront setDisplayName:](v14, "setDisplayName:", v16);

  -[VSStorefront setIdentitifer:](v14, "setIdentitifer:", CFSTR("__"));
  -[VSStorefront setIsFeatured:](v14, "setIsFeatured:", 1);
  objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("__"));
  v17 = (void *)objc_msgSend(v6, "copy");
  -[VSIdentityProviderStorefrontParser setStorefrontsByCountryCode:](self, "setStorefrontsByCountryCode:", v17);

}

- (NSDictionary)identityProvidersByStorefront
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  VSIdentityProviderStorefrontCollection *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  VSIdentityProviderStorefrontCollection *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  -[VSIdentityProviderStorefrontParser allIdentityProviders](self, "allIdentityProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v44;
    v35 = *MEMORY[0x24BDBCAB8];
    v30 = *(_QWORD *)v44;
    v31 = v4;
    do
    {
      v8 = 0;
      v32 = v6;
      do
      {
        if (*(_QWORD *)v44 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
        if (objc_msgSend(v9, "isDeveloper"))
        {
          objc_msgSend(v4, "addObject:", v9);
        }
        else
        {
          v34 = v8;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v9, "storefronts");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v40;
            v37 = v9;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v40 != v12)
                  objc_enumerationMutation(v38);
                v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v14, "storefrontTwoCharCode");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "objectForKey:", v15);
                v16 = (VSIdentityProviderStorefrontCollection *)objc_claimAutoreleasedReturnValue();
                if (!v16)
                {
                  v17 = v11;
                  v18 = v3;
                  v16 = objc_alloc_init(VSIdentityProviderStorefrontCollection);
                  -[VSIdentityProviderStorefrontCollection setStorefrontTwoCharCode:](v16, "setStorefrontTwoCharCode:", v15);
                  -[VSIdentityProviderStorefrontParser storefrontsByCountryCode](self, "storefrontsByCountryCode");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "valueForKey:", v15);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "displayName");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v21)
                    v22 = v21;
                  else
                    v22 = v15;
                  -[VSIdentityProviderStorefrontCollection setLocalizedDisplayName:](v16, "setLocalizedDisplayName:", v22);
                  if (!v16)
                    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v35, CFSTR("The sfCollection parameter must not be nil."));
                  v3 = v18;
                  objc_msgSend(v18, "setObject:forKey:", v16, v15);

                  v11 = v17;
                  v9 = v37;
                }
                -[VSIdentityProviderStorefrontCollection mutableAllIdentityProviders](v16, "mutableAllIdentityProviders");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "addObject:", v9);

                if (objc_msgSend(v14, "isFeatured"))
                {
                  -[VSIdentityProviderStorefrontCollection mutableFeaturedIdentityProviders](v16, "mutableFeaturedIdentityProviders");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "addObject:", v9);

                }
              }
              v11 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v11);
          }

          v7 = v30;
          v4 = v31;
          v6 = v32;
          v8 = v34;
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v4, "count"))
  {
    v25 = objc_alloc_init(VSIdentityProviderStorefrontCollection);
    -[VSIdentityProviderStorefrontCollection setStorefrontTwoCharCode:](v25, "setStorefrontTwoCharCode:", CFSTR("__"));
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("REGIONS_PICKER_SETTINGS_DEVELOPER_PROVIDERS_DISPLAY_NAME"), 0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderStorefrontCollection setLocalizedDisplayName:](v25, "setLocalizedDisplayName:", v27);

    -[VSIdentityProviderStorefrontCollection setMutableAllIdentityProviders:](v25, "setMutableAllIdentityProviders:", v4);
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("__"));

  }
  v28 = (void *)objc_msgSend(v3, "copy");
  -[VSIdentityProviderStorefrontParser setProvidersByStorefront:](self, "setProvidersByStorefront:", v28);

  return (NSDictionary *)v3;
}

- (NSArray)tvProviderSupportedStorefronts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[VSIdentityProviderStorefrontParser providersByStorefront](self, "providersByStorefront");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[VSIdentityProviderStorefrontParser identityProvidersByStorefront](self, "identityProvidersByStorefront");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[VSIdentityProviderStorefrontParser storefrontsByCountryCode](self, "storefrontsByCountryCode", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v7, "addObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (id)providersForStorefront:(id)a3
{
  return -[VSIdentityProviderStorefrontParser providersForStorefront:featuredOnly:](self, "providersForStorefront:featuredOnly:", a3, 0);
}

- (id)featuredProvidersForStorefront:(id)a3
{
  return -[VSIdentityProviderStorefrontParser providersForStorefront:featuredOnly:](self, "providersForStorefront:featuredOnly:", a3, 1);
}

- (id)providersForStorefront:(id)a3 featuredOnly:(BOOL)a4
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v18;
  id obj;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v20 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[VSIdentityProviderStorefrontParser allIdentityProviders](self, "allIdentityProviders");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v7, "storefronts");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v13, "storefrontTwoCharCode");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqualToString:", v5);

              if (v15)
              {
                if (!v20 || objc_msgSend(v13, "isFeatured"))
                  objc_msgSend(v18, "addObject:", v7);
                goto LABEL_18;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v10)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }

  v16 = (void *)objc_msgSend(v18, "copy");
  return v16;
}

- (id)updateFeaturedStorefronts:(id)a3 withCurrentStorefrontCodeOrNil:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "identitifer", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v6);

          objc_msgSend(v13, "setIsFeatured:", v15);
          objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v16 = (id)objc_msgSend(v7, "copy");
  }
  else
  {
    v16 = v5;
  }

  return v16;
}

- (NSArray)allIdentityProviders
{
  return self->_allIdentityProviders;
}

- (void)setAllIdentityProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)allStorefronts
{
  return self->_allStorefronts;
}

- (NSDictionary)providersByStorefront
{
  return self->_providersByStorefront;
}

- (void)setProvidersByStorefront:(id)a3
{
  objc_storeStrong((id *)&self->_providersByStorefront, a3);
}

- (NSDictionary)storefrontsByCountryCode
{
  return self->_storefrontsByCountryCode;
}

- (void)setStorefrontsByCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontsByCountryCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontsByCountryCode, 0);
  objc_storeStrong((id *)&self->_providersByStorefront, 0);
  objc_storeStrong((id *)&self->_allStorefronts, 0);
  objc_storeStrong((id *)&self->_allIdentityProviders, 0);
}

@end
