@implementation RTBuildingPolygonManager

- (RTBuildingPolygonManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_MapServiceManager_);
}

- (RTBuildingPolygonManager)initWithDistanceCalculator:(id)a3 MapServiceManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTBuildingPolygonManager *v10;
  id *p_isa;
  RTBuildingPolygonManager *v12;
  NSObject *v13;
  const char *v14;
  objc_super v16;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTBuildingPolygonManager;
  v10 = -[RTNotifier init](&v16, sel_init);
  p_isa = (id *)&v10->super.super.super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_distanceCalculator, a3);
    objc_storeStrong(p_isa + 4, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

- (void)fetchClosestBuildingPolygonsFromLocations:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  double v18;
  unint64_t v19;

  v10 = a3;
  v11 = a6;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__RTBuildingPolygonManager_fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke;
  block[3] = &unk_1E929A420;
  block[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

uint64_t __91__RTBuildingPolygonManager_fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchClosestBuildingPolygonsFromLocations:radius:limit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_fetchClosestBuildingPolygonsFromLocations:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  id obj;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  unint64_t v36;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (v12)
  {
    v13 = objc_msgSend(v11, "count");
    if (a4 > 0.0 && v13)
    {
      v29 = a5;
      v30 = v12;
      v14 = (void *)objc_opt_new();
      v15 = dispatch_group_create();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = v11;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v41 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            dispatch_group_enter(v15);
            -[RTBuildingPolygonManager mapServiceManager](self, "mapServiceManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v37[0] = MEMORY[0x1E0C809B0];
            v37[1] = 3221225472;
            v37[2] = __92__RTBuildingPolygonManager__fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke;
            v37[3] = &unk_1E929C008;
            v38 = v14;
            v39 = v15;
            objc_msgSend(v21, "fetchBuildingPolygonsFromLocation:radius:handler:", v20, v37, a4);

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v17);
      }

      -[RTNotifier queue](self, "queue");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __92__RTBuildingPolygonManager__fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke_2;
      block[3] = &unk_1E9297910;
      block[4] = self;
      v33 = v14;
      v34 = obj;
      v12 = v30;
      v36 = v29;
      v35 = v30;
      v23 = v14;
      dispatch_group_notify(v15, v22, block);

    }
    else
    {
      v24 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("invalid parameters passed to %@, locations.count, %lu, radius, %.2f, limit, %lu"), v25, objc_msgSend(v11, "count"), *(_QWORD *)&a4, a5);
      v15 = objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0D18598];
      v45 = *MEMORY[0x1E0CB2D50];
      v46[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 7, v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v28);

    }
  }

}

void __92__RTBuildingPolygonManager__fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "vertices");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10 >= 3)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __92__RTBuildingPolygonManager__fetchClosestBuildingPolygonsFromLocations_radius_limit_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_selectClosestPolygonsFromPolygons:locations:limit:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)_selectClosestPolygonsFromPolygons:(id)a3 locations:(id)a4 limit:(unint64_t)a5
{
  NSObject *v9;
  void *v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _RTMap *v35;
  void *v36;
  id v37;
  void *v38;
  SEL aSelector;
  unint64_t v41;
  id v42;
  id obj;
  NSObject *log;
  uint64_t v45;
  id v46;
  uint64_t v47;
  _QWORD v48[7];
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  _BYTE buf[24];
  uint64_t v61;
  __int16 v62;
  unint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v46 = a4;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: limit > 0", buf, 2u);
    }
    v38 = 0;
    goto LABEL_37;
  }
  aSelector = a2;
  v41 = a5;
  _rt_log_facility_get_os_log(RTLogFacilityMapService);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v42, "count");
    *(_WORD *)&buf[22] = 2048;
    v61 = objc_msgSend(v46, "count");
    v62 = 2048;
    v63 = a5;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, polygon count, %lu, location count, %lu, limit, %lu", buf, 0x2Au);

  }
  if (objc_msgSend(v42, "count") && objc_msgSend(v46, "count"))
  {
    log = objc_opt_new();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v42;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v47)
    {
      v45 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v55 != v45)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v13 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v12, "centroid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "latitude");
          v16 = v15;
          objc_msgSend(v12, "centroid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "longitude");
          v19 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v16, v18, -1.0);

          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v20 = v46;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v51;
            v23 = 1.79769313e308;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v51 != v22)
                  objc_enumerationMutation(v20);
                v25 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
                -[RTBuildingPolygonManager distanceCalculator](self, "distanceCalculator", aSelector);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = 0;
                objc_msgSend(v26, "distanceFromLocation:toLocation:error:", v19, v25, &v49);
                v28 = v27;
                v29 = v49;

                if (v28 < v23 && v29 == 0)
                  v23 = v28;
              }
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            }
            while (v21);
          }
          else
          {
            v23 = 1.79769313e308;
          }

          v31 = objc_alloc(MEMORY[0x1E0D18408]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v31, "initWithFirstObject:secondObject:", v32, v12);

          if (v33)
            -[NSObject addObject:](log, "addObject:", v33);

        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v47);
    }

    -[NSObject sortedArrayUsingComparator:](log, "sortedArrayUsingComparator:", &__block_literal_global_36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v61 = 0;
    v35 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v34);
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __79__RTBuildingPolygonManager__selectClosestPolygonsFromPolygons_locations_limit___block_invoke_2;
    v48[3] = &unk_1E929C070;
    v48[4] = buf;
    v48[5] = v41;
    v48[6] = aSelector;
    -[_RTMap withBlock:](v35, "withBlock:", v48);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(obj, "count") <= v41)
    {
      v37 = v36;
    }
    else
    {
      objc_msgSend(v36, "subarrayWithRange:", 0);
      v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = v37;

    _Block_object_dispose(buf, 8);
LABEL_37:

    goto LABEL_38;
  }
  v38 = 0;
LABEL_38:

  return v38;
}

uint64_t __79__RTBuildingPolygonManager__selectClosestPolygonsFromPolygons_locations_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

id __79__RTBuildingPolygonManager__selectClosestPolygonsFromPolygons_locations_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 < *(_QWORD *)(a1 + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilityMapService);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "secondObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v13 = 138412802;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2048;
      v18 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, sorted location, %@, distance, %.2f", (uint8_t *)&v13, 0x20u);

    }
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(_QWORD *)(v4 + 24);
  }
  *(_QWORD *)(v4 + 24) = v5 + 1;
  objc_msgSend(v3, "secondObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
}

@end
