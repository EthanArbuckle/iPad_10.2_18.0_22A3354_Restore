@implementation RTMapItemProviderBase

- (id)filterInferredMapItems:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 error:(id *)a6
{
  return -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:](self, "filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:", a3, a5, 0, a6, a4);
}

- (id)filterInferredMapItems:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 andAppendSource:(unint64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id *v35;
  id v36;
  void *v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  const __CFString *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  if (objc_msgSend(v11, "count"))
  {
    v35 = a7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = v11;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v41;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v17);
        objc_msgSend(v18, "mapItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        v20 = -[RTMapItemProviderBase mapItemCloseEnough:referenceLocation:distanceThreshold:error:](self, "mapItemCloseEnough:referenceLocation:distanceThreshold:error:", v19, v12, &v39, a4);
        v21 = v39;

        if (v20)
        {
          objc_msgSend(v18, "mapItem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "appendSource:", a6);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v24 = objc_alloc(MEMORY[0x1E0D183A8]);
            objc_msgSend(v18, "confidence");
            v26 = objc_msgSend(v24, "initWithMapItem:confidence:source:", v23, objc_msgSend(v18, "source"), v25);
            if (!v26)
            {
              v31 = (void *)MEMORY[0x1E0CB35C8];
              v32 = *MEMORY[0x1E0D18598];
              v44 = *MEMORY[0x1E0CB2D50];
              v45 = CFSTR("filteredInferredMapItem was nil");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 0, v33);
              v28 = (id)objc_claimAutoreleasedReturnValue();

              if (!v35)
                goto LABEL_16;
              v11 = v36;
              v29 = v37;
              if (v28)
              {
                v28 = objc_retainAutorelease(v28);
                *v35 = v28;
              }
              goto LABEL_24;
            }
            v27 = (void *)v26;
            objc_msgSend(v37, "addObject:", v26);

          }
        }
        else if (v21)
        {
          if (v35)
            *v35 = objc_retainAutorelease(v21);

          v30 = 0;
          v11 = v36;
          v29 = v37;
          goto LABEL_25;
        }
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
          if (v15)
            goto LABEL_4;
          break;
        }
      }
    }

    v28 = 0;
LABEL_16:
    v11 = v36;
    v29 = v37;
LABEL_24:
    v30 = v29;
    v13 = v28;
LABEL_25:

  }
  else
  {
    v30 = v11;
  }

  return v30;
}

- (RTMapItemProviderBase)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_);
}

- (RTMapItemProviderBase)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4
{
  id v6;
  id v7;
  RTMapItemProviderBaseParameters *v8;
  RTMapItemProviderBase *v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = -[RTMapItemProviderBaseParameters initWithDefaultsManager:]([RTMapItemProviderBaseParameters alloc], "initWithDefaultsManager:", v6);
    self = -[RTMapItemProviderBase initWithDistanceCalculator:parameters:](self, "initWithDistanceCalculator:parameters:", v7, v8);

    v9 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (RTMapItemProviderBase)initWithDistanceCalculator:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTMapItemProviderBase *v10;
  id *p_isa;
  RTMapItemProviderBase *v12;
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
    v14 = "Invalid parameter not satisfying: parameters";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTMapItemProviderBase;
  v10 = -[RTMapItemProviderBase init](&v16, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_distanceCalculator, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

- (BOOL)mapItemCloseEnough:(id)a3 referenceLocation:(id)a4 distanceThreshold:(double)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (a6)
  {
    if (v10)
    {
      if (v11)
      {
        -[RTMapItemProviderBase distanceCalculator](self, "distanceCalculator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "location");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        objc_msgSend(v13, "distanceFromLocation:toLocation:error:", v12, v14, &v35);
        v16 = v15;
        v17 = v35;

        if (v17)
        {
          v18 = 0;
          *a6 = objc_retainAutorelease(v17);
        }
        else
        {
          objc_msgSend(v12, "horizontalUncertainty");
          v24 = v23;
          -[RTMapItemProviderBaseParameters locationUncertaintyMax](self->_baseParameters, "locationUncertaintyMax");
          if (v24 >= v25)
            v24 = v25;
          -[RTMapItemProviderBaseParameters locationUncertaintyMin](self->_baseParameters, "locationUncertaintyMin");
          if (v24 >= v26)
            v26 = v24;
          v27 = v26 + a5;
          objc_msgSend(v10, "location");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "horizontalUncertainty");
          v30 = v29;

          -[RTMapItemProviderBaseParameters mapItemUncertaintyMin](self->_baseParameters, "mapItemUncertaintyMin");
          if (v30 < v31)
            v30 = v31;
          -[RTMapItemProviderBaseParameters mapItemUncertaintyMax](self->_baseParameters, "mapItemUncertaintyMax");
          if (v30 < v32)
            v32 = v30;
          if (v16 > v27 + v32)
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              v37 = v10;
              v38 = 2048;
              v39 = a5;
              v40 = 2048;
              v41 = v16;
              v42 = 2112;
              v43 = v12;
              _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "mapItem didn't survive distance filter, %@, distance threshold, %lf, actual distance, %lf, location, %@", buf, 0x2Au);
            }

            v18 = 0;
          }
          else
          {
            v18 = 1;
          }
        }

        goto LABEL_30;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
      }

      v21 = CFSTR("referenceLocation");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem", buf, 2u);
      }

      v21 = CFSTR("mapItem");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v21);
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v18 = 0;
LABEL_30:

  return v18;
}

- (id)filter:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 andAppendSource:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id *v27;
  id v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  if (objc_msgSend(v12, "count"))
  {
    v27 = a7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = v12;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v30 = 0;
          v20 = -[RTMapItemProviderBase mapItemCloseEnough:referenceLocation:distanceThreshold:error:](self, "mapItemCloseEnough:referenceLocation:distanceThreshold:error:", v19, v13, &v30, a4);
          v21 = v30;
          v22 = v21;
          if (v20)
          {
            objc_msgSend(v19, "appendSource:", a6);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              objc_msgSend(v29, "addObject:", v23);

          }
          else if (v21)
          {
            if (v27)
              *v27 = objc_retainAutorelease(v21);

            v25 = 0;
            v12 = v28;
            v24 = v29;
            goto LABEL_19;
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v16)
          continue;
        break;
      }
    }

    v24 = v29;
    v25 = v29;
    v12 = v28;
LABEL_19:

  }
  else
  {
    v25 = v12;
  }

  return v25;
}

- (id)filter:(id)a3 byDistance:(double)a4 fromLocation:(id)a5 error:(id *)a6
{
  return -[RTMapItemProviderBase filter:byDistance:fromLocation:andAppendSource:error:](self, "filter:byDistance:fromLocation:andAppendSource:error:", a3, a5, 0, a6, a4);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTMapItemProviderBaseParameters)baseParameters
{
  return self->_baseParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseParameters, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end
