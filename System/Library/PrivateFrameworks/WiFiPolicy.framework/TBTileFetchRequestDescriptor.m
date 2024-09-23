@implementation TBTileFetchRequestDescriptor

- (TBTileFetchRequestDescriptor)initWithTileItems:(id)a3
{
  return -[TBTileFetchRequestDescriptor initWithTileItems:maxCacheAge:](self, "initWithTileItems:maxCacheAge:", a3, 0);
}

- (TBTileFetchRequestDescriptor)initWithTileItems:(id)a3 maxCacheAge:(id)a4
{
  id v7;
  id v8;
  TBTileFetchRequestDescriptor *v9;
  TBTileFetchRequestDescriptor *v10;
  id v11;
  void *v12;
  void *v13;
  TBLocalFetchRequestDescriptor *v14;
  TBLocalFetchRequestDescriptor *localFetchDescriptor;
  void *v16;
  TBLocalFetchRequestDescriptor *v17;
  void *v18;
  uint64_t v19;
  TBLocalFetchRequestDescriptor *preferLocalFetchDescriptor;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TBTileFetchRequestDescriptor;
  v9 = -[TBTileFetchRequestDescriptor init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tileItems, a3);
    objc_storeStrong((id *)&v10->_maxCacheAge, a4);
    v10->_type = 3;
    v11 = objc_alloc(MEMORY[0x1E0C97B48]);
    +[TBTileMO entityName](TBTileMO, "entityName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithEntityName:", v12);

    v14 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]([TBLocalFetchRequestDescriptor alloc], "initWithFetchRequest:", v13);
    localFetchDescriptor = v10->_localFetchDescriptor;
    v10->_localFetchDescriptor = v14;

    -[TBTileFetchRequestDescriptor localFetchPredicate](v10, "localFetchPredicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v16);

    v17 = [TBLocalFetchRequestDescriptor alloc];
    -[TBTileFetchRequestDescriptor _preferLocalCacheFetchRequest](v10, "_preferLocalCacheFetchRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v17, "initWithFetchRequest:", v18);
    preferLocalFetchDescriptor = v10->_preferLocalFetchDescriptor;
    v10->_preferLocalFetchDescriptor = (TBLocalFetchRequestDescriptor *)v19;

  }
  return v10;
}

- (NSPredicate)localFetchPredicate
{
  void *v3;
  void *v4;
  NSPredicate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSPredicate *localFetchPredicate;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!self->_localFetchPredicate)
  {
    -[TBTileFetchRequestDescriptor tileItems](self, "tileItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[TBTileFetchRequestDescriptor tileItems](self, "tileItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tilePredicate");
      v5 = (NSPredicate *)objc_claimAutoreleasedReturnValue();

      -[TBTileFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0CB3528];
        v8 = (void *)MEMORY[0x1E0CB3880];
        -[TBTileFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
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
      localFetchPredicate = self->_localFetchPredicate;
      self->_localFetchPredicate = v5;

    }
  }
  return self->_localFetchPredicate;
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

  -[TBTileFetchRequestDescriptor tileItems](self, "tileItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tilePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TBTileFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3528];
    v10 = (void *)MEMORY[0x1E0CB3880];
    -[TBTileFetchRequestDescriptor maxCacheAge](self, "maxCacheAge");
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
  objc_msgSend(v5, "setPropertiesToFetch:", &unk_1E8863F50);

  return v5;
}

- (PBCodable)remoteRequest
{
  return 0;
}

- (Class)remoteRequestClass
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  TBLocalFetchRequestDescriptor *v11;
  TBLocalFetchRequestDescriptor *v12;
  void *v13;
  TBLocalFetchRequestDescriptor *v14;
  void *v15;
  void *v16;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[TBTileFetchRequestDescriptor tileItems](self, "tileItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setTileItems:", v7);

  objc_msgSend(v5, "setType:", -[TBTileFetchRequestDescriptor type](self, "type"));
  v8 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[TBTileMO entityName](TBTileMO, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithEntityName:", v9);

  v11 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:]([TBLocalFetchRequestDescriptor alloc], "initWithFetchRequest:", v10);
  objc_msgSend(v5, "setLocalFetchDescriptor:", v11);

  v12 = [TBLocalFetchRequestDescriptor alloc];
  -[TBTileFetchRequestDescriptor _preferLocalCacheFetchRequest](self, "_preferLocalCacheFetchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TBLocalFetchRequestDescriptor initWithFetchRequest:](v12, "initWithFetchRequest:", v13);
  objc_msgSend(v5, "setPreferLocalFetchDescriptor:", v14);

  -[TBTileFetchRequestDescriptor localFetchPredicate](self, "localFetchPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
  objc_msgSend(v10, "setPredicate:", v16);

  return v5;
}

- (TBLocalFetchRequestDescriptor)localFetchDescriptor
{
  return self->_localFetchDescriptor;
}

- (void)setLocalFetchDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_localFetchDescriptor, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSSet)tileItems
{
  return self->_tileItems;
}

- (void)setTileItems:(id)a3
{
  objc_storeStrong((id *)&self->_tileItems, a3);
}

- (TBLocalFetchRequestDescriptor)preferLocalFetchDescriptor
{
  return self->_preferLocalFetchDescriptor;
}

- (void)setPreferLocalFetchDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_preferLocalFetchDescriptor, a3);
}

- (void)setLocalFetchPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_localFetchPredicate, a3);
}

- (NSDate)maxCacheAge
{
  return self->_maxCacheAge;
}

- (void)setMaxCacheAge:(id)a3
{
  objc_storeStrong((id *)&self->_maxCacheAge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxCacheAge, 0);
  objc_storeStrong((id *)&self->_localFetchPredicate, 0);
  objc_storeStrong((id *)&self->_preferLocalFetchDescriptor, 0);
  objc_storeStrong((id *)&self->_tileItems, 0);
  objc_storeStrong((id *)&self->_localFetchDescriptor, 0);
}

@end
