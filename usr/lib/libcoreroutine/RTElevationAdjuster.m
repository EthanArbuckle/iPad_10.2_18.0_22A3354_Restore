@implementation RTElevationAdjuster

- (void)respondWithSynthesizedLocation:(id)a3 elevations:(id)a4 error:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  NSObject *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  RTSynthesizedLocation *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  objc_class *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  id v72;
  const char *aSelector;
  NSObject *v74;
  void *v75;
  void *v76;
  RTSynthesizedLocation *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  uint64_t v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    v14 = objc_msgSend(v10, "count");
    if (v14 == objc_msgSend(v11, "count"))
    {
      aSelector = a2;
      v71 = v13;
      v72 = v12;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        v16 = 0;
        v74 = v15;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "locationType");

          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "verticalAccuracy");
          v21 = v20;

          objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "elevation");
          v24 = v23;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "altitude");
          v27 = v26;

          if (v24 != v27)
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v28, "locationType") | 0x10;

            v21 = 10.0;
          }
          v82 = v21;
          v83 = v18;
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v55 = (objc_class *)objc_opt_class();
            NSStringFromClass(v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "description");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "altitude");
            v62 = v61;
            objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "elevation");
            *(_DWORD *)buf = 138413314;
            v85 = (uint64_t)v56;
            v86 = 2112;
            v87 = (uint64_t)v57;
            v88 = 2112;
            v89 = (uint64_t)v59;
            v90 = 2048;
            v91 = v62;
            v92 = 2048;
            v93 = v64;
            _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "%@ %@ CLLocation %@, elevation from %.2f to %.2f", buf, 0x34u);

          }
          v77 = [RTSynthesizedLocation alloc];
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "coordinate");
          v31 = v30;
          v33 = v32;
          objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "elevation");
          v35 = v34;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "horizontalAccuracy");
          v37 = v36;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "course");
          v39 = v38;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "courseAccuracy");
          v41 = v40;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "speed");
          v43 = v42;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "speedAccuracy");
          v46 = v45;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "geoRoadClass");
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "geoFormOfWay");
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "timestamp");
          v52 = v11;
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:](v77, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:", v48, v50, v83, v53, v31, v33, v35, v37, v82, v39, v41, v43, v46);

          v11 = v52;
          v15 = v74;
          -[NSObject addObject:](v74, "addObject:", v54);

          ++v16;
        }
        while (v16 < objc_msgSend(v10, "count"));
      }
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        v66 = (objc_class *)objc_opt_class();
        NSStringFromClass(v66);
        v67 = v11;
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 138412802;
        v85 = (uint64_t)v68;
        v86 = 2112;
        v87 = (uint64_t)v69;
        v88 = 2048;
        v89 = v70;
        _os_log_debug_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_DEBUG, "%@ %@, adjusted %tu locations", buf, 0x20u);

        v11 = v67;
      }

      v13 = v71;
      v12 = v72;
      (*((void (**)(id, NSObject *, id))v71 + 2))(v71, v15, v72);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        v85 = objc_msgSend(v11, "count");
        v86 = 2048;
        v87 = objc_msgSend(v10, "count");
        _os_log_fault_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_FAULT, "Number of elements (%tu) in elevations is not equal to number of elements in locations (%tu)", buf, 0x16u);
      }
    }

  }
}

- (void)adjustElevationForSynthesizedLocations:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  RTElevationAdjuster *v24;
  _QWORD v25[4];
  id v26;
  RTElevationAdjuster *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v24 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v9 = 0;
      do
      {
        v10 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timestamp");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timestamp");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v12, v14);

        v16 = objc_alloc(MEMORY[0x1E0D18370]);
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "altitude");
        v18 = (void *)objc_msgSend(v16, "initWithElevation:dateInterval:", v15);
        objc_msgSend(v8, "addObject:", v18);

        ++v9;
      }
      while (v9 < objc_msgSend(v6, "count"));
    }
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v30 = objc_msgSend(v6, "count");
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "Invoked adjustElevationForLocations for %tu RTSynthesizedLocation values", buf, 0xCu);
    }

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __93__RTElevationAdjuster_RTSynthesizedLocation__adjustElevationForSynthesizedLocations_handler___block_invoke;
    v25[3] = &unk_1E9297F30;
    v26 = v6;
    v27 = v24;
    v28 = v7;
    -[RTElevationAdjuster adjustElevation:handler:](v24, "adjustElevation:handler:", v8, v25);

    v20 = v26;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = *MEMORY[0x1E0D18598];
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received empty location array"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 7, v20);
    (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v23);

  }
}

void __93__RTElevationAdjuster_RTSynthesizedLocation__adjustElevationForSynthesizedLocations_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5 || (v6 = objc_msgSend(v7, "count"), v6 != objc_msgSend(*(id *)(a1 + 32), "count")))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 40), "respondWithSynthesizedLocation:elevations:error:handler:", *(_QWORD *)(a1 + 32), v7, 0, *(_QWORD *)(a1 + 48));

}

- (id)adjustCLLocation:(id)a3 elevation:(double)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  _OWORD v9[8];
  _OWORD v10[2];
  uint8_t buf[16];
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];

  if (a3)
  {
    v17 = 0u;
    memset(v18, 0, 28);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    memset(v12, 0, sizeof(v12));
    *(_OWORD *)buf = 0u;
    objc_msgSend(a3, "clientLocation");
    *(double *)((char *)v12 + 12) = a4;
    v5 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    v9[6] = v16;
    v9[7] = v17;
    v10[0] = v18[0];
    *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)((char *)v18 + 12);
    v9[2] = v12[1];
    v9[3] = v13;
    v9[4] = v14;
    v9[5] = v15;
    v9[0] = *(_OWORD *)buf;
    v9[1] = v12[0];
    v6 = (void *)objc_msgSend(v5, "initWithClientLocation:", v9);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    v6 = 0;
  }
  return v6;
}

- (void)respondWithCLLocation:(id)a3 elevations:(id)a4 error:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  const char *aSelector;
  void *v38;
  void *v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v14)
  {
    v15 = objc_msgSend(v11, "count");
    if (v15 == objc_msgSend(v12, "count"))
    {
      v36 = v13;
      aSelector = a2;
      v35 = v14;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        v17 = 0;
        do
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "description");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "altitude");
            v27 = v26;
            objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "elevation");
            *(_DWORD *)buf = 138413314;
            v41 = (uint64_t)v23;
            v42 = 2112;
            v43 = (uint64_t)v24;
            v44 = 2112;
            v45 = (uint64_t)v25;
            v46 = 2048;
            v47 = v27;
            v48 = 2048;
            v49 = v29;
            _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "%@ %@ CLLocation %@, elevation from %.2f to %.2f", buf, 0x34u);

          }
          objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "elevation");
          -[RTElevationAdjuster adjustCLLocation:elevation:](self, "adjustCLLocation:elevation:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject addObject:](v16, "addObject:", v21);
          ++v17;
        }
        while (v17 < objc_msgSend(v11, "count"));
      }
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v11, "count");
        *(_DWORD *)buf = 138412802;
        v41 = (uint64_t)v32;
        v42 = 2112;
        v43 = (uint64_t)v33;
        v44 = 2048;
        v45 = v34;
        _os_log_debug_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_DEBUG, "%@ %@, adjusted %tu locations", buf, 0x20u);

      }
      v14 = v35;
      v13 = v36;
      (*((void (**)(id, NSObject *, id))v35 + 2))(v35, v16, v36);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        v41 = objc_msgSend(v12, "count");
        v42 = 2048;
        v43 = objc_msgSend(v11, "count");
        _os_log_fault_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_FAULT, "Number of elements (%tu) in elevations is not equal to number of elements in locations (%tu)", buf, 0x16u);
      }
    }

  }
}

- (void)adjustElevationForLocations:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  RTElevationAdjuster *v27;
  _QWORD v28[4];
  id v29;
  RTElevationAdjuster *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v27 = self;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __71__RTElevationAdjuster_CLLocation__adjustElevationForLocations_handler___block_invoke;
    v32[3] = &unk_1E929A988;
    v8 = v6;
    v33 = v8;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v32);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v10 = 0;
      do
      {
        v11 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timestamp");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timestamp");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v13, v15);

        v17 = objc_alloc(MEMORY[0x1E0D18370]);
        objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "altitude");
        v19 = (void *)objc_msgSend(v17, "initWithElevation:dateInterval:", v16);
        objc_msgSend(v9, "addObject:", v19);

        ++v10;
      }
      while (v10 < objc_msgSend(v8, "count"));
    }
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v26 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v35 = v26;
      _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "Invoked adjustElevationForLocations for %tu CLLocation values", buf, 0xCu);
    }

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __71__RTElevationAdjuster_CLLocation__adjustElevationForLocations_handler___block_invoke_8;
    v28[3] = &unk_1E9297F30;
    v29 = v8;
    v30 = v27;
    v31 = v7;
    -[RTElevationAdjuster adjustElevation:handler:](v27, "adjustElevation:handler:", v9, v28);

    v21 = v33;
  }
  else
  {
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23 = *MEMORY[0x1E0D18598];
    v36 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received empty location array"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 7, v24);
    (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v25);

  }
}

void __71__RTElevationAdjuster_CLLocation__adjustElevationForLocations_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(v3, "toString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "adjustElevationForLocations,locationCount,%tu,location,%@", (uint8_t *)&v7, 0x16u);

  }
}

void __71__RTElevationAdjuster_CLLocation__adjustElevationForLocations_handler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5 || (v6 = objc_msgSend(v7, "count"), v6 != objc_msgSend(*(id *)(a1 + 32), "count")))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 40), "respondWithCLLocation:elevations:error:handler:", *(_QWORD *)(a1 + 32), v7, 0, *(_QWORD *)(a1 + 48));

}

- (void)respondWithTripSegmentLocation:(id)a3 elevations:(id)a4 error:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  objc_class *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  const char *aSelector;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    v14 = objc_msgSend(v10, "count");
    if (v14 == objc_msgSend(v11, "count"))
    {
      aSelector = a2;
      v61 = v13;
      v62 = v12;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        v16 = 0;
        v64 = v15;
        do
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v45 = (objc_class *)objc_opt_class();
            NSStringFromClass(v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "description");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "altitude");
            v52 = v51;
            objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "elevation");
            *(_DWORD *)buf = 138413314;
            v71 = (uint64_t)v46;
            v72 = 2112;
            v73 = (uint64_t)v47;
            v74 = 2112;
            v75 = (uint64_t)v49;
            v76 = 2048;
            v77 = v52;
            v78 = 2048;
            v79 = v54;
            _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "%@ %@ CLLocation %@, elevation from %.2f to %.2f", buf, 0x34u);

          }
          v18 = objc_alloc(MEMORY[0x1E0C9E430]);
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "timestamp");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "latitude");
          v21 = v20;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "longitude");
          v23 = v22;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "horizontalAccuracy");
          v25 = v24;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "course");
          v27 = v26;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "courseAccuracy");
          v30 = v29;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "speed");
          v33 = v32;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
          v34 = v10;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "speedAccuracy");
          v37 = v36;
          objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "elevation");
          v40 = v39;
          objc_msgSend(v34, "objectAtIndexedSubscript:", v16);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v18, "initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:", v19, objc_msgSend(v41, "locType"), v21, v23, v25, v27, v30, v33, v37, v40, 0x4024000000000000);
          v43 = v11;
          v44 = (void *)v42;

          v10 = v34;
          v15 = v64;
          -[NSObject addObject:](v64, "addObject:", v44);

          v11 = v43;
          ++v16;
        }
        while (v16 < objc_msgSend(v34, "count"));
      }
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        v56 = (objc_class *)objc_opt_class();
        NSStringFromClass(v56);
        v57 = v11;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 138412802;
        v71 = (uint64_t)v58;
        v72 = 2112;
        v73 = (uint64_t)v59;
        v74 = 2048;
        v75 = v60;
        _os_log_debug_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_DEBUG, "%@ %@, adjusted %tu locations", buf, 0x20u);

        v11 = v57;
      }

      v13 = v61;
      v12 = v62;
      (*((void (**)(id, NSObject *, id))v61 + 2))(v61, v15, v62);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        v71 = objc_msgSend(v11, "count");
        v72 = 2048;
        v73 = objc_msgSend(v10, "count");
        _os_log_fault_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_FAULT, "Number of elements (%tu) in elevations is not equal to number of elements in locations (%tu)", buf, 0x16u);
      }
    }

  }
}

- (void)adjustElevationForTripSegmentLocations:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  RTElevationAdjuster *v24;
  _QWORD v25[4];
  id v26;
  RTElevationAdjuster *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v24 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v9 = 0;
      do
      {
        v10 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timestamp");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timestamp");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v12, v14);

        v16 = objc_alloc(MEMORY[0x1E0D18370]);
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "altitude");
        v18 = (void *)objc_msgSend(v16, "initWithElevation:dateInterval:", v15);
        objc_msgSend(v8, "addObject:", v18);

        ++v9;
      }
      while (v9 < objc_msgSend(v6, "count"));
    }
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v30 = objc_msgSend(v6, "count");
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "Invoked adjustElevationForLocations for %tu CLLocation values", buf, 0xCu);
    }

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __93__RTElevationAdjuster_CLTripSegmentLocation__adjustElevationForTripSegmentLocations_handler___block_invoke;
    v25[3] = &unk_1E9297F30;
    v26 = v6;
    v27 = v24;
    v28 = v7;
    -[RTElevationAdjuster adjustElevation:handler:](v24, "adjustElevation:handler:", v8, v25);

    v20 = v26;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = *MEMORY[0x1E0D18598];
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received empty location array"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 7, v20);
    (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v23);

  }
}

void __93__RTElevationAdjuster_CLTripSegmentLocation__adjustElevationForTripSegmentLocations_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5 || (v6 = objc_msgSend(v7, "count"), v6 != objc_msgSend(*(id *)(a1 + 32), "count")))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 40), "respondWithTripSegmentLocation:elevations:error:handler:", *(_QWORD *)(a1 + 32), v7, 0, *(_QWORD *)(a1 + 48));

}

- (RTElevationAdjuster)initWithElevationManager:(id)a3
{
  id v5;
  RTElevationAdjuster *v6;
  RTElevationAdjuster *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTElevationAdjuster;
  v6 = -[RTElevationAdjuster init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_elevationManager, a3);

  return v7;
}

- (id)performElevationInterpolationOn:(id)a3 referenceElevations:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  uint8_t *v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  __int16 v84;
  __int16 v85;
  uint8_t buf[2];
  __int16 v87;

  v5 = a3;
  v6 = a4;
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      v33 = v5;
      goto LABEL_21;
    }
    v87 = 0;
    v31 = "Attempting adjustElevationForLocationsWithElevations with no input elevation data";
    v32 = (uint8_t *)&v87;
LABEL_44:
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, v31, v32, 2u);
    goto LABEL_20;
  }
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v31 = "Attempting adjustElevationForLocationsWithElevations with no reference elevation data";
    v32 = buf;
    goto LABEL_44;
  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v7 = 1;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isOnOrAfter:", v11);

      if (v12)
        break;
      if (++v7 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_9;
    }
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v85 = 0;
    v31 = "Reference elevation data not in chronological order";
    v32 = (uint8_t *)&v85;
    goto LABEL_44;
  }
LABEL_9:
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v13 = 1;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v13 - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "isOnOrAfter:", v17);

      if (v18)
        break;
      if (++v13 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_13;
    }
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v84 = 0;
    v31 = "Input elevation data not in chronological order";
    v32 = (uint8_t *)&v84;
    goto LABEL_44;
  }
LABEL_13:
  v83 = v6;
  v19 = objc_msgSend(v6, "count");
  v20 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v81 = v20;
  v23 = v20 - 1;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "endDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "endDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "compare:", v27);

    if (v28 != -1 || v22 >= v23)
      break;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v29);

    ++v22;
  }
  v35 = v81;
  v80 = v21;
  if (v22 >= v81 || v19 < 2)
  {
    v6 = v83;
  }
  else
  {
    v36 = 0;
    v79 = v19 - 1;
    v6 = v83;
    do
    {
      v37 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v6, "objectAtIndexedSubscript:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "endDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v36 + 1;
      objc_msgSend(v6, "objectAtIndexedSubscript:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "endDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v37, "initWithStartDate:endDate:", v39, v41);

      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "endDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v42, "containsDate:", v44);

        if (!v45)
          break;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "endDate");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v36);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "endDate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "timeIntervalSinceDate:", v49);
        v51 = v50;

        objc_msgSend(v6, "objectAtIndexedSubscript:", v82);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "elevation");
        v54 = v53;
        objc_msgSend(v6, "objectAtIndexedSubscript:", v36);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "elevation");
        v57 = v56;

        objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "elevation");
        v60 = v59;

        objc_msgSend(v42, "duration");
        if (v61 > 0.0)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v36);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "elevation");
          v64 = v63;
          objc_msgSend(v42, "duration");
          v60 = v64 + v51 / v65 * (v54 - v57);

        }
        v66 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "startDate");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "endDate");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)objc_msgSend(v66, "initWithStartDate:endDate:", v68, v70);

        v72 = objc_alloc(MEMORY[0x1E0D18370]);
        objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "elevationUncertainty");
        v75 = v74;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)objc_msgSend(v72, "initWithElevation:dateInterval:elevationUncertainty:estimationStatus:", v71, objc_msgSend(v76, "estimationStatus"), v60, v75);
        objc_msgSend(v80, "addObject:", v77);

        ++v22;
        v35 = v81;
        v6 = v83;
      }
      while (v22 < v81);

      if (v22 >= v35)
        break;
      ++v36;
    }
    while (v82 < v79);
  }
  if (v22 >= v35)
  {
    v33 = v80;
  }
  else
  {
    v33 = v80;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "addObject:", v78);

      ++v22;
    }
    while (v35 != v22);
    v6 = v83;
  }
LABEL_21:

  return v33;
}

- (void)adjustElevation:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  RTElevationManager *elevationManager;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  RTElevationAdjuster *v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3588]);
    v9 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithTimeInterval:sinceDate:", v11, -10.0);
    v13 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithTimeInterval:sinceDate:", v15, 10.0);
    v17 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v12, v16);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184D8]), "initWithDateInterval:batchSize:", v17, 0);
    elevationManager = self->_elevationManager;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __47__RTElevationAdjuster_adjustElevation_handler___block_invoke;
    v23[3] = &unk_1E9298FC8;
    v26 = v7;
    v24 = v6;
    v25 = self;
    -[RTElevationManager fetchElevationsWithOptions:handler:](elevationManager, "fetchElevationsWithOptions:handler:", v18, v23);

    v20 = v26;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = *MEMORY[0x1E0D18598];
    v27 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received empty input elevation array"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 7, v18);
    (*((void (**)(id, id, void *))v7 + 2))(v7, v6, v20);
  }

}

void __47__RTElevationAdjuster_adjustElevation_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "performElevationInterpolationOn:referenceElevations:", *(_QWORD *)(a1 + 32), v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (RTElevationManager)elevationManager
{
  return self->_elevationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevationManager, 0);
}

@end
