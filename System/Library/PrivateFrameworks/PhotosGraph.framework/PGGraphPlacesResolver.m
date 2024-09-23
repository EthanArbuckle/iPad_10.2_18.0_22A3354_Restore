@implementation PGGraphPlacesResolver

+ (id)resolvePlacesForMomentNode:(id)a3 feeder:(id)a4 poiCache:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_clusteredRegionsFromFeeder:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
          v16 = (void *)objc_opt_class();
          objc_msgSend(v15, "center", (_QWORD)v20);
          objc_msgSend(v16, "_businessItemsAtCoordinate:inCache:", v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "count"))
          {
            objc_msgSend((id)objc_opt_class(), "resolvedPlaceForRegion:withPlaceItems:", v15, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObjectsFromArray:", v18);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

+ (id)poiStringFromSpatialLookupCategory:(int64_t)a3
{
  void *v3;

  v3 = 0;
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
      +[PGPhotosGraphProfile poiEntertainment](PGPhotosGraphProfile, "poiEntertainment");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      +[PGPhotosGraphProfile poiAmusementPark](PGPhotosGraphProfile, "poiAmusementPark");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[PGPhotosGraphProfile poiStadium](PGPhotosGraphProfile, "poiStadium");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
    case 7:
      +[PGPhotosGraphProfile poiCulture](PGPhotosGraphProfile, "poiCulture");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      +[PGPhotosGraphProfile poiMuseum](PGPhotosGraphProfile, "poiMuseum");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      +[PGPhotosGraphProfile poiRestaurant](PGPhotosGraphProfile, "poiRestaurant");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      +[PGPhotosGraphProfile poiNightlife](PGPhotosGraphProfile, "poiNightlife");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      +[PGPhotosGraphProfile poiPark](PGPhotosGraphProfile, "poiPark");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      +[PGPhotosGraphProfile poiTravel](PGPhotosGraphProfile, "poiTravel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 17:
      +[PGPhotosGraphProfile poiActivity](PGPhotosGraphProfile, "poiActivity");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      +[PGPhotosGraphProfile poiDiving](PGPhotosGraphProfile, "poiDiving");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      +[PGPhotosGraphProfile poiHiking](PGPhotosGraphProfile, "poiHiking");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      +[PGPhotosGraphProfile poiPerformance](PGPhotosGraphProfile, "poiPerformance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 21:
      +[PGPhotosGraphProfile poiHospital](PGPhotosGraphProfile, "poiHospital");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)resolvedPlaceForRegion:(id)a3 withPlaceItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char v24;
  int v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  PGGraphResolvedPlace *v33;
  PGGraphResolvedPlace *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v9 = v8;
  v11 = v10;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v17, "categoryNames");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          objc_msgSend(v17, "region");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "center");
          v21 = v20;
          v23 = v22;
          v24 = objc_msgSend(v19, "containsCoordinate:", v9, v11);
          v25 = objc_msgSend(v5, "containsCoordinate:", v21, v23);
          if ((v24 & 1) != 0 || v25)
            objc_msgSend(v7, "addObjectsFromArray:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v27 = v7;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        v33 = [PGGraphResolvedPlace alloc];
        v34 = -[PGGraphResolvedPlace initWithPlaceOfInterestType:confidence:](v33, "initWithPlaceOfInterestType:confidence:", v32, 1.0, (_QWORD)v36);
        objc_msgSend(v26, "addObject:", v34);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v29);
  }

  return v26;
}

+ (id)_clusteredRegionsFromFeeder:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71A50], "performClustering:dataset:progressBlock:", 0, v3, &__block_literal_global_43936);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_businessItemsAtCoordinate:(CLLocationCoordinate2D)a3 inCache:(id)a4
{
  double longitude;
  double latitude;
  id v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CLLocationCoordinate2D v17;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = a4;
  v17.latitude = latitude;
  v17.longitude = longitude;
  v7 = CLLocationCoordinate2DIsValid(v17);
  v8 = (id)MEMORY[0x1E0C9AA60];
  if (v7)
  {
    v9 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithCenter:radius:identifier:", v11, latitude, longitude, 100.0);

    objc_msgSend(v6, "businessItemsForRegion:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = v8;
    v8 = v15;

  }
  return v8;
}

@end
