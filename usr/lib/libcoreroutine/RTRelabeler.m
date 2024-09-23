@implementation RTRelabeler

- (RTRelabeler)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_);
}

- (RTRelabeler)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4
{
  id v6;
  id v7;
  RTRelabelerParameters *v8;
  RTRelabeler *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[RTRelabelerParameters initWithDefaultsManager:]([RTRelabelerParameters alloc], "initWithDefaultsManager:", v7);

  v9 = -[RTRelabeler initWithDistanceCalculator:parameters:](self, "initWithDistanceCalculator:parameters:", v6, v8);
  return v9;
}

- (RTRelabeler)initWithDistanceCalculator:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTRelabeler *v10;
  RTRelabeler *v11;
  RTInferredMapItemDeduper *v12;
  uint64_t v13;
  RTInferredMapItemDeduper *deduper;
  uint64_t v15;
  NSUUID *placeholderUUID;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *hallucinatedUUIDs;
  NSObject *v22;
  RTRelabelerParameters *parameters;
  NSUUID *v24;
  NSArray *v25;
  RTRelabeler *v26;
  NSObject *v27;
  const char *v28;
  objc_super v30;
  uint8_t buf[4];
  RTRelabelerParameters *v32;
  __int16 v33;
  NSUUID *v34;
  __int16 v35;
  NSArray *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      v26 = 0;
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_14;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: parameters";
    goto LABEL_17;
  }
  v30.receiver = self;
  v30.super_class = (Class)RTRelabeler;
  v10 = -[RTRelabeler init](&v30, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_distanceCalculator, a3);
    v12 = [RTInferredMapItemDeduper alloc];
    v13 = -[RTInferredMapItemDeduper initWithDeduperFunction:](v12, "initWithDeduperFunction:", deduperFunctionGroupedLabelType);
    deduper = v11->_deduper;
    v11->_deduper = (RTInferredMapItemDeduper *)v13;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    placeholderUUID = v11->_placeholderUUID;
    v11->_placeholderUUID = (NSUUID *)v15;

    objc_storeStrong((id *)&v11->_parameters, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[RTRelabelerParameters minimumNumberPOIs](v11->_parameters, "minimumNumberPOIs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RTRelabelerParameters minimumNumberPOIs](v11->_parameters, "minimumNumberPOIs"))
    {
      v18 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v19);

        ++v18;
      }
      while (v18 < -[RTRelabelerParameters minimumNumberPOIs](v11->_parameters, "minimumNumberPOIs"));
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v17);
    v20 = objc_claimAutoreleasedReturnValue();
    hallucinatedUUIDs = v11->_hallucinatedUUIDs;
    v11->_hallucinatedUUIDs = (NSArray *)v20;

    v11->_loggingEnabled = 0;
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      parameters = v11->_parameters;
      v24 = v11->_placeholderUUID;
      v25 = v11->_hallucinatedUUIDs;
      *(_DWORD *)buf = 138412802;
      v32 = parameters;
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "created relabeler with parameters, %@, placeholderUUID, %@, hallucinatedUUIDs, %@", buf, 0x20u);
    }

  }
  self = v11;
  v26 = self;
LABEL_15:

  return v26;
}

- (double)contextDistanceThreshold
{
  double result;

  -[RTRelabelerParameters contextDistanceThreshold](self->_parameters, "contextDistanceThreshold");
  return result;
}

- (void)enableLogging:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_loggingEnabled = a3;
  if (a3)
    v3 = CFSTR("enabling");
  else
    v3 = CFSTR("disabling");
  -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR(" logging for the relabeler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }

}

+ (BOOL)placeholderCandidate:(id)a3 knownPlaceTypeThreshold:(double)a4
{
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  double v18;
  BOOL v19;
  __int16 v21;
  __int16 v22;

  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      v11 = 0;
      goto LABEL_17;
    }
    v22 = 0;
    v9 = "Invalid parameter not satisfying: candidate";
    v10 = (uint8_t *)&v22;
LABEL_19:
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    goto LABEL_8;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v21 = 0;
    v9 = "Invalid parameter not satisfying: RTCommonValidConfidence(knownPlaceTypeThreshold)";
    v10 = (uint8_t *)&v21;
    goto LABEL_19;
  }
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "placeSource") == 1)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "placeSource") == 0;

  }
  objc_msgSend(v5, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "placeSource") == 0x2000)
  {
    objc_msgSend(v5, "secondObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_msgSend(v14, "source") & 0xFDFDE) == 0;

  }
  else
  {
    v15 = 0;
  }

  objc_msgSend(v5, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "placeSource") == 0x2000)
  {
    objc_msgSend(v5, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "placeConfidence");
    v19 = v18 < a4;

  }
  else
  {
    v19 = 0;
  }

  v11 = v7 || v15 && v19;
LABEL_17:

  return v11;
}

- (BOOL)placeholderCandidate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[RTRelabelerParameters passthroughThreshold](self->_parameters, "passthroughThreshold");
  LOBYTE(self) = objc_msgSend(v5, "placeholderCandidate:knownPlaceTypeThreshold:", v4);

  return (char)self;
}

- (id)filterOldCandidates:(id)a3 referenceDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[16];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a5)
    {
      v23 = CFSTR("candidates");
LABEL_21:
      _RTErrorInvalidParameterCreate((uint64_t)v23);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", buf, 2u);
    }

    if (a5)
    {
      v23 = CFSTR("referenceDate");
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v26 = v9;
  objc_msgSend(v9, "dateByAddingTimeInterval:", (double)-[RTRelabelerParameters weekThreshold](self->_parameters, "weekThreshold") * -604800.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = v8;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "entryDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "compare:", v11);

        if (v21 != -1)
          objc_msgSend(v12, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v15);
  }

  v10 = v26;
  v8 = v27;
LABEL_23:

  return v12;
}

- (id)filterAoiCandidates:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[16];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v13, "secondObject", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "extendedAttributes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "wifiFingerprintLabelType");

          if (v16 != 2)
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("candidates"));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)filterFarCandidates:(id)a3 referenceLocation:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  RTDistanceCalculator *distanceCalculator;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  double v24;
  void *v25;
  id v26;
  NSObject *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v35;
  const char *aSelector;
  id *v37;
  id v38;
  void *v39;
  id obj;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a5)
    {
      v28 = CFSTR("candidates");
LABEL_28:
      _RTErrorInvalidParameterCreate((uint64_t)v28);
      v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
LABEL_29:
    v26 = 0;
    goto LABEL_30;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (a5)
    {
      v28 = CFSTR("referenceLocation");
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  aSelector = a2;
  v37 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v38 = v9;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        distanceCalculator = self->_distanceCalculator;
        objc_msgSend(v16, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "location");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "location");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v20, v11, &v41);
        v22 = v21;
        v23 = v41;

        if (v23)
        {
          v29 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v23, "userInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 1, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(aSelector);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v47 = v35;
            v48 = 2112;
            v49 = v31;
            _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          v25 = v39;
          if (v37)
            *v37 = objc_retainAutorelease(v31);

          v26 = 0;
          goto LABEL_23;
        }
        -[RTRelabelerParameters contextDistanceThreshold](self->_parameters, "contextDistanceThreshold");
        if (v22 <= v24)
          objc_msgSend(v39, "addObject:", v16);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v13)
        continue;
      break;
    }
  }

  v25 = v39;
  v26 = v39;
LABEL_23:
  v9 = v38;

LABEL_30:
  return v26;
}

- (id)convertLowConfidenceCandidates:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v41;
  const char *aSelector;
  id *v43;
  void *v44;
  RTRelabeler *v45;
  void *v46;
  uint64_t v47;
  id obj;
  void *v49;
  RTLearnedVisit *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    aSelector = a2;
    v43 = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v44 = v8;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v52;
      v45 = self;
      v46 = v9;
      while (2)
      {
        v13 = 0;
        v47 = v11;
        do
        {
          if (*(_QWORD *)v52 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v13);
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "placeConfidence");
          v18 = v17;
          -[RTRelabelerParameters confidenceThreshold](self->_parameters, "confidenceThreshold");
          v20 = v19;

          if (v18 < v20)
          {
            v50 = [RTLearnedVisit alloc];
            objc_msgSend(v15, "identifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "location");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "entryDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "exitDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "creationDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "expirationDate");
            v25 = v12;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "placeConfidence");
            v27 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v50, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v49, v21, v22, v23, v24, v26, 1);

            v12 = v25;
            v11 = v47;

            v9 = v46;
            self = v45;

            v15 = (void *)v27;
          }
          v28 = objc_alloc(MEMORY[0x1E0D18408]);
          objc_msgSend(v14, "secondObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v28, "initWithFirstObject:secondObject:", v15, v29);

          if (!v30)
          {
            v32 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v14, "firstObject");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("could not create convertedCandidate for visit, %@"), v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = (void *)MEMORY[0x1E0CB35C8];
            v59 = *MEMORY[0x1E0CB2D50];
            v60 = v34;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 2, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(aSelector);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v56 = v41;
              v57 = 2112;
              v58 = v37;
              _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

            }
            v8 = v44;
            if (v43)
              *v43 = objc_retainAutorelease(v37);

            v31 = 0;
            goto LABEL_18;
          }
          objc_msgSend(v9, "addObject:", v30);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        if (v11)
          continue;
        break;
      }
    }

    v31 = v9;
    v8 = v44;
LABEL_18:

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("candidates"));
      v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
  }

  return v31;
}

- (id)preprocessContextCandidates:(id)a3 relabelingCandidate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v23;
  id v24;
  id v25;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contextCandidates", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("contextCandidates"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v8 = 0;
LABEL_14:
      v15 = 0;
      *a5 = v17;
      goto LABEL_29;
    }
    v8 = 0;
LABEL_19:
    v15 = 0;
    goto LABEL_29;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabelingCandidate", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("relabelingCandidate"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_19;
  }
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entryDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  -[RTRelabeler filterOldCandidates:referenceDate:error:](self, "filterOldCandidates:referenceDate:error:", v8, v12, &v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v25;

  if (v14)
  {
    v15 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v14);
  }
  else
  {
    v24 = 0;
    -[RTRelabeler filterAoiCandidates:error:](self, "filterAoiCandidates:error:", v13, &v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v24;

    if (v20)
    {
      v15 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v20);
      v13 = v19;
    }
    else
    {
      v23 = 0;
      -[RTRelabeler convertLowConfidenceCandidates:error:](self, "convertLowConfidenceCandidates:error:", v19, &v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v23;

      if (v21)
      {
        v15 = 0;
        if (a5)
          *a5 = objc_retainAutorelease(v21);
      }
      else
      {
        v15 = v13;
      }

    }
  }

  v8 = v13;
LABEL_29:

  return v15;
}

- (BOOL)partitionCandidates:(id)a3 intoNonRevGeoCandidates:(id *)a4 revGeoCandidates:(id *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  BOOL v22;
  NSObject *v23;
  const __CFString *v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (!a6)
      goto LABEL_28;
    v24 = CFSTR("candidates");
    goto LABEL_27;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outNonRevGeoCandidates", buf, 2u);
    }

    if (!a6)
      goto LABEL_28;
    v24 = CFSTR("outNonRevGeoCandidates");
LABEL_27:
    _RTErrorInvalidParameterCreate((uint64_t)v24);
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outRevGeoCandidates", buf, 2u);
    }

    if (a6)
    {
      v24 = CFSTR("outRevGeoCandidates");
      goto LABEL_27;
    }
LABEL_28:
    v22 = 0;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v28 = v10;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (-[RTRelabeler placeholderCandidate:](self, "placeholderCandidate:", v18))
          v19 = v11;
        else
          v19 = v12;
        objc_msgSend(v19, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v15);
  }

  v20 = objc_retainAutorelease(v12);
  *a4 = v20;
  v21 = objc_retainAutorelease(v11);
  *a5 = v21;

  v22 = 1;
  v10 = v28;
LABEL_29:

  return v22;
}

- (BOOL)dedupeRelabelingCandidate:(id)a3 nonRevGeoCandidates:(id)a4 deduper:(id)a5 inferredMapItemDeduperState:(id *)a6 dedupedRelabelingCandidate:(id *)a7 dedupedNonRevGeoCandidates:(id *)a8 error:(id *)a9
{
  id *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _RTMap *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  BOOL v40;
  NSObject *v41;
  const __CFString *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  RTInferredMapItemDeduperState *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  const char *aSelector;
  id *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  RTInferredMapItemDeduperState *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  uint64_t v97;
  const __CFString *v98;
  uint64_t v99;
  const __CFString *v100;
  uint64_t v101;
  const __CFString *v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  id v106;
  uint64_t v107;
  _QWORD v108[3];

  v16 = a9;
  v108[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = v19;
  if (v17)
  {
    if (v18)
    {
      if (v19)
      {
        if (a6)
        {
          if (a7)
          {
            if (a8)
            {
              aSelector = a2;
              v21 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v18);
              -[_RTMap withBlock:](v21, "withBlock:", &__block_literal_global_48);
              v22 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count") + 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = v17;
              v96 = (void *)v22;
              if (!-[RTRelabeler placeholderCandidate:](self, "placeholderCandidate:", v17))
              {
                v86 = v20;
                v88 = v23;
                v24 = v18;
                v25 = objc_alloc(MEMORY[0x1E0D183A8]);
                objc_msgSend(v17, "secondObject");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "firstObject");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "placeConfidence");
                v29 = v28;
                objc_msgSend(v17, "firstObject");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = (void *)objc_msgSend(v25, "initWithMapItem:confidence:source:", v26, objc_msgSend(v30, "placeSource"), v29);

                if (!v31)
                {
                  v51 = (void *)MEMORY[0x1E0CB35C8];
                  v107 = *MEMORY[0x1E0CB2D50];
                  v108[0] = CFSTR("could not convert candidate to RTInferredMapItem");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 3, v52);
                  v34 = (id)objc_claimAutoreleasedReturnValue();

                  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    NSStringFromSelector(aSelector);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v104 = v78;
                    v105 = 2112;
                    v106 = v34;
                    _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

                  }
                  v18 = v24;
                  v23 = v88;
                  if (a9)
                  {
                    v34 = objc_retainAutorelease(v34);
                    v40 = 0;
                    *a9 = v34;
                  }
                  else
                  {
                    v40 = 0;
                  }
                  v20 = v86;
                  v39 = v96;
                  goto LABEL_55;
                }
                objc_msgSend(v88, "addObject:", v31);

                v23 = v88;
                v18 = v24;
                v16 = a9;
                v20 = v86;
                v22 = (uint64_t)v96;
              }
              objc_msgSend(v23, "addObjectsFromArray:", v22);
              v90 = objc_alloc_init(RTInferredMapItemDeduperState);
              objc_msgSend(v20, "dedupeInferredMapItems:state:error:", v23);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = 0;
              v34 = v33;
              v91 = v32;
              if (v33)
              {
                v35 = (void *)MEMORY[0x1E0CB35C8];
                objc_msgSend(v33, "userInfo");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 5, v36);
                v37 = (id)objc_claimAutoreleasedReturnValue();

                _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(aSelector);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v104 = v74;
                  v105 = 2112;
                  v106 = v37;
                  _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

                }
                v39 = v96;
                if (v16)
                  goto LABEL_14;
              }
              else
              {
                v49 = objc_msgSend(v32, "count");
                v89 = v23;
                if (v49 == objc_msgSend(v23, "count"))
                {
                  v85 = v16;
                  v50 = v95;
                  if (-[RTRelabeler placeholderCandidate:](self, "placeholderCandidate:", v95))
                  {
                    v87 = v20;
                    *a7 = objc_retainAutorelease(v95);
                  }
                  else
                  {
                    v92 = objc_alloc(MEMORY[0x1E0D18408]);
                    objc_msgSend(v95, "firstObject");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "firstObject");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "mapItem");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    v93 = (id)objc_msgSend(v92, "initWithFirstObject:secondObject:", v58, v60);

                    if (!v93)
                    {
                      v75 = (void *)MEMORY[0x1E0CB35C8];
                      v99 = *MEMORY[0x1E0CB2D50];
                      v100 = CFSTR("dedupedRelabelingCandidate was nil");
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 2, v76);
                      v37 = (id)objc_claimAutoreleasedReturnValue();

                      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                      v77 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                      {
                        NSStringFromSelector(aSelector);
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v104 = v81;
                        v105 = 2112;
                        v106 = v37;
                        _os_log_error_impl(&dword_1D1A22000, v77, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

                      }
                      v34 = 0;
                      if (v85)
                      {
                        v37 = objc_retainAutorelease(v37);
                        v40 = 0;
                        *v85 = v37;
                      }
                      else
                      {
                        v40 = 0;
                      }
                      v39 = v96;
                      v23 = v89;
                      v57 = v90;
                      goto LABEL_54;
                    }
                    v87 = v20;
                    v61 = objc_retainAutorelease(v93);
                    *a7 = v61;

                    v50 = v95;
                  }
                  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v96, "count"));
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = -[RTRelabeler placeholderCandidate:](self, "placeholderCandidate:", v50) ^ 1;
                  if (objc_msgSend(v91, "count") <= v63)
                  {
LABEL_62:
                    v37 = objc_retainAutorelease(v62);
                    *a8 = v37;
                    v57 = v90;
                    *a6 = objc_retainAutorelease(v90);
                    v40 = 1;
                    v20 = v87;
                    v23 = v89;
                    v39 = v96;
                    v34 = 0;
                    goto LABEL_54;
                  }
                  v64 = 0;
                  v82 = v62;
                  v83 = v18;
                  while (1)
                  {
                    v94 = objc_alloc(MEMORY[0x1E0D18408]);
                    objc_msgSend(v18, "objectAtIndexedSubscript:", v64);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "firstObject");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v91, "objectAtIndexedSubscript:", v63 + v64);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "mapItem");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    v69 = (void *)objc_msgSend(v94, "initWithFirstObject:secondObject:", v66, v68);

                    if (!v69)
                      break;
                    v62 = v82;
                    objc_msgSend(v82, "addObject:", v69);

                    ++v64;
                    v18 = v83;
                    if (v63 + v64 >= objc_msgSend(v91, "count"))
                      goto LABEL_62;
                  }
                  v70 = (void *)MEMORY[0x1E0CB35C8];
                  v97 = *MEMORY[0x1E0CB2D50];
                  v98 = CFSTR("dedupedCandidate was nil");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 2, v71);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();

                  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                  v73 = objc_claimAutoreleasedReturnValue();
                  v37 = v82;
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                  {
                    NSStringFromSelector(aSelector);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v104 = v80;
                    v105 = 2112;
                    v106 = v72;
                    _os_log_error_impl(&dword_1D1A22000, v73, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

                  }
                  v18 = v83;
                  v20 = v87;
                  v23 = v89;
                  v34 = 0;
                  if (v85)
                    *v85 = objc_retainAutorelease(v72);

                  v40 = 0;
                  v39 = v96;
LABEL_53:
                  v57 = v90;
LABEL_54:

LABEL_55:
                  v17 = v95;
                  goto LABEL_41;
                }
                v54 = (void *)MEMORY[0x1E0CB35C8];
                v101 = *MEMORY[0x1E0CB2D50];
                v102 = CFSTR("dedupedInferredMapItems.count != dedupableInferredMapItems.count");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 5, v55);
                v37 = (id)objc_claimAutoreleasedReturnValue();

                _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                v56 = objc_claimAutoreleasedReturnValue();
                v39 = v96;
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(aSelector);
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v104 = v79;
                  v105 = 2112;
                  v106 = v37;
                  _os_log_error_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

                }
                v34 = 0;
                if (v16)
                {
LABEL_14:
                  v37 = objc_retainAutorelease(v37);
                  v40 = 0;
                  *v16 = v37;
                  goto LABEL_53;
                }
              }
              v40 = 0;
              goto LABEL_53;
            }
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outDedupedNonRevGeoCandidates", buf, 2u);
            }

            if (a9)
            {
              v42 = CFSTR("outDedupedNonRevGeoCandidates");
              goto LABEL_39;
            }
LABEL_40:
            v40 = 0;
            goto LABEL_41;
          }
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outDedupedRelabelingCandidate", buf, 2u);
          }

          if (!a9)
            goto LABEL_40;
          v42 = CFSTR("outDedupedRelabelingCandidate");
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outInferredMapItemDeduperState", buf, 2u);
          }

          if (!a9)
            goto LABEL_40;
          v42 = CFSTR("outInferredMapItemDeduperState");
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: deduper", buf, 2u);
        }

        if (!a9)
          goto LABEL_40;
        v42 = CFSTR("deduper");
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonRevGeoCandidates", buf, 2u);
      }

      if (!a9)
        goto LABEL_40;
      v42 = CFSTR("nonRevGeoCandidates");
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabelingCandidate", buf, 2u);
    }

    if (!a9)
      goto LABEL_40;
    v42 = CFSTR("relabelingCandidate");
  }
LABEL_39:
  _RTErrorInvalidParameterCreate((uint64_t)v42);
  v40 = 0;
  *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

  return v40;
}

id __157__RTRelabeler_dedupeRelabelingCandidate_nonRevGeoCandidates_deduper_inferredMapItemDeduperState_dedupedRelabelingCandidate_dedupedNonRevGeoCandidates_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v2 = (objc_class *)MEMORY[0x1E0D183A8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "secondObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeConfidence");
  v8 = v7;
  objc_msgSend(v3, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v4, "initWithMapItem:confidence:source:", v5, objc_msgSend(v9, "placeSource"), v8);
  return v10;
}

- (id)createProbabilityVectorForNonRevGeoCandidate:(id)a3 uniqueNonRevGeoMapItems:(id)a4 hallucinatedUUIDs:(id)a5 placeholderUUID:(id)a6 placeholderWeight:(double)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  const __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  _RTMap *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  NSObject *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  double v62;
  void *v63;
  void *v64;
  char *v65;
  char *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;
  const __CFString *v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  id v82;
  uint64_t v83;
  _QWORD v84[4];

  v84[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate", buf, 2u);
    }

    if (a8)
    {
      v20 = CFSTR("candidate");
      goto LABEL_31;
    }
LABEL_32:
    v26 = 0;
    goto LABEL_33;
  }
  if (-[RTRelabeler placeholderCandidate:](self, "placeholderCandidate:", v15))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: ![self placeholderCandidate:candidate]", buf, 2u);
    }

    if (a8)
    {
      v20 = CFSTR("![self placeholderCandidate:candidate]");
LABEL_31:
      _RTErrorInvalidParameterCreate((uint64_t)v20);
      v26 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uniqueNonRevGeoMapItems", buf, 2u);
    }

    if (a8)
    {
      v20 = CFSTR("uniqueNonRevGeoMapItems");
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hallucinatedUUIDs", buf, 2u);
    }

    if (a8)
    {
      v20 = CFSTR("hallucinatedUUIDs");
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeholderUUID", buf, 2u);
    }

    if (a8)
    {
      v20 = CFSTR("placeholderUUID");
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (a7 < 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeholderWeight >= 1", buf, 2u);
    }

    if (a8)
    {
      v20 = CFSTR("placeholderWeight >= 1");
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  v28 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v16);
  -[_RTMap withBlock:](v28, "withBlock:", &__block_literal_global_79);
  v29 = objc_claimAutoreleasedReturnValue();

  v70 = (void *)v29;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "secondObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v30;
  objc_msgSend(v30, "member:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v69 = v18;
    v34 = objc_msgSend(v16, "count");
    v35 = (double)(unint64_t)(v34 + objc_msgSend(v17, "count") - 1) + a7;
    if (v35 <= 0.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v80 = "-[RTRelabeler createProbabilityVectorForNonRevGeoCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:place"
              "holderUUID:placeholderWeight:error:]";
        v81 = 1024;
        LODWORD(v82) = 423;
        _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "divisor was less than or equal to zero (in %s:%d)", buf, 0x12u);
      }

    }
    objc_msgSend(v15, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "placeConfidence");
    v39 = v38;

    v40 = (1.0 - v39) / v35;
    if (v40 >= 0.0)
    {
      v67 = v17;
      v68 = v16;
      v51 = v15;
      objc_msgSend(v71, "setByAddingObjectsFromSet:", v17);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v52, "count") + 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v53 = v52;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v73 != v56)
              objc_enumerationMutation(v53);
            v58 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            objc_msgSend(v51, "secondObject");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "identifier");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v58, "isEqual:", v60);

            if (v61)
              v62 = v39;
            else
              v62 = v40;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v63, v58);

          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
        }
        while (v55);
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40 * a7);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v69;
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v64, v69);

      v15 = v51;
      v43 = v53;
      v17 = v67;
      v16 = v68;
    }
    else
    {
      v41 = (void *)MEMORY[0x1E0CB35C8];
      v77 = *MEMORY[0x1E0CB2D50];
      v78 = CFSTR("remainder < 0");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 7, v42);
      v43 = (id)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v66 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v80 = v66;
        v81 = 2112;
        v82 = v43;
        _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v18 = v69;
      if (a8)
      {
        v43 = objc_retainAutorelease(v43);
        v26 = 0;
        *a8 = v43;
      }
      else
      {
        v26 = 0;
      }
    }
  }
  else
  {
    v45 = v18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setNonRevGeoUUIDs does not contain the identifier of candidate, %@"), v15);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v83 = *MEMORY[0x1E0CB2D50];
    v84[0] = v46;
    v43 = (id)v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 6, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v65 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v80 = v65;
      v81 = 2112;
      v82 = v49;
      _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    if (a8)
      *a8 = objc_retainAutorelease(v49);

    v26 = 0;
    v18 = v45;
  }

LABEL_33:
  return v26;
}

uint64_t __142__RTRelabeler_createProbabilityVectorForNonRevGeoCandidate_uniqueNonRevGeoMapItems_hallucinatedUUIDs_placeholderUUID_placeholderWeight_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)createProbabilityVectorForRevGeoCandidate:(id)a3 uniqueNonRevGeoMapItems:(id)a4 hallucinatedUUIDs:(id)a5 placeholderUUID:(id)a6 revGeoConfidence:(double)a7 clippingRadius:(double)a8 sigma:(double)a9 error:(id *)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  uint64_t i;
  void *v27;
  RTDistanceCalculator *distanceCalculator;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  const __CFString *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  void *v70;
  void *v71;
  id *v72;
  id v73;
  void *v74;
  id obj;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[16];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate", buf, 2u);
    }

    if (!a10)
      goto LABEL_68;
    v61 = CFSTR("candidate");
    goto LABEL_67;
  }
  if (!-[RTRelabeler placeholderCandidate:](self, "placeholderCandidate:", v18))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [self placeholderCandidate:candidate]", buf, 2u);
    }

    if (!a10)
      goto LABEL_68;
    v61 = CFSTR("[self placeholderCandidate:candidate]");
    goto LABEL_67;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uniqueNonRevGeoMapItems", buf, 2u);
    }

    if (!a10)
      goto LABEL_68;
    v61 = CFSTR("uniqueNonRevGeoMapItems");
    goto LABEL_67;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hallucinatedUUIDs", buf, 2u);
    }

    if (!a10)
      goto LABEL_68;
    v61 = CFSTR("hallucinatedUUIDs");
    goto LABEL_67;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeholderUUID", buf, 2u);
    }

    if (!a10)
      goto LABEL_68;
    v61 = CFSTR("placeholderUUID");
    goto LABEL_67;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTCommonValidConfidence(revGeoConfidence)", buf, 2u);
    }

    if (!a10)
      goto LABEL_68;
    v61 = CFSTR("RTCommonValidConfidence(revGeoConfidence)");
    goto LABEL_67;
  }
  if (a8 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clippingRadius > 0", buf, 2u);
    }

    if (!a10)
      goto LABEL_68;
    v61 = CFSTR("clippingRadius > 0");
LABEL_67:
    _RTErrorInvalidParameterCreate((uint64_t)v61);
    v48 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  if (a9 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sigma > 0", buf, 2u);
    }

    if (a10)
    {
      v61 = CFSTR("sigma > 0");
      goto LABEL_67;
    }
LABEL_68:
    v48 = 0;
    goto LABEL_69;
  }
  v72 = a10;
  v73 = v21;
  v22 = (a9 + a9) * a9;
  v23 = log(v22 * 3.14159265) * -0.5;
  v74 = v20;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count") + objc_msgSend(v19, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v25 = v19;
  obj = v25;
  v77 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
  v79 = v18;
  if (v77)
  {
    v76 = *(_QWORD *)v91;
    while (2)
    {
      for (i = 0; i != v77; ++i)
      {
        if (*(_QWORD *)v91 != v76)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        distanceCalculator = self->_distanceCalculator;
        objc_msgSend(v18, "firstObject", v72);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "location");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "location");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "location");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = 0;
        -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v31, v32, &v89);
        v34 = v33;
        v35 = v89;

        if (v35)
        {
          v70 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v35, "userInfo");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 1, v71);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = 0;
          if (v72)
            *v72 = objc_retainAutorelease(v58);
          v18 = v79;
          v20 = v74;
          v21 = v73;
          v59 = obj;
          goto LABEL_73;
        }
        if (v34 <= a8)
          v36 = v34;
        else
          v36 = a8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23 - v36 * v36 / v22);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v37, v38);

        v18 = v79;
      }
      v25 = obj;
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
      if (v77)
        continue;
      break;
    }
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v39 = v74;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v86;
    v43 = v23 - a8 * a8 / v22;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v86 != v42)
          objc_enumerationMutation(v39);
        v45 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43, v72);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v46, v45);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
    }
    while (v41);
  }

  v84 = 0;
  -[RTRelabeler convertAndNormalizeLogProbMap:error:](self, "convertAndNormalizeLogProbMap:error:", v24, &v84);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v84;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(obj, "count") + objc_msgSend(v39, "count") + 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v35 = v47;
  v49 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v81 != v51)
          objc_enumerationMutation(v35);
        v53 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * k);
        v54 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v35, "objectForKeyedSubscript:", v53, v72);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "doubleValue");
        objc_msgSend(v54, "numberWithDouble:", (1.0 - a7) * v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v57, v53);

      }
      v50 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
    }
    while (v50);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v73;
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v58, v73);
  v59 = v78;
  v18 = v79;
  v20 = v74;
LABEL_73:

LABEL_69:
  return v48;
}

- (id)createProbabilityVectorForCandidate:(id)a3 uniqueNonRevGeoMapItems:(id)a4 hallucinatedUUIDs:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  RTRelabelerParameters *parameters;
  NSUUID *placeholderUUID;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[RTRelabeler placeholderCandidate:](self, "placeholderCandidate:", v12);
  parameters = self->_parameters;
  placeholderUUID = self->_placeholderUUID;
  if (v13)
  {
    -[RTRelabelerParameters revGeoConfidence](parameters, "revGeoConfidence");
    v17 = v16;
    -[RTRelabelerParameters clippingRadius](self->_parameters, "clippingRadius");
    v19 = v18;
    -[RTRelabelerParameters sigma](self->_parameters, "sigma");
    -[RTRelabeler createProbabilityVectorForRevGeoCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:placeholderUUID:revGeoConfidence:clippingRadius:sigma:error:](self, "createProbabilityVectorForRevGeoCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:placeholderUUID:revGeoConfidence:clippingRadius:sigma:error:", v12, v11, v10, placeholderUUID, a6, v17, v19, v20);
  }
  else
  {
    -[RTRelabelerParameters placeholderWeight](parameters, "placeholderWeight");
    -[RTRelabeler createProbabilityVectorForNonRevGeoCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:placeholderUUID:placeholderWeight:error:](self, "createProbabilityVectorForNonRevGeoCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:placeholderUUID:placeholderWeight:error:", v12, v11, v10, placeholderUUID, a6);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)createUUIDToPriorMapForContextNonRevGeoCandidates:(id)a3 contextRevGeoCandidates:(id)a4 uniqueNonRevGeoMapItems:(id)a5 hallucinatedUUIDs:(id)a6 baseCount:(double)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _RTMap *v45;
  void *v46;
  _RTMap *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  uint64_t v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  id v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t m;
  uint64_t v86;
  void *v87;
  double v88;
  long double v89;
  void *v90;
  id *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  const char *aSelector;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id *v105;
  id v106;
  void *v107;
  RTRelabeler *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  id v112;
  void *v113;
  uint64_t v114;
  void *context;
  id v116;
  id obj;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  id v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;
  const __CFString *v143;
  uint8_t v144[128];
  uint8_t buf[4];
  void *v146;
  __int16 v147;
  id v148;
  uint64_t v149;
  const __CFString *v150;
  _BYTE v151[128];
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = v18;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contextNonRevGeoCandidates", buf, 2u);
    }

    if (a8)
    {
      v21 = CFSTR("contextNonRevGeoCandidates");
      goto LABEL_26;
    }
LABEL_27:
    v26 = 0;
    goto LABEL_28;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contextRevGeoCandidates", buf, 2u);
    }

    if (a8)
    {
      v21 = CFSTR("contextRevGeoCandidates");
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uniqueNonRevGeoMapItems", buf, 2u);
    }

    if (a8)
    {
      v21 = CFSTR("uniqueNonRevGeoMapItems");
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hallucinatedUUIDs", buf, 2u);
    }

    if (a8)
    {
      v21 = CFSTR("hallucinatedUUIDs");
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (a7 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: baseCount >= 0", buf, 2u);
    }

    if (a8)
    {
      v21 = CFSTR("baseCount >= 0");
LABEL_26:
      _RTErrorInvalidParameterCreate((uint64_t)v21);
      v26 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  aSelector = a2;
  v105 = a8;
  v107 = v18;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count") + objc_msgSend(v18, "count") + 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v106 = v17;
  obj = v17;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v137;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v137 != v31)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v34, v35);

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
    }
    while (v30);
  }

  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  v116 = v107;
  v36 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v133;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v133 != v38)
          objc_enumerationMutation(v116);
        v40 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v41, v40);

      }
      v37 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
    }
    while (v37);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v42, self->_placeholderUUID);

  v43 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v28, "allKeys");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setWithArray:", v44);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v15);
  -[_RTMap withBlock:](v45, "withBlock:", &__block_literal_global_102);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", obj);
  -[_RTMap withBlock:](v47, "withBlock:", &__block_literal_global_103);
  v48 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v46);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)v48;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v48);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v49;
  if ((objc_msgSend(v49, "isSubsetOfSet:", v102) & 1) != 0)
  {
    v101 = v46;
    v98 = v16;
    v99 = v15;
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v111 = (id)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v128, v144, 16);
    if (!v110)
    {
      v55 = 0;
      v73 = 0;
      goto LABEL_72;
    }
    v108 = self;
    v109 = *(_QWORD *)v129;
LABEL_46:
    v50 = 0;
    while (1)
    {
      if (*(_QWORD *)v129 != v109)
        objc_enumerationMutation(v111);
      v51 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * v50);
      v52 = (void *)MEMORY[0x1D8231EA8]();
      v127 = 0;
      -[RTRelabeler createProbabilityVectorForCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:error:](self, "createProbabilityVectorForCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:error:", v51, obj, v116, &v127);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v127;
      v55 = v54;
      if (v54)
        break;
      v56 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v53, "allKeys");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setWithArray:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "isEqualToSet:", v113);

      if ((v59 & 1) == 0)
      {
        v78 = (void *)MEMORY[0x1E0CB35C8];
        v142 = *MEMORY[0x1E0CB2D50];
        v143 = CFSTR("the probability vector obtained had different UUIDs than the prior map built");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 8, v79);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelector);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v146 = v97;
          v147 = 2112;
          v148 = v73;
          _os_log_error_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        goto LABEL_71;
      }
      v114 = v50;
      context = v52;
      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      objc_msgSend(v28, "allKeys");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v124;
        do
        {
          for (k = 0; k != v62; ++k)
          {
            if (*(_QWORD *)v124 != v63)
              objc_enumerationMutation(v60);
            v65 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * k);
            v66 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v28, "objectForKeyedSubscript:", v65);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "doubleValue");
            v69 = v68;
            objc_msgSend(v53, "objectForKeyedSubscript:", v65);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "doubleValue");
            objc_msgSend(v66, "numberWithDouble:", v69 + v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v72, v65);

          }
          v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
        }
        while (v62);
      }

      objc_autoreleasePoolPop(context);
      v50 = v114 + 1;
      self = v108;
      if (v114 + 1 == v110)
      {
        v55 = 0;
        v73 = 0;
        v110 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v128, v144, 16);
        if (v110)
          goto LABEL_46;
LABEL_72:

        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        objc_msgSend(v28, "allKeys");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
        if (v82)
        {
          v83 = v82;
          v84 = *(_QWORD *)v120;
          do
          {
            for (m = 0; m != v83; ++m)
            {
              if (*(_QWORD *)v120 != v84)
                objc_enumerationMutation(v81);
              v86 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * m);
              objc_msgSend(v28, "objectForKeyedSubscript:", v86);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "doubleValue");
              v89 = v88;

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)log(v89));
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v90, v86);

            }
            v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
          }
          while (v83);
        }

        if (v55)
        {
          v91 = v105;
          v17 = v106;
          v46 = v101;
          if (v105)
          {
            v92 = v55;
            goto LABEL_85;
          }
LABEL_86:
          v26 = 0;
        }
        else
        {
          v91 = v105;
          v17 = v106;
          v46 = v101;
          if (v73)
          {
            if (!v105)
              goto LABEL_86;
            v92 = v73;
LABEL_85:
            v26 = 0;
            *v91 = objc_retainAutorelease(v92);
          }
          else
          {
            v118 = 0;
            -[RTRelabeler convertAndNormalizeLogProbMap:error:](self, "convertAndNormalizeLogProbMap:error:", v28, &v118);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v118;
            v95 = v94;
            if (v94)
            {
              v26 = 0;
              if (v105)
                *v105 = objc_retainAutorelease(v94);
            }
            else
            {
              v26 = v93;
            }

            v46 = v101;
          }
        }

        v16 = v98;
        v15 = v99;
LABEL_93:

        goto LABEL_94;
      }
    }
    v77 = v54;
    v73 = 0;
LABEL_71:

    objc_autoreleasePoolPop(v52);
    goto LABEL_72;
  }
  v74 = (void *)MEMORY[0x1E0CB35C8];
  v149 = *MEMORY[0x1E0CB2D50];
  v150 = CFSTR("uniqueContextNonRevGeoUUIDs is not a subset of uniqueNonRevGeoUUIDs");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 9, v75);
  v111 = (id)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(aSelector);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v146 = v96;
    v147 = 2112;
    v148 = v111;
    _os_log_error_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

  }
  v17 = v106;
  if (!a8)
  {
    v26 = 0;
    goto LABEL_93;
  }
  v26 = 0;
  v112 = objc_retainAutorelease(v111);
  *a8 = v112;

LABEL_94:
  v19 = v107;
LABEL_28:

  return v26;
}

id __147__RTRelabeler_createUUIDToPriorMapForContextNonRevGeoCandidates_contextRevGeoCandidates_uniqueNonRevGeoMapItems_hallucinatedUUIDs_baseCount_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "secondObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __147__RTRelabeler_createUUIDToPriorMapForContextNonRevGeoCandidates_contextRevGeoCandidates_uniqueNonRevGeoMapItems_hallucinatedUUIDs_baseCount_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)convertAndNormalizeLogProbMap:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  long double v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  long double v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[16];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v54;
      v10 = -1.79769313e308;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValue");
          v15 = v14;

          if (v15 > v10)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "doubleValue");
            v10 = v17;

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v8);
    }
    else
    {
      v10 = -1.79769313e308;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v6, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v50;
      v24 = 0.0;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v50 != v23)
            objc_enumerationMutation(v20);
          v26 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
          v27 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v6, "objectForKeyedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          objc_msgSend(v27, "numberWithDouble:", v29 - v10);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v30, v26);

          objc_msgSend(v19, "objectForKeyedSubscript:", v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          v24 = v24 + exp(v32);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v22);
    }
    else
    {
      v24 = 0.0;
    }

    v33 = log(v24);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v19, "allKeys", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v46 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
          v40 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v19, "objectForKeyedSubscript:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "doubleValue");
          objc_msgSend(v40, "numberWithDouble:", (double)exp(v42 - v33));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v43, v39);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v36);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: logProbMap", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("logProbMap"));
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (id)combineProbabilityVector:(id)a3 prior:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  long double v27;
  double v28;
  void *v29;
  long double v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  const __CFString *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v43;
  void *v44;
  const char *aSelector;
  id *v46;
  RTRelabeler *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;
  _QWORD v63[4];

  v63[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v9, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v11, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "isEqualToSet:", v17) & 1) != 0)
      {
        v47 = self;
        aSelector = a2;
        v46 = a5;
        v48 = v14;
        v18 = v11;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v49 = v9;
        v50 = (id)objc_claimAutoreleasedReturnValue();
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v19 = v9;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v54 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
              v25 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v19, "objectForKeyedSubscript:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "doubleValue");
              v28 = log(v27);
              objc_msgSend(v18, "objectForKeyedSubscript:", v24);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "doubleValue");
              objc_msgSend(v25, "numberWithDouble:", (double)(v28 + log(v30)));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setObject:forKeyedSubscript:", v31, v24);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
          }
          while (v21);
        }

        v52 = 0;
        -[RTRelabeler convertAndNormalizeLogProbMap:error:](v47, "convertAndNormalizeLogProbMap:error:", v50, &v52);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v52;
        if (v33)
        {
          _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          v34 = objc_claimAutoreleasedReturnValue();
          v14 = v48;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(aSelector);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v59 = v44;
            v60 = 2112;
            v61 = v33;
            _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          v35 = 0;
          if (v46)
            *v46 = objc_retainAutorelease(v33);
          v11 = v18;
        }
        else
        {
          v35 = v32;
          v11 = v18;
          v14 = v48;
        }

        v9 = v49;
      }
      else
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v62 = *MEMORY[0x1E0CB2D50];
        v63[0] = CFSTR("probUUIDs != priorUUIDs");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 8, v40);
        v50 = (id)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v59 = v43;
          v60 = 2112;
          v61 = v50;
          _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        if (a5)
        {
          v35 = 0;
          v51 = objc_retainAutorelease(v50);
          *a5 = v51;

LABEL_35:
          goto LABEL_36;
        }
        v35 = 0;
      }

      goto LABEL_35;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: prior", buf, 2u);
    }

    if (a5)
    {
      v37 = CFSTR("prior");
      goto LABEL_24;
    }
LABEL_25:
    v35 = 0;
    goto LABEL_36;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: probabilityVector", buf, 2u);
  }

  if (!a5)
    goto LABEL_25;
  v37 = CFSTR("probabilityVector");
LABEL_24:
  _RTErrorInvalidParameterCreate((uint64_t)v37);
  v35 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v35;
}

- (id)generateRelabeledInferredMapItemsFromProbMap:(id)a3 inferredMapItemDeduperState:(id)a4 hallucinatedUUIDs:(id)a5 originalCandidate:(id)a6 referenceLocation:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v50;
  uint64_t v51;
  void *v52;
  RTFusedInferredMapItem *v53;
  void *v54;
  id v55;
  RTFusedInferredMapItem *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  _BYTE *v67;
  SEL v68;
  id v69;
  uint64_t v70;
  const __CFString *v71;
  uint8_t v72[4];
  uint64_t v73;
  __int16 v74;
  id v75;
  _BYTE buf[24];
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  _QWORD v81[4];

  v81[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = v19;
  if (v15)
  {
    if (v16)
    {
      if (v17)
      {
        if (v18)
        {
          if (v19)
          {
            v21 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v15, "allKeys");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setWithArray:", v22);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            v69 = 0;
            objc_msgSend(v16, "allDedupedUUIDsWithError:", &v69);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v69;
            v59 = v23;
            if (v23)
            {
              v24 = (void *)MEMORY[0x1E0CB35C8];
              objc_msgSend(v23, "userInfo");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 5, v25);
              v26 = (id)objc_claimAutoreleasedReturnValue();

              _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(a2);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v44;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v26;
                _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, error when fetching all dedupedUUIDs, %@", buf, 0x16u);

              }
              if (a8)
              {
                v26 = objc_retainAutorelease(v26);
                v28 = 0;
                *a8 = v26;
              }
              else
              {
                v28 = 0;
              }
              goto LABEL_59;
            }
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v61);
            v26 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "allObjects");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObjectsFromArray:", v35);

            objc_msgSend(v26, "addObject:", self->_placeholderUUID);
            if ((objc_msgSend(v26, "isEqualToSet:", v60) & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              v77 = __Block_byref_object_copy__64;
              v78 = __Block_byref_object_dispose__64;
              v79 = 0;
              v63[0] = MEMORY[0x1E0C809B0];
              v63[1] = 3221225472;
              v63[2] = __148__RTRelabeler_generateRelabeledInferredMapItemsFromProbMap_inferredMapItemDeduperState_hallucinatedUUIDs_originalCandidate_referenceLocation_error___block_invoke;
              v63[3] = &unk_1E929D330;
              v55 = v15;
              v64 = v55;
              v65 = v18;
              v67 = buf;
              v68 = a2;
              v58 = v36;
              v66 = v58;
              v62 = 0;
              objc_msgSend(v16, "enumerateDedupedUUIDToMapItemMapUsingBlock:error:", v63, &v62);
              v57 = v62;
              if (v57)
              {
                _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(a2);
                  v51 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v72 = 138412546;
                  v73 = v51;
                  v74 = 2112;
                  v75 = v57;
                  v54 = (void *)v51;
                  _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, enumeration error, %@", v72, 0x16u);

                }
              }
              v38 = *(void **)(*(_QWORD *)&buf[8] + 40);
              if (v38)
              {
                v28 = 0;
                if (a8)
                  *a8 = objc_retainAutorelease(v38);
              }
              else
              {
                v53 = [RTFusedInferredMapItem alloc];
                objc_msgSend(v55, "objectForKeyedSubscript:", self->_placeholderUUID);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "doubleValue");
                v56 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v53, "initWithMapItem:confidence:source:", 0, 0);

                if (v56)
                {
                  objc_msgSend(v58, "addObject:");
                  -[RTRelabelerParameters confidenceEqualityEpsilon](self->_parameters, "confidenceEqualityEpsilon");
                  +[RTFusedInferredMapItem sortFusedInferredMapItems:confidenceEqualityEpsilon:referenceLocation:distanceCalculator:ascending:](RTFusedInferredMapItem, "sortFusedInferredMapItems:confidenceEqualityEpsilon:referenceLocation:distanceCalculator:ascending:", v58, v20, self->_distanceCalculator, 0);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v45 = (void *)MEMORY[0x1E0CB35C8];
                  v70 = *MEMORY[0x1E0CB2D50];
                  v71 = CFSTR("relabeledInferredMapItem was nil");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 4, v46);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    NSStringFromSelector(a2);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v72 = 138412546;
                    v73 = (uint64_t)v52;
                    v74 = 2112;
                    v75 = v47;
                    _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "%@, error, %@", v72, 0x16u);

                  }
                  if (a8)
                    *a8 = objc_retainAutorelease(v47);

                  v28 = 0;
                }

              }
              _Block_object_dispose(buf, 8);

            }
            else
            {
              v39 = (void *)MEMORY[0x1E0CB35C8];
              v80 = *MEMORY[0x1E0CB2D50];
              v81[0] = CFSTR("inputUUIDs != probMapUUIDs");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 8, v40);
              v58 = (id)objc_claimAutoreleasedReturnValue();

              _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(a2);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v50;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v58;
                _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

              }
              if (a8)
              {
                v42 = objc_retainAutorelease(v58);
                v28 = 0;
                *a8 = v42;
LABEL_58:

LABEL_59:
                goto LABEL_60;
              }
              v28 = 0;
            }
            v42 = v58;
            goto LABEL_58;
          }
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
          }

          if (a8)
          {
            _RTErrorInvalidParameterCreate((uint64_t)CFSTR("referenceLocation"));
            v30 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          }
LABEL_32:
          v28 = 0;
          goto LABEL_60;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: originalCandidate", buf, 2u);
        }

        if (!a8)
          goto LABEL_32;
        _RTErrorInvalidParameterCreate((uint64_t)CFSTR("originalCandidate"));
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hallucinatedUUIDs", buf, 2u);
        }

        if (!a8)
          goto LABEL_32;
        _RTErrorInvalidParameterCreate((uint64_t)CFSTR("hallucinatedUUIDs"));
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemDeduperState", buf, 2u);
      }

      if (!a8)
        goto LABEL_32;
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("inferredMapItemDeduperState"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: probMap", buf, 2u);
    }

    if (!a8)
      goto LABEL_32;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("probMap"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_31:
  v28 = 0;
  *a8 = v30;
LABEL_60:

  return v28;
}

void __148__RTRelabeler_generateRelabeledInferredMapItemsFromProbMap_inferredMapItemDeduperState_hallucinatedUUIDs_originalCandidate_referenceLocation_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  RTFusedInferredMapItem *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  RTFusedInferredMapItem *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a2;
  v9 = [RTFusedInferredMapItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v9, "initWithMapItem:confidence:source:", v7, objc_msgSend(v13, "placeSource"), v12);

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("relabeledInferredMapItem was nil during enumeration");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 4, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412546;
      v23 = v21;
      v24 = 2112;
      v25 = v17;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v22, 0x16u);

    }
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v17;

    *a4 = 1;
  }

}

- (id)relabeledProbVectorForCandidate:(id)a3 usingContextNonRevGeoCandidates:(id)a4 contextRevGeoCandidates:(id)a5 inferredMapItemDeduperState:(id)a6 referenceLocation:(id)a7 outPriorVector:(id *)a8 outObservationVector:(id *)a9 outPosteriorVector:(id *)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  os_log_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  NSObject *v32;
  const __CFString *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  unint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL4 v46;
  void *v47;
  id v48;
  uint64_t v49;
  _BOOL4 v50;
  void *v51;
  id v52;
  uint64_t v53;
  _BOOL4 v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  NSObject *v62;
  id v63;
  id v64;
  NSObject *v65;
  NSObject *v66;
  os_log_t v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  NSObject *log;
  NSObject *loga;
  os_log_t logb;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = v21;
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate", buf, 2u);
    }

    if (!a11)
      goto LABEL_56;
    v33 = CFSTR("candidate");
    goto LABEL_55;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contextNonRevGeoCandidates", buf, 2u);
    }

    if (!a11)
      goto LABEL_56;
    v33 = CFSTR("contextNonRevGeoCandidates");
    goto LABEL_55;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contextRevGeoCandidates", buf, 2u);
    }

    if (!a11)
      goto LABEL_56;
    v33 = CFSTR("contextRevGeoCandidates");
    goto LABEL_55;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemDeduperState", buf, 2u);
    }

    if (!a11)
      goto LABEL_56;
    v33 = CFSTR("inferredMapItemDeduperState");
    goto LABEL_55;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (!a11)
      goto LABEL_56;
    v33 = CFSTR("referenceLocation");
    goto LABEL_55;
  }
  if (!a8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outPriorVector", buf, 2u);
    }

    if (!a11)
      goto LABEL_56;
    v33 = CFSTR("outPriorVector");
    goto LABEL_55;
  }
  if (!a9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outObservationVector", buf, 2u);
    }

    if (!a11)
      goto LABEL_56;
    v33 = CFSTR("outObservationVector");
LABEL_55:
    _RTErrorInvalidParameterCreate((uint64_t)v33);
    v31 = 0;
    *a11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_57;
  }
  if (!a10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outPosteriorVector", buf, 2u);
    }

    if (a11)
    {
      v33 = CFSTR("outPosteriorVector");
      goto LABEL_55;
    }
LABEL_56:
    v31 = 0;
    goto LABEL_57;
  }
  if (self->_loggingEnabled)
  {
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v84 = objc_msgSend(v18, "count");
      _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_INFO, "contextNonRevGeoCandidates count, %lu", buf, 0xCu);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", &__block_literal_global_138);
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    loga = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(loga, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 134217984;
      v84 = v23;
      _os_log_impl(&dword_1D1A22000, loga, OS_LOG_TYPE_INFO, "contextRevGeoCandidates count, %lu", buf, 0xCu);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", &__block_literal_global_140);
  }
  v82 = 0;
  objc_msgSend(v20, "allUniqueMapItemsWithError:", &v82);
  logb = (os_log_t)objc_claimAutoreleasedReturnValue();
  v24 = v82;
  if (v24)
  {
    v25 = logb;
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = v24;
    objc_msgSend(v24, "userInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 5, v28);
    v71 = (id)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v84 = (uint64_t)v27;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "error when fetching all unique mapItems, %@", buf, 0xCu);
    }

    if (a11)
    {
      v30 = objc_retainAutorelease(v71);
      v31 = 0;
      *a11 = v30;
    }
    else
    {
      v31 = 0;
      v30 = v71;
    }
  }
  else
  {
    v72 = (id)-[NSObject count](logb, "count");
    if ((unint64_t)v72 <= -[RTRelabelerParameters minimumNumberPOIs](self->_parameters, "minimumNumberPOIs"))
      v42 = -[RTRelabelerParameters minimumNumberPOIs](self->_parameters, "minimumNumberPOIs") - (_QWORD)v72;
    else
      v42 = 0;
    v73 = (id)MEMORY[0x1E0C99E60];
    -[NSArray subarrayWithRange:](self->_hallucinatedUUIDs, "subarrayWithRange:", 0, v42);
    v69 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setWithArray:", v69);
    v74 = (id)objc_claimAutoreleasedReturnValue();

    -[RTRelabelerParameters baseCount](self->_parameters, "baseCount");
    v81 = 0;
    -[RTRelabeler createUUIDToPriorMapForContextNonRevGeoCandidates:contextRevGeoCandidates:uniqueNonRevGeoMapItems:hallucinatedUUIDs:baseCount:error:](self, "createUUIDToPriorMapForContextNonRevGeoCandidates:contextRevGeoCandidates:uniqueNonRevGeoMapItems:hallucinatedUUIDs:baseCount:error:", v18, v19, logb, v74, &v81);
    v70 = (id)objc_claimAutoreleasedReturnValue();
    v43 = v81;
    v68 = v43;
    if (self->_loggingEnabled)
    {
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        v44 = objc_msgSend(v74, "count");
        *(_DWORD *)buf = 134217984;
        v84 = v44;
        _os_log_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_INFO, "hallucinated UUIDs count, %lu", buf, 0xCu);
      }

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        v45 = objc_msgSend(v70, "count");
        *(_DWORD *)buf = 134218242;
        v84 = v45;
        v85 = 2112;
        v86 = v68;
        _os_log_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_INFO, "prior count, %lu, error, %@", buf, 0x16u);
      }

      v46 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
      v43 = v68;
      if (v46)
      {
        objc_msgSend(v70, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_143);
        v43 = v68;
      }
    }
    if (v43)
    {
      if (a11)
      {
        v47 = v43;
        v31 = 0;
        *a11 = objc_retainAutorelease(v43);
        v30 = v74;
        v25 = logb;
      }
      else
      {
        v31 = 0;
        v30 = v74;
        v25 = logb;
        v47 = v43;
      }
    }
    else
    {
      v80 = 0;
      -[RTRelabeler createProbabilityVectorForCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:error:](self, "createProbabilityVectorForCandidate:uniqueNonRevGeoMapItems:hallucinatedUUIDs:error:", v17, logb, v74, &v80);
      v67 = (os_log_t)objc_claimAutoreleasedReturnValue();
      v48 = v80;
      v64 = v48;
      if (self->_loggingEnabled)
      {
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          v49 = -[NSObject count](v67, "count");
          *(_DWORD *)buf = 134218242;
          v84 = v49;
          v85 = 2112;
          v86 = v64;
          _os_log_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_INFO, "observation count, %lu, error, %@", buf, 0x16u);
        }

        v50 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
        v48 = v64;
        if (v50)
        {
          -[NSObject enumerateKeysAndObjectsUsingBlock:](v67, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_145);
          v48 = v64;
        }
      }
      if (v48)
      {
        if (a11)
        {
          v51 = v48;
          v31 = 0;
          *a11 = objc_retainAutorelease(v48);
          v30 = v74;
          v25 = logb;
        }
        else
        {
          v31 = 0;
          v30 = v74;
          v25 = logb;
          v51 = v48;
        }
      }
      else
      {
        v79 = 0;
        -[RTRelabeler combineProbabilityVector:prior:error:](self, "combineProbabilityVector:prior:error:", v67, v70, &v79);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        v52 = v79;
        v61 = v52;
        if (self->_loggingEnabled)
        {
          _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            v53 = objc_msgSend(v63, "count");
            *(_DWORD *)buf = 134218242;
            v84 = v53;
            v85 = 2112;
            v86 = v61;
            _os_log_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_INFO, "posterior count, %lu, error, %@", buf, 0x16u);
          }

          v54 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
          v52 = v61;
          if (v54)
          {
            objc_msgSend(v63, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_147);
            v52 = v61;
          }
        }
        if (v52)
        {
          if (a11)
          {
            v55 = v52;
            v31 = 0;
            *a11 = objc_retainAutorelease(v52);
            v30 = v74;
            v25 = logb;
          }
          else
          {
            v31 = 0;
            v30 = v74;
            v25 = logb;
            v55 = v52;
          }
        }
        else
        {
          v78 = 0;
          -[RTRelabeler generateRelabeledInferredMapItemsFromProbMap:inferredMapItemDeduperState:hallucinatedUUIDs:originalCandidate:referenceLocation:error:](self, "generateRelabeledInferredMapItemsFromProbMap:inferredMapItemDeduperState:hallucinatedUUIDs:originalCandidate:referenceLocation:error:", v63, v20, v74, v17, v22, &v78);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v78;
          v57 = v56;
          if (v56)
          {
            v31 = 0;
            if (a11)
              *a11 = objc_retainAutorelease(v56);
            v30 = v74;
            v25 = logb;
            v58 = v60;
          }
          else
          {
            *a8 = objc_retainAutorelease(v70);
            *a9 = objc_retainAutorelease(v67);
            *a10 = objc_retainAutorelease(v63);
            v58 = v60;
            v31 = v60;
            v30 = v74;
            v25 = logb;
          }

          v55 = v61;
        }

        v51 = v64;
      }

      v47 = v68;
    }

    v27 = 0;
  }

LABEL_57:
  return v31;
}

void __210__RTRelabeler_relabeledProbVectorForCandidate_usingContextNonRevGeoCandidates_contextRevGeoCandidates_inferredMapItemDeduperState_referenceLocation_outPriorVector_outObservationVector_outPosteriorVector_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = a3;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "nonRevGeoCandidate, %lu, visit identifier, %@, mapItem identifier, %@", (uint8_t *)&v10, 0x20u);

  }
}

void __210__RTRelabeler_relabeledProbVectorForCandidate_usingContextNonRevGeoCandidates_contextRevGeoCandidates_inferredMapItemDeduperState_referenceLocation_outPriorVector_outObservationVector_outPosteriorVector_error___block_invoke_139(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = a3;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "revGeoCandidate, %lu, visit identifier, %@, mapItem identifier, %@", (uint8_t *)&v10, 0x20u);

  }
}

void __210__RTRelabeler_relabeledProbVectorForCandidate_usingContextNonRevGeoCandidates_contextRevGeoCandidates_inferredMapItemDeduperState_referenceLocation_outPriorVector_outObservationVector_outPosteriorVector_error___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "UUID, %@, prior, %@", (uint8_t *)&v7, 0x16u);
  }

}

void __210__RTRelabeler_relabeledProbVectorForCandidate_usingContextNonRevGeoCandidates_contextRevGeoCandidates_inferredMapItemDeduperState_referenceLocation_outPriorVector_outObservationVector_outPosteriorVector_error___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "UUID, %@, observation, %@", (uint8_t *)&v7, 0x16u);
  }

}

void __210__RTRelabeler_relabeledProbVectorForCandidate_usingContextNonRevGeoCandidates_contextRevGeoCandidates_inferredMapItemDeduperState_referenceLocation_outPriorVector_outObservationVector_outPosteriorVector_error___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "UUID, %@, posterior, %@", (uint8_t *)&v7, 0x16u);
  }

}

- (id)relabeledInferredMapItemFromProbVector:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  RTFusedInferredMapItem *v27;
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "confidence");
      v10 = v9;
      -[RTRelabelerParameters confidenceThreshold](self->_parameters, "confidenceThreshold");
      v12 = v11;

      if (v10 > v12)
      {
        if ((unint64_t)objc_msgSend(v7, "count") <= 1)
        {
          objc_msgSend(v7, "firstObject");
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_23:
          v17 = (void *)v13;
          goto LABEL_24;
        }
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "confidence");
        v20 = v19;
        -[RTRelabelerParameters minimumConfidenceRatio](self->_parameters, "minimumConfidenceRatio");
        v22 = v21;
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "confidence");
        v25 = v22 * v24;

        if (v20 > v25)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        if (self->_loggingEnabled)
        {
          _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v29 = 0;
            _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "demoted because does not satisfy minimum confidence ratio", v29, 2u);
          }

        }
      }
      v27 = [RTFusedInferredMapItem alloc];
      -[RTRelabelerParameters revGeoConfidence](self->_parameters, "revGeoConfidence");
      v13 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v27, "initWithMapItem:confidence:source:", 0, 0);
      goto LABEL_23;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v30 = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledProbVector.count >= 1", v30, 2u);
    }

    if (a4)
    {
      v15 = CFSTR("relabeledProbVector.count >= 1");
      goto LABEL_14;
    }
LABEL_15:
    v17 = 0;
    goto LABEL_24;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledProbVector", buf, 2u);
  }

  if (!a4)
    goto LABEL_15;
  v15 = CFSTR("relabeledProbVector");
LABEL_14:
  _RTErrorInvalidParameterCreate((uint64_t)v15);
  v17 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v17;
}

- (id)relabelCandidate:(id)a3 usingContextCandidates:(id)a4 metrics:(id)a5 outPriorVector:(id *)a6 outObservationVector:(id *)a7 outPosteriorVector:(id *)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  RTFusedInferredMapItem *v22;
  void *v23;
  id *v24;
  id *v25;
  id v26;
  RTRelabeler *v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  RTRelabeler *v43;
  void *v44;
  void *v45;
  RTLearnedVisit *v46;
  id v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  RTFusedInferredMapItem *v58;
  double v59;
  double v60;
  id v61;
  void *v62;
  RTRelabeler *v63;
  RTFusedInferredMapItem *v64;
  NSObject *v65;
  id v66;
  NSObject *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  _BOOL4 loggingEnabled;
  NSObject *v73;
  RTFusedInferredMapItem *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  id v81;
  NSObject *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  unint64_t v89;
  BOOL v90;
  id v91;
  char *v92;
  id v93;
  RTInferredMapItemDeduper *deduper;
  BOOL v95;
  id v96;
  id v97;
  id v98;
  id v99;
  RTRelabeler *v100;
  void *v101;
  uint64_t v102;
  id v103;
  RTFusedInferredMapItem *v104;
  void *v105;
  NSObject *v106;
  RTFusedInferredMapItem *v107;
  void *v108;
  void *v109;
  id v110;
  RTFusedInferredMapItem *v111;
  RTFusedInferredMapItem *v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  void *v117;
  uint64_t v118;
  RTRelabeler *v119;
  NSObject *v120;
  RTFusedInferredMapItem *v121;
  RTFusedInferredMapItem *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  RTRelabeler *v128;
  NSObject *v129;
  RTFusedInferredMapItem *v130;
  RTFusedInferredMapItem *v131;
  NSObject *v132;
  RTFusedInferredMapItem *v133;
  RTFusedInferredMapItem *v134;
  void *v135;
  RTFusedInferredMapItem *v136;
  id v137;
  id v138;
  id *v139;
  void *v140;
  RTFusedInferredMapItem *v141;
  id *v142;
  id *v143;
  void *v144;
  void *v145;
  RTFusedInferredMapItem *v146;
  void *v147;
  void *v148;
  RTLearnedVisit *v149;
  id v150;
  void *v151;
  void *v152;
  id v153;
  id v154;
  id v155;
  id v156;
  void *v157;
  id v158;
  id v159;
  id *v160;
  const char *aSelector;
  SEL aSelectora;
  void *v163;
  void *v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  uint64_t v179;
  const __CFString *v180;
  uint64_t v181;
  const __CFString *v182;
  uint64_t v183;
  const __CFString *v184;
  uint8_t buf[4];
  RTFusedInferredMapItem *v186;
  __int16 v187;
  id v188;
  uint64_t v189;

  v189 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = v18;
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidate", buf, 2u);
    }

    if (!a9)
    {
LABEL_55:
      v16 = 0;
LABEL_56:
      v64 = 0;
      goto LABEL_57;
    }
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("candidate"));
    v66 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
LABEL_28:
    v64 = 0;
    *a9 = v66;
    goto LABEL_57;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metrics", buf, 2u);
    }

    if (!a9)
      goto LABEL_56;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("metrics"));
    v66 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v160 = a6;
  aSelector = a2;
  if (self->_loggingEnabled)
  {
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v16, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = (RTFusedInferredMapItem *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "secondObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v163 = v19;
      v24 = a7;
      v25 = a8;
      v26 = v16;
      v27 = self;
      v28 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v186 = v22;
      v187 = 2112;
      v188 = v29;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "relabeling visit identifier, %@, mapItem identifier, %@", buf, 0x16u);

      v17 = v28;
      self = v27;
      v16 = v26;
      a8 = v25;
      a7 = v24;
      v19 = v163;

    }
  }
  objc_msgSend(v19, "setPreprocessedMetricsUsingInputCandidate:contextCandidates:", v16, v17);
  objc_msgSend(v16, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "placeConfidence");
  v32 = v31;
  -[RTRelabelerParameters confidenceThreshold](self->_parameters, "confidenceThreshold");
  v34 = v33;

  if (v32 < v34)
  {
    v139 = a7;
    v142 = a8;
    v158 = v17;
    v164 = v19;
    v149 = [RTLearnedVisit alloc];
    objc_msgSend(v16, "firstObject");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "identifier");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v155 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "location");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v153 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "entryDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "exitDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "creationDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "expirationDate");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v16;
    v151 = v16;
    v43 = self;
    v44 = (void *)v41;
    objc_msgSend(v42, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "placeConfidence");
    v46 = -[RTLearnedVisit initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:](v149, "initWithIdentifier:location:entryDate:exitDate:creationDate:expirationDate:placeConfidence:placeSource:", v144, v35, v36, v37, v39, v44, 1);

    self = v43;
    v47 = objc_alloc(MEMORY[0x1E0D18408]);
    objc_msgSend(v151, "secondObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "initWithFirstObject:secondObject:", v46, v48);

    if (v43->_loggingEnabled)
    {
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_INFO, "converting candidate to reverse geocode", buf, 2u);
      }

    }
    v19 = v164;
    if (v49)
    {

      v16 = (id)v49;
      v17 = v158;
      a7 = v139;
      a8 = v142;
      goto LABEL_14;
    }
    v84 = (void *)MEMORY[0x1E0CB35C8];
    v183 = *MEMORY[0x1E0CB2D50];
    v184 = CFSTR("candidate was nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 2, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v87 = objc_claimAutoreleasedReturnValue();
    v17 = v158;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      v122 = (RTFusedInferredMapItem *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v186 = v122;
      v187 = 2112;
      v188 = v86;
      _os_log_error_impl(&dword_1D1A22000, v87, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    if (a9)
      *a9 = objc_retainAutorelease(v86);

    goto LABEL_55;
  }
LABEL_14:
  objc_msgSend(v16, "firstObject");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "placeConfidence");
  v53 = v52;
  -[RTRelabelerParameters passthroughThreshold](self->_parameters, "passthroughThreshold");
  if (v53 <= v54)
  {
    objc_msgSend(v16, "secondObject");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "extendedAttributes");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v56, "wifiFingerprintLabelType") == 2)
    {

      goto LABEL_17;
    }
    v79 = objc_msgSend(v17, "count");

    if (!v79)
      goto LABEL_18;
    v143 = a8;
    v178 = 0;
    -[RTRelabeler preprocessContextCandidates:relabelingCandidate:error:](self, "preprocessContextCandidates:relabelingCandidate:error:", v17, v16, &v178);
    v80 = v17;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v81 = v178;

    if (self->_loggingEnabled)
    {
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        v83 = objc_msgSend(v17, "count");
        *(_DWORD *)buf = 134218242;
        v186 = (RTFusedInferredMapItem *)v83;
        v187 = 2112;
        v188 = v81;
        _os_log_impl(&dword_1D1A22000, v82, OS_LOG_TYPE_INFO, "preprocessed contextCandidates count, %lu, preprocessError, %@", buf, 0x16u);
      }

    }
    if (v81)
    {
      v64 = 0;
      if (a9)
        *a9 = objc_retainAutorelease(v81);
      goto LABEL_110;
    }
    objc_msgSend(v19, "setFilteredInputMetricsUsingContextCandidates:", v17);
    v89 = objc_msgSend(v17, "count");
    if (v89 < -[RTRelabelerParameters contextCandidateAmountThreshold](self->_parameters, "contextCandidateAmountThreshold")&& !-[RTRelabeler placeholderCandidate:](self, "placeholderCandidate:", v16))
    {
      v112 = [RTFusedInferredMapItem alloc];
      objc_msgSend(v16, "secondObject");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "placeConfidence");
      v116 = v115;
      objc_msgSend(v16, "firstObject");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v112, "initWithMapItem:confidence:source:", v113, objc_msgSend(v117, "placeSource"), v116);
      v119 = self;
      v64 = (RTFusedInferredMapItem *)v118;

      if (v119->_loggingEnabled)
      {
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v186 = v64;
          _os_log_impl(&dword_1D1A22000, v120, OS_LOG_TYPE_INFO, "returning early since insufficient amount of context candidates, relabeledInferredMapItem, %@", buf, 0xCu);
        }

      }
      if (v64)
      {
        v121 = v64;
      }
      else
      {
        v124 = (void *)MEMORY[0x1E0CB35C8];
        v179 = *MEMORY[0x1E0CB2D50];
        v180 = CFSTR("relabeledInferredMapItem was nil");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v180, &v179, 1);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 4, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v127 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelector);
          v134 = (RTFusedInferredMapItem *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v186 = v134;
          v187 = 2112;
          v188 = v126;
          _os_log_error_impl(&dword_1D1A22000, v127, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        if (a9)
          *a9 = objc_retainAutorelease(v126);

      }
      goto LABEL_110;
    }
    v176 = 0;
    v177 = 0;
    v175 = 0;
    v90 = -[RTRelabeler partitionCandidates:intoNonRevGeoCandidates:revGeoCandidates:error:](self, "partitionCandidates:intoNonRevGeoCandidates:revGeoCandidates:error:", v17, &v177, &v176, &v175);
    v91 = v177;
    v92 = (char *)v176;
    v93 = v175;
    if (!v90)
    {
      if (a9)
      {
        v110 = v93;
        v64 = 0;
        *a9 = objc_retainAutorelease(v93);
        v93 = v110;
      }
      else
      {
        v64 = 0;
      }
      goto LABEL_109;
    }
    v159 = v93;
    objc_msgSend(v19, "setNonRevGeoCandidates:revGeoCandidates:", v91, v92);
    deduper = self->_deduper;
    v173 = 0;
    v174 = 0;
    v171 = 0;
    v172 = 0;
    v95 = -[RTRelabeler dedupeRelabelingCandidate:nonRevGeoCandidates:deduper:inferredMapItemDeduperState:dedupedRelabelingCandidate:dedupedNonRevGeoCandidates:error:](self, "dedupeRelabelingCandidate:nonRevGeoCandidates:deduper:inferredMapItemDeduperState:dedupedRelabelingCandidate:dedupedNonRevGeoCandidates:error:", v16, v91, deduper, &v174, &v173, &v172, &v171);
    v96 = v174;
    v165 = v173;
    v97 = v172;
    v98 = v171;
    aSelectora = v92;
    if (!v95)
    {
      if (a9)
      {
        v123 = v98;
        v64 = 0;
        *a9 = objc_retainAutorelease(v98);
        v98 = v123;
      }
      else
      {
        v64 = 0;
      }
      v109 = v165;
      v108 = v96;
      v81 = 0;
      goto LABEL_108;
    }
    v150 = v98;
    v138 = v91;
    v99 = v96;
    objc_msgSend(v19, "setNumberOfUniqueMapItems:", v96);
    objc_msgSend(v16, "firstObject");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "location");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "location");
    v100 = self;
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = 0;
    v170 = 0;
    v167 = 0;
    v168 = 0;
    v137 = v97;
    -[RTRelabeler relabeledProbVectorForCandidate:usingContextNonRevGeoCandidates:contextRevGeoCandidates:inferredMapItemDeduperState:referenceLocation:outPriorVector:outObservationVector:outPosteriorVector:error:](v100, "relabeledProbVectorForCandidate:usingContextNonRevGeoCandidates:contextRevGeoCandidates:inferredMapItemDeduperState:referenceLocation:outPriorVector:outObservationVector:outPosteriorVector:error:", v165, v97, v92, v99, v101, &v170, &v169, &v168, &v167);
    v102 = objc_claimAutoreleasedReturnValue();
    v103 = v170;
    v156 = v169;
    v154 = v168;
    v104 = (RTFusedInferredMapItem *)v167;

    v105 = v99;
    v146 = v104;
    v148 = v103;
    v152 = (void *)v102;
    if (v104)
    {
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v106 = objc_claimAutoreleasedReturnValue();
      v107 = v104;
      v81 = 0;
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v186 = v104;
        _os_log_error_impl(&dword_1D1A22000, v106, OS_LOG_TYPE_ERROR, "relabeldProbVector error, %@", buf, 0xCu);
      }

      v97 = v137;
      v91 = v138;
      v108 = v105;
      v64 = 0;
      v109 = v165;
      if (a9)
        *a9 = objc_retainAutorelease(v146);
      goto LABEL_107;
    }
    v166 = 0;
    -[RTRelabeler relabeledInferredMapItemFromProbVector:error:](v100, "relabeledInferredMapItemFromProbVector:error:", v102, &v166);
    v141 = (RTFusedInferredMapItem *)objc_claimAutoreleasedReturnValue();
    v128 = v100;
    v81 = 0;
    v135 = v99;
    v136 = (RTFusedInferredMapItem *)v166;
    if (v136)
    {
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v186 = v136;
        _os_log_error_impl(&dword_1D1A22000, v129, OS_LOG_TYPE_ERROR, "relabeling pick error, %@", buf, 0xCu);
      }

      v97 = v137;
      v91 = v138;
      v107 = 0;
      if (a9)
      {
        v130 = v136;
        v64 = 0;
        v109 = v165;
        *a9 = objc_retainAutorelease(v136);
        v131 = v141;
LABEL_106:

        v108 = v135;
LABEL_107:

        v98 = v150;
LABEL_108:

        v93 = v159;
        v92 = (char *)aSelectora;
LABEL_109:

LABEL_110:
        goto LABEL_57;
      }
      v64 = 0;
      v109 = v165;
      v131 = v141;
    }
    else
    {
      if (v128->_loggingEnabled)
      {
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v132 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v186 = v141;
          _os_log_impl(&dword_1D1A22000, v132, OS_LOG_TYPE_INFO, "relabeledInferredMapItem, %@", buf, 0xCu);
        }

      }
      v109 = v165;
      objc_msgSend(v19, "setOutputMetricsUsingInputCandidate:priorVector:observationVector:posteriorVector:relabeledProbVector:relabeledInferredMapItem:", v165, v103, v156, v154, v152, v141);
      if (v160)
        *v160 = objc_retainAutorelease(v103);
      if (a7)
        *a7 = objc_retainAutorelease(v156);
      v91 = v138;
      if (v143)
        *v143 = objc_retainAutorelease(v154);
      v133 = v141;
      v131 = v141;
      v64 = v133;
      v97 = v137;
      v107 = 0;
    }
    v130 = v136;
    goto LABEL_106;
  }
LABEL_17:

LABEL_18:
  v57 = -[RTRelabeler placeholderCandidate:](self, "placeholderCandidate:", v16);
  v58 = [RTFusedInferredMapItem alloc];
  if (v57)
  {
    -[RTRelabelerParameters revGeoConfidence](self->_parameters, "revGeoConfidence");
    v60 = v59;
    v61 = v16;
    objc_msgSend(v16, "firstObject");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = self;
    v64 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v58, "initWithMapItem:confidence:source:", 0, objc_msgSend(v62, "placeSource"), v60);
  }
  else
  {
    objc_msgSend(v16, "secondObject");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "placeConfidence");
    v70 = v69;
    v61 = v16;
    objc_msgSend(v16, "firstObject");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = self;
    v64 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v58, "initWithMapItem:confidence:source:", v62, objc_msgSend(v71, "placeSource"), v70);

  }
  loggingEnabled = v63->_loggingEnabled;
  v16 = v61;
  if (loggingEnabled)
  {
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v186 = v64;
      _os_log_impl(&dword_1D1A22000, v73, OS_LOG_TYPE_INFO, "passing through relabeler, relabeledInferredMapItem, %@", buf, 0xCu);
    }

  }
  if (v64)
  {
    v74 = v64;
  }
  else
  {
    v75 = (void *)MEMORY[0x1E0CB35C8];
    v181 = *MEMORY[0x1E0CB2D50];
    v182 = CFSTR("relabeledInferredMapItem was nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerErrorDomain"), 4, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      v111 = (RTFusedInferredMapItem *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v186 = v111;
      v187 = 2112;
      v188 = v77;
      _os_log_error_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    if (a9)
      *a9 = objc_retainAutorelease(v77);

  }
LABEL_57:

  return v64;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTInferredMapItemDeduper)deduper
{
  return self->_deduper;
}

- (void)setDeduper:(id)a3
{
  objc_storeStrong((id *)&self->_deduper, a3);
}

- (RTRelabelerParameters)parameters
{
  return self->_parameters;
}

- (NSUUID)placeholderUUID
{
  return self->_placeholderUUID;
}

- (NSArray)hallucinatedUUIDs
{
  return self->_hallucinatedUUIDs;
}

- (BOOL)loggingEnabled
{
  return self->_loggingEnabled;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_loggingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hallucinatedUUIDs, 0);
  objc_storeStrong((id *)&self->_placeholderUUID, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_deduper, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end
