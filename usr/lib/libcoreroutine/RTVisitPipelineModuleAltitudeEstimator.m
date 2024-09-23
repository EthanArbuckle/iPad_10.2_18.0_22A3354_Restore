@implementation RTVisitPipelineModuleAltitudeEstimator

- (RTVisitPipelineModuleAltitudeEstimator)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMaxHorizontalAccuracy_locationManager_);
}

- (RTVisitPipelineModuleAltitudeEstimator)initWithMaxHorizontalAccuracy:(double)a3 locationManager:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  RTVisitPipelineModuleAltitudeEstimator *v11;
  RTVisitPipelineModuleAltitudeEstimator *v12;
  RTVisitPipelineModuleAltitudeEstimator *v13;
  objc_super v15;
  uint8_t buf[16];

  v7 = a4;
  v8 = v7;
  if (a3 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid parameter not satisfying: maxHorizontalAccuracy >= 0";
LABEL_12:
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid parameter not satisfying: locationManager";
      goto LABEL_12;
    }
LABEL_9:

    v13 = 0;
    goto LABEL_10;
  }
  v15.receiver = self;
  v15.super_class = (Class)RTVisitPipelineModuleAltitudeEstimator;
  v11 = -[RTVisitPipelineModuleAltitudeEstimator init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_maxHorizontalAccuracy = a3;
    objc_storeStrong((id *)&v11->_locationManager, a4);
    -[RTVisitPipelineModuleAltitudeEstimator initializeZAxisParameters](v12, "initializeZAxisParameters");
  }
  self = v12;
  v13 = self;
LABEL_10:

  return v13;
}

- (void)initializeZAxisParameters
{
  *(_OWORD *)&self->_estimatedAltitude = xmmword_1D1EEE010;
}

- (BOOL)isValidForAltitudeUpdate:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", v10, 2u);
    }

    goto LABEL_8;
  }
  if (objc_msgSend(v3, "type") == 1 || (objc_msgSend(v4, "verticalAccuracy"), v5 < 0.0))
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "verticalAccuracy");
  v7 = v6 < 30.0;
LABEL_9:

  return v7;
}

- (void)updateAltitudeForCentroid:(id)a3 locations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double estimatedVerticalUncertainty;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint8_t v19[16];
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  double v28;
  __int128 buf;
  uint64_t v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  estimatedVerticalUncertainty = self->_estimatedVerticalUncertainty;
  if (estimatedVerticalUncertainty == -1.0 || estimatedVerticalUncertainty > 0.0)
  {
    if (objc_msgSend(v7, "count"))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v30 = 0x2020000000;
      v11 = self->_estimatedVerticalUncertainty;
      v12 = 0.0;
      if (v11 != -1.0)
        v12 = 1.0 / (v11 * v11);
      v31 = v12;
      v25 = 0;
      v26 = (double *)&v25;
      v13 = v12 * self->_estimatedAltitude;
      v27 = 0x2020000000;
      v28 = v13;
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __78__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeForCentroid_locations___block_invoke;
      v20[3] = &unk_1E92A32C8;
      v20[4] = self;
      v20[5] = &v21;
      v20[6] = &buf;
      v20[7] = &v25;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v20);
      if (!*((_BYTE *)v22 + 24))
      {
        v14 = *((_QWORD *)&buf + 1);
        v15 = *(double *)(*((_QWORD *)&buf + 1) + 24);
        if (v15 <= 0.0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v19 = 0;
            _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inverseVerticalUncertaintySquaredSum > 0.0", v19, 2u);
          }

        }
        else
        {
          self->_estimatedVerticalUncertainty = sqrt(1.0 / v15);
          self->_estimatedAltitude = v26[3] / *(double *)(v14 + 24);
        }
      }
      _Block_object_dispose(&v21, 8);
      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "no locations after filtering to update the estimated altitude and vertical uncertainty.", (uint8_t *)&buf, 2u);
      }

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_estimatedVerticalUncertainty);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "invalid estimated verticalUncertainty, %@, setting it to the default value.", (uint8_t *)&buf, 0xCu);

    }
    self->_estimatedVerticalUncertainty = -1.0;
  }

}

void __78__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeForCentroid_locations___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "verticalUncertainty");
  if (v7 == 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "this location, %@, has zero uncertainty, so it is chosen as the final estimate.", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(v6, "altitude");
    *(_QWORD *)(a1[4] + 24) = v9;
    objc_msgSend(v6, "verticalUncertainty");
    *(_QWORD *)(a1[4] + 32) = v10;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "verticalUncertainty");
    v12 = v11;
    objc_msgSend(v6, "verticalUncertainty");
    v14 = 1.0 / (v12 * v13);
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v14 + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
    objc_msgSend(v6, "altitude");
    *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = *(double *)(*(_QWORD *)(a1[7] + 8) + 24) + v15 * v14;
  }

}

- (id)dateIntervalForAltitudeEstimation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "exit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "entry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateWithTimeInterval:sinceDate:", v9, 900.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "earlierDate:", v10);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "entry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isBeforeDate:", v11);

  if (v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v21 = 138412290;
      v22 = v3;
      _os_log_fault_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_FAULT, "Invalid visit for altitude update, %@", (uint8_t *)&v21, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "entry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateWithTimeInterval:sinceDate:", v15, 900.0);
    v16 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v16;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v3, "entry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithStartDate:endDate:", v18, v6);

  return v19;
}

- (id)updateAltitudeforVisit:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  CLLocationDegrees v8;
  void *v9;
  CLLocationDegrees v10;
  CLLocationCoordinate2D v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_semaphore_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  dispatch_time_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  char v38;
  id v39;
  NSObject *v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double estimatedVerticalUncertainty;
  double estimatedAltitude;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  RTVisitPipelineModuleAltitudeEstimator *v91;
  _QWORD v92[5];
  NSObject *v93;
  uint64_t *v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;
  id *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  uint8_t buf[24];
  _QWORD v109[3];

  v109[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RTVisitPipelineModuleAltitudeEstimator initializeZAxisParameters](self, "initializeZAxisParameters");
  v90 = v4;
  v91 = self;
  -[RTVisitPipelineModuleAltitudeEstimator dateIntervalForAltitudeEstimation:](self, "dateIntervalForAltitudeEstimation:", v4);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latitude");
  v8 = v7;
  objc_msgSend(v4, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "longitude");
  v11 = CLLocationCoordinate2DMake(v8, v10);
  objc_msgSend(v4, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "horizontalUncertainty");
  v14 = v13;

  if (v14 < 5.0)
    v14 = 5.0;
  objc_msgSend(v90, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v5, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v16, v11.latitude, v11.longitude, 0.0, v14, 0.0);

  v86 = *MEMORY[0x1E0D18598];
  v87 = *MEMORY[0x1E0CB2D50];
  do
  {
    v17 = (void *)MEMORY[0x1D8231EA8]();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v89, 200, v88, v91->_maxHorizontalAccuracy);
    v102 = 0;
    v103 = (id *)&v102;
    v104 = 0x3032000000;
    v105 = __Block_byref_object_copy__131;
    v106 = __Block_byref_object_dispose__131;
    v107 = 0;
    v96 = 0;
    v97 = &v96;
    v98 = 0x3032000000;
    v99 = __Block_byref_object_copy__131;
    v100 = __Block_byref_object_dispose__131;
    v101 = 0;
    v19 = dispatch_semaphore_create(0);
    -[RTVisitPipelineModuleAltitudeEstimator locationManager](v91, "locationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __65__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeforVisit___block_invoke;
    v92[3] = &unk_1E92A3318;
    v95 = &v96;
    v94 = &v102;
    v92[4] = v91;
    v21 = v19;
    v93 = v21;
    objc_msgSend(v20, "fetchStoredLocationsWithOptions:handler:", v18, v92);

    v22 = v21;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v22, v24))
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceDate:", v23);
    v27 = v26;
    v28 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_101);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "filteredArrayUsingPredicate:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "submitToCoreAnalytics:type:duration:", v32, 1, v27);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v34 = (void *)MEMORY[0x1E0CB35C8];
    v109[0] = v87;
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v109, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", v86, 15, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = objc_retainAutorelease(v36);

      v38 = 0;
    }
    else
    {
LABEL_9:
      v37 = 0;
      v38 = 1;
    }

    v39 = v37;
    if ((v38 & 1) == 0)
      objc_storeStrong(v103 + 5, v37);
    if (v103[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v53 = v103[5];
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v53;
        _os_log_debug_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_DEBUG, "not updating the current visit's altitude and verticalUncertainty due to error, %@", buf, 0xCu);
      }

      objc_msgSend(v90, "location");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "altitude");
      v91->_estimatedAltitude = v42;

      objc_msgSend(v90, "location");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "verticalUncertainty");
      v91->_estimatedVerticalUncertainty = v44;
      v45 = 2;
    }
    else
    {
      objc_msgSend(v90, "location");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitPipelineModuleAltitudeEstimator updateAltitudeForCentroid:locations:](v91, "updateAltitudeForCentroid:locations:", v46, v97[5]);

      objc_msgSend((id)v97[5], "lastObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "date");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "dateByAddingTimeInterval:", 1.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v89, "endDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v97[5], "count") && objc_msgSend(v43, "compare:", v49) == -1)
      {
        v51 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v43, "earlierDate:", v49);
        v50 = objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "initWithStartDate:endDate:", v50, v49);

        v45 = 0;
        v89 = (void *)v52;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v50 = objc_claimAutoreleasedReturnValue();
        v45 = 2;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_DEBUG, "no more locations to fetch.", buf, 2u);
        }
      }

    }
    _Block_object_dispose(&v96, 8);

    _Block_object_dispose(&v102, 8);
    objc_autoreleasePoolPop(v17);
  }
  while (!v45);
  v54 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v90, "location");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "latitude");
  v57 = v56;
  objc_msgSend(v90, "location");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "longitude");
  v60 = v59;
  objc_msgSend(v90, "location");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "horizontalUncertainty");
  v63 = v62;
  estimatedAltitude = v91->_estimatedAltitude;
  estimatedVerticalUncertainty = v91->_estimatedVerticalUncertainty;
  objc_msgSend(v90, "location");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "date");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "location");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "referenceFrame");
  objc_msgSend(v90, "location");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "speed");
  v72 = v71;
  objc_msgSend(v90, "location");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(v54, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v67, v69, objc_msgSend(v73, "sourceAccuracy"), v57, v60, v63, estimatedAltitude, estimatedVerticalUncertainty, v72);

  v75 = objc_alloc(MEMORY[0x1E0D18578]);
  objc_msgSend(v90, "date");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v90, "type");
  objc_msgSend(v90, "entry");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "exit");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v90, "dataPointCount");
  objc_msgSend(v90, "confidence");
  v82 = v81;
  objc_msgSend(v90, "placeInference");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v75, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v76, v77, v74, v78, v79, v80, v82, v83);

  return v84;
}

void __65__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeforVisit___block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  id v7;
  _RTMap *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v6 = obj;
  v7 = a2;
  v8 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v7);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeforVisit___block_invoke_2;
  v12[3] = &unk_1E92A32F0;
  v12[4] = *(_QWORD *)(a1 + 32);
  -[_RTMap withBlock:](v8, "withBlock:", v12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id __65__RTVisitPipelineModuleAltitudeEstimator_updateAltitudeforVisit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isValidForAltitudeUpdate:", v3))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)process:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  RTVisitCluster *v17;
  void *v18;
  RTVisitCluster *v19;
  void *v20;
  void *v21;
  RTVisitCluster *v22;
  RTVisitCluster *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  id v29;
  NSObject *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v4;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v6)
    {
      v7 = v6;
      v29 = v4;
      v8 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v10, "visit");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "entry");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
          if (v12)
          {
            if (v14)
            {
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v36 = v25;
              v37 = 2112;
              v38 = v10;
              _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "%@ working on cluster, %@", buf, 0x16u);

            }
            objc_msgSend(v10, "visit");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTVisitPipelineModuleAltitudeEstimator updateAltitudeforVisit:](self, "updateAltitudeforVisit:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = [RTVisitCluster alloc];
            objc_msgSend(v10, "points");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v17;
            v20 = v18;
            v21 = v16;
          }
          else
          {
            if (v14)
            {
              v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v36 = v27;
              v37 = 2112;
              v38 = v10;
              _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "%@ skiping cluster with null visit entry, %@ ", buf, 0x16u);

            }
            v22 = [RTVisitCluster alloc];
            objc_msgSend(v10, "points");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "visit");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v22;
            v20 = v16;
            v21 = v18;
          }
          v23 = -[RTVisitCluster initWithPoints:visit:](v19, "initWithPoints:visit:", v20, v21);

          objc_msgSend(v5, "addObject:", v23);
        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v7);
      v4 = v29;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, obj, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inClusters.count", buf, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (double)maxHorizontalAccuracy
{
  return self->_maxHorizontalAccuracy;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (double)estimatedAltitude
{
  return self->_estimatedAltitude;
}

- (void)setEstimatedAltitude:(double)a3
{
  self->_estimatedAltitude = a3;
}

- (double)estimatedVerticalUncertainty
{
  return self->_estimatedVerticalUncertainty;
}

- (void)setEstimatedVerticalUncertainty:(double)a3
{
  self->_estimatedVerticalUncertainty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
