@implementation RTLocationSmoother

- (double)getRefAlt:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = a3;
  objc_msgSend(v3, "verticalAccuracy");
  v4 = 0.0;
  if (v5 > 0.0)
  {
    objc_msgSend(v3, "altitude");
    v4 = v6;
  }

  return v4;
}

- (id)estimateLocationWithLocations:(id)a3 timestamp:(double)a4
{
  return -[RTLocationSmoother estimateLocationWithLocations:timestamp:parameters:meta:](self, "estimateLocationWithLocations:timestamp:parameters:meta:", a3, MEMORY[0x1E0C9AA70], 0, a4);
}

- (id)estimateLocationWithLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5 meta:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  NSObject *v59;
  int v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v65;
  void *v66;
  RTLocationSmoother *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  int v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  uint8_t buf[4];
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  double v81;
  __int16 v82;
  double v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  NSObject *v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a3;
  v13 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v10, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherPreciseLocationOnlyMode"), MEMORY[0x1E0C9AAA0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v10, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherEnableFallbackModel"), v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v10, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherInterpolateTime"), MEMORY[0x1E0C9AAB0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v10, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherAverageMovingSpeed"), &unk_1E932CD90);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v70 = objc_claimAutoreleasedReturnValue();
  v90[0] = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingDescriptors:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = v23;
  if (!v15)
  {
    v26 = v23;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("timestamp"), v44);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "filteredArrayUsingPredicate:", v46);
    v29 = objc_claimAutoreleasedReturnValue();

    -[NSObject lastObject](v29, "lastObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "timestamp");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "timeIntervalSinceReferenceDate");
    v50 = v49;

    -[RTLocationSmoother smoothLocations:timestamp:parameters:](self, "smoothLocations:timestamp:parameters:", v26, v10, v50 + -0.00000001);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      if (v18)
      {
        objc_msgSend(v26, "filteredArrayUsingPredicate:", v73);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityLocation);
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v77 = *(double *)&v44;
          v78 = 2048;
          v79 = COERCE_DOUBLE(objc_msgSend(v51, "count"));
          _os_log_debug_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, interpolation, referenceDate, %@, post locations, %lu", buf, 0x16u);
        }

        if (objc_msgSend(v51, "count"))
        {
          v69 = v44;
          objc_msgSend(v51, "firstObject");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "timestamp");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "timeIntervalSinceReferenceDate");
          v56 = v55;

          -[RTLocationSmoother smoothLocations:timestamp:parameters:](self, "smoothLocations:timestamp:parameters:", v26, v10, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v57;
          if (v57 && v50 != v56)
          {
            -[RTLocationSmoother interpolateLocation1:location2:weigth:speed:timestamp:](self, "interpolateLocation1:location2:weigth:speed:timestamp:", v25, v57, 1.0 - (a4 - v50) / (v56 - v50), v21, a4);
            *(double *)&v30 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            _rt_log_facility_get_os_log(RTLogFacilityLocation);
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134219522;
              v77 = v50;
              v78 = 2048;
              v79 = a4;
              v80 = 2048;
              v81 = v56;
              v82 = 2048;
              v83 = 1.0 - (a4 - v50) / (v56 - v50);
              v84 = 2112;
              v85 = v25;
              v86 = 2112;
              v87 = v58;
              v88 = 2112;
              v89 = v30;
              _os_log_debug_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, interpolation, t1, %.2f, timeofinterest, %.2f, t2, %.2f, weight, %.2f, location1, %@, location2, %@, interpolatedLocation, %@", buf, 0x48u);
            }

            v44 = v69;
            if (*(double *)&v30 == 0.0)
              goto LABEL_32;
LABEL_27:
            v45 = (void *)v70;
            goto LABEL_35;
          }

          v44 = v69;
        }

      }
LABEL_32:
      -[RTLocationSmoother inflateHorizontalAccuracyWithLocation:speed:timestamp:](self, "inflateHorizontalAccuracyWithLocation:speed:timestamp:", v25, v21, a4);
      *(double *)&v30 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      *(double *)&v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v45 = (void *)v70;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v77 = *(double *)&v25;
        v78 = 2112;
        v79 = *(double *)&v30;
        _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, allLocationMode, locationT1, %@, estimatedLocation, %@", buf, 0x16u);
      }
      goto LABEL_34;
    }
    *(double *)&v30 = 0.0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type IN %@"), &unk_1E932C1A8);
  v68 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filteredArrayUsingPredicate:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationSmoother smoothLocations:timestamp:parameters:](self, "smoothLocations:timestamp:parameters:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type IN %@"), &unk_1E932C1C0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filteredArrayUsingPredicate:", v25);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v67 = self;
  -[RTLocationSmoother snapToBestLocationWithLocations:timestamp:parameters:](self, "snapToBestLocationWithLocations:timestamp:parameters:", v26, v10, a4);
  *(double *)&v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  v28 = v24;
  v29 = v28;
  v30 = v28;
  if (*(double *)&v27 != 0.0)
  {
    if (!v28)
    {
      *(double *)&v30 = COERCE_DOUBLE(v27);
      if (v11)
        goto LABEL_7;
      goto LABEL_12;
    }
    -[NSObject horizontalAccuracy](v27, "horizontalAccuracy");
    v32 = v31 + v31;
    -[NSObject horizontalAccuracy](v29, "horizontalAccuracy");
    v30 = v29;
    if (v32 < v33)
    {
      *(double *)&v30 = COERCE_DOUBLE(v27);

    }
  }
  if (v11)
  {
LABEL_7:
    v66 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("timestamp"), v65);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "filteredArrayUsingPredicate:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v35, "count"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __78__RTLocationSmoother_estimateLocationWithLocations_timestamp_parameters_meta___block_invoke;
    v74[3] = &unk_1E929A988;
    v37 = v36;
    v75 = v37;
    objc_msgSend(v35, "enumerateObjectsUsingBlock:", v74);
    if (objc_msgSend(v37, "count"))
    {
      objc_msgSend(v37, "valueForKeyPath:", CFSTR("@avg.self"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "doubleValue");
      v40 = v39;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v41, CFSTR("kRTLocationSmootherSpeedEstimationAfterDate"));

      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v77 = v40;
        _os_log_debug_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, preciseLocationMode, speedAfterDate, %f", buf, 0xCu);
      }

    }
    v11 = v66;
  }
LABEL_12:
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v77 = *(double *)&v29;
    v78 = 2112;
    v79 = *(double *)&v27;
    v80 = 2112;
    v81 = *(double *)&v30;
    _os_log_debug_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, preciseLocationMode, gpsEstimatedLocation, %@, wifiEstimatedLocation, %@, interpolatedLocation, %@", buf, 0x20u);
  }

  self = v67;
  v44 = (void *)v68;
  v45 = (void *)v70;
LABEL_34:

LABEL_35:
  v60 = v72;
  if (*(double *)&v30 != 0.0)
    v60 = 0;
  if (v60 == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = v71;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, fallback model is engaged", buf, 2u);
    }

    -[RTLocationSmoother estimateLocationFromFallbackModelWithLocations:timestamp:parameters:](self, "estimateLocationFromFallbackModelWithLocations:timestamp:parameters:", v71, v10, a4);
    v63 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = v30;
    v62 = v71;
  }

  return v63;
}

void __78__RTLocationSmoother_estimateLocationWithLocations_timestamp_parameters_meta___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "speed");
  if (v3 > 0.0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "speed");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
}

- (id)interpolateLocation1:(id)a3 location2:(id)a4 weigth:(double)a5 speed:(double)a6 timestamp:(double)a7
{
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  _OWORD v37[8];
  _OWORD v38[4];
  __int128 v39;
  __int128 v40;
  _OWORD v41[2];
  __int128 v42;
  __int128 v43;
  _OWORD v44[2];

  v11 = a3;
  v12 = a4;
  objc_msgSend(v11, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = v14;

  objc_msgSend(v12, "timestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = v17;

  objc_msgSend(v11, "horizontalAccuracy");
  v20 = v19;
  objc_msgSend(v12, "horizontalAccuracy");
  v22 = v21;
  v43 = 0u;
  memset(v44, 0, 28);
  v42 = 0u;
  v40 = 0u;
  memset(v41, 0, sizeof(v41));
  v39 = 0u;
  memset(&v38[2], 0, 32);
  if (v11)
    objc_msgSend(v11, "clientLocation");
  v23 = a7 - v15;
  if (a7 - v15 < 0.0)
    v23 = -(a7 - v15);
  v24 = v20 + a6 * v23;
  v25 = v18 - a7;
  if (v18 - a7 < 0.0)
    v25 = -(v18 - a7);
  v26 = v22 + a6 * v25;
  if (v24 >= v26)
    v27 = v26;
  else
    v27 = v24;
  objc_msgSend(v11, "coordinate");
  v29 = v28;
  objc_msgSend(v12, "coordinate");
  *(double *)((char *)&v38[2] + 4) = (1.0 - a5) * v30 + v29 * a5;
  objc_msgSend(v11, "coordinate");
  v32 = v31;
  objc_msgSend(v12, "coordinate");
  *(double *)((char *)&v38[2] + 12) = (1.0 - a5) * v33 + v32 * a5;
  *(double *)((char *)&v38[3] + 4) = v27;
  *(double *)((char *)v41 + 12) = a7;
  v34 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  v37[6] = v42;
  v37[7] = v43;
  v38[0] = v44[0];
  *(_OWORD *)((char *)v38 + 12) = *(_OWORD *)((char *)v44 + 12);
  v37[2] = v39;
  v37[3] = v40;
  v37[4] = v41[0];
  v37[5] = v41[1];
  v37[0] = v38[2];
  v37[1] = v38[3];
  v35 = (void *)objc_msgSend(v34, "initWithClientLocation:", v37);

  return v35;
}

- (id)inflateHorizontalAccuracyWithLocation:(id)a3 speed:(double)a4 timestamp:(double)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v17;
  _OWORD v18[8];
  _OWORD v19[2];
  uint8_t buf[32];
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = a5 - v9;

  if (v10 < 0.0)
    v10 = -v10;
  objc_msgSend(v7, "horizontalAccuracy");
  v12 = v11 + a4 * v10;
  _rt_log_facility_get_os_log(RTLogFacilityLocation);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "horizontalAccuracy");
    *(_DWORD *)buf = 134218496;
    *(double *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = v12;
    _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, interpolation, no follow-up locations, delta, %.2f, originalHorizontalAccuray, %.2f, newHorizontalAccuracy, %.2f", buf, 0x20u);
  }

  v25 = 0u;
  memset(v26, 0, 28);
  v24 = 0u;
  v22 = 0u;
  memset(v23, 0, sizeof(v23));
  v21 = 0u;
  memset(buf, 0, sizeof(buf));
  if (v7)
    objc_msgSend(v7, "clientLocation");
  *(double *)&buf[20] = v12;
  *(double *)((char *)v23 + 12) = a5;
  v14 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  v18[6] = v24;
  v18[7] = v25;
  v19[0] = v26[0];
  *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)((char *)v26 + 12);
  v18[2] = v21;
  v18[3] = v22;
  v18[4] = v23[0];
  v18[5] = v23[1];
  v18[0] = *(_OWORD *)buf;
  v18[1] = *(_OWORD *)&buf[16];
  v15 = (void *)objc_msgSend(v14, "initWithClientLocation:", v18);

  return v15;
}

- (id)snapToBestLocationWithLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *i;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _OWORD v34[8];
  _OWORD v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[2];
  __int128 v41;
  __int128 v42;
  _OWORD v43[2];
  __int128 v44;
  __int128 v45;
  _OWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherAverageMovingSpeed"), &unk_1E932CD90);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v45 = 0u;
  memset(v46, 0, 28);
  v44 = 0u;
  v42 = 0u;
  memset(v43, 0, sizeof(v43));
  v41 = 0u;
  memset(v40, 0, sizeof(v40));
  v12 = (void *)objc_opt_new();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "clientLocation");
  }
  else
  {
    v45 = 0u;
    memset(v46, 0, 28);
    v44 = 0u;
    v42 = 0u;
    memset(v43, 0, sizeof(v43));
    v41 = 0u;
    memset(v40, 0, sizeof(v40));
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = v7;
  v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (!v15)
  {

    v16 = 0;
    goto LABEL_21;
  }
  v16 = 0;
  v17 = *(_QWORD *)v37;
  v18 = -1.0;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(_QWORD *)v37 != v17)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
      if (v16)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "horizontalAccuracy");
        v22 = v21;
        objc_msgSend(v20, "timestamp");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceReferenceDate");
        v25 = v22 + v11 * vabdd_f64(a4, v24);

        if (v25 >= v18)
          continue;
        v26 = v20;
      }
      else
      {
        v26 = v20;
        objc_msgSend(v26, "horizontalAccuracy");
        v28 = v27;
        objc_msgSend(v26, "timestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
        v25 = v28 + v11 * vabdd_f64(a4, v29);
      }

      v18 = v25;
      v16 = v26;
    }
    v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  }
  while (v15);

  if (v16
    && (*(double *)((char *)v43 + 12) = a4,
        LODWORD(v44) = 4,
        *(double *)((char *)&v40[1] + 4) = v18,
        objc_msgSend(v16, "coordinate"),
        *(_QWORD *)((char *)v40 + 4) = v30,
        objc_msgSend(v16, "coordinate"),
        *(_QWORD *)((char *)v40 + 12) = v31,
        *(double *)((char *)&v40[1] + 4) > 0.0))
  {
    v32 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    v34[6] = v44;
    v34[7] = v45;
    v35[0] = v46[0];
    *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)((char *)v46 + 12);
    v34[2] = v41;
    v34[3] = v42;
    v34[4] = v43[0];
    v34[5] = v43[1];
    v34[0] = v40[0];
    v34[1] = v40[1];
    v15 = (void *)objc_msgSend(v32, "initWithClientLocation:", v34);
  }
  else
  {
    v15 = 0;
  }
LABEL_21:

  return v15;
}

+ (int)_inferLocationType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type IN %@"), &unk_1E932C1D8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type IN %@"), &unk_1E932C1F0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
      v7 = 4;
    else
      v7 = 6;

  }
  return v7;
}

- (id)smoothLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  NSObject *v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  char v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  NSObject *v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  NSObject *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  NSObject *v114;
  void *v115;
  void *v116;
  id v117;
  NSObject *v119;
  const char *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  id v128;
  double v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  _OWORD v149[8];
  _OWORD v150[2];
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  double v154;
  double v155;
  uint8_t buf[32];
  _OWORD v157[2];
  _OWORD v158[3];
  _BYTE v159[50];
  __int16 v160;
  double v161;
  __int16 v162;
  double v163;
  __int16 v164;
  double v165;
  __int16 v166;
  double v167;
  __int16 v168;
  unsigned int v169;
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherPk_pre"), &unk_1E932CDA0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v8, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherDeltaQk"), &unk_1E932CDB0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v8, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherDynamicQk"), &unk_1E932CDC0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v8, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherAverageMovingSpeed"), &unk_1E932CD90);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    v19 = 10.0;
    if (v15)
    {
      objc_msgSend(v8, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherQkCoefficient"), &unk_1E932CDD0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = v21;

      if (v18 * v22 * (v18 * v22) >= 10.0)
        v19 = v18 * v22 * (v18 * v22);
      else
        v19 = 10.0;
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "description");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        *(double *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v121;
        _os_log_debug_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, speed, %.2f, qkFromSpeed, %.2f, parameters, %@", buf, 0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherQk"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v148 = v26;

    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v148;
      _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, q, %.2f", buf, 0xCu);
    }

    v154 = 0.0;
    v155 = 0.0;
    v153 = 0;
    v135 = a4;
    if (objc_msgSend(v7, "count"))
    {
      v127 = v18;
      v128 = v8;
      v28 = 0;
      v29 = 1;
      v140 = -1.0;
      v30 = 0;
      v31 = 0;
      v147 = v11;
      v145 = 0.0;
      v146 = 0.0;
      v32 = v11;
      v137 = 0.0;
      v138 = 0.0;
      v139 = -1.0;
      v141 = 0.0;
      v142 = 0.0;
      v129 = 0.0;
      v33 = 1;
      v144 = sqrt(v148);
      v136 = v11;
      while (1)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v28);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v29 == 1)
          v36 = 0;
        else
          v36 = v13;
        v37 = v148;
        if (v36 == 1)
        {
          objc_msgSend(v34, "timestamp");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndexedSubscript:", v29 - 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "timestamp");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "timeIntervalSinceDate:", v40);
          v42 = v41;

          if (v144 * v42 * (v144 * v42) >= 10.0)
            v37 = v144 * v42 * (v144 * v42);
          else
            v37 = 10.0;
        }
        _rt_log_facility_get_os_log(RTLogFacilityLocation);
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v71 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v35, "coordinate");
          v133 = v72;
          objc_msgSend(v35, "coordinate");
          v74 = v73;
          objc_msgSend(v35, "horizontalAccuracy");
          v76 = v75;
          objc_msgSend(v35, "speed");
          v78 = v77;
          objc_msgSend(v35, "course");
          v79 = v31;
          v80 = v30;
          v82 = v81;
          objc_msgSend(v35, "timestamp");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "stringFromDate");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = v82;
          v30 = v80;
          v31 = v79;
          v122 = v76;
          a4 = v135;
          objc_msgSend(v71, "stringWithFormat:", CFSTR("<%+.8f,%+.8f> +/- %.2fm (speed %.2f mps / course %.2f) @ %@,type %u"), v133, v74, v122, v78, v123, v84, objc_msgSend(v35, "type"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v85;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v37;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v29;
          _os_log_debug_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, Locations in vehicle estimator buffer, %@, qk, %.2f, number, %u", buf, 0x1Cu);

        }
        objc_msgSend(v35, "horizontalAccuracy");
        if (v44 <= 0.0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityLocation);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, horizontalAccuracy is not valid", buf, 2u);
          }
        }
        else
        {
          if (v29 == 1)
          {
            objc_msgSend(v35, "coordinate");
            v31 = v45;
            objc_msgSend(v35, "coordinate");
            -[RTLocationSmoother getRefAlt:](self, "getRefAlt:", v35);
            v30 = v46;
          }
          objc_msgSend(v35, "coordinate");
          objc_msgSend(v35, "coordinate");
          RTCommonConvertGeodeticToLocalFrame();
          objc_msgSend(v35, "horizontalAccuracy");
          v48 = v47;
          objc_msgSend(v35, "horizontalAccuracy");
          v50 = v48 * v49 * 0.5;
          if (v29 == 1)
          {
            v145 = v155;
            v146 = v154;
            v32 = v136 + v50;
            v147 = v136 + v50;
          }
          else
          {
            objc_msgSend(v35, "timestamp");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "timeIntervalSinceReferenceDate");
            v53 = v52;

            if (v53 < a4)
            {
              if (v147 + v50 == 0.0)
              {
                _rt_log_facility_get_os_log(RTLogFacilityLocation);
                v119 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                {
LABEL_68:
                  v8 = v128;

                  v101 = 0;
                  goto LABEL_63;
                }
                *(_WORD *)buf = 0;
                v120 = "fFilterPk_pre[0] + kFilterRk == 0.0\n";
LABEL_70:
                _os_log_error_impl(&dword_1D1A22000, v119, OS_LOG_TYPE_ERROR, v120, buf, 2u);
                goto LABEL_68;
              }
              if (v32 + v50 == 0.0)
              {
                _rt_log_facility_get_os_log(RTLogFacilityLocation);
                v119 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                  goto LABEL_68;
                *(_WORD *)buf = 0;
                v120 = "fFilterPk_pre[1] + kFilterRk == 0.0\n";
                goto LABEL_70;
              }
              v54 = v147 / (v147 + v50);
              v55 = v32 / (v32 + v50);
              v145 = v145 + v55 * (v155 - v145);
              v146 = v146 + v54 * (v154 - v146);
              v147 = v37 + v147 - v54 * v147;
              v32 = v37 + v32 - v55 * v32;
              _rt_log_facility_get_os_log(RTLogFacilityLocation);
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                v86 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v35, "coordinate");
                v134 = v87;
                objc_msgSend(v35, "coordinate");
                v131 = v88;
                objc_msgSend(v35, "horizontalAccuracy");
                v90 = v89;
                objc_msgSend(v35, "timestamp");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "stringFromDate");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "stringWithFormat:", CFSTR("<%+.8f,%+.8f> +/- %.2f @ %@"), v134, v131, v90, v92);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138415362;
                *(_QWORD *)&buf[4] = v93;
                *(_WORD *)&buf[12] = 2048;
                *(double *)&buf[14] = v154;
                *(_WORD *)&buf[22] = 2048;
                *(double *)&buf[24] = v155;
                LOWORD(v157[0]) = 2048;
                *(double *)((char *)v157 + 2) = v37;
                WORD5(v157[0]) = 2048;
                *(double *)((char *)v157 + 12) = v146;
                WORD2(v157[1]) = 2048;
                *(double *)((char *)&v157[1] + 6) = v145;
                HIWORD(v157[1]) = 2048;
                *(double *)v158 = v147;
                WORD4(v158[0]) = 2048;
                *(double *)((char *)v158 + 10) = v32;
                WORD1(v158[1]) = 2048;
                *(double *)((char *)&v158[1] + 4) = v154;
                WORD6(v158[1]) = 2048;
                *(double *)((char *)&v158[1] + 14) = v155;
                WORD3(v158[2]) = 2048;
                *((double *)&v158[2] + 1) = v154 - v146;
                *(_WORD *)v159 = 2048;
                *(double *)&v159[2] = v155 - v145;
                *(_WORD *)&v159[10] = 1024;
                *(_DWORD *)&v159[12] = v29;
                _os_log_debug_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_DEBUG, "RTLocationSmoother (forward), %@, (E,N) (%.4f, %.4f), qk, %.2f, Xk (%.2f, %.2f), Pkpre, (%.2f, %.2f), Zk, (%.2f, %.2f), Zk-Xk, (%.2f, %.2f), number, %u,  ", buf, 0x80u);

              }
              goto LABEL_35;
            }
          }
          objc_msgSend(v35, "timestamp");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "timeIntervalSinceReferenceDate");
          v59 = v58;

          if (v59 < a4)
            goto LABEL_45;
          if ((v33 & 1) != 0)
          {
            objc_msgSend(v35, "timestamp");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "timeIntervalSinceReferenceDate");
            v129 = v61;

            v141 = v146;
            v142 = v145;
            v139 = v147;
            v140 = v32;
            v137 = v32;
            v138 = v147;
          }
          if (v29 == 1)
          {
            v33 = 0;
            goto LABEL_45;
          }
          v130 = v31;
          v132 = v30;
          v62 = v50 + v32;
          v63 = v147 / (v50 + v147);
          v64 = v138 / (v50 + v147);
          v65 = v137 / v62;
          v66 = v154 - v146;
          v67 = v155 - v145;
          v141 = v141 + v64 * (v154 - v146);
          v142 = v142 + v137 / v62 * (v155 - v145);
          v68 = v32 / v62;
          v145 = v145 + v32 / v62 * (v155 - v145);
          v146 = v146 + v63 * (v154 - v146);
          v147 = v37 + v147 * (1.0 - v63);
          v69 = 1.0 - v32 / v62;
          v32 = v37 + v32 * v69;
          v139 = v139 - v138 * v64;
          v140 = v140 - v137 * v65;
          v137 = v69 * v137;
          v138 = (1.0 - v63) * v138;
          _rt_log_facility_get_os_log(RTLogFacilityLocation);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            v94 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v35, "coordinate");
            v126 = v95;
            objc_msgSend(v35, "coordinate");
            v125 = v96;
            objc_msgSend(v35, "horizontalAccuracy");
            v124 = v97;
            objc_msgSend(v35, "timestamp");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "stringFromDate");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "stringWithFormat:", CFSTR("<%+.8f,%+.8f> +/- %.2f @ %@"), v126, v125, v124, v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138417410;
            *(_QWORD *)&buf[4] = v100;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v154;
            *(_WORD *)&buf[22] = 2048;
            *(double *)&buf[24] = v155;
            LOWORD(v157[0]) = 2048;
            *(double *)((char *)v157 + 2) = v37;
            WORD5(v157[0]) = 2048;
            *(double *)((char *)v157 + 12) = v141;
            WORD2(v157[1]) = 2048;
            *(double *)((char *)&v157[1] + 6) = v142;
            HIWORD(v157[1]) = 2048;
            *(double *)v158 = v147;
            WORD4(v158[0]) = 2048;
            *(double *)((char *)v158 + 10) = v32;
            WORD1(v158[1]) = 2048;
            *(double *)((char *)&v158[1] + 4) = v63;
            WORD6(v158[1]) = 2048;
            *(double *)((char *)&v158[1] + 14) = v68;
            WORD3(v158[2]) = 2048;
            *((double *)&v158[2] + 1) = v154;
            *(_WORD *)v159 = 2048;
            *(double *)&v159[2] = v155;
            *(_WORD *)&v159[10] = 2048;
            *(double *)&v159[12] = v154 - v146;
            *(_WORD *)&v159[20] = 2048;
            *(double *)&v159[22] = v155 - v145;
            *(_WORD *)&v159[30] = 2048;
            *(double *)&v159[32] = v64;
            *(_WORD *)&v159[40] = 2048;
            *(double *)&v159[42] = v65;
            v160 = 2048;
            v161 = v66;
            v162 = 2048;
            v163 = v67;
            v164 = 2048;
            v165 = v138;
            v166 = 2048;
            v167 = v137;
            v168 = 1024;
            v169 = v29;
            _os_log_debug_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_DEBUG, "RTLocationSmoother (backward), %@, (E,N) (%.4f, %.4f), qk, %.2f, Xjj (%.2f, %.2f), Pkpre, (%.2f, %.2f), Lk, (%.2f, %.2f), Zk, (%.2f, %.2f), Zk-Xk, (%.2f, %.2f), lambda, (%.2f, %.2f), innovation, (%.2f, %.2f), sigma, (%2.f, %.2f), number, %u,  ", buf, 0xD0u);

          }
          v33 = 0;
          v30 = v132;
          a4 = v135;
          v31 = v130;
        }
LABEL_35:

LABEL_45:
        v28 = v29;
        if (objc_msgSend(v7, "count") <= (unint64_t)v29++)
        {
          if ((v33 & 1) != 0)
          {
            v8 = v128;
            v102 = v127;
            v103 = v147;
            goto LABEL_51;
          }
          v108 = v139 + v140;
          v8 = v128;
          v109 = v127;
          v107 = v129;
          goto LABEL_53;
        }
      }
    }
    v102 = v18;
    v32 = v11;
    v103 = v11;
LABEL_51:
    objc_msgSend(v7, "lastObject");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "timestamp");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "timeIntervalSinceReferenceDate");
    v107 = v106;

    v108 = v32 + v103;
    v109 = v102;
    a4 = v135;
LABEL_53:
    v110 = sqrt(v108);
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("@min.horizontalAccuracy"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    if (v110 < v111)
    {
      objc_msgSend(v35, "doubleValue");
      v110 = v112;
    }
    v151 = 0;
    v152 = 0;
    RTCommonConvertLocalFrameToGeodetic();
    v113 = v110 + v109 * vabdd_f64(a4, v107);
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v113 - v110;
      _os_log_debug_impl(&dword_1D1A22000, v114, OS_LOG_TYPE_DEBUG, "RTLocationSmoother, additional uncertainty, %f", buf, 0xCu);
    }

    memset(v159, 0, 44);
    memset(v158, 0, sizeof(v158));
    memset(v157, 0, sizeof(v157));
    memset(buf, 0, sizeof(buf));
    v115 = (void *)objc_opt_new();
    v116 = v115;
    if (v115)
    {
      objc_msgSend(v115, "clientLocation");
    }
    else
    {
      memset(v159, 0, 44);
      memset(v158, 0, sizeof(v158));
      memset(v157, 0, sizeof(v157));
      memset(buf, 0, sizeof(buf));
    }

    *(double *)((char *)v158 + 12) = a4;
    v101 = 0;
    LODWORD(v158[2]) = +[RTLocationSmoother _inferLocationType:](RTLocationSmoother, "_inferLocationType:", v7);
    *(double *)&buf[20] = v113;
    *(_QWORD *)&buf[4] = v152;
    *(_QWORD *)&buf[12] = v151;
    if (v113 > 0.0 && v110 > 0.0)
    {
      v117 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      v149[6] = v158[2];
      v149[7] = *(_OWORD *)v159;
      v150[0] = *(_OWORD *)&v159[16];
      *(_OWORD *)((char *)v150 + 12) = *(_OWORD *)&v159[28];
      v149[2] = v157[0];
      v149[3] = v157[1];
      v149[4] = v158[0];
      v149[5] = v158[1];
      v149[0] = *(_OWORD *)buf;
      v149[1] = *(_OWORD *)&buf[16];
      v101 = (void *)objc_msgSend(v117, "initWithClientLocation:", v149);
    }
LABEL_63:

  }
  else
  {
    v101 = 0;
  }

  return v101;
}

- (id)estimateLocationFromFallbackModelWithLocations:(id)a3 timestamp:(double)a4 parameters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  id v23;
  _OWORD v25[8];
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "objectForKey:defaultObject:", CFSTR("kRTLocationSmootherAverageMovingSpeed"), &unk_1E932CD90);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v7;
  v13 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v13)
  {
    v14 = 0;
    v15 = *(_QWORD *)v37;
    v16 = 1.79769313e308;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v18, "timestamp");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceReferenceDate");
        v21 = v20 - a4;

        if (v21 < 0.0)
          v21 = -v21;
        if (v16 > v21)
        {
          v22 = v18;

          v14 = v22;
          v16 = v21;
        }
      }
      v13 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v13);

    if (!v14)
    {
      v13 = 0;
      goto LABEL_17;
    }
    v34 = 0u;
    memset(v35, 0, 28);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
    objc_msgSend(v14, "clientLocation");
    *(double *)((char *)&v28 + 4) = *(double *)((char *)&v28 + 4) + v11 * v16;
    v23 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    v25[6] = v33;
    v25[7] = v34;
    v26[0] = v35[0];
    *(_OWORD *)((char *)v26 + 12) = *(_OWORD *)((char *)v35 + 12);
    v25[2] = v29;
    v25[3] = v30;
    v25[4] = v31;
    v25[5] = v32;
    v25[0] = v27;
    v25[1] = v28;
    v13 = (void *)objc_msgSend(v23, "initWithClientLocation:", v25);
  }
  else
  {
    v14 = v12;
  }

LABEL_17:
  return v13;
}

- (id)estimateVehicleLocationWithLocations:(id)a3 parkingTimestamp:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  NSObject *v18;
  _QWORD v20[5];
  uint8_t buf[4];
  double v22;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("kRTLocationSmootherQk");
  v23[1] = CFSTR("kRTLocationSmootherPk_pre");
  v24[0] = &unk_1E932D560;
  v24[1] = &unk_1E932D570;
  v23[2] = CFSTR("kRTLocationSmootherAverageMovingSpeed");
  v23[3] = CFSTR("kRTLocationSmootherPreciseLocationOnlyMode");
  v24[2] = &unk_1E932D580;
  v24[3] = MEMORY[0x1E0C9AAB0];
  v23[4] = CFSTR("kRTLocationSmootherInterpolateTime");
  v24[4] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __102__RTLocationSmoother_VehicleLocationEstimator__estimateVehicleLocationWithLocations_parkingTimestamp___block_invoke;
  v20[3] = &__block_descriptor_40_e37_B24__0__CLLocation_8__NSDictionary_16l;
  *(double *)&v20[4] = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTLocationSmoother estimateLocationWithLocations:timestamp:parameters:meta:](self, "estimateLocationWithLocations:timestamp:parameters:meta:", v11, v9, v8, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kRTLocationSmootherSpeedEstimationAfterDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13
    && (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kRTLocationSmootherSpeedEstimationAfterDate")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "doubleValue"),
        v16 = v15,
        v14,
        v16 > 9.0))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134283521;
      v22 = v16;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "invalidating parked event due to large average speed of %{private}f m/s", buf, 0xCu);
    }

    v17 = 0;
  }
  else
  {
    v17 = v12;
  }

  return v17;
}

BOOL __102__RTLocationSmoother_VehicleLocationEstimator__estimateVehicleLocationWithLocations_parkingTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  _BOOL8 v9;

  v3 = a2;
  v4 = *(double *)(a1 + 32);
  objc_msgSend(v3, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  if (v4 - v6 > 10.0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v3, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = v8 - *(double *)(a1 + 32) <= 16.0;

  }
  return v9;
}

@end
