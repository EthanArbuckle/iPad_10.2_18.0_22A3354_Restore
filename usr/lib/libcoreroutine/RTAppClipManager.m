@implementation RTAppClipManager

- (RTAppClipManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_);
}

- (RTAppClipManager)initWithDistanceCalculator:(id)a3
{
  id v4;
  id v5;
  RTAppClipManager *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D80CD8]);
    self = -[RTAppClipManager initWithProactiveCDNDownloader:distanceCalculator:](self, "initWithProactiveCDNDownloader:distanceCalculator:", v5, v4);

    v6 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (RTAppClipManager)initWithProactiveCDNDownloader:(id)a3 distanceCalculator:(id)a4
{
  id v7;
  id v8;
  RTAppClipManager *v9;
  id *p_isa;
  RTAppClipManager *v11;
  NSObject *v12;
  const char *v13;
  objc_super v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v11 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: procativeCDNDownloader";
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)RTAppClipManager;
  v9 = -[RTNotifier init](&v15, sel_init);
  p_isa = (id *)&v9->super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_distanceCalculator, a4);
    objc_storeStrong(p_isa + 5, a3);
  }
  self = p_isa;
  v11 = self;
LABEL_10:

  return v11;
}

- (id)_selectClosestLocationsFromLocations:(id)a3 toLocation:(id)a4 limit:(unint64_t)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  RTDistanceCalculator *distanceCalculator;
  double v16;
  double v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _RTMap *v23;
  void *v24;
  id v25;
  void *v26;
  SEL v28;
  void *v29;
  os_log_t log;
  id v31;
  _QWORD v32[6];
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v31 = a4;
  v29 = v9;
  if (v31)
  {
    v28 = a2;
    log = (os_log_t)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          distanceCalculator = self->_distanceCalculator;
          v37 = 0;
          -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v14, v31, &v37);
          v17 = v16;
          v18 = v37;
          if (!v18)
          {
            v19 = objc_alloc(MEMORY[0x1E0D18408]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v19, "initWithFirstObject:secondObject:", v20, v14);

            if (v21)
              -[NSObject addObject:](log, "addObject:", v21);

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v11);
    }

    -[NSObject sortedArrayUsingComparator:](log, "sortedArrayUsingComparator:", &__block_literal_global_39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v34 = buf;
    v35 = 0x2020000000;
    v36 = 0;
    v23 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v22);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __74__RTAppClipManager__selectClosestLocationsFromLocations_toLocation_limit___block_invoke_2;
    v32[3] = &unk_1E929C6C0;
    v32[4] = buf;
    v32[5] = v28;
    -[_RTMap withBlock:](v23, "withBlock:", v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "count") <= a5)
    {
      v25 = v24;
    }
    else
    {
      objc_msgSend(v24, "subarrayWithRange:", 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v25;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }
    v26 = 0;
  }

  return v26;
}

uint64_t __74__RTAppClipManager__selectClosestLocationsFromLocations_toLocation_limit___block_invoke(uint64_t a1, void *a2, void *a3)
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

id __74__RTAppClipManager__selectClosestLocationsFromLocations_toLocation_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityMapService);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    objc_msgSend(v3, "secondObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v12 = 138413058;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2048;
    v19 = v9;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, sorted location idx, %lu, location, %@, distance, %.2f", (uint8_t *)&v12, 0x2Au);

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v3, "secondObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_fetchNearbyAppClipLocationsFromLocation:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6
{
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  char *v16;
  void *v17;
  ATXProactiveCDNDownloader *procativeCDNDownloader;
  _QWORD v19[5];
  id v20;
  id v21;
  SEL v22;
  double v23;
  unint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  double v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTAppClipManager _fetchNearbyAppClipLocationsFromLocation:radius:limit:handler:]";
      v27 = 1024;
      LODWORD(v28) = 114;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
    }

  }
  if (a4 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTAppClipManager _fetchNearbyAppClipLocationsFromLocation:radius:limit:handler:]";
      v27 = 1024;
      LODWORD(v28) = 115;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: radius >= 0 (in %s:%d)", buf, 0x12u);
    }

  }
  if (v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMapService);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v26 = v16;
      v27 = 2112;
      v28 = v11;
      v29 = 2048;
      v30 = a4;
      v31 = 2048;
      v32 = a5;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, fetch nearby app clips, location, %@, radius, %.2f, limit, %lu", buf, 0x2Au);

    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithRTLocation:", v11);
    procativeCDNDownloader = self->_procativeCDNDownloader;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__RTAppClipManager__fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke;
    v19[3] = &unk_1E929C710;
    v19[4] = self;
    v22 = a2;
    v21 = v12;
    v20 = v11;
    v23 = a4;
    v24 = a5;
    -[ATXProactiveCDNDownloader heroDatasForLocation:completion:](procativeCDNDownloader, "heroDatasForLocation:completion:", v17, v19);

  }
}

void __82__RTAppClipManager__fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__RTAppClipManager__fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke_2;
  block[3] = &unk_1E929C6E8;
  v15 = v6;
  v13 = *(_OWORD *)(a1 + 48);
  v8 = (id)v13;
  v19 = v13;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v16 = v5;
  v17 = v9;
  v18 = v10;
  v20 = *(_QWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 72);
  v11 = v5;
  v12 = v6;
  dispatch_async(v7, block);

}

void __82__RTAppClipManager__fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id obj;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  double v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilityMapService);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v41 = v31;
      v42 = 2112;
      v43 = v32;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 40), "count");
      *(_DWORD *)buf = 138412546;
      v41 = v5;
      v42 = 2048;
      v43 = v6;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, fetched app clip count, %lu", buf, 0x16u);

    }
    v7 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = *(id *)(a1 + 40);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      v33 = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v12, "urlHash");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = objc_alloc(MEMORY[0x1E0D183B0]);
            objc_msgSend(v12, "latitude");
            v17 = v16;
            objc_msgSend(v12, "longitude");
            v19 = v18;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:horizontalUncertainty:date:", v20, v17, v19, -1.0);

            v22 = *(_QWORD *)(a1 + 56);
            v23 = *(void **)(*(_QWORD *)(a1 + 48) + 32);
            v35 = 0;
            objc_msgSend(v23, "distanceFromLocation:toLocation:error:", v22, v21, &v35);
            v25 = v24;
            v26 = v35;
            if (!v26 && v25 < *(double *)(a1 + 80))
            {
              _rt_log_facility_get_os_log(RTLogFacilityMapService);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                NSStringFromSelector(*(SEL *)(a1 + 72));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "urlHash");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v41 = v28;
                v42 = 2112;
                v43 = (uint64_t)v21;
                v44 = 2048;
                v45 = v25;
                v46 = 2112;
                v47 = v29;
                _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%@, fetched app clip location, %@, distance, %f, urlHash, %@", buf, 0x2Au);

                v7 = v33;
              }

              objc_msgSend(v7, "addObject:", v21);
            }

          }
          objc_autoreleasePoolPop(v13);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 48), "_selectClosestLocationsFromLocations:toLocation:limit:", v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

- (void)fetchNearbyAppClipLocationsFromLocation:(id)a3 radius:(double)a4 limit:(unint64_t)a5 handler:(id)a6
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
  block[2] = __81__RTAppClipManager_fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke;
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

uint64_t __81__RTAppClipManager_fetchNearbyAppClipLocationsFromLocation_radius_limit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchNearbyAppClipLocationsFromLocation:radius:limit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (ATXProactiveCDNDownloader)procativeCDNDownloader
{
  return self->_procativeCDNDownloader;
}

- (void)setProcativeCDNDownloader:(id)a3
{
  objc_storeStrong((id *)&self->_procativeCDNDownloader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_procativeCDNDownloader, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end
