@implementation GEOMapServiceTraits

- (void)addKnownClientResolvedTypesIfAvailable:(id)a3 clientTypeResolver:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), "intValue");
        v13 = v12;
        if (((_DWORD)v12 - 1) >= 6)
          v14 = 0;
        else
          v14 = v12;
        if (objc_msgSend(v7, "hasObjectWithType:", v14))
          -[GEOMapServiceTraits addKnownClientResolvedType:](self, "addKnownClientResolvedType:", v13);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

+ (void)addKnownClientResolvedTypesIfAvailable:(id)a3 clientTypeResolver:(id)a4 toTraits:(id)a5
{
  _objc_msgSend(a5, "addKnownClientResolvedTypesIfAvailable:clientTypeResolver:", a3, a4);
}

+ (void)addCommonKnownClientResolvedTypesIfAvailableWithClientTypeResolver:(id)a3 toTraits:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = objc_msgSend(&off_101273830, "mutableCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  if (objc_msgSend(v8, "isLocationServicesApproved")
    && objc_msgSend(v8, "isAuthorizedForPreciseLocation"))
  {
    objc_msgSend(v10, "addObject:", &off_10126DDF8);
  }
  if (GEOConfigGetBOOL(MapsConfig_MapsSearchEnableParkedCarResult, off_1014B2E28))
    objc_msgSend(v10, "addObject:", &off_10126DE10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
  objc_msgSend(a1, "addKnownClientResolvedTypesIfAvailable:clientTypeResolver:toTraits:", v9, v7, v6);

}

@end
