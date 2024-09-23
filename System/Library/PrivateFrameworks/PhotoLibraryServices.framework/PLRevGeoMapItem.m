@implementation PLRevGeoMapItem

+ (id)placeInfoWithName:(id)a3 geoPlaceInfo:(id)a4 dominantOrderType:(unint64_t)a5
{
  id v7;
  id v8;
  PLRevGeoMapItemAdditionalPlaceInfo *v9;
  void *v10;
  double v11;
  double v12;
  PLRevGeoMapItemAdditionalPlaceInfo *v13;

  v7 = a4;
  v8 = a3;
  v9 = [PLRevGeoMapItemAdditionalPlaceInfo alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "placeType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "areaInMeters");
  v12 = v11;

  v13 = -[PLRevGeoMapItemAdditionalPlaceInfo initWithName:placeType:dominantOrderType:areaInSquareMeters:](v9, "initWithName:placeType:dominantOrderType:areaInSquareMeters:", v8, v10, a5, v12);
  return v13;
}

+ (id)sortedAdditionalPlaceInfoComparator
{
  return &__block_literal_global_25166;
}

+ (id)mapItemWithGEOMapItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PLRevGeoMapItem *v44;
  void *v45;
  PLRevGeoMapItem *v46;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "_asPlaceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_additionalPlaceInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geoAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "structuredAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v50 = v3;
    objc_msgSend(v4, "name");
    v9 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v4;
    +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v10, v4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v48 = v9;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v18, v17, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v14);
    }

    +[PLRevGeoMapItem sortedAdditionalPlaceInfoComparator](PLRevGeoMapItem, "sortedAdditionalPlaceInfoComparator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortUsingComparator:", v20);

    v4 = v49;
    v3 = v50;
    v5 = v48;
    v22 = (void *)v51;
    v21 = v52;
  }
  else
  {
    v23 = objc_msgSend(v7, "areaOfInterestsCount");
    v21 = v52;
    if (v23)
    {
      v24 = v23;
      v25 = objc_msgSend(v3, "_placeType");
      if (v24 != 1 || v25 != 11)
      {
        objc_msgSend(v7, "areaOfInterestAtIndex:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v26, v4, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "addObject:", v27);
      }
    }
    if (objc_msgSend(v7, "hasSubLocality"))
    {
      objc_msgSend(v7, "subLocality");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v28, v4, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v52, "addObject:", v29);
    }
    v22 = (void *)v51;
    if (objc_msgSend(v7, "hasLocality"))
    {
      objc_msgSend(v7, "locality");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v30, v4, 5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v52, "addObject:", v31);
    }
    if (objc_msgSend(v7, "hasSubAdministrativeArea"))
    {
      objc_msgSend(v7, "subAdministrativeArea");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v32, v4, 7);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v52, "addObject:", v33);
    }
    if (objc_msgSend(v7, "hasAdministrativeArea"))
    {
      objc_msgSend(v7, "administrativeArea");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v34, v4, 10);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v52, "addObject:", v35);
    }
    if (objc_msgSend(v7, "hasCountry"))
    {
      objc_msgSend(v7, "country");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v36, v4, 12);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v52, "addObject:", v37);
    }
  }
  if (objc_msgSend(v7, "hasThoroughfare"))
  {
    objc_msgSend(v7, "thoroughfare");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v38, v4, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addObject:", v39);
  }
  if (objc_msgSend(v7, "hasAdministrativeAreaCode"))
  {
    objc_msgSend(v7, "administrativeAreaCode");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v40, v4, 11);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addObject:", v41);
  }
  if (objc_msgSend(v7, "hasCountryCode"))
  {
    objc_msgSend(v7, "countryCode");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLRevGeoMapItem placeInfoWithName:geoPlaceInfo:dominantOrderType:](PLRevGeoMapItem, "placeInfoWithName:geoPlaceInfo:dominantOrderType:", v42, v4, 13);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addObject:", v43);
  }
  v44 = -[PLRevGeoMapItem initWithSortedPlaceInfos:backupPlaceInfos:finalPlaceInfos:]([PLRevGeoMapItem alloc], "initWithSortedPlaceInfos:backupPlaceInfos:finalPlaceInfos:", v8, v21, v22);
  v45 = v22;
  v46 = v44;

  return v46;
}

uint64_t __67__PLRevGeoMapItem_GEOServices__sortedAdditionalPlaceInfoComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "placeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  objc_msgSend(v5, "placeType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  if (v7 == 7 || v9 != 7)
  {
    if (v7 != 7 || v9 == 7)
    {
      objc_msgSend(v4, "areaInSquareMeters");
      v12 = v11;
      objc_msgSend(v5, "areaInSquareMeters");
      if (v9 != 9 || v13 != 0.0 || (v10 = -1, v7 == 9) && v12 == 0.0)
      {
        if (v7 != 9 || v12 != 0.0 || (v10 = 1, v9 == 9) && v13 == 0.0)
        {
          v14 = -1;
          if (v12 >= v13)
            v14 = 1;
          if (v12 == v13)
            v10 = 0;
          else
            v10 = v14;
        }
      }
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (PLRevGeoMapItem)initWithSortedPlaceInfos:(id)a3 backupPlaceInfos:(id)a4 finalPlaceInfos:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLRevGeoMapItem *v12;
  PLRevGeoMapItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLRevGeoMapItem;
  v12 = -[PLRevGeoMapItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sortedPlaceInfos, a3);
    objc_storeStrong((id *)&v13->_backupPlaceInfos, a4);
    objc_storeStrong((id *)&v13->_finalPlaceInfos, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p sortedPlaceInfos=%@ backupPlaceInfos=%@ finalPlaceInfos=%@>"), v5, self, self->_sortedPlaceInfos, self->_backupPlaceInfos, self->_finalPlaceInfos);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PLRevGeoMapItem *v4;
  uint64_t v5;
  char v6;
  PLRevGeoMapItem *v7;
  NSArray *sortedPlaceInfos;
  void *v9;
  NSArray *backupPlaceInfos;
  void *v11;
  NSArray *finalPlaceInfos;
  void *v13;

  v4 = (PLRevGeoMapItem *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      sortedPlaceInfos = self->_sortedPlaceInfos;
      -[PLRevGeoMapItem sortedPlaceInfos](v7, "sortedPlaceInfos");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(sortedPlaceInfos) = -[NSArray isEqualToArray:](sortedPlaceInfos, "isEqualToArray:", v9);

      if ((_DWORD)sortedPlaceInfos
        && (backupPlaceInfos = self->_backupPlaceInfos,
            -[PLRevGeoMapItem backupPlaceInfos](v7, "backupPlaceInfos"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(backupPlaceInfos) = -[NSArray isEqualToArray:](backupPlaceInfos, "isEqualToArray:", v11),
            v11,
            (_DWORD)backupPlaceInfos))
      {
        finalPlaceInfos = self->_finalPlaceInfos;
        -[PLRevGeoMapItem finalPlaceInfos](v7, "finalPlaceInfos");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[NSArray isEqualToArray:](finalPlaceInfos, "isEqualToArray:", v13);

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *sortedPlaceInfos;
  id v5;

  sortedPlaceInfos = self->_sortedPlaceInfos;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sortedPlaceInfos, CFSTR("sortedPlaceInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backupPlaceInfos, CFSTR("backupPlaceInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_finalPlaceInfos, CFSTR("finalPlaceInfos"));

}

- (PLRevGeoMapItem)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PLRevGeoMapItem *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("sortedPlaceInfos"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("backupPlaceInfos"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("finalPlaceInfos"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PLRevGeoMapItem initWithSortedPlaceInfos:backupPlaceInfos:finalPlaceInfos:](self, "initWithSortedPlaceInfos:backupPlaceInfos:finalPlaceInfos:", v8, v9, v10);
  return v11;
}

- (NSArray)sortedPlaceInfos
{
  return self->_sortedPlaceInfos;
}

- (NSArray)backupPlaceInfos
{
  return self->_backupPlaceInfos;
}

- (NSArray)finalPlaceInfos
{
  return self->_finalPlaceInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalPlaceInfos, 0);
  objc_storeStrong((id *)&self->_backupPlaceInfos, 0);
  objc_storeStrong((id *)&self->_sortedPlaceInfos, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
