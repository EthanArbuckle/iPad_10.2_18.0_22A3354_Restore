@implementation TBLocationFetchRequestDescriptor

- (unint64_t)type
{
  return self->_type;
}

- (TBLocalFetchRequestDescriptor)localFetchDescriptor
{
  return self->_localFetchDescriptor;
}

- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4 radius:(double)a5 maxCacheAge:(id)a6
{
  id v11;
  TBLocationFetchRequestDescriptor *v12;
  TBGloriaTile *v13;
  TBGloriaTile *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  TBLocalFetchRequestDescriptor *v23;
  void *v24;
  uint64_t v25;
  TBLocalFetchRequestDescriptor *localFetchDescriptor;
  TBLocalFetchRequestDescriptor *v27;
  void *v28;
  uint64_t v29;
  TBLocalFetchRequestDescriptor *preferLocalFetchDescriptor;
  TBLocationFetchRequestDescriptor *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v37.receiver = self;
  v37.super_class = (Class)TBLocationFetchRequestDescriptor;
  v12 = -[TBLocationFetchRequestDescriptor init](&v37, sel_init);
  v12->_latitude = a3;
  v12->_longitude = a4;
  v12->_type = 2;
  objc_storeStrong((id *)&v12->_maxCacheAge, a6);
  v13 = -[TBGloriaTile initWithLat:lng:zoom:]([TBGloriaTile alloc], "initWithLat:lng:zoom:", +[TBGloriaTile defaultZoomLevel](TBGloriaTile, "defaultZoomLevel"), a3, a4);
  v14 = v13;
  if (v13)
  {
    v12->_primaryTileKey = -[TBGloriaTile key](v13, "key");
    NSLog(CFSTR("%s: search radius %f"), "-[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:]", *(_QWORD *)&a5);
    -[TBGloriaTile neighborTileKeysWithRadius:](v14, "neighborTileKeysWithRadius:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          +[TBTileItemDescriptor tileItemDescriptorWithKey:](TBTileItemDescriptor, "tileItemDescriptorWithKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v19);
    }

    objc_storeStrong((id *)&v12->_tileItems, v16);
    v23 = [TBLocalFetchRequestDescriptor alloc];
    -[TBLocationFetchRequestDescriptor _localFetchRequest](v12, "_localFetchRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v23, "initWithFetchRequest:", v24);
    localFetchDescriptor = v12->_localFetchDescriptor;
    v12->_localFetchDescriptor = (TBLocalFetchRequestDescriptor *)v25;

    v27 = [TBLocalFetchRequestDescriptor alloc];
    -[TBLocationFetchRequestDescriptor _preferLocalCacheFetchRequest](v12, "_preferLocalCacheFetchRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v27, "initWithFetchRequest:", v28);
    preferLocalFetchDescriptor = v12->_preferLocalFetchDescriptor;
    v12->_preferLocalFetchDescriptor = (TBLocalFetchRequestDescriptor *)v29;

  }
  else
  {
    NSLog(CFSTR("%s: failed to create gloria tile"), "-[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:]");
    v17 = 0;
    v16 = 0;
    v28 = v12;
    v12 = 0;
  }

  v31 = v12;
  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TBLocalFetchRequestDescriptor *v11;
  void *v12;
  TBLocalFetchRequestDescriptor *v13;
  TBLocalFetchRequestDescriptor *v14;
  void *v15;
  TBLocalFetchRequestDescriptor *v16;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[TBLocationFetchRequestDescriptor latitude](self, "latitude");
  objc_msgSend(v5, "setLatitude:");
  -[TBLocationFetchRequestDescriptor longitude](self, "longitude");
  objc_msgSend(v5, "setLongitude:");
  objc_msgSend(v5, "setType:", -[TBLocationFetchRequestDescriptor type](self, "type"));
  objc_msgSend(v5, "maxCacheAge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TBLocationFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
    objc_msgSend(v5, "setMaxCacheAge:", v8);

  }
  objc_msgSend(v5, "setPrimaryTileKey:", -[TBLocationFetchRequestDescriptor primaryTileKey](self, "primaryTileKey"));
  -[TBLocationFetchRequestDescriptor tileItems](self, "tileItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  objc_msgSend(v5, "setTileItems:", v10);

  v11 = [TBLocalFetchRequestDescriptor alloc];
  -[TBLocationFetchRequestDescriptor _localFetchRequest](self, "_localFetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v11, "initWithFetchRequest:", v12);
  objc_msgSend(v5, "setLocalFetchDescriptor:", v13);

  v14 = [TBLocalFetchRequestDescriptor alloc];
  -[TBLocationFetchRequestDescriptor _preferLocalCacheFetchRequest](self, "_preferLocalCacheFetchRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v14, "initWithFetchRequest:", v15);
  objc_msgSend(v5, "setPreferLocalFetchDescriptor:", v16);

  return v5;
}

- (unint64_t)primaryTileKey
{
  return self->_primaryTileKey;
}

- (id)_localFetchRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C97B48];
  +[TBTileMO entityName](TBTileMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TBLocationFetchRequestDescriptor localFetchPredicate](self, "localFetchPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  return v5;
}

- (NSPredicate)localFetchPredicate
{
  NSPredicate *localFetchPredicate;
  void *v4;
  NSPredicate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSPredicate *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  localFetchPredicate = self->_localFetchPredicate;
  if (!localFetchPredicate)
  {
    -[TBLocationFetchRequestDescriptor tileItems](self, "tileItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tilePredicate");
    v5 = (NSPredicate *)objc_claimAutoreleasedReturnValue();

    -[TBLocationFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3528];
      v8 = (void *)MEMORY[0x1E0CB3880];
      -[TBLocationFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicateWithFormat:", CFSTR("created >= %@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      v15[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "andPredicateWithSubpredicates:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (NSPredicate *)v12;
    }
    v13 = self->_localFetchPredicate;
    self->_localFetchPredicate = v5;

    localFetchPredicate = self->_localFetchPredicate;
  }
  return localFetchPredicate;
}

- (id)_preferLocalCacheFetchRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[TBTileMO entityName](TBTileMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TBLocationFetchRequestDescriptor tileItems](self, "tileItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tilePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TBLocationFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3528];
    v10 = (void *)MEMORY[0x1E0CB3880];
    -[TBLocationFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("created > %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "andPredicateWithSubpredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v14);

  }
  objc_msgSend(v5, "setResultType:", 2);
  objc_msgSend(v5, "setPropertiesToFetch:", &unk_1E8863F38);

  return v5;
}

- (NSDate)maxCacheAge
{
  return self->_maxCacheAge;
}

- (NSSet)tileItems
{
  return self->_tileItems;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setTileItems:(id)a3
{
  objc_storeStrong((id *)&self->_tileItems, a3);
}

- (void)setPrimaryTileKey:(unint64_t)a3
{
  self->_primaryTileKey = a3;
}

- (void)setPreferLocalFetchDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_preferLocalFetchDescriptor, a3);
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (void)setLocalFetchDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_localFetchDescriptor, a3);
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileItems, 0);
  objc_storeStrong((id *)&self->_preferLocalFetchDescriptor, 0);
  objc_storeStrong((id *)&self->_localFetchDescriptor, 0);
  objc_storeStrong((id *)&self->_maxCacheAge, 0);
  objc_storeStrong((id *)&self->_remoteRequest, 0);
  objc_storeStrong((id *)&self->_localFetchPredicate, 0);
}

- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor
{
  return self->_preferLocalFetchDescriptor;
}

- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4 maxCacheAge:(id)a5
{
  id v8;
  double v9;
  TBLocationFetchRequestDescriptor *v10;

  v8 = a5;
  +[TBDefaults tileSearchRadius](TBDefaults, "tileSearchRadius");
  v10 = -[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:](self, "initWithLatitude:longitude:radius:maxCacheAge:", v8, a3, a4, v9);

  return v10;
}

- (TBLocationFetchRequestDescriptor)initWithLatitude:(double)a3 longitude:(double)a4
{
  double v7;

  +[TBDefaults tileSearchRadius](TBDefaults, "tileSearchRadius");
  return -[TBLocationFetchRequestDescriptor initWithLatitude:longitude:radius:maxCacheAge:](self, "initWithLatitude:longitude:radius:maxCacheAge:", 0, a3, a4, v7);
}

- (PBCodable)remoteRequest
{
  return 0;
}

- (Class)remoteRequestClass
{
  return 0;
}

- (void)setLocalFetchPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_localFetchPredicate, a3);
}

- (void)setMaxCacheAge:(id)a3
{
  objc_storeStrong((id *)&self->_maxCacheAge, a3);
}

@end
