@implementation SHStreamingProviders

- (SHStreamingProviders)initWithResponse:(id)a3
{
  id v4;
  SHStreamingProviders *v5;
  SHStreamingProviders *v6;
  uint64_t v7;
  NSDictionary *providersKeyedByBundleID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHStreamingProviders;
  v5 = -[SHStreamingProviders init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SHStreamingProviders buildStreamingProvidersFromResponseArray:](v5, "buildStreamingProvidersFromResponseArray:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    providersKeyedByBundleID = v6->_providersKeyedByBundleID;
    v6->_providersKeyedByBundleID = (NSDictionary *)v7;

  }
  return v6;
}

- (id)buildStreamingProvidersFromResponseArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setValue:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (id)availableBundleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[SHStreamingProviders providersKeyedByBundleID](self, "providersKeyedByBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)availableStreamingProviders
{
  void *v2;
  int64_t v3;

  -[SHStreamingProviders providersKeyedByBundleID](self, "providersKeyedByBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)streamingProviderForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SHStreamingProviders providersKeyedByBundleID](self, "providersKeyedByBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)providerNameForBundleID:(id)a3
{
  void *v3;
  void *v4;

  -[SHStreamingProviders streamingProviderForBundleID:](self, "streamingProviderForBundleID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("providerName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)songURIForBundleID:(id)a3
{
  void *v3;
  void *v4;

  -[SHStreamingProviders streamingProviderForBundleID:](self, "streamingProviderForBundleID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("songURI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)searchURLForBundleID:(id)a3 title:(id)a4 artist:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SHTokenizedURL *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  -[SHStreamingProviders songURIForBundleID:](self, "songURIForBundleID:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SHTokenizedURL initWithString:]([SHTokenizedURL alloc], "initWithString:", v10);
  -[SHTokenizedURL updateToken:withValue:](v11, "updateToken:withValue:", 13, v9);

  -[SHTokenizedURL updateToken:withValue:](v11, "updateToken:withValue:", 14, v8);
  -[SHTokenizedURL URLRepresentation](v11, "URLRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDictionary)providersKeyedByBundleID
{
  return self->_providersKeyedByBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providersKeyedByBundleID, 0);
}

@end
