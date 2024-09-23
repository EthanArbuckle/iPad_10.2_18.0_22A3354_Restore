@implementation PLRevGeoLocationInfo

- (PLRevGeoLocationInfo)initWithMapItem:(id)a3 postalAddress:(id)a4 addressString:(id)a5 countryCode:(id)a6 compoundNameInfo:(id)a7 compoundSecondaryNameInfo:(id)a8 isHome:(BOOL)a9 geoServiceProvider:(id)a10
{
  id v17;
  id v18;
  PLRevGeoLocationInfo *v19;
  PLRevGeoLocationInfo *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v17 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)PLRevGeoLocationInfo;
  v19 = -[PLRevGeoLocationInfo init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_mapItem, a3);
    objc_storeStrong((id *)&v20->_postalAddress, a4);
    objc_storeStrong((id *)&v20->_addressString, a5);
    objc_storeStrong((id *)&v20->_countryCode, a6);
    objc_storeStrong((id *)&v20->_compoundNameInfo, a7);
    objc_storeStrong((id *)&v20->_compoundSecondaryNameInfo, a8);
    v20->_isHome = a9;
    objc_storeStrong((id *)&v20->_geoServiceProvider, a10);
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PLRevGeoLocationInfo;
  -[PLRevGeoLocationInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ mapItem: %@, postalAddress: %@, countryCode: %@, addressString: %@, compoundNameInfo: %@, compoundSecondaryNameInfo: %@, mapItem: %d"), v4, self->_mapItem, self->_postalAddress, self->_addressString, self->_countryCode, self->_compoundNameInfo, self->_compoundSecondaryNameInfo, self->_isHome);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasMapItem
{
  return self->_mapItem != 0;
}

- (id)localizedDescription
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  PLRevGeoCompoundNameInfo *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PLRevGeoLocationInfo placeWithAnnotation:](self, "placeWithAnnotation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLRevGeoLocationInfo _namingOrderForAssetReverseGeoDescription](PLRevGeoLocationInfo, "_namingOrderForAssetReverseGeoDescription");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v3);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v27);
        objc_msgSend(v2, "bestPlaceInfoForOrderType:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          if (!v7)
          {
            v7 = v11;
            v6 = v10;
          }
          if (objc_msgSend(v12, "hasArea"))
          {
            objc_msgSend(v12, "maximumArea");
            if (v13 >= 500.0)
            {

              v6 = v10;
              v7 = v12;
              goto LABEL_16;
            }
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
LABEL_16:

  objc_msgSend(v7, "placeName");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    v31 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != 3)
    {
      v22 = 0;
LABEL_26:
      v25 = -[PLRevGeoCompoundNameInfo initWithNamePrefix:nameSuffix:sortedNames:isContinuation:suffixWhenPrefixOnly:]([PLRevGeoCompoundNameInfo alloc], "initWithNamePrefix:nameSuffix:sortedNames:isContinuation:suffixWhenPrefixOnly:", v22, 0, v16, 0, 0);
      -[PLRevGeoCompoundNameInfo localizedTitleForNameInfo](v25, "localizedTitleForNameInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_27;
    }
    objc_msgSend(v2, "bestPlaceInfoForOrderType:", 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "placeName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v15, "lowercaseString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "containsString:", v20))
      {

      }
      else
      {
        objc_msgSend(v15, "lowercaseString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "containsString:", v19);

        if ((v24 & 1) == 0)
        {
          objc_msgSend(v17, "placeName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
      }
    }
    v22 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v21 = 0;
LABEL_27:

  return v21;
}

- (id)placeNamesForLocalizedDetailedDescription
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PLRevGeoLocationInfo placeWithAnnotation:](self, "placeWithAnnotation:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  +[PLRevGeoLocationInfo _namingOrderForAssetDetailedReverseGeoDescription](PLRevGeoLocationInfo, "_namingOrderForAssetDetailedReverseGeoDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
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
        objc_msgSend(v3, "bestPlaceInfoForOrderType:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "unsignedIntegerValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "placeName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  if (-[PLRevGeoLocationInfo _locationInfoOrderForCurrentLocale](self, "_locationInfoOrderForCurrentLocale") == 1)
  {
    objc_msgSend(v4, "reversedOrderedSet");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v4;
  }
  v13 = v12;
  v14 = (void *)objc_msgSend(v12, "copy");

  return v14;
}

- (unint64_t)_locationInfoOrderForCurrentLocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageCode");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(&unk_1E3763AB8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    v10 = 1;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(&unk_1E3763AB8);
      if ((objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11)) & 1) != 0)
        break;
      if (v8 == ++v11)
      {
        v8 = objc_msgSend(&unk_1E3763AB8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasLocation
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[PLRevGeoLocationInfo compoundNameInfo](self, "compoundNameInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitleForNameInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = 1;
  }
  else
  {
    -[PLRevGeoLocationInfo compoundSecondaryNameInfo](self, "compoundSecondaryNameInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedSortedNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

- (id)placeWithAnnotation:(id)a3
{
  return +[PLRevGeoPlace placeWithMapItem:placeAnnotation:](PLRevGeoPlace, "placeWithMapItem:placeAnnotation:", self->_mapItem, a3);
}

- (BOOL)isEqual:(id)a3
{
  PLRevGeoLocationInfo *v4;
  PLRevGeoLocationInfo *v5;
  PLRevGeoMapItem *mapItem;
  uint64_t v7;
  void *v8;
  PLRevGeoMapItem *v9;
  void *v10;
  BOOL v11;
  NSString *addressString;
  uint64_t v13;
  void *v14;
  NSString *v15;
  void *v16;
  PLRevGeoCompoundNameInfo *compoundNameInfo;
  uint64_t v18;
  void *v19;
  PLRevGeoCompoundNameInfo *v20;
  void *v21;
  PLRevGeoCompoundNameInfo *compoundSecondaryNameInfo;
  uint64_t v23;
  void *v24;
  PLRevGeoCompoundNameInfo *v25;
  void *v26;
  _BOOL4 isHome;

  v4 = (PLRevGeoLocationInfo *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      mapItem = self->_mapItem;
      -[PLRevGeoLocationInfo mapItem](v5, "mapItem");
      v7 = objc_claimAutoreleasedReturnValue();
      if (mapItem == (PLRevGeoMapItem *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_mapItem;
        -[PLRevGeoLocationInfo mapItem](v5, "mapItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = -[PLRevGeoMapItem isEqual:](v9, "isEqual:", v10);

        if (!(_DWORD)v9)
          goto LABEL_19;
      }
      addressString = self->_addressString;
      -[PLRevGeoLocationInfo addressString](v5, "addressString");
      v13 = objc_claimAutoreleasedReturnValue();
      if (addressString == (NSString *)v13)
      {

      }
      else
      {
        v14 = (void *)v13;
        v15 = self->_addressString;
        -[PLRevGeoLocationInfo addressString](v5, "addressString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = -[NSString isEqualToString:](v15, "isEqualToString:", v16);

        if (!(_DWORD)v15)
          goto LABEL_19;
      }
      compoundNameInfo = self->_compoundNameInfo;
      -[PLRevGeoLocationInfo compoundNameInfo](v5, "compoundNameInfo");
      v18 = objc_claimAutoreleasedReturnValue();
      if (compoundNameInfo == (PLRevGeoCompoundNameInfo *)v18)
      {

      }
      else
      {
        v19 = (void *)v18;
        v20 = self->_compoundNameInfo;
        -[PLRevGeoLocationInfo compoundNameInfo](v5, "compoundNameInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = -[PLRevGeoCompoundNameInfo isEqual:](v20, "isEqual:", v21);

        if (!(_DWORD)v20)
          goto LABEL_19;
      }
      compoundSecondaryNameInfo = self->_compoundSecondaryNameInfo;
      -[PLRevGeoLocationInfo compoundSecondaryNameInfo](v5, "compoundSecondaryNameInfo");
      v23 = objc_claimAutoreleasedReturnValue();
      if (compoundSecondaryNameInfo == (PLRevGeoCompoundNameInfo *)v23)
      {

      }
      else
      {
        v24 = (void *)v23;
        v25 = self->_compoundSecondaryNameInfo;
        -[PLRevGeoLocationInfo compoundSecondaryNameInfo](v5, "compoundSecondaryNameInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v25) = -[PLRevGeoCompoundNameInfo isEqual:](v25, "isEqual:", v26);

        if (!(_DWORD)v25)
        {
LABEL_19:
          v11 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      isHome = self->_isHome;
      v11 = isHome == -[PLRevGeoLocationInfo isHome](v5, "isHome");
      goto LABEL_22;
    }
    v11 = 0;
  }
LABEL_23:

  return v11;
}

- (id)plistData
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  PLRevGeoLocationInfo *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[ERROR] Could not encode revGeoLocationData %@ with error:%@", buf, 0x16u);
    }

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 13, CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mapItem, CFSTR("mapItem"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_postalAddress, CFSTR("postalAddress"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_addressString, CFSTR("addressString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_compoundNameInfo, CFSTR("compoundNames"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_compoundSecondaryNameInfo, CFSTR("compoundSecondaryNames"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_geoServiceProvider, CFSTR("geoServiceProvider"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isHome, CFSTR("isHome"));

}

- (PLRevGeoLocationInfo)initWithCoder:(id)a3
{
  id v4;
  PLRevGeoLocationInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v4 = a3;
  if (+[PLRevGeoLocationInfo isInvalidWithCoder:](PLRevGeoLocationInfo, "isInvalidWithCoder:", v4))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postalAddress"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geoServiceProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addressString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compoundNames"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compoundSecondaryNames"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHome"));
    self = -[PLRevGeoLocationInfo initWithMapItem:postalAddress:addressString:countryCode:compoundNameInfo:compoundSecondaryNameInfo:isHome:geoServiceProvider:](self, "initWithMapItem:postalAddress:addressString:countryCode:compoundNameInfo:compoundSecondaryNameInfo:isHome:geoServiceProvider:", v6, v7, v9, v10, v11, v12, v14, v8);

    v5 = self;
  }

  return v5;
}

- (PLRevGeoMapItem)mapItem
{
  return self->_mapItem;
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)geoServiceProvider
{
  return self->_geoServiceProvider;
}

- (PLRevGeoCompoundNameInfo)compoundNameInfo
{
  return self->_compoundNameInfo;
}

- (PLRevGeoCompoundNameInfo)compoundSecondaryNameInfo
{
  return self->_compoundSecondaryNameInfo;
}

- (BOOL)isHome
{
  return self->_isHome;
}

- (void)setIsHome:(BOOL)a3
{
  self->_isHome = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundSecondaryNameInfo, 0);
  objc_storeStrong((id *)&self->_compoundNameInfo, 0);
  objc_storeStrong((id *)&self->_geoServiceProvider, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

+ (id)newDataFromRevGeoLocationInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_newRevGeoLocationInfoFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_namingOrderForAssetReverseGeoDescription
{
  return &unk_1E3763A88;
}

+ (id)_namingOrderForAssetDetailedReverseGeoDescription
{
  return &unk_1E3763AA0;
}

+ (id)infoFromPlistData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = a3;
    v9 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v9;
    if (!v5)
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "[ERROR] Could not decode revGeoLocationData with error:%@", buf, 0xCu);
      }

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (BOOL)isInvalidWithCoder:(id)a3
{
  return objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("version")) != 13;
}

+ (BOOL)isInvalidWithPlistData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  char v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3710];
  v5 = a3;
  v11 = 0;
  v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, &v11);

  v7 = v11;
  if (v7)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "[ERROR] Could not create unarchiver for revGeoLocationData with error:%@", buf, 0xCu);
    }

    v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(a1, "isInvalidWithCoder:", v6);
    objc_msgSend(v6, "finishDecoding");
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)locationWasResolvedWithBestRevGeoProvider
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  int v8;

  +[PLRevGeoLocationHelper currentRevGeoProvider](PLRevGeoLocationHelper, "currentRevGeoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRevGeoLocationInfo geoServiceProvider](self, "geoServiceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0
    || (v5 = +[PLRevGeoLocationHelper isAutoNaviRevGeoProvider:](PLRevGeoLocationHelper, "isAutoNaviRevGeoProvider:", v4), -[PLRevGeoLocationInfo countryCode](self, "countryCode"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = +[PLRevGeoLocationHelper isAutoNaviCountryCode:](PLRevGeoLocationHelper, "isAutoNaviCountryCode:", v6), v6, v5 == v7))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v8 = v7 ^ +[PLRevGeoLocationHelper isCurrentRevGeoProviderAutoNavi](PLRevGeoLocationHelper, "isCurrentRevGeoProviderAutoNavi");
  }

  return v8;
}

- (PLRevGeoLocationInfo)initWithGEOMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLRevGeoLocationInfo *v12;
  uint64_t v14;

  v4 = a3;
  +[PLRevGeoMapItem mapItemWithGEOMapItem:](PLRevGeoMapItem, "mapItemWithGEOMapItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geoAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postalAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addressObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fullAddressWithMultiline:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLRevGeoLocationInfo countryCodeWithGEOMapItem:](PLRevGeoLocationInfo, "countryCodeWithGEOMapItem:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLRevGeoLocationHelper currentRevGeoProvider](PLRevGeoLocationHelper, "currentRevGeoProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = 0;
  v12 = -[PLRevGeoLocationInfo initWithMapItem:postalAddress:addressString:countryCode:compoundNameInfo:compoundSecondaryNameInfo:isHome:geoServiceProvider:](self, "initWithMapItem:postalAddress:addressString:countryCode:compoundNameInfo:compoundSecondaryNameInfo:isHome:geoServiceProvider:", v5, v7, v9, v10, 0, 0, v14, v11);

  return v12;
}

+ (id)countryCodeWithGEOMapItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "geoAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "hasStructuredAddress"))
  {
    objc_msgSend(v4, "structuredAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasCountryCode"))
    {
      objc_msgSend(v5, "countryCode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
