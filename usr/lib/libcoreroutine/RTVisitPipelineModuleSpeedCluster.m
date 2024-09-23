@implementation RTVisitPipelineModuleSpeedCluster

void __45__RTVisitPipelineModuleSpeedCluster_process___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  RTVisitLocationPoints *v40;
  RTVisitCluster *v41;
  NSObject *v42;
  objc_class *v43;
  char *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  RTVisitCluster *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = v6;
  if (a4)
  {
    if (!objc_msgSend(v6, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[RTVisitPipelineModuleSpeedCluster process:]_block_invoke";
        v47 = 1024;
        LODWORD(v48) = 114;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count (in %s:%d)", buf, 0x12u);
      }

    }
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "date");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToDate:", v10);

    if (v14)
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = 0;

      if (objc_msgSend(v7, "count") == 1)
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "only last point is in this segment.  send force exit signal", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "clearAndAddForcedExitSignalToClusters:", *(_QWORD *)(a1 + 40));
        goto LABEL_22;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "entry");
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
      v20 = objc_claimAutoreleasedReturnValue();

      v10 = v19;
      v7 = (void *)v20;
    }
    else if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = (const char *)v10;
        _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "working visit is terminated as last point of low speed segment is, %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "clearAndAddForcedExitSignalToClusters:", *(_QWORD *)(a1 + 40));
    }
    if (objc_msgSend(*(id *)(a1 + 48), "isPartialAndExitDateIsEqualToDate:", v12))
    {
      objc_msgSend(v7, "lastObject");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 16);
      *(_QWORD *)(v22 + 16) = v21;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x1E0D18578]);
      objc_msgSend(v7, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x1E0D185C8];
      v28 = objc_msgSend(v25, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v24, 1, v26, v10, v12, 0, *MEMORY[0x1E0D185C8], 0);
      v29 = *(_QWORD *)(a1 + 32);
      v30 = *(void **)(v29 + 8);
      *(_QWORD *)(v29 + 8) = v28;

      v31 = objc_alloc(MEMORY[0x1E0D18578]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "location");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v24, 1, v32, v10, 0, 0, v27, 0);
LABEL_27:
      v39 = (void *)v33;

      v40 = -[RTVisitLocationPoints initWithLocations:]([RTVisitLocationPoints alloc], "initWithLocations:", v7);
      v41 = -[RTVisitCluster initWithPoints:visit:]([RTVisitCluster alloc], "initWithPoints:visit:", v40, v39);
      if (v41)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v41);
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v46 = v44;
        v47 = 2112;
        v48 = v41;
        _os_log_debug_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_DEBUG, "%@ adding to output clusters, %@", buf, 0x16u);

      }
      *a4 = 0;

      goto LABEL_32;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "entry");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "date");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "isEqualToDate:", v36) & 1) != 0)
    {

LABEL_22:
      *a4 = 0;
LABEL_32:

      goto LABEL_33;
    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {

    }
    else
    {
      v37 = objc_msgSend(v7, "count");

      if (v37 == 1)
        goto LABEL_22;
    }
    objc_msgSend(*(id *)(a1 + 32), "clearWorkingVisit");
    v38 = objc_alloc(MEMORY[0x1E0D18578]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v38, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v24, 3, v32, v10, v12, 0, *MEMORY[0x1E0D185C8], 0);
    goto LABEL_27;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[RTVisitPipelineModuleSpeedCluster process:]_block_invoke";
    v47 = 1024;
    LODWORD(v48) = 110;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stop (in %s:%d)", buf, 0x12u);
  }
LABEL_33:

}

- (id)process:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  RTVisit *v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  RTVisitLocationPoints *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  RTVisitHyperParameter *hyperParameter;
  id v31;
  void *v32;
  void *v33;
  BOOL v34;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  RTVisit *workingVisit;
  RTLocation *lastPoint;
  RTVisit *v41;
  void *v43;
  id obj;
  uint64_t v45;
  id v46;
  _QWORD v47[5];
  id v48;
  void *v49;
  _BYTE *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint8_t v56[4];
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  _BYTE buf[24];
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v5 = v4;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTVisitPipelineModuleSpeedCluster process:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 73;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inClusters.count (in %s:%d)", buf, 0x12u);
    }

    v4 = v5;
  }
  v43 = v4;
  if (objc_msgSend(v4, "count"))
  {
    v46 = (id)objc_opt_new();
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
    if (v7)
    {
      v45 = *(_QWORD *)v52;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v52 != v45)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v8);
          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v9;
            _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@ working on cluster, %@", buf, 0x16u);

          }
          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v37 = (objc_class *)objc_opt_class();
            NSStringFromClass(v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            workingVisit = self->_workingVisit;
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v38;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = workingVisit;
            _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@ working visit, %@", buf, 0x16u);

          }
          objc_msgSend(v9, "points");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v63 = __Block_byref_object_copy__143;
          v64 = __Block_byref_object_dispose__143;
          v65 = 0;
          objc_msgSend(v12, "locations");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count") == 0;

          if (v14)
          {
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v56 = 0;
              _os_log_debug_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEBUG, "received forced exit signal", v56, 2u);
            }

            -[RTVisitPipelineModuleSpeedCluster clearAndAddForcedExitSignalToClusters:](self, "clearAndAddForcedExitSignalToClusters:", v46);
          }
          else
          {
            v15 = self->_workingVisit;
            if (v15)
            {
              if (!self->_lastPoint)
              {
                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  v41 = self->_workingVisit;
                  *(_DWORD *)v56 = 138412802;
                  v57 = (const char *)v41;
                  v58 = 2080;
                  v59 = "-[RTVisitPipelineModuleSpeedCluster process:]";
                  v60 = 1024;
                  v61 = 93;
                  _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "no last point in working visit, %@ (in %s:%d)", v56, 0x1Cu);
                }

                v15 = self->_workingVisit;
              }
              -[RTVisit entry](v15, "entry");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v9, "isDateInside:", v17);

              _rt_log_facility_get_os_log(RTLogFacilityVisit);
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
              if (v18)
              {
                if (v20)
                {
                  lastPoint = self->_lastPoint;
                  *(_DWORD *)v56 = 138412290;
                  v57 = (const char *)lastPoint;
                  _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "working visit is inside and use last point, %@", v56, 0xCu);
                }

                objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), self->_lastPoint);
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "date");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v9, "isDateInside:", v21);

                if ((v22 & 1) == 0)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v56 = 136315394;
                    v57 = "-[RTVisitPipelineModuleSpeedCluster process:]";
                    v58 = 1024;
                    LODWORD(v59) = 98;
                    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "working visit is inside but last point is not (in %s:%d)", v56, 0x12u);
                  }

                }
              }
              else
              {
                if (v20)
                {
                  *(_WORD *)v56 = 0;
                  _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "working visit is outside. send forced exit signal", v56, 2u);
                }

                -[RTVisitPipelineModuleSpeedCluster clearAndAddForcedExitSignalToClusters:](self, "clearAndAddForcedExitSignalToClusters:", v46);
              }
            }
            if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
            {
              v55 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = [RTVisitLocationPoints alloc];
              objc_msgSend(v12, "locations");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = -[RTVisitLocationPoints initWithLocations:](v26, "initWithLocations:", v28);

              v12 = (void *)v29;
            }
            hyperParameter = self->_hyperParameter;
            v47[0] = MEMORY[0x1E0C809B0];
            v47[1] = 3221225472;
            v47[2] = __45__RTVisitPipelineModuleSpeedCluster_process___block_invoke;
            v47[3] = &unk_1E92A40A0;
            v50 = buf;
            v47[4] = self;
            v31 = v46;
            v48 = v31;
            v49 = v9;
            objc_msgSend(v12, "enumerateLowSpeedSegementsUsingBlock:block:", hyperParameter, v47);
            if (self->_workingVisit)
            {
              objc_msgSend(v9, "visit");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "exit");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33 == 0;

              if (!v34)
                -[RTVisitPipelineModuleSpeedCluster clearAndAddForcedExitSignalToClusters:](self, "clearAndAddForcedExitSignalToClusters:", v31);
            }

          }
          _Block_object_dispose(buf, 8);

          ++v8;
        }
        while (v7 != v8);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
      }
      while (v7);
    }

  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (RTVisitPipelineModuleSpeedCluster)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithHyperParameter_);
}

- (RTVisitPipelineModuleSpeedCluster)initWithHyperParameter:(id)a3
{
  id v5;
  RTVisitPipelineModuleSpeedCluster *v6;
  RTVisitPipelineModuleSpeedCluster *v7;
  RTVisitPipelineModuleSpeedCluster *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTVisitPipelineModuleSpeedCluster;
    v6 = -[RTVisitPipelineModuleSpeedCluster init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_hyperParameter, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SpeedCluster"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_workingVisit)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("working visit, %@"), self->_workingVisit);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v4);

  }
  return (NSString *)v3;
}

- (void)clearWorkingVisit
{
  RTLocation *lastPoint;
  RTVisit *workingVisit;

  lastPoint = self->_lastPoint;
  self->_lastPoint = 0;

  workingVisit = self->_workingVisit;
  self->_workingVisit = 0;

}

- (void)clearAndAddForcedExitSignalToClusters:(id)a3
{
  id v4;
  NSObject *v5;
  RTVisitCluster *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_workingVisit)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[RTVisitPipelineModuleSpeedCluster clearAndAddForcedExitSignalToClusters:]";
      v9 = 1024;
      v10 = 63;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "cannot create exit signal without working visit (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }

  }
  v6 = -[RTVisitCluster initWithPoints:visit:]([RTVisitCluster alloc], "initWithPoints:visit:", 0, self->_workingVisit);
  if (v6)
    objc_msgSend(v4, "addObject:", v6);
  -[RTVisitPipelineModuleSpeedCluster clearWorkingVisit](self, "clearWorkingVisit");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameter, 0);
  objc_storeStrong((id *)&self->_lastPoint, 0);
  objc_storeStrong((id *)&self->_workingVisit, 0);
}

@end
