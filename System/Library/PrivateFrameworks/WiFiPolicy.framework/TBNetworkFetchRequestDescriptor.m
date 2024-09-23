@implementation TBNetworkFetchRequestDescriptor

- (unint64_t)type
{
  return self->_type;
}

- (TBLocalFetchRequestDescriptor)localFetchDescriptor
{
  return self->_localFetchDescriptor;
}

- (NSSet)bssids
{
  return self->_bssids;
}

- (TBNetworkFetchRequestDescriptor)initWithBSSIDs:(id)a3
{
  return -[TBNetworkFetchRequestDescriptor initWithBSSIDs:maxCacheAge:](self, "initWithBSSIDs:maxCacheAge:", a3, 0);
}

- (TBNetworkFetchRequestDescriptor)initWithBSSIDs:(id)a3 maxCacheAge:(id)a4
{
  id v7;
  id v8;
  TBNetworkFetchRequestDescriptor *v9;
  NSSet *bssids;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  TBLocalFetchRequestDescriptor *v15;
  TBLocalFetchRequestDescriptor *localFetchDescriptor;
  TBLocalFetchRequestDescriptor *v17;
  void *preferLocalFetchDescriptor;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TBNetworkFetchRequestDescriptor;
  v9 = -[TBNetworkFetchRequestDescriptor init](&v20, sel_init);
  objc_storeStrong((id *)&v9->_bssids, a3);
  bssids = v9->_bssids;
  if (bssids && -[NSSet count](bssids, "count"))
  {
    v9->_type = 1;
    objc_storeStrong((id *)&v9->_maxCacheAge, a4);
    v11 = objc_alloc(MEMORY[0x1E0C97B48]);
    +[TBAccessPointMO entityName](TBAccessPointMO, "entityName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithEntityName:", v12);

    -[TBNetworkFetchRequestDescriptor localFetchPredicate](v9, "localFetchPredicate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v14);

    v15 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]([TBLocalFetchRequestDescriptor alloc], "initWithFetchRequest:", v13);
    localFetchDescriptor = v9->_localFetchDescriptor;
    v9->_localFetchDescriptor = v15;

    v17 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]([TBLocalFetchRequestDescriptor alloc], "initWithFetchRequest:", v13);
    preferLocalFetchDescriptor = v9->_preferLocalFetchDescriptor;
    v9->_preferLocalFetchDescriptor = v17;
  }
  else
  {
    NSLog(CFSTR("%s: bssids is nil or empty"), "-[TBNetworkFetchRequestDescriptor initWithBSSIDs:maxCacheAge:]");
    v13 = 0;
    preferLocalFetchDescriptor = v9;
    v9 = 0;
  }

  return v9;
}

- (NSPredicate)localFetchPredicate
{
  NSPredicate *localFetchPredicate;
  void *v4;
  void *v5;
  NSPredicate *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSPredicate *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  localFetchPredicate = self->_localFetchPredicate;
  if (!localFetchPredicate)
  {
    v4 = (void *)MEMORY[0x1E0CB3880];
    -[NSSet reformatBSSIDs](self->_bssids, "reformatBSSIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateWithFormat:", CFSTR("bssid IN %@"), v5);
    v6 = (NSPredicate *)objc_claimAutoreleasedReturnValue();

    -[TBNetworkFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3528];
      v9 = (void *)MEMORY[0x1E0CB3880];
      -[TBNetworkFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateWithFormat:", CFSTR("created > %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      v16[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "andPredicateWithSubpredicates:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (NSPredicate *)v13;
    }
    v14 = self->_localFetchPredicate;
    self->_localFetchPredicate = v6;

    localFetchPredicate = self->_localFetchPredicate;
  }
  return localFetchPredicate;
}

- (NSDate)maxCacheAge
{
  return self->_maxCacheAge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bssids, 0);
  objc_storeStrong((id *)&self->_preferLocalFetchDescriptor, 0);
  objc_storeStrong((id *)&self->_localFetchDescriptor, 0);
  objc_storeStrong((id *)&self->_maxCacheAge, 0);
  objc_storeStrong((id *)&self->_remoteRequest, 0);
  objc_storeStrong((id *)&self->_localFetchPredicate, 0);
}

- (TBNetworkFetchRequestDescriptor)init
{
  TBNetworkFetchRequestDescriptor *v2;
  TBNetworkFetchRequestDescriptor *v3;
  id v4;
  void *v5;
  void *v6;
  TBLocalFetchRequestDescriptor *v7;
  TBLocalFetchRequestDescriptor *localFetchDescriptor;
  TBLocalFetchRequestDescriptor *v9;
  TBLocalFetchRequestDescriptor *preferLocalFetchDescriptor;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TBNetworkFetchRequestDescriptor;
  v2 = -[TBNetworkFetchRequestDescriptor init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_type = 1;
    v4 = objc_alloc(MEMORY[0x1E0C97B48]);
    +[TBAccessPointMO entityName](TBAccessPointMO, "entityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithEntityName:", v5);

    v7 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]([TBLocalFetchRequestDescriptor alloc], "initWithFetchRequest:", v6);
    localFetchDescriptor = v3->_localFetchDescriptor;
    v3->_localFetchDescriptor = v7;

    v9 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]([TBLocalFetchRequestDescriptor alloc], "initWithFetchRequest:", v6);
    preferLocalFetchDescriptor = v3->_preferLocalFetchDescriptor;
    v3->_preferLocalFetchDescriptor = v9;

  }
  return v3;
}

- (GEOWiFiQualityNetworkSearch)remoteRequest
{
  GEOWiFiQualityNetworkSearch *remoteRequest;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  GEOWiFiQualityNetworkSearch *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  remoteRequest = self->_remoteRequest;
  if (!remoteRequest)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D27748]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[TBNetworkFetchRequestDescriptor bssids](self, "bssids", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
          v11 = objc_alloc_init(MEMORY[0x1E0D27718]);
          objc_msgSend(v10, "reformatBSSID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setIdentifier:", v12);

          v13 = objc_alloc_init(MEMORY[0x1E0D27738]);
          objc_msgSend(v13, "addBss:", v11);
          objc_msgSend(v4, "addEss:", v13);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v14 = self->_remoteRequest;
    self->_remoteRequest = (GEOWiFiQualityNetworkSearch *)v4;

    remoteRequest = self->_remoteRequest;
  }
  return remoteRequest;
}

- (Class)remoteRequestClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TBLocalFetchRequestDescriptor *v16;
  TBLocalFetchRequestDescriptor *v17;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[TBNetworkFetchRequestDescriptor bssids](self, "bssids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBssids:", v7);

  objc_msgSend(v5, "setType:", -[TBNetworkFetchRequestDescriptor type](self, "type"));
  -[TBNetworkFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TBNetworkFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
    objc_msgSend(v5, "setMaxCacheAge:", v10);

  }
  v11 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[TBAccessPointMO entityName](TBAccessPointMO, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithEntityName:", v12);

  -[TBNetworkFetchRequestDescriptor localFetchPredicate](self, "localFetchPredicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v13, "setPredicate:", v15);

  v16 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]([TBLocalFetchRequestDescriptor alloc], "initWithFetchRequest:", v13);
  objc_msgSend(v5, "setLocalFetchDescriptor:", v16);

  v17 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]([TBLocalFetchRequestDescriptor alloc], "initWithFetchRequest:", v13);
  objc_msgSend(v5, "setPreferLocalFetchDescriptor:", v17);

  return v5;
}

- (void)setLocalFetchPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_localFetchPredicate, a3);
}

- (void)setRemoteRequest:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRequest, a3);
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setMaxCacheAge:(id)a3
{
  objc_storeStrong((id *)&self->_maxCacheAge, a3);
}

- (void)setLocalFetchDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_localFetchDescriptor, a3);
}

- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor
{
  return self->_preferLocalFetchDescriptor;
}

- (void)setPreferLocalFetchDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_preferLocalFetchDescriptor, a3);
}

- (void)setBssids:(id)a3
{
  objc_storeStrong((id *)&self->_bssids, a3);
}

@end
