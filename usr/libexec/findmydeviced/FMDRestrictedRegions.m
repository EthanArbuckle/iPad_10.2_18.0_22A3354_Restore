@implementation FMDRestrictedRegions

+ (id)sharedInstance
{
  if (qword_1003068A0 != -1)
    dispatch_once(&qword_1003068A0, &stru_1002C4B48);
  return (id)qword_100306898;
}

- (FMDRestrictedRegions)init
{
  FMDRestrictedRegions *v2;
  FMDRestrictedRegions *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDRestrictedRegions;
  v2 = -[FMDRestrictedRegions init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[FMDRestrictedRegions _setupRegions](v2, "_setupRegions");
    -[FMDRestrictedRegions _setupSKUs](v3, "_setupSKUs");
  }
  return v3;
}

- (BOOL)isRestrictedLocationWithLatitude:(double)a3 longitude:(double)a4
{
  void *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (objc_msgSend(v7, "isInternalBuild"))
  {
    v8 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("simulateRestrictedRegionPresence"), kFMDNotBackedUpPrefDomain);

    if ((v8 & 1) != 0)
      return 1;
  }
  else
  {

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRestrictedRegions regions](self, "regions", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "containsCoordinate:", a3, a4) & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRestrictedRegions fineKoreaRegion](self, "fineKoreaRegion"));
          v9 = objc_msgSend(v15, "containsCoordinate:", a3, a4);

          goto LABEL_15;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)_setupRegions
{
  NSMutableArray *v3;
  NSMutableArray *regions;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  regions = self->_regions;
  self->_regions = v3;

  v5 = objc_alloc_init((Class)GEOMapRegion);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(&off_1002D8F78, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(&off_1002D8F78);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
        objc_msgSend(v11, "doubleValue");
        v13 = v12;

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        v17 = objc_msgSend(objc_alloc((Class)GEOLatLng), "initWithLatitude:longitude:", v13, v16);
        objc_msgSend(v5, "addVertex:", v17);

      }
      v7 = objc_msgSend(&off_1002D8F78, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRestrictedRegions regions](self, "regions"));
  objc_msgSend(v18, "addObject:", v5);

}

- (GEOMapRegion)fineKoreaRegion
{
  if (qword_1003068B0 != -1)
    dispatch_once(&qword_1003068B0, &stru_1002C4B68);
  return (GEOMapRegion *)(id)qword_1003068A8;
}

- (void)_setupSKUs
{
  NSMutableSet *v3;
  NSMutableSet *sku;

  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  sku = self->_sku;
  self->_sku = v3;

  -[NSMutableSet addObject:](self->_sku, "addObject:", CFSTR("KH"));
}

- (BOOL)isRestrictedSKU
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (objc_msgSend(v3, "isInternalBuild"))
  {
    v4 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("simulateRestrictedRegionPresence"), kFMDNotBackedUpPrefDomain);

    if ((v4 & 1) != 0)
      return 1;
  }
  else
  {

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRestrictedRegions currentDeviceSKURegion](self, "currentDeviceSKURegion"));

  if (!v6)
  {
    v7 = (void *)MGCopyAnswer(CFSTR("h63QSdBCiT/z0WU6rdQv6Q"), 0);
    -[FMDRestrictedRegions setCurrentDeviceSKURegion:](self, "setCurrentDeviceSKURegion:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRestrictedRegions sku](self, "sku"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRestrictedRegions currentDeviceSKURegion](self, "currentDeviceSKURegion"));
  v10 = objc_msgSend(v8, "containsObject:", v9);

  return v10;
}

- (NSMutableArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_storeStrong((id *)&self->_regions, a3);
}

- (NSMutableSet)sku
{
  return self->_sku;
}

- (void)setSku:(id)a3
{
  objc_storeStrong((id *)&self->_sku, a3);
}

- (NSString)currentDeviceSKURegion
{
  return self->_currentDeviceSKURegion;
}

- (void)setCurrentDeviceSKURegion:(id)a3
{
  objc_storeStrong((id *)&self->_currentDeviceSKURegion, a3);
}

- (void)setFineKoreaRegion:(id)a3
{
  objc_storeStrong((id *)&self->_fineKoreaRegion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fineKoreaRegion, 0);
  objc_storeStrong((id *)&self->_currentDeviceSKURegion, 0);
  objc_storeStrong((id *)&self->_sku, 0);
  objc_storeStrong((id *)&self->_regions, 0);
}

@end
