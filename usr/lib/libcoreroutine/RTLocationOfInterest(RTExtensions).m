@implementation RTLocationOfInterest(RTExtensions)

+ (id)locationsOfInterestFromLearnedLocationsOfInterest:()RTExtensions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = objc_alloc(MEMORY[0x1E0D183C0]);
          v13 = (void *)objc_msgSend(v12, "initWithLearnedLocationOfInterest:", v11, (_QWORD)v15);
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)initWithLearnedLocationOfInterest:()RTExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v33 = a1;
    objc_msgSend(v4, "visits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v5, "visits");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v5, "visits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v35 != v12)
              objc_enumerationMutation(v9);
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183D8]), "initWithLearnedVisit:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
            if (v14)
              objc_msgSend(v6, "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v5, "location");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "confidence");
    v17 = v16;
    objc_msgSend(v5, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0D183C0];
    objc_msgSend(v5, "place");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v19, "typeFromPlaceType:", objc_msgSend(v30, "type"));
    v20 = (void *)MEMORY[0x1E0D183C0];
    objc_msgSend(v5, "place");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "typeSourceFromPlaceTypeSource:", objc_msgSend(v21, "typeSource"));
    objc_msgSend(v5, "place");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "customLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "place");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "mapItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (id)objc_msgSend(v33, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v15, v18, v29, v22, v6, v24, v17, v26);

    v27 = a1;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (uint64_t)typeFromPlaceType:()RTExtensions
{
  if ((unint64_t)(a3 - 1) >= 4)
    return -1;
  else
    return a3 - 1;
}

+ (unint64_t)typeSourceFromPlaceTypeSource:()RTExtensions
{
  return (__rbit32(a3) >> 30) & 0xFFFFFFFFFFFFFFCFLL | (16 * ((a3 >> 2) & 3));
}

+ (uint64_t)routineModeFromLearnedLocationMode:()RTExtensions
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

@end
