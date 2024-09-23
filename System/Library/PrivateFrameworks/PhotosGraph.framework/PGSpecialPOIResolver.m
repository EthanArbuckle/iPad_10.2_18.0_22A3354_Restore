@implementation PGSpecialPOIResolver

- (PGSpecialPOIResolver)initWithMomentNodes:(id)a3
{
  id v5;
  PGSpecialPOIResolver *v6;
  PGSpecialPOIResolver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSpecialPOIResolver;
  v6 = -[PGSpecialPOIResolver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_momentNodes, a3);

  return v7;
}

- (BOOL)anyMomentContainsSpecialPOI:(unint64_t)a3
{
  return -[PGSpecialPOIResolver _numberOfMomentsMatchingSpecialPOI:](self, "_numberOfMomentsMatchingSpecialPOI:", a3) != 0;
}

- (BOOL)momentsContainSpecialPOI:(unint64_t)a3 withMomentRatio:(double)a4
{
  double v6;

  v6 = (double)-[PGSpecialPOIResolver _numberOfMomentsMatchingSpecialPOI:](self, "_numberOfMomentsMatchingSpecialPOI:", a3);
  return v6 / (double)-[NSArray count](self->_momentNodes, "count") >= a4;
}

- (unint64_t)specialPOIsInAnyMoment
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;

  v3 = 0;
  v4 = 1;
  do
  {
    if (-[PGSpecialPOIResolver anyMomentContainsSpecialPOI:](self, "anyMomentContainsSpecialPOI:", v4))
      v5 = v4;
    else
      v5 = 0;
    v3 |= v5;
    v6 = v4 >= 2;
    v4 *= 2;
  }
  while (!v6);
  return v3;
}

- (unint64_t)specialPOIsWithMomentRatio:(double)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v5 = 0;
  v6 = 1;
  do
  {
    if (-[PGSpecialPOIResolver momentsContainSpecialPOI:withMomentRatio:](self, "momentsContainSpecialPOI:withMomentRatio:", v6, a3))
    {
      v7 = v6;
    }
    else
    {
      v7 = 0;
    }
    v5 |= v7;
    v8 = v6 >= 2;
    v6 *= 2;
  }
  while (!v8);
  return v5;
}

- (BOOL)anyMomentHasPOIAmusementPark
{
  return -[PGSpecialPOIResolver anyMomentContainsSpecialPOI:](self, "anyMomentContainsSpecialPOI:", 1)
      || -[PGSpecialPOIResolver anyMomentContainsSpecialPOI:](self, "anyMomentContainsSpecialPOI:", 2);
}

- (unint64_t)_numberOfMomentsMatchingSpecialPOI:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_countBySpecialPOI, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[PGSpecialPOIResolver _regionsBySpecialPOI](PGSpecialPOIResolver, "_regionsBySpecialPOI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGSpecialPOIResolver _nameBySpecialPOI](PGSpecialPOIResolver, "_nameBySpecialPOI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGSpecialPOIResolver _numberOfMomentsInRegions:containingAOIName:](self, "_numberOfMomentsInRegions:containingAOIName:", v7, v9));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_countBySpecialPOI, "setObject:forKeyedSubscript:", v5, v4);

  }
  v10 = objc_msgSend(v5, "unsignedIntegerValue");

  return v10;
}

- (unint64_t)_numberOfMomentsInRegions:(id)a3 containingAOIName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSArray *obj;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_momentNodes;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "collection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addressNodes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __68__PGSpecialPOIResolver__numberOfMomentsInRegions_containingAOIName___block_invoke;
        v16[3] = &unk_1E8432D68;
        v17 = v7;
        v18 = v6;
        v19 = &v24;
        objc_msgSend(v12, "enumerateNodesUsingBlock:", v16);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }

  v13 = v25[3];
  _Block_object_dispose(&v24, 8);

  return v13;
}

- (NSArray)momentNodes
{
  return self->_momentNodes;
}

- (NSMutableDictionary)countBySpecialPOI
{
  return self->_countBySpecialPOI;
}

- (void)setCountBySpecialPOI:(id)a3
{
  objc_storeStrong((id *)&self->_countBySpecialPOI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countBySpecialPOI, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
}

void __68__PGSpecialPOIResolver__numberOfMomentsInRegions_containingAOIName___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(v5, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "areaNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__PGSpecialPOIResolver__numberOfMomentsInRegions_containingAOIName___block_invoke_2;
  v17[3] = &unk_1E8432D40;
  v18 = *(id *)(a1 + 32);
  v19 = &v20;
  objc_msgSend(v7, "enumerateNodesUsingBlock:", v17);

  if (*((_BYTE *)v21 + 24))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v5, "coordinate", (_QWORD)v13);
          if (objc_msgSend(v12, "containsCoordinate:"))
          {
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
            *a3 = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  _Block_object_dispose(&v20, 8);

}

void __68__PGSpecialPOIResolver__numberOfMomentsInRegions_containingAOIName___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

+ (BOOL)specialPOIContainsCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1, "_regionsBySpecialPOI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "containsCoordinate:", latitude, longitude) & 1) != 0)
              {

                v17 = 1;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 0;
    }
    while (v8);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

+ (unint64_t)specialPOIsContainingCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  void *v5;
  unint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(a1, "_regionsBySpecialPOI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PGSpecialPOIResolver_specialPOIsContainingCoordinate___block_invoke;
  v8[3] = &unk_1E8432CB0;
  *(CLLocationDegrees *)&v8[5] = latitude;
  *(CLLocationDegrees *)&v8[6] = longitude;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

+ (BOOL)specialPOINameIsInString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "_nameBySpecialPOI", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v4, "containsString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (unint64_t)specialPOIsWithNameInString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(a1, "_nameBySpecialPOI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PGSpecialPOIResolver_specialPOIsWithNameInString___block_invoke;
  v9[3] = &unk_1E8432CD8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (id)_regionsBySpecialPOI
{
  if (_regionsBySpecialPOI_onceToken != -1)
    dispatch_once(&_regionsBySpecialPOI_onceToken, &__block_literal_global_57253);
  return (id)_regionsBySpecialPOI_regionsBySpecialPOI;
}

+ (id)_nameBySpecialPOI
{
  if (_nameBySpecialPOI_onceToken != -1)
    dispatch_once(&_nameBySpecialPOI_onceToken, &__block_literal_global_174);
  return (id)_nameBySpecialPOI_nameBySpecialPOI;
}

void __41__PGSpecialPOIResolver__nameBySpecialPOI__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E84E4C70;
  v2[1] = &unk_1E84E4C88;
  v3[0] = CFSTR("disney");
  v3[1] = CFSTR("universal");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_nameBySpecialPOI_nameBySpecialPOI;
  _nameBySpecialPOI_nameBySpecialPOI = v0;

}

void __44__PGSpecialPOIResolver__regionsBySpecialPOI__block_invoke()
{
  id v0;
  CLLocationCoordinate2D v1;
  void *v2;
  id v3;
  CLLocationCoordinate2D v4;
  void *v5;
  id v6;
  CLLocationCoordinate2D v7;
  void *v8;
  id v9;
  CLLocationCoordinate2D v10;
  void *v11;
  id v12;
  CLLocationCoordinate2D v13;
  void *v14;
  id v15;
  CLLocationCoordinate2D v16;
  void *v17;
  void *v18;
  id v19;
  CLLocationCoordinate2D v20;
  void *v21;
  id v22;
  CLLocationCoordinate2D v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[7];

  v31[6] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C9E368]);
  v1 = CLLocationCoordinate2DMake(28.3826407, -81.5640857);
  v2 = (void *)objc_msgSend(v0, "initWithCenter:radius:identifier:", CFSTR("DisneyOrlando"), v1.latitude, v1.longitude, 5740.0);
  v31[0] = v2;
  v3 = objc_alloc(MEMORY[0x1E0C9E368]);
  v4 = CLLocationCoordinate2DMake(33.8103178, -117.922078);
  v5 = (void *)objc_msgSend(v3, "initWithCenter:radius:identifier:", CFSTR("DisneyAnaheim"), v4.latitude, v4.longitude, 820.0);
  v31[1] = v5;
  v6 = objc_alloc(MEMORY[0x1E0C9E368]);
  v7 = CLLocationCoordinate2DMake(48.8687234, 2.7833537);
  v8 = (void *)objc_msgSend(v6, "initWithCenter:radius:identifier:", CFSTR("DisneyParis"), v7.latitude, v7.longitude, 1110.0);
  v31[2] = v8;
  v9 = objc_alloc(MEMORY[0x1E0C9E368]);
  v10 = CLLocationCoordinate2DMake(35.6296051, 139.881228);
  v11 = (void *)objc_msgSend(v9, "initWithCenter:radius:identifier:", CFSTR("DisneyTokyo"), v10.latitude, v10.longitude, 1050.0);
  v31[3] = v11;
  v12 = objc_alloc(MEMORY[0x1E0C9E368]);
  v13 = CLLocationCoordinate2DMake(22.3143489, 114.040808);
  v14 = (void *)objc_msgSend(v12, "initWithCenter:radius:identifier:", CFSTR("DisneyHongkong"), v13.latitude, v13.longitude, 1090.0);
  v31[4] = v14;
  v15 = objc_alloc(MEMORY[0x1E0C9E368]);
  v16 = CLLocationCoordinate2DMake(31.1416439, 121.664522);
  v17 = (void *)objc_msgSend(v15, "initWithCenter:radius:identifier:", CFSTR("DisneyShanghai"), v16.latitude, v16.longitude, 1290.0);
  v31[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(MEMORY[0x1E0C9E368]);
  v20 = CLLocationCoordinate2DMake(28.4712567, -81.4676208);
  v21 = (void *)objc_msgSend(v19, "initWithCenter:radius:identifier:", CFSTR("UniversalOrlando"), v20.latitude, v20.longitude, 1440.0);
  v30[0] = v21;
  v22 = objc_alloc(MEMORY[0x1E0C9E368]);
  v23 = CLLocationCoordinate2DMake(34.1391594, -118.353077);
  v24 = (void *)objc_msgSend(v22, "initWithCenter:radius:identifier:", CFSTR("UniversalHolywood"), v23.latitude, v23.longitude, 780.0);
  v30[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = &unk_1E84E4C70;
  v28[1] = &unk_1E84E4C88;
  v29[0] = v18;
  v29[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)_regionsBySpecialPOI_regionsBySpecialPOI;
  _regionsBySpecialPOI_regionsBySpecialPOI = v26;

}

void __52__PGSpecialPOIResolver_specialPOIsWithNameInString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsString:", a3))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v5, "unsignedIntegerValue");

}

void __56__PGSpecialPOIResolver_specialPOIsContainingCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "containsCoordinate:", *(double *)(a1 + 40), *(double *)(a1 + 48), (_QWORD)v11))
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= objc_msgSend(v5, "unsignedIntegerValue");
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

@end
