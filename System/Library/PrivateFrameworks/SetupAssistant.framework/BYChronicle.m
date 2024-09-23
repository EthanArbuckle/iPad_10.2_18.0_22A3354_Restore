@implementation BYChronicle

- (BYChronicle)init
{
  BYChronicle *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *featureEntries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BYChronicle;
  v2 = -[BYChronicle init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    featureEntries = v2->_featureEntries;
    v2->_featureEntries = v3;

  }
  return v2;
}

- (BYChronicle)initWithDictionary:(id)a3
{
  id v4;
  BYChronicle *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  BYChronicleEntry *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[BYChronicle init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("features"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[BYChronicleEntry initWithDictionary:]([BYChronicleEntry alloc], "initWithDictionary:", v12);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_featureEntries, "setObject:forKeyedSubscript:", v13, v11);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  return v5;
}

- (void)recordFeatureShown:(unint64_t)a3
{
  BYChronicleEntry *v5;

  v5 = objc_alloc_init(BYChronicleEntry);
  -[BYChronicle addEntry:forFeature:](self, "addEntry:forFeature:", v5, a3);

}

- (void)addEntry:(id)a3 forFeature:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[BYChronicle featureEntries](self, "featureEntries");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (id)entryForFeature:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[BYChronicle featureEntries](self, "featureEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[BYChronicle featureEntries](self, "featureEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[BYChronicle featureEntries](self, "featureEntries", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v21[1] = CFSTR("data");
        v22[0] = v10;
        v21[0] = CFSTR("type");
        objc_msgSend(v12, "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v3, CFSTR("features"));
  return v16;
}

- (NSMutableDictionary)featureEntries
{
  return self->_featureEntries;
}

- (void)setFeatureEntries:(id)a3
{
  objc_storeStrong((id *)&self->_featureEntries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureEntries, 0);
}

@end
