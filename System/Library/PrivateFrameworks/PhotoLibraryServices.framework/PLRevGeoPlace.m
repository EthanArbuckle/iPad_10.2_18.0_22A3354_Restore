@implementation PLRevGeoPlace

- (PLRevGeoPlace)initWithPlaceInfosForOrderType:(id)a3
{
  id v5;
  PLRevGeoPlace *v6;
  PLRevGeoPlace *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLRevGeoPlace;
  v6 = -[PLRevGeoPlace init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_placeInfosForOrderType, a3);

  return v7;
}

- (id)bestPlaceInfoForOrderType:(unint64_t)a3
{
  NSDictionary *placeInfosForOrderType;
  void *v4;
  void *v5;
  void *v6;

  placeInfosForOrderType = self->_placeInfosForOrderType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](placeInfosForOrderType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_placeInfosForOrderType, PLRevGeoPlacePlaceInfosMapKey);
}

- (PLRevGeoPlace)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PLRevGeoPlace *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, PLRevGeoPlacePlaceInfosMapKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[PLRevGeoPlace initWithPlaceInfosForOrderType:](self, "initWithPlaceInfosForOrderType:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDictionary)placeInfosForOrderType
{
  return self->_placeInfosForOrderType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInfosForOrderType, 0);
}

+ (id)_newFilterSortedPlaceInfos:(id)a3 usingPlaceAnnotation:(id)a4 outFoundOrderType:(unint64_t *)a5 outPreviousOrderType:(unint64_t *)a6
{
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v19[7];
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v11, "placeLevel");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __104__PLRevGeoPlace__newFilterSortedPlaceInfos_usingPlaceAnnotation_outFoundOrderType_outPreviousOrderType___block_invoke;
  v19[3] = &unk_1E3676D78;
  v19[4] = &v21;
  v19[5] = a1;
  v20 = v12;
  v19[6] = a5;
  v13 = objc_msgSend(v10, "indexOfObjectPassingTest:", v19);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v10;
  }
  else
  {
    v15 = objc_msgSend(v10, "count");
    v16 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v10, "subarrayWithRange:", v13, v15 - v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v16, "initWithArray:", v17);

    if (a6)
      *a6 = v22[3];
  }
  _Block_object_dispose(&v21, 8);

  return v14;
}

+ (id)placeWithMapItem:(id)a3 placeAnnotation:(id)a4
{
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  unint64_t v33;
  PLRevGeoPlace *v34;
  PLRevGeoPlace *v35;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  unint64_t v52;
  _QWORD v53[5];
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v37 = a4;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__97694;
  v59 = __Block_byref_object_dispose__97695;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v60 = v6;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __50__PLRevGeoPlace_placeWithMapItem_placeAnnotation___block_invoke;
  v54[3] = &unk_1E3676DA0;
  v54[4] = &v55;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v54);
  v53[0] = v7;
  v53[1] = 3221225472;
  v53[2] = __50__PLRevGeoPlace_placeWithMapItem_placeAnnotation___block_invoke_2;
  v53[3] = &unk_1E3676DC8;
  v53[4] = &v55;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v53);
  v52 = 0;
  objc_msgSend(v38, "sortedPlaceInfos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") == 0;

  if (v11)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v38, "backupPlaceInfos");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v62, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v44 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v27 = v52;
          if (v27 <= objc_msgSend(v26, "dominantOrderType"))
            ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v26, objc_msgSend(v26, "dominantOrderType"));
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v62, 16);
      }
      while (v23);
    }

  }
  else
  {
    v51 = 0;
    objc_msgSend(v38, "sortedPlaceInfos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[PLRevGeoPlace _newFilterSortedPlaceInfos:usingPlaceAnnotation:outFoundOrderType:outPreviousOrderType:](PLRevGeoPlace, "_newFilterSortedPlaceInfos:usingPlaceAnnotation:outFoundOrderType:outPreviousOrderType:", v12, v37, &v52, &v51);

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v48 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_msgSend(v18, "placeType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(a1, "_dominantOrderTypeForPlaceType:lastOrderType:", v19, v51);

          ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v18, v20);
          v51 = v20;
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      }
      while (v15);
    }

    objc_msgSend((id)v56[5], "objectForKeyedSubscript:", &unk_1E3760F08);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v9)[2](v9, v21, 1);
    ((void (**)(_QWORD, void *, uint64_t))v9)[2](v9, v21, 3);

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v38, "finalPlaceInfos");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v61, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
        v33 = v52;
        if (v33 <= objc_msgSend(v32, "dominantOrderType"))
          ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v32, objc_msgSend(v32, "dominantOrderType"));
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v61, 16);
    }
    while (v29);
  }

  v34 = [PLRevGeoPlace alloc];
  v35 = -[PLRevGeoPlace initWithPlaceInfosForOrderType:](v34, "initWithPlaceInfosForOrderType:", v56[5]);

  _Block_object_dispose(&v55, 8);
  return v35;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)_dominantOrderTypeForPlaceType:(id)a3 lastOrderType:(unint64_t)a4
{
  int v5;
  unint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v5 = objc_msgSend(a3, "intValue");
  result = 0;
  switch(v5)
  {
    case 1:
      result = 12;
      break;
    case 2:
      result = 10;
      break;
    case 3:
      result = 7;
      break;
    case 4:
      result = 5;
      break;
    case 6:
      v7 = 3;
      v8 = 6;
      if (a4 >= 7)
        v8 = 8 * (a4 < 0xA);
      v11 = a4 >= 5;
      goto LABEL_17;
    case 7:
      result = 14;
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      v7 = 1;
      v8 = 4;
      v9 = 9;
      v10 = 14;
      if (a4 <= 0xB)
        v10 = 0;
      if (a4 >= 0xA)
        v9 = v10;
      if (a4 >= 5)
        v8 = v9;
      v11 = a4 >= 3;
LABEL_17:
      if (v11)
        result = v8;
      else
        result = v7;
      break;
    case 12:
    case 15:
      result = 2;
      break;
    default:
      return result;
  }
  return result;
}

void __50__PLRevGeoPlace_placeWithMapItem_placeAnnotation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PLRevGeoPlaceInfo *v15;
  void *v16;
  PLRevGeoPlaceInfo *v17;
  id v18;

  v5 = a2;
  if (v5)
  {
    v18 = v5;
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    v5 = v18;
    if (v7)
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

      }
      objc_msgSend(v18, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = _placeInfosIndexOfPlaceInfoWithName(v10, v13);

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = [PLRevGeoPlaceInfo alloc];
        objc_msgSend(v18, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PLRevGeoPlaceInfo initWithPlaceName:](v15, "initWithPlaceName:", v16);

        objc_msgSend(v10, "addObject:", v17);
      }
      else
      {
        objc_msgSend(v10, "objectAtIndex:", v14);
        v17 = (PLRevGeoPlaceInfo *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "areaInSquareMeters");
      -[PLRevGeoPlaceInfo addPlaceInfoArea:](v17, "addPlaceInfoArea:");

      v5 = v18;
    }
  }

}

void __50__PLRevGeoPlace_placeWithMapItem_placeAnnotation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "placeName", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = _placeInfosIndexOfPlaceInfoWithName(v8, v14);
          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v8, "removeObjectAtIndex:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
}

BOOL __104__PLRevGeoPlace__newFilterSortedPlaceInfos_usingPlaceAnnotation_outFoundOrderType_outPreviousOrderType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  uint64_t *v13;

  v6 = *(void **)(a1 + 40);
  v7 = a2;
  objc_msgSend(v7, "placeType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "_dominantOrderTypeForPlaceType:lastOrderType:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

  objc_msgSend(v7, "placeType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "intValue");
  v12 = *(_DWORD *)(a1 + 56);

  if (v11 == v12)
  {
    v13 = *(uint64_t **)(a1 + 48);
    if (v13)
      *v13 = v9;
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;
  }
  return v11 == v12;
}

@end
