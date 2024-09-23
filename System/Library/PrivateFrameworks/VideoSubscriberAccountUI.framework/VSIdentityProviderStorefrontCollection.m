@implementation VSIdentityProviderStorefrontCollection

- (VSIdentityProviderStorefrontCollection)init
{
  VSIdentityProviderStorefrontCollection *v2;
  NSMutableArray *v3;
  NSMutableArray *mutableFeaturedIdentityProviders;
  NSMutableArray *v5;
  NSMutableArray *mutableAllIdentityProviders;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSIdentityProviderStorefrontCollection;
  v2 = -[VSIdentityProviderStorefrontCollection init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableFeaturedIdentityProviders = v2->_mutableFeaturedIdentityProviders;
    v2->_mutableFeaturedIdentityProviders = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableAllIdentityProviders = v2->_mutableAllIdentityProviders;
    v2->_mutableAllIdentityProviders = v5;

  }
  return v2;
}

- (id)featuredIdentityProviders
{
  void *v2;
  void *v3;

  -[VSIdentityProviderStorefrontCollection mutableFeaturedIdentityProviders](self, "mutableFeaturedIdentityProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)allIdentityProviders
{
  void *v2;
  void *v3;

  -[VSIdentityProviderStorefrontCollection mutableAllIdentityProviders](self, "mutableAllIdentityProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)featureProvidersInCurrentStorefront
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[VSIdentityProviderStorefrontCollection storefrontTwoCharCode](self, "storefrontTwoCharCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[VSIdentityProviderStorefrontCollection featuredIdentityProviders](self, "featuredIdentityProviders");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v5, "storefronts");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v18 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
              objc_msgSend(v11, "storefrontTwoCharCode");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "isEqualToString:", v3))
              {
                objc_msgSend(v5, "rankForSorting");
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                if (v13)
                  continue;
                objc_msgSend(v11, "sortOrdinal");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setRankForSorting:", v12);
              }

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v8);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

}

- (NSString)storefrontTwoCharCode
{
  return self->_storefrontTwoCharCode;
}

- (void)setStorefrontTwoCharCode:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontTwoCharCode, a3);
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDisplayName, a3);
}

- (NSMutableArray)mutableFeaturedIdentityProviders
{
  return self->_mutableFeaturedIdentityProviders;
}

- (void)setMutableFeaturedIdentityProviders:(id)a3
{
  objc_storeStrong((id *)&self->_mutableFeaturedIdentityProviders, a3);
}

- (NSMutableArray)mutableAllIdentityProviders
{
  return self->_mutableAllIdentityProviders;
}

- (void)setMutableAllIdentityProviders:(id)a3
{
  objc_storeStrong((id *)&self->_mutableAllIdentityProviders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAllIdentityProviders, 0);
  objc_storeStrong((id *)&self->_mutableFeaturedIdentityProviders, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_storefrontTwoCharCode, 0);
}

@end
