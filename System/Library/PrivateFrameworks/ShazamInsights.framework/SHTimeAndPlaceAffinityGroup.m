@implementation SHTimeAndPlaceAffinityGroup

- (SHTimeAndPlaceAffinityGroup)initWithRegions:(id)a3 affinityGroup:(id)a4
{
  id v7;
  id v8;
  SHTimeAndPlaceAffinityGroup *v9;
  SHTimeAndPlaceAffinityGroup *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHTimeAndPlaceAffinityGroup;
  v9 = -[SHTimeAndPlaceAffinityGroup init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_regions, a3);
    objc_storeStrong((id *)&v10->_affinityGroup, a4);
  }

  return v10;
}

- (NSDictionary)geohashKeyedRegions
{
  NSDictionary *geohashKeyedRegions;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  geohashKeyedRegions = self->_geohashKeyedRegions;
  if (!geohashKeyedRegions)
  {
    v4 = (void *)MEMORY[0x24BDBCED8];
    -[SHTimeAndPlaceAffinityGroup regions](self, "regions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SHTimeAndPlaceAffinityGroup regions](self, "regions", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(v12, "geohash");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "geohash");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v15 = (NSDictionary *)objc_msgSend(v6, "copy");
    v16 = self->_geohashKeyedRegions;
    self->_geohashKeyedRegions = v15;

    geohashKeyedRegions = self->_geohashKeyedRegions;
  }
  return geohashKeyedRegions;
}

- (id)regionsForGeohash:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SHTimeAndPlaceAffinityGroup regions](self, "regions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "geohash");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasPrefix:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v5, "count") && objc_msgSend(v4, "length"))
  {
    v16 = 0;
    v17 = 0;
    while (1)
    {
      objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") + v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHTimeAndPlaceAffinityGroup geohashKeyedRegions](self, "geohashKeyedRegions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        break;

      ++v17;
      --v16;
      if (v17 == objc_msgSend(v4, "length"))
        goto LABEL_11;
    }
    objc_msgSend(v5, "addObject:", v20);

  }
LABEL_11:
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (NSArray)regions
{
  return self->_regions;
}

- (SHAffinityGroup)affinityGroup
{
  return self->_affinityGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affinityGroup, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_geohashKeyedRegions, 0);
}

@end
