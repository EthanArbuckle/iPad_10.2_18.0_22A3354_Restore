@implementation RTLearnedLocationReconcilerModel

- (double)scoreForDeviceClass:(id)a3
{
  id v3;
  double v4;
  NSObject *v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("iPhone")) & 1) != 0)
  {
    v4 = 0.3333;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Watch")) & 1) != 0)
  {
    v4 = 0.2667;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("iPad")) & 1) != 0)
  {
    v4 = 0.2;
  }
  else
  {
    v4 = 0.1333;
    if ((objc_msgSend(v3, "containsString:", CFSTR("Mac")) & 1) == 0
      && (objc_msgSend(v3, "containsString:", CFSTR("VMWare")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "containsString:", CFSTR("iPod")) & 1) != 0)
      {
        v4 = 0.0667;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        {
          v8 = 138412290;
          v9 = v3;
          _os_log_fault_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_FAULT, "cannot calculate score for device class, %@, because it is unknown.", (uint8_t *)&v8, 0xCu);
        }

        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v8 = 138412802;
          v9 = v3;
          v10 = 2080;
          v11 = "-[RTLearnedLocationReconcilerModel scoreForDeviceClass:]";
          v12 = 1024;
          v13 = 44;
          _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "cannot calculate score for device class, %@, because it is unknown. (in %s:%d)", (uint8_t *)&v8, 0x1Cu);
        }

        v4 = -1.0;
      }
    }
  }

  return v4;
}

- (double)weightForVisit:(id)a3 modelContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  double v51;
  double v52;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  RTLearnedLocationReconcilerModel *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = self;
  -[RTLearnedLocationReconcilerModel scoreForDeviceClass:](self, "scoreForDeviceClass:", v9);
  v11 = v10;

  objc_msgSend(v6, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  objc_msgSend(v7, "devices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKeyPath:", CFSTR("@sum.visits.@count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(v6, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transitions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  objc_msgSend(v7, "devices");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForKeyPath:", CFSTR("@sum.transitions.@count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  objc_msgSend(v6, "place");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "type");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v25, "unsignedIntegerValue");

  objc_msgSend(v6, "dataPointCount");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v26, "unsignedIntegerValue");

  if (v17)
    v27 = (double)v14 / (double)v17;
  else
    v27 = 0.0;
  if (v23)
    v28 = (double)v20 / (double)v23;
  else
    v28 = 0.0;
  objc_msgSend(v6, "place");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "visits");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count") == 1)
  {
    objc_msgSend(v6, "place");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "visits");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v34, "isEqual:", v6);

  }
  else
  {
    v54 = 0;
  }

  objc_msgSend(v6, "outbound");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "startDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v58 = v7;
  objc_msgSend(v7, "overlappingVisits");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v60 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v42, "outbound");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "startDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isBeforeDate:", v36);

        if (v45)
        {
          objc_msgSend(v42, "outbound");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "startDate");
          v47 = objc_claimAutoreleasedReturnValue();

          v36 = (void *)v47;
        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v39);
  }

  objc_msgSend(v6, "outbound");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "startDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v36, "isEqual:", v49);

  -[RTLearnedLocationReconcilerModel _weightWithDeviceWeight:visitsPercentage:transitionsPercentage:semanticLabel:firstVisit:earliestTransition:rawLocationCount:](v57, "_weightWithDeviceWeight:visitsPercentage:transitionsPercentage:semanticLabel:firstVisit:earliestTransition:rawLocationCount:", (unint64_t)(v56 - 1) < 3, v54, v50, v55, v11, v27, v28);
  v52 = v51;

  return v52;
}

- (double)_weightWithDeviceWeight:(double)a3 visitsPercentage:(double)a4 transitionsPercentage:(double)a5 semanticLabel:(BOOL)a6 firstVisit:(BOOL)a7 earliestTransition:(BOOL)a8 rawLocationCount:(unint64_t)a9
{
  double v9;
  double v10;
  double v11;

  v9 = a4 * 0.1538 + a3 * 0.2308 + a5 * 0.0769 + (double)a6 * 0.0769 + (double)a7 * 0.2308 + (double)a8 * 0.1923;
  if (a9 <= 0xC7)
    v10 = 0.0;
  else
    v10 = 1.0;
  v11 = v9 + v10 * 0.0385;
  if (v11 < 0.0)
    v11 = 0.0;
  return fmin(v11, 1.0);
}

@end
