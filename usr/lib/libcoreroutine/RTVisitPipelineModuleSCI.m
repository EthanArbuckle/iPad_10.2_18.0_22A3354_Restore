@implementation RTVisitPipelineModuleSCI

uint64_t __47__RTVisitPipelineModuleSCI_onHintNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onHintNotification:", *(_QWORD *)(a1 + 40));
}

- (void)onHintNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__RTVisitPipelineModuleSCI_onHintNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_onHintNotification:(id)a3
{
  char *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSArray *hintCache;
  void *v13;
  __int16 v14;
  NSObject *v15;
  int v16;
  char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v7;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, received hint notification, %@, %@", (uint8_t *)&v16, 0x20u);

  }
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTHintManagerNotificationDidUpdate, "notificationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    hintCache = self->_hintCache;
    self->_hintCache = 0;

    objc_msgSend(v5, "hintSourcesUpdated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if ((v14 & 0x300) != 0)
      self->_latestGeofenceHintChecked = 0;
    if ((v14 & 0xC00) != 0)
      self->_latestSignificantRegionHintChecked = 0;
    if ((v14 & 0x100) != 0)
      -[RTVisitPipelineModuleSCI processContextChangeWithSource:](self, "processContextChangeWithSource:", 7);
    if ((v14 & 0x400) != 0)
      -[RTVisitPipelineModuleSCI processContextChangeWithSource:](self, "processContextChangeWithSource:", 9);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412802;
      v17 = v5;
      v18 = 2080;
      v19 = "-[RTVisitPipelineModuleSCI _onHintNotification:]";
      v20 = 1024;
      LODWORD(v21) = 1068;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v16, 0x1Cu);
    }

  }
}

- (id)process:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  char *v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  char *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSMutableArray *v44;
  NSMutableArray *v45;
  NSMutableArray *clusters;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  char *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  char *v58;
  unint64_t v59;
  void *v60;
  id v61;
  id obj;
  NSMutableArray *obja;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[6];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  unint64_t v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v76 = "-[RTVisitPipelineModuleSCI process:]";
      v77 = 1024;
      LODWORD(v78) = 1220;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "empty in clustesr or nil (in %s:%d)", buf, 0x12u);
    }

  }
  if (!objc_msgSend(v4, "count"))
  {
    v44 = 0;
    goto LABEL_54;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v61 = v4;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
  if (!v6)
    goto LABEL_31;
  v7 = v6;
  v8 = *(_QWORD *)v71;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v71 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v9);
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v34 = (char *)objc_claimAutoreleasedReturnValue();
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v76 = v34;
        v77 = 2112;
        v78 = (unint64_t)v36;
        v79 = 2112;
        v80 = v10;
        v81 = 2112;
        v82 = v37;
        _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, %@ working on cluster, %@, %@", buf, 0x2Au);

      }
      objc_msgSend(v10, "points");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "points");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v29 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
LABEL_24:

          -[RTVisitPipelineModuleSCI exitUntilNotInWorkingHypotheisWithBlock:](self, "exitUntilNotInWorkingHypotheisWithBlock:", 0);
          goto LABEL_25;
        }
        NSStringFromSelector(a2);
        v30 = (char *)objc_claimAutoreleasedReturnValue();
        -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v76 = v30;
        v77 = 2112;
        v78 = (unint64_t)v31;
        v32 = v29;
        v33 = "%@, received forced exit signal, %@";
LABEL_29:
        _os_log_debug_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_DEBUG, v33, buf, 0x16u);

        goto LABEL_24;
      }
      objc_msgSend(v13, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitSCIStayCluster lastProcessedSample](self->_workingHypothesis, "lastProcessedSample");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isOnOrAfter:", v17);

      if ((v18 & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v76 = "-[RTVisitPipelineModuleSCI process:]";
          v77 = 1024;
          LODWORD(v78) = 1238;
          _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "new point is out of order (in %s:%d)", buf, 0x12u);
        }

      }
      objc_msgSend(v13, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitSCIStayCluster lastProcessedSample](self->_workingHypothesis, "lastProcessedSample");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isOnOrAfter:", v22);

      if (v23)
      {
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __36__RTVisitPipelineModuleSCI_process___block_invoke;
        v69[3] = &unk_1E92A47C0;
        v69[4] = v10;
        v69[5] = self;
        -[RTVisitPipelineModuleSCI exitUntilNotInWorkingHypotheisWithBlock:](self, "exitUntilNotInWorkingHypotheisWithBlock:", v69);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v13, 0);
        -[RTVisitPipelineModuleSCI processPoints:](self, "processPoints:", v24);

        objc_msgSend(v10, "visit");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "exit");
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          v28 = -[RTVisitPipelineModuleSCI isInWorkingHypothesis](self, "isInWorkingHypothesis");

          if (!v28)
            goto LABEL_25;
          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            goto LABEL_24;
          NSStringFromSelector(a2);
          v30 = (char *)objc_claimAutoreleasedReturnValue();
          -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v76 = v30;
          v77 = 2112;
          v78 = (unint64_t)v31;
          v32 = v29;
          v33 = "%@, in cluster is terminated and we are still in working hypothesis, %@";
          goto LABEL_29;
        }

      }
LABEL_25:

      ++v9;
    }
    while (v7 != v9);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    v7 = v38;
  }
  while (v38);
LABEL_31:

  if (-[RTVisitSCIStayCluster numOfResiduePoints](self->_workingHypothesis, "numOfResiduePoints")
    && -[RTVisitPipelineModuleSCI isVisitInFlight](self, "isVisitInFlight"))
  {
    if (-[NSMutableArray count](self->_clusters, "count"))
    {
      -[NSMutableArray lastObject](self->_clusters, "lastObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "visit");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "exit");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v76 = "-[RTVisitPipelineModuleSCI process:]";
          v77 = 1024;
          LODWORD(v78) = 1260;
          _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "unexpected in flight points (in %s:%d)", buf, 0x12u);
        }

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v58 = (char *)objc_claimAutoreleasedReturnValue();
      v59 = -[RTVisitSCIStayCluster numOfResiduePoints](self->_workingHypothesis, "numOfResiduePoints");
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v76 = v58;
      v77 = 2048;
      v78 = v59;
      v79 = 2112;
      v80 = v60;
      _os_log_debug_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_DEBUG, "%@, add partial visit to capture %lu in flight points, %@", buf, 0x20u);

    }
    -[RTVisitPipelineModuleSCI addVisitFromWorkingHypothesis:confidence:](self, "addVisitFromWorkingHypothesis:confidence:", 1, *MEMORY[0x1E0D185C8]);
  }
  v44 = self->_clusters;
  v45 = (NSMutableArray *)objc_opt_new();
  clusters = self->_clusters;
  self->_clusters = v45;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v44 = v44;
    v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v66;
      obja = v44;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v66 != v49)
            objc_enumerationMutation(v44);
          v51 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v50);
          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            v53 = (char *)objc_claimAutoreleasedReturnValue();
            v54 = (objc_class *)objc_opt_class();
            NSStringFromClass(v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v76 = v53;
            v77 = 2112;
            v78 = (unint64_t)v55;
            v79 = 2112;
            v80 = v51;
            v81 = 2112;
            v82 = v56;
            _os_log_debug_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_DEBUG, "%@, %@ adding to output clusters, %@, %@", buf, 0x2Au);

            v44 = obja;
          }

          ++v50;
        }
        while (v48 != v50);
        v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      }
      while (v48);
    }

  }
  v4 = v61;
LABEL_54:

  return v44;
}

- (BOOL)isVisitInFlight
{
  if (self->_useLowConfidence)
  {
    if (self->_lcFSMState == 1)
      return 1;
  }
  else if (self->_fsmState == 3)
  {
    return 1;
  }
  return 0;
}

- (void)processPoints:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  RTVisitPipelineModuleSCI *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  RTVisitSCIStayCluster *workingHypothesis;
  void *v41;
  double v42;
  double v43;
  NSObject *v44;
  id v45;
  void *v46;
  BOOL v47;
  uint64_t v48;
  id v49;
  unint64_t v50;
  unint64_t v51;
  id v52;
  id v53;
  char *v54;
  void *v55;
  char *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  RTVisitSCIStayCluster *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  RTLocation *v78;
  RTLocation *lastPointProcessed;
  void *v80;
  char *v81;
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v84 = "-[RTVisitPipelineModuleSCI processPoints:]";
      v85 = 1024;
      LODWORD(v86) = 839;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "empty points (in %s:%d)", buf, 0x12u);
    }

  }
  if (objc_msgSend(v4, "count"))
  {
    v6 = objc_msgSend(v4, "count");
    v7 = -[RTVisitSCIStayCluster numOfOutliers](self->_workingHypothesis, "numOfOutliers");
    if (objc_msgSend(v4, "count"))
    {
      v8 = 0;
      v9 = (240 * (v7 + v6)) >> 1;
      v10 = 0x1E0C99000uLL;
      while (1)
      {
        v11 = (void *)MEMORY[0x1D8231EA8]();
        if (v8 > v9)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v84 = "-[RTVisitPipelineModuleSCI processPoints:]";
            v85 = 1024;
            LODWORD(v86) = 847;
            _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "run out of loop while processing (in %s:%d)", buf, 0x12u);
          }

        }
        v13 = v10;
        objc_msgSend(v4, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeObjectAtIndex:", 0);
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v54 = (char *)objc_claimAutoreleasedReturnValue();
          -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v84 = v54;
          v85 = 2112;
          v86 = *(double *)&v14;
          v87 = 2112;
          v88 = *(double *)&v55;
          _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "%@, processing point, %@, %@", buf, 0x20u);

        }
        objc_msgSend(v14, "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitSCIStayCluster lastProcessedSample](self->_workingHypothesis, "lastProcessedSample");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isOnOrAfter:", v17);

        if ((v18 & 1) == 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v84 = "-[RTVisitPipelineModuleSCI processPoints:]";
            v85 = 1024;
            LODWORD(v86) = 858;
            _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "new sample is out of order (in %s:%d)", buf, 0x12u);
          }

        }
        objc_msgSend(v14, "horizontalUncertainty");
        v21 = v20;
        -[RTVisitHyperParameter maxHorizontalAccuracy](self->_hyperParameter, "maxHorizontalAccuracy");
        v10 = v13;
        if (v21 > v22 || (objc_msgSend(v14, "horizontalUncertainty"), v23 < 0.0))
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v84 = "-[RTVisitPipelineModuleSCI processPoints:]";
            v85 = 1024;
            LODWORD(v86) = 860;
            _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "uncertainty is out of range (in %s:%d)", buf, 0x12u);
          }

        }
        if (-[RTVisitSCIStayCluster numOfDataPoints](self->_workingHypothesis, "numOfDataPoints"))
          break;
        v33 = self;
        v34 = 9;
LABEL_28:
        v35 = -[RTVisitPipelineModuleSCI handleFSM:point:](v33, "handleFSM:point:", v34, v14);
LABEL_46:

        objc_autoreleasePoolPop(v11);
        ++v8;
        if (!objc_msgSend(v4, "count"))
          goto LABEL_58;
      }
      objc_msgSend(v14, "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitSCIStayCluster lastProcessedSample](self->_workingHypothesis, "lastProcessedSample");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceDate:", v26);
      v28 = v27;
      -[RTVisitHyperParameter maxGapInVisit](self->_hyperParameter, "maxGapInVisit");
      v30 = v29;

      if (v28 > v30)
      {
        -[RTVisitPipelineModuleSCI handleFSM:point:](self, "handleFSM:point:", 3, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "insertObject:atIndex:", v14, 0);
        if (objc_msgSend(v31, "count"))
        {
          objc_msgSend(v31, "addObjectsFromArray:", v4);
          v32 = v31;

          v4 = v32;
        }
LABEL_45:

        goto LABEL_46;
      }
      objc_msgSend(v14, "latitude");
      objc_msgSend(v14, "longitude");
      -[RTVisitSCIStayCluster centroid](self->_workingHypothesis, "centroid");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "latitude");
      -[RTVisitSCIStayCluster centroid](self->_workingHypothesis, "centroid");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "longitude");
      RTCommonCalculateDistance();
      v39 = v38;

      workingHypothesis = self->_workingHypothesis;
      objc_msgSend(v14, "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitSCIStayCluster getRadiusForDate:](workingHypothesis, "getRadiusForDate:", v41);
      v43 = v42;

      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v56 = (char *)objc_claimAutoreleasedReturnValue();
        -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v84 = v56;
        v85 = 2048;
        v86 = v39;
        v87 = 2048;
        v88 = v43;
        v89 = 2112;
        v90 = v57;
        _os_log_debug_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_DEBUG, "%@, distance from working hypothesis, %.1fm, radius, %.1fm, %@", buf, 0x2Au);

        v10 = v13;
      }

      if (v39 >= v43)
      {
        v49 = -[RTVisitPipelineModuleSCI handleFSM:point:](self, "handleFSM:point:", 2, v14);
        v50 = -[RTVisitSCIStayCluster numOfOutliers](self->_workingHypothesis, "numOfOutliers");
        v51 = v50;
        if (self->_useLowConfidence && self->_lcFSMState == 1 && (v50 > 3 || v39 >= 300.0))
          v52 = -[RTVisitPipelineModuleSCI handleFSM:point:](self, "handleFSM:point:", 7, v14);
        if (!-[RTVisitPipelineModuleSCI isTimeOutsideClusterSatisfiedForOutlierCount:location:](self, "isTimeOutsideClusterSatisfiedForOutlierCount:location:", v51, v14))goto LABEL_46;
        -[RTVisitPipelineModuleSCI handleFSM:point:](self, "handleFSM:point:", 5, v14);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "count"))
        {
          objc_msgSend(v31, "addObjectsFromArray:", v4);
          v53 = v31;

          v4 = v53;
        }
        goto LABEL_45;
      }
      v45 = -[RTVisitPipelineModuleSCI handleFSM:point:](self, "handleFSM:point:", 1, v14);
      if (self->_useLowConfidence
        && !self->_lcFSMState
        && -[RTVisitSCIStayCluster numOfDataPoints](self->_workingHypothesis, "numOfDataPoints") >= 2)
      {
        -[RTVisitSCIStayCluster centroid](self->_workingHypothesis, "centroid");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = -[RTVisitPipelineModuleSCI isHintNearLocation:](self, "isHintNearLocation:", v46);

        if (v47)
        {
          v48 = 8;
        }
        else
        {
          if (self->_fsmState != 3)
          {
LABEL_52:
            if (!-[RTVisitPipelineModuleSCI isDwellTimeSatisfiedForLocation:](self, "isDwellTimeSatisfiedForLocation:", v14))
            {
              objc_msgSend(*(id *)(v10 + 3432), "date");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "date");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "timeIntervalSinceDate:", v60);
              v62 = v61;
              -[RTVisitPipelineModuleSCI minStaticIntervalForSLVArrival](self, "minStaticIntervalForSLVArrival");
              v64 = v63;

              if (v62 < v64)
              {
                v65 = self->_workingHypothesis;
                objc_msgSend(v14, "date");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTVisitSCIStayCluster dwellTimeIntervalWithDate:](v65, "dwellTimeIntervalWithDate:", v66);
                v68 = v67;

                -[RTVisitPipelineModuleSCI requiredDwellTimeForLocation:](self, "requiredDwellTimeForLocation:", v14);
                v70 = v69;
                v71 = v69 - v68;
                v72 = *(void **)(v10 + 3432);
                objc_msgSend(v14, "date");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "dateWithTimeInterval:sinceDate:", v73, v71);
                v74 = (void *)objc_claimAutoreleasedReturnValue();

                _rt_log_facility_get_os_log(RTLogFacilityVisit);
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                {
                  NSStringFromSelector(a2);
                  v81 = (char *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "stringFromDate");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
                  v76 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413314;
                  v84 = v81;
                  v85 = 2048;
                  v86 = v70;
                  v87 = 2048;
                  v88 = v71;
                  v89 = 2112;
                  v90 = v80;
                  v91 = 2112;
                  v92 = v76;
                  v77 = (void *)v76;
                  _os_log_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_INFO, "%@, requiredDwellTime, %.2f, remainingDwellTime, %.2f, nextPotentialEntryDate, %@, %@", buf, 0x34u);

                }
                -[RTDelayedLocationRequester updateFireDate:](self->_delayedLocationRequester, "updateFireDate:", v74);

                v10 = v13;
              }
              goto LABEL_46;
            }
            v33 = self;
            v34 = 4;
            goto LABEL_28;
          }
          v48 = 10;
        }
        v58 = -[RTVisitPipelineModuleSCI handleFSM:point:](self, "handleFSM:point:", v48, v14);
      }
      if (self->_fsmState == 3)
        goto LABEL_46;
      goto LABEL_52;
    }
LABEL_58:
    objc_msgSend(v4, "lastObject");
    v78 = (RTLocation *)objc_claimAutoreleasedReturnValue();
    lastPointProcessed = self->_lastPointProcessed;
    self->_lastPointProcessed = v78;

  }
}

- (id)stateMachineConfidenceString
{
  if (self->_useLowConfidence)
    return CFSTR("lowConfidence");
  else
    return CFSTR("highConfidence");
}

- (id)handleFSM:(unint64_t)a3 point:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  unint64_t lcFSMState;
  char v11;
  unint64_t fsmState;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  NSObject *v29;
  char *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "FSMStateToString:", self->_fsmState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "LCFSMStateToString:", self->_lcFSMState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_useLowConfidence)
    goto LABEL_7;
  lcFSMState = self->_lcFSMState;
  if (lcFSMState != 1)
  {
    if (!lcFSMState)
    {
      v11 = 0;
      if (a3 <= 0xA && ((1 << a3) & 0x510) != 0)
      {
        v11 = 1;
        self->_lcFSMState = 1;
        -[RTVisitPipelineModuleSCI addVisitFromWorkingHypothesis:confidence:](self, "addVisitFromWorkingHypothesis:confidence:", 1, *MEMORY[0x1E0D185D0]);
      }
      goto LABEL_11;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_11;
  }
  v11 = 0;
  if (a3 <= 7 && ((1 << a3) & 0xA8) != 0)
  {
    -[RTVisitPipelineModuleSCI addVisitFromWorkingHypothesis:confidence:](self, "addVisitFromWorkingHypothesis:confidence:", 3, *MEMORY[0x1E0D185D0]);
    self->_lcFSMState = 0;
    v11 = 1;
  }
LABEL_11:
  fsmState = self->_fsmState;
  if (fsmState - 2 < 2)
  {
    if (a3 != 1)
    {
      if (a3 == 2)
      {
        if (!v7)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
            v35 = 1024;
            LODWORD(v36) = 774;
            _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "point is nil (in %s:%d)", buf, 0x12u);
          }

        }
        -[RTVisitSCIStayCluster addOutlier:](self->_workingHypothesis, "addOutlier:", v7);
        goto LABEL_37;
      }
      if (fsmState == 2)
      {
        if (a3 - 5 >= 2 && a3 != 3)
        {
          if (a3 != 4)
            goto LABEL_61;
          self->_fsmState = 3;
          if (self->_useLowConfidence)
            goto LABEL_37;
          v16 = 1;
          -[RTVisitPipelineModuleSCI addVisitFromWorkingHypothesis:confidence:](self, "addVisitFromWorkingHypothesis:confidence:", 1, *MEMORY[0x1E0D185C8]);
LABEL_46:
          v15 = 0;
          goto LABEL_63;
        }
      }
      else
      {
        if (a3 != 3)
        {
          if (a3 == 6)
          {
LABEL_37:
            v15 = 0;
LABEL_60:
            v16 = 1;
            goto LABEL_63;
          }
          if (a3 != 5)
            goto LABEL_61;
        }
        if (!self->_useLowConfidence)
          -[RTVisitPipelineModuleSCI addVisitFromWorkingHypothesis:confidence:](self, "addVisitFromWorkingHypothesis:confidence:", 3, *MEMORY[0x1E0D185C8]);
      }
      -[RTVisitSCIStayCluster outliers](self->_workingHypothesis, "outliers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitPipelineModuleSCI resetWorkingHypothesis](self, "resetWorkingHypothesis");
LABEL_59:
      self->_fsmState = 0;
      goto LABEL_60;
    }
    if (!v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
        v35 = 1024;
        LODWORD(v36) = 778;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "point is nil (in %s:%d)", buf, 0x12u);
      }

      fsmState = self->_fsmState;
    }
    v16 = 1;
    -[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:](self->_workingHypothesis, "addNewPoint:event:lcFSMState:fsmState:", v7, 1, self->_lcFSMState, fsmState);
    goto LABEL_46;
  }
  if (fsmState == 1)
  {
    v15 = 0;
    if (a3 > 6)
    {
LABEL_62:
      v16 = v11;
      goto LABEL_63;
    }
    if (((1 << a3) & 0x6C) == 0)
    {
      v16 = v11;
      if (a3 == 1)
      {
        if (v7)
        {
          v28 = 1;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
            v35 = 1024;
            LODWORD(v36) = 761;
            _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "point is nil (in %s:%d)", buf, 0x12u);
          }

          v28 = self->_fsmState;
        }
        v16 = 1;
        -[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:](self->_workingHypothesis, "addNewPoint:event:lcFSMState:fsmState:", v7, 1, self->_lcFSMState, v28);
        v15 = 0;
        self->_fsmState = 2;
      }
      goto LABEL_63;
    }
    -[RTVisitPipelineModuleSCI resetWorkingHypothesis](self, "resetWorkingHypothesis");
    v15 = 0;
    goto LABEL_59;
  }
  if (fsmState)
  {
LABEL_61:
    v15 = 0;
    goto LABEL_62;
  }
  if (-[RTVisitSCIStayCluster numOfDataPoints](self->_workingHypothesis, "numOfDataPoints"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
      v35 = 1024;
      LODWORD(v36) = 736;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "nonzero data points outside working hypothesis (in %s:%d)", buf, 0x12u);
    }

  }
  if (-[RTVisitSCIStayCluster numOfOutliers](self->_workingHypothesis, "numOfOutliers"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
      v35 = 1024;
      LODWORD(v36) = 737;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "unexpected outliers outside working hypothesis (in %s:%d)", buf, 0x12u);
    }

  }
  v15 = 0;
  v16 = 1;
  if (a3 - 5 >= 2 && a3 != 3)
  {
    if (a3 == 9)
    {
      if (!v7)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
          v35 = 1024;
          LODWORD(v36) = 743;
          _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "point is nil (in %s:%d)", buf, 0x12u);
        }

      }
      -[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:](self->_workingHypothesis, "addNewPoint:event:lcFSMState:fsmState:", v7, 9, self->_lcFSMState, self->_fsmState);
      v15 = 0;
      v16 = 1;
      self->_fsmState = 1;
      goto LABEL_63;
    }
    goto LABEL_61;
  }
LABEL_63:
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v32 = v8;
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "FSMEventToString:", a3);
    v31 = v9;
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "FSMStateToString:", self->_fsmState);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "LCFSMStateToString:", self->_lcFSMState);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v15, "count");
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414082;
    v34 = v30;
    v35 = 2112;
    v36 = v23;
    v37 = 2112;
    v38 = v32;
    v39 = 2112;
    v40 = v24;
    v41 = 2112;
    v42 = v31;
    v43 = 2112;
    v44 = v25;
    v45 = 2048;
    v46 = v26;
    v47 = 2112;
    v48 = v27;
    _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "%@, event, %@, HC FSM inState, %@, HC FSM outState, %@, LC FSM inState, %@, LC FSM outState, %@, points left, %lu, %@", buf, 0x52u);

    v9 = v31;
    v8 = v32;
  }

  if ((v16 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v34 = (const char *)a3;
      v35 = 2080;
      v36 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
      v37 = 1024;
      LODWORD(v38) = 833;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "unhandled event, %lu (in %s:%d)", buf, 0x1Cu);
    }

  }
  return v15;
}

+ (id)FSMStateToString:(unint64_t)a3
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(&unk_1E932CAD8, "count") != 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "+[RTVisitPipelineModuleSCI FSMStateToString:]";
      v8 = 1024;
      v9 = 105;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stateNames.count == RTVisitSCIFSMStateMax + 1 (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

  }
  objc_msgSend(&unk_1E932CAD8, "objectAtIndexedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)LCFSMStateToString:(unint64_t)a3
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(&unk_1E932CAF0, "count") != 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "+[RTVisitPipelineModuleSCI LCFSMStateToString:]";
      v8 = 1024;
      v9 = 113;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stateNames.count == RTVisitSCIFSMLCStateMax + 1 (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

  }
  objc_msgSend(&unk_1E932CAF0, "objectAtIndexedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)FSMEventToString:(unint64_t)a3
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(&unk_1E932CB08, "count") != 11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "+[RTVisitPipelineModuleSCI FSMEventToString:]";
      v8 = 1024;
      v9 = 130;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventNames.count == RTVisitSCIFSMEventMax + 1 (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

  }
  objc_msgSend(&unk_1E932CB08, "objectAtIndexedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)exitUntilNotInWorkingHypotheisWithBlock:(id)a3
{
  uint64_t (**v5)(_QWORD);
  unint64_t v6;
  __int128 v7;
  unint64_t v8;
  const __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v17;
  const __CFString *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t (**)(_QWORD))a3;
  v6 = -[RTVisitSCIStayCluster numOfOutliers](self->_workingHypothesis, "numOfOutliers");
  if (-[RTVisitPipelineModuleSCI isInWorkingHypothesis](self, "isInWorkingHypothesis"))
  {
    v8 = 0;
    v9 = CFSTR("with");
    if (!v5)
      v9 = CFSTR("without");
    v18 = v9;
    *(_QWORD *)&v7 = 136315394;
    v17 = v7;
    while (1)
    {
      if (v8 > v6)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v17;
          v20 = "-[RTVisitPipelineModuleSCI exitUntilNotInWorkingHypotheisWithBlock:]";
          v21 = 1024;
          LODWORD(v22) = 290;
          _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "run out of loops while exiting (in %s:%d)", buf, 0x12u);
        }

      }
      if (v5 && (v5[2](v5) & 1) != 0)
        break;
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v20 = v12;
        v21 = 2112;
        v22 = v18;
        v23 = 2112;
        v24 = v13;
        _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, exit from working hypothesis and clear outliers %@ block, %@", buf, 0x20u);

      }
      -[RTVisitPipelineModuleSCI exitFromWorkingHypothesis](self, "exitFromWorkingHypothesis");
      ++v8;
      if (!-[RTVisitPipelineModuleSCI isInWorkingHypothesis](self, "isInWorkingHypothesis"))
        goto LABEL_14;
    }
  }
  else
  {
LABEL_14:
    if (!v5)
    {
      if (-[RTVisitSCIStayCluster numOfOutliers](self->_workingHypothesis, "numOfOutliers"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[RTVisitPipelineModuleSCI exitUntilNotInWorkingHypotheisWithBlock:]";
          v21 = 1024;
          LODWORD(v22) = 302;
          _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "nonzero outliers afterwards (in %s:%d)", buf, 0x12u);
        }

      }
      if (-[RTVisitSCIStayCluster numOfDataPoints](self->_workingHypothesis, "numOfDataPoints", v17))
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[RTVisitPipelineModuleSCI exitUntilNotInWorkingHypotheisWithBlock:]";
          v21 = 1024;
          LODWORD(v22) = 303;
          _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "nonzero data points (in %s:%d)", buf, 0x12u);
        }

      }
      if (self->_fsmState)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[RTVisitPipelineModuleSCI exitUntilNotInWorkingHypotheisWithBlock:]";
          v21 = 1024;
          LODWORD(v22) = 304;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "state is not correct (in %s:%d)", buf, 0x12u);
        }

      }
    }
  }

}

- (BOOL)isInWorkingHypothesis
{
  return self->_fsmState != 0;
}

- (void)addVisitFromWorkingHypothesis:(int64_t)a3 confidence:(double)a4
{
  NSObject *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[RTVisitPipelineModuleSCI isVisitInFlight](self, "isVisitInFlight"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[RTVisitPipelineModuleSCI addVisitFromWorkingHypothesis:confidence:]";
      v16 = 1024;
      LODWORD(v17) = 338;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "adding visit while FSM is not in correct state (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }

  }
  -[RTVisitSCIStayCluster createVisit:confidence:](self->_workingHypothesis, "createVisit:confidence:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, detected visit, %@, %@", (uint8_t *)&v14, 0x20u);

  }
  -[RTVisitPipelineModuleSCI addToClusters:](self, "addToClusters:", v9);

}

- (void)addToClusters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  void *v33;
  void *v34;
  char *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  int v44;
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "visit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v44 = 136315394;
      v45 = "-[RTVisitPipelineModuleSCI addToClusters:]";
      v46 = 1024;
      LODWORD(v47) = 310;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "no entry ts (in %s:%d)", (uint8_t *)&v44, 0x12u);
    }

  }
  objc_msgSend(v4, "visit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v44 = 136315394;
      v45 = "-[RTVisitPipelineModuleSCI addToClusters:]";
      v46 = 1024;
      LODWORD(v47) = 311;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "no location (in %s:%d)", (uint8_t *)&v44, 0x12u);
    }

  }
  objc_msgSend(v4, "visit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v4, "points");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v44 = 136315394;
        v45 = "-[RTVisitPipelineModuleSCI addToClusters:]";
        v46 = 1024;
        LODWORD(v47) = 313;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "no points for entry visit (in %s:%d)", (uint8_t *)&v44, 0x12u);
      }

    }
  }
  objc_msgSend(v4, "visit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "entry");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v4, "visit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v4, "visit");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "exit");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {

        if (!-[NSMutableArray count](self->_clusters, "count"))
          goto LABEL_35;
LABEL_20:
        -[NSMutableArray lastObject](self->_clusters, "lastObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "visit");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "exit");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          -[NSMutableArray lastObject](self->_clusters, "lastObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "visit");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "entry");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "visit");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "entry");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v40, "isEqualToDate:", v42);

          if ((v43 & 1) != 0)
          {
LABEL_31:
            -[NSMutableArray addObject:](self->_clusters, "addObject:", v4);
            goto LABEL_32;
          }
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v44 = 136315394;
            v45 = "-[RTVisitPipelineModuleSCI addToClusters:]";
            v46 = 1024;
            LODWORD(v47) = 323;
            _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "entry time of partial visit does not match (in %s:%d)", (uint8_t *)&v44, 0x12u);
          }
        }
        else
        {
LABEL_35:
          if (!-[NSMutableArray count](self->_clusters, "count"))
            goto LABEL_31;
          if (self->_useLowConfidence)
            goto LABEL_31;
          -[NSMutableArray lastObject](self->_clusters, "lastObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "visit");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "exit");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "visit");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "entry");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v28, "isBeforeDate:", v30);

          if ((v31 & 1) != 0)
            goto LABEL_31;
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            -[NSMutableArray lastObject](self->_clusters, "lastObject");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "visit");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "exit");
            v35 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "visit");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "entry");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 138413058;
            v45 = v35;
            v46 = 2112;
            v48 = 2080;
            v47 = v37;
            v49 = "-[RTVisitPipelineModuleSCI addToClusters:]";
            v50 = 1024;
            v51 = 329;
            _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "overlap! last visit, %@, on or after new visit, %@ (in %s:%d)", (uint8_t *)&v44, 0x26u);

          }
        }

        goto LABEL_31;
      }
      objc_msgSend(v4, "points");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        goto LABEL_20;
    }
  }
  else
  {

  }
LABEL_32:

}

uint64_t __36__RTVisitPipelineModuleSCI_process___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "potentialEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isExitDateBeforeDate:", v3);

  if ((_DWORD)v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[RTVisitPipelineModuleSCI process:]_block_invoke";
      v11 = 1024;
      v12 = 1244;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "working hypothesis is in the future (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "potentialEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isDateInside:", v6);

  return v7;
}

- (double)minStaticIntervalForSLVArrival
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("MinStaticIntervalForSLVArrival"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v9;
      v14 = 2112;
      v15 = CFSTR("MinStaticIntervalForSLVArrival");
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@ overridden to %.1fs, %@", (uint8_t *)&v12, 0x2Au);

    }
  }
  else
  {
    v7 = 900.0;
  }

  return v7;
}

- (double)minStaticIntervalForSLVArrivalWithHint
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("MinStaticIntervalForSLVArrivalWithHint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v9;
      v14 = 2112;
      v15 = CFSTR("MinStaticIntervalForSLVArrivalWithHint");
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@ overridden to %.1fs, %@", (uint8_t *)&v12, 0x2Au);

    }
  }
  else
  {
    v7 = 240.0;
  }

  return v7;
}

- (RTVisitPipelineModuleSCI)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_delayedLocationRequester_hintManager_queue_hyperParameter_useLowConfidence_);
}

- (RTVisitPipelineModuleSCI)initWithDefaultsManager:(id)a3 delayedLocationRequester:(id)a4 hintManager:(id)a5 queue:(id)a6 hyperParameter:(id)a7 useLowConfidence:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  RTVisitPipelineModuleSCI *v19;
  RTVisitPipelineModuleSCI *v20;
  uint64_t v21;
  NSMutableArray *clusters;
  RTLocation *lastPointProcessed;
  uint64_t v24;
  RTDistanceCalculator *distanceCalculator;
  uint64_t v26;
  NSDate *requiredDwellTimeCacheDateToUpdate;
  double v28;
  RTHintManager *hintManager;
  void *v30;
  RTVisitPipelineModuleSCI *v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  void *v35;
  NSObject *v37;
  id v38;
  id v39;
  objc_super v40;
  uint8_t buf[16];

  v15 = a3;
  v39 = a4;
  v16 = a5;
  v38 = a6;
  v17 = a7;
  v18 = v17;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v31 = 0;
LABEL_11:
      v35 = v38;
      v34 = v39;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v33 = "Invalid parameter not satisfying: defaultsManager";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, v33, buf, 2u);
    goto LABEL_10;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v33 = "Invalid parameter not satisfying: hintManager";
    goto LABEL_17;
  }
  if (v17)
  {
    v40.receiver = self;
    v40.super_class = (Class)RTVisitPipelineModuleSCI;
    v19 = -[RTVisitPipelineModuleSCI init](&v40, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_defaultsManager, a3);
      objc_storeStrong((id *)&v20->_delayedLocationRequester, a4);
      objc_storeStrong((id *)&v20->_hintManager, a5);
      objc_storeStrong((id *)&v20->_hyperParameter, a7);
      v20->_useLowConfidence = a8;
      v21 = objc_opt_new();
      clusters = v20->_clusters;
      v20->_clusters = (NSMutableArray *)v21;

      v20->_fsmState = 0;
      v20->_lcFSMState = 0;
      lastPointProcessed = v20->_lastPointProcessed;
      v20->_lastPointProcessed = 0;

      v24 = objc_opt_new();
      distanceCalculator = v20->_distanceCalculator;
      v20->_distanceCalculator = (RTDistanceCalculator *)v24;

      objc_storeStrong((id *)&v20->_queue, a6);
      *(_WORD *)&v20->_latestGeofenceHintChecked = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v26 = objc_claimAutoreleasedReturnValue();
      requiredDwellTimeCacheDateToUpdate = v20->_requiredDwellTimeCacheDateToUpdate;
      v20->_requiredDwellTimeCacheDateToUpdate = (NSDate *)v26;

      -[RTVisitPipelineModuleSCI minStaticIntervalForSLVArrival](v20, "minStaticIntervalForSLVArrival");
      v20->_requiredDwellTimeCache = v28;
      hintManager = v20->_hintManager;
      +[RTNotification notificationName](RTHintManagerNotificationDidUpdate, "notificationName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](hintManager, "addObserver:selector:name:", v20, sel_onHintNotification_, v30);

      -[RTVisitPipelineModuleSCI resetWorkingHypothesis](v20, "resetWorkingHypothesis");
    }
    self = v20;
    v31 = self;
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v37 = objc_claimAutoreleasedReturnValue();
  v35 = v38;
  v34 = v39;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter", buf, 2u);
  }

  v31 = 0;
LABEL_12:

  return v31;
}

- (void)shutdown
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  RTDelayedLocationRequester *delayedLocationRequester;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, %@", (uint8_t *)&v10, 0x20u);

  }
  -[RTDelayedLocationRequester shutdown](self->_delayedLocationRequester, "shutdown");
  delayedLocationRequester = self->_delayedLocationRequester;
  self->_delayedLocationRequester = 0;

}

- (void)resetWorkingHypothesis
{
  NSObject *v4;
  RTVisitSCIStayCluster *v5;
  RTVisitSCIStayCluster *workingHypothesis;
  RTDelayedLocationRequester *delayedLocationRequester;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%@, %@, %@", (uint8_t *)&v13, 0x20u);

  }
  v5 = (RTVisitSCIStayCluster *)objc_opt_new();
  workingHypothesis = self->_workingHypothesis;
  self->_workingHypothesis = v5;

  delayedLocationRequester = self->_delayedLocationRequester;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDelayedLocationRequester updateFireDate:](delayedLocationRequester, "updateFireDate:", v8);

}

- (void)exitFromWorkingHypothesis
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  RTVisitSCIStayCluster *workingHypothesis;
  char *v10;
  RTVisitSCIStayCluster *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  RTVisitSCIStayCluster *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = -[RTVisitSCIStayCluster numOfOutliers](self->_workingHypothesis, "numOfOutliers");
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    workingHypothesis = self->_workingHypothesis;
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = (unint64_t)v8;
    v14 = 2112;
    v15 = workingHypothesis;
    v16 = 2112;
    v17 = v10;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@, exit from working hypothesis, %@, %@", (uint8_t *)&v12, 0x20u);

  }
  -[RTVisitPipelineModuleSCI handleFSM:point:](self, "handleFSM:point:", 5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    -[RTVisitPipelineModuleSCI processPoints:](self, "processPoints:", v6);
  if (v4 && v4 <= -[RTVisitSCIStayCluster numOfOutliers](self->_workingHypothesis, "numOfOutliers"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = self->_workingHypothesis;
      v12 = 134218754;
      v13 = v4;
      v14 = 2112;
      v15 = v11;
      v16 = 2080;
      v17 = "-[RTVisitPipelineModuleSCI exitFromWorkingHypothesis]";
      v18 = 1024;
      v19 = 207;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "outliers number is increasing. before, %lu, current working hypothesis, %@ (in %s:%d)", (uint8_t *)&v12, 0x26u);
    }

  }
}

- (void)processContextOnGeofenceEntry
{
  -[RTVisitPipelineModuleSCI processContextChangeWithSource:](self, "processContextChangeWithSource:", 9);
}

- (void)refreshCachedHintOfSource:(int64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 9) > 1)
  {
    if ((unint64_t)(a3 - 7) > 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D183A0], "hintSourceToString:", a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412802;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, no cache to refresh for hint source %@, %@", (uint8_t *)&v10, 0x20u);

      }
    }
    else
    {
      -[RTVisitPipelineModuleSCI refreshLatestGeofenceHintCache](self, "refreshLatestGeofenceHintCache");
    }
  }
  else
  {
    -[RTVisitPipelineModuleSCI refreshLatestSignificantRegionHintCache](self, "refreshLatestSignificantRegionHintCache");
  }
}

- (id)latestCachedHintOfSource:(int64_t)a3
{
  RTHint *latestSignificantRegionHint;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 9) <= 1)
  {
    latestSignificantRegionHint = self->_latestSignificantRegionHint;
    return latestSignificantRegionHint;
  }
  if ((unint64_t)(a3 - 7) <= 1)
  {
    latestSignificantRegionHint = self->_latestGeofenceHint;
    return latestSignificantRegionHint;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D183A0], "hintSourceToString:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, no cache to retrieve for hint source %@, %@", (uint8_t *)&v12, 0x20u);

  }
  return 0;
}

- (void)processContextChangeWithSource:(int64_t)a3
{
  int64_t v3;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  RTVisitSCIStayCluster *v10;
  RTVisitSCIStayCluster *workingHypothesis;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  RTVisitSCIStayCluster *v30;
  unint64_t v31;
  void *v32;
  RTVisitPipelineModuleSCI *v34;
  RTVisitSCIStayCluster *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  RTVisitSCIStayCluster *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  if (a3 == 7 || a3 == 9)
    goto LABEL_6;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hintSource == RTHintSourceGeoFenceEntry || hintSource == RTHintSourceSignificantRegionEntry", buf, 2u);
  }

  if (v3 == 9)
  {
LABEL_6:
    v6 = -[RTVisitSCIStayCluster numOfOutliers](self->_workingHypothesis, "numOfOutliers");
    -[RTVisitPipelineModuleSCI handleFSM:point:](self, "handleFSM:point:", 6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v8 = objc_claimAutoreleasedReturnValue();
    v34 = self;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D183A0], "hintSourceToString:", v3);
      v10 = (RTVisitSCIStayCluster *)objc_claimAutoreleasedReturnValue();
      workingHypothesis = self->_workingHypothesis;
      objc_msgSend((id)objc_opt_class(), "FSMStateToString:", self->_fsmState);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "LCFSMStateToString:", self->_lcFSMState);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v43 = (unint64_t)v9;
      v44 = 2112;
      v45 = v10;
      v46 = 2112;
      v47 = (const char *)workingHypothesis;
      v48 = 2112;
      v49 = v12;
      v50 = 2112;
      v51 = v13;
      v52 = 2048;
      v53 = v6;
      v54 = 2112;
      v55 = v14;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, entry hint of source, %@, detected. Will exit any existing hypothesis, %@, if not in visit HC FSM inState, %@, LC FSM inState, %@, number points left, %lu, %@", buf, 0x48u);

      self = v34;
    }

    if (objc_msgSend(v7, "count"))
    {
      v31 = v6;
      -[RTVisitPipelineModuleSCI refreshCachedHintOfSource:](self, "refreshCachedHintOfSource:", v3);
      -[RTVisitPipelineModuleSCI latestCachedHintOfSource:](self, "latestCachedHintOfSource:", v3);
      v35 = (RTVisitSCIStayCluster *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v32 = v7;
      obj = v7;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (!v16)
        goto LABEL_23;
      v17 = v16;
      v18 = *(_QWORD *)v38;
      while (1)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v20, "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[RTVisitPipelineModuleSCI isValidLatestRegionHintSource:date:](self, "isValidLatestRegionHintSource:date:", v3, v21))
          {

LABEL_20:
            objc_msgSend(v15, "addObject:", v20);
            continue;
          }
          objc_msgSend(v20, "date");
          v22 = v3;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTVisitSCIStayCluster date](v35, "date");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isBeforeDate:", v24);

          self = v34;
          v3 = v22;

          if (!v25)
            goto LABEL_20;
          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTVisitPipelineModuleSCI stateMachineConfidenceString](v34, "stateMachineConfidenceString");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v43 = (unint64_t)v27;
            v44 = 2112;
            v45 = v35;
            v46 = 2112;
            v47 = (const char *)v20;
            v48 = 2112;
            v49 = v28;
            _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "%@, skipping irrelevant location. hint, %@, is after location, %@, %@", buf, 0x2Au);

            v3 = v22;
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (!v17)
        {
LABEL_23:

          -[RTVisitPipelineModuleSCI processPoints:](self, "processPoints:", v15);
          v6 = v31;
          v7 = v32;
          break;
        }
      }
    }
    if (v6 && v6 <= -[RTVisitSCIStayCluster numOfOutliers](self->_workingHypothesis, "numOfOutliers"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = self->_workingHypothesis;
        *(_DWORD *)buf = 134218754;
        v43 = v6;
        v44 = 2112;
        v45 = v30;
        v46 = 2080;
        v47 = "-[RTVisitPipelineModuleSCI processContextChangeWithSource:]";
        v48 = 1024;
        LODWORD(v49) = 282;
        _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "outliers number is increasing. before, %lu, current working hypothesis, %@ (in %s:%d)", buf, 0x26u);
      }

    }
  }
}

- (id)getHintsNearLocation:(id)a3 withinDistance:(double)a4 sourceFilter:(id)a5 fromDate:(id)a6 limit:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  RTVisitPipelineModuleSCI *v28;
  uint64_t *v29;
  SEL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_alloc(MEMORY[0x1E0D184E0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithStartDate:endDate:", v15, v19);
  v21 = (void *)objc_msgSend(v16, "initWithReferenceLocation:sourceFilter:ascending:distance:dateInterval:limit:batchSize:", v13, v14, 0, v17, v20, a7, a7);

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__147;
  v35 = __Block_byref_object_dispose__147;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[RTHintManager hintStore](self->_hintManager, "hintStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __92__RTVisitPipelineModuleSCI_getHintsNearLocation_withinDistance_sourceFilter_fromDate_limit___block_invoke;
  v26[3] = &unk_1E92A4770;
  v29 = &v31;
  v30 = a2;
  v23 = v13;
  v27 = v23;
  v28 = self;
  objc_msgSend(v22, "enumerateStoredHintsWithOptions:usingBlock:", v21, v26);

  v24 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v24;
}

void __92__RTVisitPipelineModuleSCI_getHintsNearLocation_withinDistance_sourceFilter_fromDate_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v5);
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "count");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    objc_msgSend(*(id *)(a1 + 40), "stateMachineConfidenceString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413570;
    v14 = v8;
    v15 = 2048;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2048;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v12;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, retrieved %ld hints near location, %@, total number of hints retrieved %ld, error %@, %@", (uint8_t *)&v13, 0x3Eu);

  }
}

- (BOOL)isHint:(id)a3 withinDistance:(double)a4 location:(id)a5
{
  id v9;
  id v10;
  RTDistanceCalculator *distanceCalculator;
  void *v12;
  double v13;
  double v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  distanceCalculator = self->_distanceCalculator;
  objc_msgSend(v9, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v10, v12, &v21);
  v14 = v13;
  v15 = v21;

  if (v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v23 = v17;
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v15;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, While Computing distance between location, %@, and hint, %@, an error, %@ was observed, %@", buf, 0x34u);

    }
    v19 = 0;
  }
  else
  {
    v19 = v14 <= a4;
  }

  return v19;
}

- (id)filterHints:(id)a3 existingHints:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v14;
  id obj;
  id v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = v6;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v23;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v18 = 0;
          v19 = &v18;
          v20 = 0x2020000000;
          v21 = 1;
          v17[0] = v10;
          v17[1] = 3221225472;
          v17[2] = __54__RTVisitPipelineModuleSCI_filterHints_existingHints___block_invoke;
          v17[3] = &unk_1E92A4798;
          v17[4] = self;
          v17[5] = v12;
          v17[6] = &v18;
          objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17, v14);
          if (*((_BYTE *)v19 + 24))
            objc_msgSend(v16, "addObject:", v12);
          _Block_object_dispose(&v18, 8);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

  }
  else
  {
    v16 = v6;
  }

  return v16;
}

void __54__RTVisitPipelineModuleSCI_filterHints_existingHints___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "horizontalUncertainty");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "horizontalUncertainty");
  v13 = v10 + v12;
  objc_msgSend(*(id *)(a1 + 40), "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isHint:withinDistance:location:", v7, v14, v13);

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)retrieveNonLOIHintsNearLocation:(id)a3 withinDistance:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 247);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitPipelineModuleSCI relevantDateForHintSource:date:](self, "relevantDateForHintSource:date:", 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)v7;
  -[RTVisitPipelineModuleSCI getHintsNearLocation:withinDistance:sourceFilter:fromDate:limit:](self, "getHintsNearLocation:withinDistance:sourceFilter:fromDate:limit:", v6, v7, v9, 1000, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (((v15 >> (objc_msgSend(v18, "source") + 1)) & 1) == 0)
        {
          v15 |= 1 << (objc_msgSend(v18, "source") + 1);
          objc_msgSend(v11, "addObject:", v18);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  return v11;
}

- (void)populateHintCacheNearLocation:(id)a3 withinDistance:(double)a4
{
  RTLocation *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSArray *v26;
  NSArray *hintCache;
  RTLocation *hintCacheUpdateLocation;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = (RTLocation *)a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDistanceCalculator distanceFromLocation:toLocation:error:](self->_distanceCalculator, "distanceFromLocation:toLocation:error:", v7, self->_hintCacheUpdateLocation, 0);
    v11 = v10;
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138413314;
    v30 = v9;
    v31 = 2112;
    v32 = (uint64_t)v7;
    v33 = 2048;
    v34 = a4;
    v35 = 2048;
    v36 = v11;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, location, %@, distance, %.2f, distance to last cache update, %.2f, %@", (uint8_t *)&v29, 0x34u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitPipelineModuleSCI getHintsNearLocation:withinDistance:sourceFilter:fromDate:limit:](self, "getHintsNearLocation:withinDistance:sourceFilter:fromDate:limit:", v7, v14, 0, 0, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObjectsFromArray:", v15);
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "count");
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138412802;
    v30 = v17;
    v31 = 2048;
    v32 = v18;
    v33 = 2112;
    v34 = *(double *)&v19;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, retrieved LOI hints, %lu, %@", (uint8_t *)&v29, 0x20u);

  }
  if (!self->_useLowConfidence)
  {
    -[RTVisitPipelineModuleSCI retrieveNonLOIHintsNearLocation:withinDistance:](self, "retrieveNonLOIHintsNearLocation:withinDistance:", v7, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSCI filterHints:existingHints:](self, "filterHints:existingHints:", v20, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v21);

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v20, "count");
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412802;
      v30 = v23;
      v31 = 2048;
      v32 = v24;
      v33 = 2112;
      v34 = *(double *)&v25;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, retrieved NON-LOI hints, %lu, %@", (uint8_t *)&v29, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v13);
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
  hintCache = self->_hintCache;
  self->_hintCache = v26;

  hintCacheUpdateLocation = self->_hintCacheUpdateLocation;
  self->_hintCacheUpdateLocation = v7;

}

- (id)hintsNearLocation:(id)a3
{
  id v5;
  RTDistanceCalculator *distanceCalculator;
  RTLocation *hintCacheUpdateLocation;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  RTLocation *v13;
  void *v14;
  NSArray *hintCache;
  NSArray *v16;
  NSArray *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  RTLocation *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  distanceCalculator = self->_distanceCalculator;
  hintCacheUpdateLocation = self->_hintCacheUpdateLocation;
  v19 = 0;
  -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v5, hintCacheUpdateLocation, &v19);
  v9 = v8;
  v10 = v19;
  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_hintCacheUpdateLocation;
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v21 = v12;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, While Computing distance between location, %@, and location, %@, an error, %@ was observed setting distance to 0, %@", buf, 0x34u);

    }
  }
  else
  {
    if (v9 <= 1320.0)
      goto LABEL_7;
    hintCache = self->_hintCache;
    self->_hintCache = 0;

    v11 = self->_hintCacheUpdateLocation;
    self->_hintCacheUpdateLocation = 0;
  }

LABEL_7:
  v16 = self->_hintCache;
  if (!v16)
  {
    -[RTVisitPipelineModuleSCI populateHintCacheNearLocation:withinDistance:](self, "populateHintCacheNearLocation:withinDistance:", v5, 1500.0);
    v16 = self->_hintCache;
  }
  v17 = v16;

  return v17;
}

+ (BOOL)filterHint:(id)a3 sourceFilter:(id)a4 inverseFilter:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v10 = objc_msgSend(v8, "integerValue");
      v11 = ((v10 & (1 << (objc_msgSend(v7, "source") + 1))) != 0) ^ a5;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sourceFilter", v15, 2u);
      }

      v11 = 1;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hint", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (BOOL)isHintConsistentWithLocation:(id)a3 hint:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTDistanceCalculator *distanceCalculator;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    distanceCalculator = self->_distanceCalculator;
    objc_msgSend(v8, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v12 = -[RTDistanceCalculator checkConsistencyBetweenLocation:otherLocation:error:](distanceCalculator, "checkConsistencyBetweenLocation:otherLocation:error:", v11, v7, &v22);
    v13 = v22;

    if (v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v24 = v15;
        v25 = 2112;
        v26 = v9;
        v27 = 2112;
        v28 = v7;
        v29 = 2112;
        v30 = v13;
        v31 = 2112;
        v32 = v16;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, While processing hint, %@, near location, %@, an error, %@ was observed, %@", buf, 0x34u);

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v24 = v19;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = (void *)v20;
      v31 = 2112;
      v32 = v21;
      _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "%@, Processing hint, %@, near location, %@, consistent, %@, %@", buf, 0x34u);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hint", buf, 2u);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)getHintConsistentWithLocation:(id)a3 sourceFilter:(id)a4 inverseFilter:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  void *v18;
  RTDistanceCalculator *distanceCalculator;
  void *v20;
  double v21;
  double v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  unsigned int v30;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v5 = a5;
  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[RTVisitPipelineModuleSCI hintsNearLocation:](self, "hintsNearLocation:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v37;
    v15 = 1.79769313e308;
    v32 = v9;
    v33 = *(_QWORD *)v37;
    v30 = v5;
    v34 = v10;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend((id)objc_opt_class(), "filterHint:sourceFilter:inverseFilter:", v17, v9, v5)
          && -[RTVisitPipelineModuleSCI isHintConsistentWithLocation:hint:](self, "isHintConsistentWithLocation:hint:", v8, v17))
        {
          v18 = v13;
          distanceCalculator = self->_distanceCalculator;
          objc_msgSend(v17, "location");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0;
          -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v8, v20, &v35);
          v22 = v21;
          v23 = v35;

          if (v23)
          {
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v25 = v8;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v41 = v26;
              v42 = 2112;
              v43 = v17;
              v44 = 2112;
              v45 = v25;
              v46 = 2112;
              v47 = v23;
              v48 = 2112;
              v49 = v27;
              _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, While processing hint, %@, near location, %@, an error, %@ was observed, %@", buf, 0x34u);

              v9 = v32;
              v8 = v25;
              v5 = v30;
            }

          }
          v13 = v18;
          if (!v18 || v15 > v22)
          {
            v28 = v17;

            v13 = v28;
            v9 = v32;
            v15 = v22;
          }
          v14 = v33;

          v10 = v34;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)getHintWithinDistance:(double)a3 ofLocation:(id)a4 sourceFilter:(id)a5 inverseFilter:(BOOL)a6
{
  uint64_t v6;
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  RTDistanceCalculator *distanceCalculator;
  void *v20;
  double v21;
  double v22;
  id v23;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  NSObject *v27;
  id v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  __int128 v34;
  const __CFString *v35;
  unsigned int v36;
  id v38;
  id obj;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  double v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v6 = a6;
  v59 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v40 = v10;
  -[RTVisitPipelineModuleSCI hintsNearLocation:](self, "hintsNearLocation:", v10);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
  if (v12)
  {
    v14 = v12;
    v38 = 0;
    v15 = *(_QWORD *)v43;
    v16 = 1.79769313e308;
    *(_QWORD *)&v13 = 138413570;
    v34 = v13;
    v36 = v6;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v17);
        if (objc_msgSend((id)objc_opt_class(), "filterHint:sourceFilter:inverseFilter:", v18, v11, v6))
        {
          distanceCalculator = self->_distanceCalculator;
          objc_msgSend(v18, "location");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0;
          -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v40, v20, &v41);
          v22 = v21;
          v23 = v41;

          if (v23)
          {
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v47 = v25;
              v48 = 2112;
              v49 = v18;
              v50 = 2112;
              v51 = v40;
              v52 = 2112;
              v53 = *(double *)&v23;
              v54 = 2112;
              v55 = v26;
              _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, While processing hint, %@, near location, %@, an error, %@ was observed, %@", buf, 0x34u);

              v6 = v36;
            }

          }
          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = CFSTR("NO");
            if (v22 < a3)
              v30 = CFSTR("YES");
            v35 = v30;
            -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString", v34);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v34;
            v47 = v29;
            v48 = 2112;
            v49 = v18;
            v50 = 2112;
            v51 = v40;
            v52 = 2048;
            v53 = a3;
            v54 = 2112;
            v55 = v35;
            v56 = 2112;
            v57 = v31;
            _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "%@, hint, %@, location, %@, distance %f, nearby, %@, %@", buf, 0x3Eu);

            v6 = v36;
          }

          if (v22 < a3 && (!v38 || v16 > v22))
          {
            v28 = v18;

            v38 = v28;
            v16 = v22;
          }

        }
        ++v17;
      }
      while (v14 != v17);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
      v14 = v32;
    }
    while (v32);
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (BOOL)isHintNearLocation:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v20;
  NSObject *v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitPipelineModuleSCI getHintConsistentWithLocation:sourceFilter:inverseFilter:](self, "getHintConsistentWithLocation:sourceFilter:inverseFilter:", v5, v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSCI getHintWithinDistance:ofLocation:sourceFilter:inverseFilter:](self, "getHintWithinDistance:ofLocation:sourceFilter:inverseFilter:", v5, v12, 0, 180.0);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v13 = objc_claimAutoreleasedReturnValue();
        -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138413058;
        v21 = v13;
        v22 = 2112;
        v23 = v8;
        v24 = 2112;
        v25 = v5;
        v26 = 2112;
        v27 = v14;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, LOI Hint, %@, detected near location, %@, but not consistent, %@", (uint8_t *)&v20, 0x2Au);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitPipelineModuleSCI getHintWithinDistance:ofLocation:sourceFilter:inverseFilter:](self, "getHintWithinDistance:ofLocation:sourceFilter:inverseFilter:", v5, v15, 1, 180.0);
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v17 = objc_claimAutoreleasedReturnValue();
          -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138413058;
          v21 = v17;
          v22 = 2112;
          v23 = v10;
          v24 = 2112;
          v25 = v5;
          v26 = 2112;
          v27 = v18;
          _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, Hint, %@, detected near location, %@, %@", (uint8_t *)&v20, 0x2Au);

        }
        v9 = 1;
        goto LABEL_12;
      }
    }
    v9 = 0;
LABEL_12:

    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413058;
    v21 = v10;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, LOI Hint, %@, detected near location, %@, %@", (uint8_t *)&v20, 0x2Au);

    goto LABEL_12;
  }
LABEL_13:

  return v9;
}

- (double)requiredTimeOutsideClusterForOutlierCount:(unint64_t)a3 location:(id)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;

  v6 = a4;
  v7 = v6;
  v8 = 0.0;
  if (a3 <= 0xF0)
  {
    if (a3 < 4)
    {
      v12 = 0x7FEFFFFFFFFFFFFFLL;
    }
    else
    {
      objc_msgSend(v6, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[RTVisitPipelineModuleSCI isValidLatestRegionHintSource:date:](self, "isValidLatestRegionHintSource:date:", 8, v9)&& !-[RTVisitPipelineModuleSCI isLastRegionHintNearLocation:hintSource:](self, "isLastRegionHintNearLocation:hintSource:", v7, 8))
      {

        goto LABEL_12;
      }
      objc_msgSend(v7, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[RTVisitPipelineModuleSCI isValidLatestRegionHintSource:date:](self, "isValidLatestRegionHintSource:date:", 10, v10))
      {
        v11 = -[RTVisitPipelineModuleSCI isLastRegionHintNearLocation:hintSource:](self, "isLastRegionHintNearLocation:hintSource:", v7, 10);

        if (!v11)
          goto LABEL_12;
      }
      else
      {

      }
      v12 = 0x406E000000000000;
    }
    v8 = *(double *)&v12;
  }
LABEL_12:

  return v8;
}

- (BOOL)isTimeOutsideClusterSatisfiedForOutlierCount:(unint64_t)a3 location:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitSCIStayCluster potentialExit](self->_workingHypothesis, "potentialExit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;

  -[RTVisitPipelineModuleSCI requiredTimeOutsideClusterForOutlierCount:location:](self, "requiredTimeOutsideClusterForOutlierCount:location:", a3, v7);
  v13 = v12;

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 < v13)
      v16 = CFSTR("NO");
    else
      v16 = CFSTR("YES");
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413314;
    v20 = v15;
    v21 = 2048;
    v22 = v13;
    v23 = 2048;
    v24 = v11;
    v25 = 2112;
    v26 = v16;
    v27 = 2112;
    v28 = v17;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, requiredTimeOutsideCluster, %f, timeOutsideCluster, %f, satisified, %@, %@", (uint8_t *)&v19, 0x34u);

  }
  return v11 >= v13;
}

- (double)requiredDwellTimeForLocation:(id)a3
{
  NSDate *v5;
  NSDate *requiredDwellTimeCacheDateToUpdate;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSDate *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDate *v15;
  NSDate *v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  double requiredDwellTimeCache;
  void *v23;
  double v24;
  int v26;
  void *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  NSDate *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (NSDate *)a3;
  requiredDwellTimeCacheDateToUpdate = self->_requiredDwellTimeCacheDateToUpdate;
  -[NSDate date](v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(requiredDwellTimeCacheDateToUpdate) = -[NSDate isBeforeDate:](requiredDwellTimeCacheDateToUpdate, "isBeforeDate:", v7);

  if ((_DWORD)requiredDwellTimeCacheDateToUpdate)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate date](v5, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self->_requiredDwellTimeCacheDateToUpdate;
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138413058;
      v27 = v9;
      v28 = 2112;
      v29 = *(double *)&v10;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, recomputing dwell time, location date, %@, cache time to update, %@, %@", (uint8_t *)&v26, 0x2Au);

    }
    v13 = (void *)MEMORY[0x1E0C99D68];
    -[NSDate date](v5, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateWithTimeInterval:sinceDate:", v14, 1.0);
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v16 = self->_requiredDwellTimeCacheDateToUpdate;
    self->_requiredDwellTimeCacheDateToUpdate = v15;

    -[RTVisitPipelineModuleSCI minStaticIntervalForSLVArrival](self, "minStaticIntervalForSLVArrival");
    v18 = v17;
    if (-[RTVisitPipelineModuleSCI isHintNearLocation:](self, "isHintNearLocation:", v5))
    {
      -[RTVisitPipelineModuleSCI minStaticIntervalForSLVArrivalWithHint](self, "minStaticIntervalForSLVArrivalWithHint");
      v18 = v19;
    }
    if (-[RTVisitPipelineModuleSCI isLastRegionHintNearLocation:hintSource:](self, "isLastRegionHintNearLocation:hintSource:", v5, 9)|| -[RTVisitPipelineModuleSCI isLastRegionHintNearLocation:hintSource:](self, "isLastRegionHintNearLocation:hintSource:", v5, 7))
    {
      v18 = 0.0;
    }
    self->_requiredDwellTimeCache = v18;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    requiredDwellTimeCache = self->_requiredDwellTimeCache;
    -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138413058;
    v27 = v21;
    v28 = 2048;
    v29 = requiredDwellTimeCache;
    v30 = 2112;
    v31 = v5;
    v32 = 2112;
    v33 = v23;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, requiredDwellTime, %f, location, %@, %@", (uint8_t *)&v26, 0x2Au);

  }
  v24 = self->_requiredDwellTimeCache;

  return v24;
}

- (BOOL)isDwellTimeSatisfiedForLocation:(id)a3
{
  RTVisitSCIStayCluster *workingHypothesis;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  workingHypothesis = self->_workingHypothesis;
  v5 = a3;
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitSCIStayCluster dwellTimeIntervalWithDate:](workingHypothesis, "dwellTimeIntervalWithDate:", v6);
  v8 = v7;

  -[RTVisitPipelineModuleSCI requiredDwellTimeForLocation:](self, "requiredDwellTimeForLocation:", v5);
  v10 = v9;

  return v8 >= v10;
}

- (id)getLastHintUsingSourceFilter:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  RTVisitPipelineModuleSCI *v18;
  uint64_t *v19;
  SEL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0D184E0]);
  v7 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithStartDate:endDate:", v8, v9);
  v11 = (void *)objc_msgSend(v6, "initWithReferenceLocation:sourceFilter:ascending:distance:dateInterval:limit:batchSize:", 0, v5, 0, 0, v10, 1, 1);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__147;
  v25 = __Block_byref_object_dispose__147;
  v26 = 0;
  -[RTHintManager hintStore](self->_hintManager, "hintStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__RTVisitPipelineModuleSCI_getLastHintUsingSourceFilter___block_invoke;
  v16[3] = &unk_1E92A4770;
  v19 = &v21;
  v20 = a2;
  v13 = v5;
  v17 = v13;
  v18 = self;
  objc_msgSend(v12, "enumerateStoredHintsWithOptions:usingBlock:", v11, v16);

  v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __57__RTVisitPipelineModuleSCI_getLastHintUsingSourceFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "stateMachineConfidenceString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v8;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, sourceFilter, %@, hint, %@, %@", (uint8_t *)&v12, 0x2Au);

  }
}

- (void)refreshLatestGeofenceHintCache
{
  void *v4;
  RTHint *v5;
  RTHint *latestGeofenceHint;
  NSObject *v7;
  void *v8;
  RTHint *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  RTHint *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_latestGeofenceHintChecked)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 768);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSCI getLastHintUsingSourceFilter:](self, "getLastHintUsingSourceFilter:", v4);
    v5 = (RTHint *)objc_claimAutoreleasedReturnValue();
    latestGeofenceHint = self->_latestGeofenceHint;
    self->_latestGeofenceHint = v5;

    self->_latestGeofenceHintChecked = 1;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_latestGeofenceHint;
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, lastGeofenceHint, %@, %@", (uint8_t *)&v11, 0x20u);

    }
  }
}

- (void)refreshLatestSignificantRegionHintCache
{
  void *v4;
  RTHint *v5;
  RTHint *latestSignificantRegionHint;
  NSObject *v7;
  void *v8;
  RTHint *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  RTHint *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_latestSignificantRegionHintChecked)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3072);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSCI getLastHintUsingSourceFilter:](self, "getLastHintUsingSourceFilter:", v4);
    v5 = (RTHint *)objc_claimAutoreleasedReturnValue();
    latestSignificantRegionHint = self->_latestSignificantRegionHint;
    self->_latestSignificantRegionHint = v5;

    self->_latestSignificantRegionHintChecked = 1;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_latestSignificantRegionHint;
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, latestSignificantRegionHint, %@, %@", (uint8_t *)&v11, 0x20u);

    }
  }
}

- (id)relevantDateForHintSource:(int64_t)a3 date:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;

  v6 = a4;
  if (a3 == 9 || a3 == 7)
  {
    v7 = (void *)MEMORY[0x1E0C99D68];
    -[RTVisitPipelineModuleSCI minStaticIntervalForSLVArrival](self, "minStaticIntervalForSLVArrival");
    v9 = -v8;
    v10 = v7;
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 8)
  {
    v10 = (void *)MEMORY[0x1E0C99D68];
    v9 = -240.0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99D68];
    if (a3 == 1)
    {
      v9 = -43200.0;
    }
    else
    {
      -[RTVisitPipelineModuleSCI minStaticIntervalForSLVArrival](self, "minStaticIntervalForSLVArrival");
      v9 = -v12;
    }
    v10 = v11;
  }
  objc_msgSend(v10, "dateWithTimeInterval:sinceDate:", v6, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isValidLatestRegionHintSource:(int64_t)a3 date:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a4;
  -[RTVisitPipelineModuleSCI refreshCachedHintOfSource:](self, "refreshCachedHintOfSource:", a3);
  -[RTVisitPipelineModuleSCI latestCachedHintOfSource:](self, "latestCachedHintOfSource:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (v9 = (unint64_t)(a3 - 7) < 4, objc_msgSend(v7, "source") != a3))
    v9 = 0;
  -[RTVisitPipelineModuleSCI relevantDateForHintSource:date:](self, "relevantDateForHintSource:date:", a3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isBeforeDate:", v10);

  return v9 & (v12 ^ 1);
}

- (BOOL)isLastRegionHintNearLocation:(id)a3 hintSource:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if ((unint64_t)(a4 - 7) >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hintSource == RTHintSourceGeoFenceEntry || hintSource == RTHintSourceGeoFenceExit || hintSource == RTHintSourceSignificantRegionEntry || hintSource == RTHintSourceSignificantRegionExit", (uint8_t *)&v19, 2u);
    }
    LOBYTE(v11) = 0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    LOBYTE(v11) = 0;
    goto LABEL_11;
  }
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[RTVisitPipelineModuleSCI isValidLatestRegionHintSource:date:](self, "isValidLatestRegionHintSource:date:", a4, v10);

  if (v11)
  {
    -[RTVisitPipelineModuleSCI latestCachedHintOfSource:](self, "latestCachedHintOfSource:", a4);
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = -[RTVisitPipelineModuleSCI isHintConsistentWithLocation:hint:](self, "isHintConsistentWithLocation:hint:", v8, v12);
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D183A0], "hintSourceToString:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      -[RTVisitPipelineModuleSCI stateMachineConfidenceString](self, "stateMachineConfidenceString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413570;
      v20 = v15;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "%@, location, %@, hintSource, %@, lastRegionHint, %@, consistent, %@, %@", (uint8_t *)&v19, 0x3Eu);

    }
LABEL_9:

  }
LABEL_11:

  return v11;
}

- (RTVisitSCIStayCluster)workingHypothesis
{
  return self->_workingHypothesis;
}

- (unint64_t)fsmState
{
  return self->_fsmState;
}

- (unint64_t)lcFSMState
{
  return self->_lcFSMState;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDelayedLocationRequester)delayedLocationRequester
{
  return self->_delayedLocationRequester;
}

- (void)setDelayedLocationRequester:(id)a3
{
  objc_storeStrong((id *)&self->_delayedLocationRequester, a3);
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
  objc_storeStrong((id *)&self->_hintManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RTVisitHyperParameter)hyperParameter
{
  return self->_hyperParameter;
}

- (void)setHyperParameter:(id)a3
{
  objc_storeStrong((id *)&self->_hyperParameter, a3);
}

- (BOOL)latestGeofenceHintChecked
{
  return self->_latestGeofenceHintChecked;
}

- (void)setLatestGeofenceHintChecked:(BOOL)a3
{
  self->_latestGeofenceHintChecked = a3;
}

- (RTHint)latestGeofenceHint
{
  return self->_latestGeofenceHint;
}

- (void)setLatestGeofenceHint:(id)a3
{
  objc_storeStrong((id *)&self->_latestGeofenceHint, a3);
}

- (BOOL)latestSignificantRegionHintChecked
{
  return self->_latestSignificantRegionHintChecked;
}

- (void)setLatestSignificantRegionHintChecked:(BOOL)a3
{
  self->_latestSignificantRegionHintChecked = a3;
}

- (RTHint)latestSignificantRegionHint
{
  return self->_latestSignificantRegionHint;
}

- (void)setLatestSignificantRegionHint:(id)a3
{
  objc_storeStrong((id *)&self->_latestSignificantRegionHint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSignificantRegionHint, 0);
  objc_storeStrong((id *)&self->_latestGeofenceHint, 0);
  objc_storeStrong((id *)&self->_hyperParameter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_delayedLocationRequester, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_workingHypothesis, 0);
  objc_storeStrong((id *)&self->_requiredDwellTimeCacheDateToUpdate, 0);
  objc_storeStrong((id *)&self->_hintCacheUpdateLocation, 0);
  objc_storeStrong((id *)&self->_hintCache, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_lastPointProcessed, 0);
  objc_storeStrong((id *)&self->_clusters, 0);
}

@end
