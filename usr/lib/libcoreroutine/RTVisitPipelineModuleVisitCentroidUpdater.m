@implementation RTVisitPipelineModuleVisitCentroidUpdater

- (RTVisitPipelineModuleVisitCentroidUpdater)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithHyperParameter_locationManager_distanceCalculator_);
}

- (RTVisitPipelineModuleVisitCentroidUpdater)initWithHyperParameter:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  RTVisitPipelineModuleVisitCentroidUpdater *v13;
  uint64_t v14;
  unsigned int *v15;
  int v16;
  RTVisitPipelineModuleVisitCentroidUpdater *v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: hyperParameter";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_17;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_16;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_16;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTVisitPipelineModuleVisitCentroidUpdater;
  v13 = -[RTVisitPipelineModuleVisitCentroidUpdater init](&v21, sel_init);
  self = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_hyperParameter, a3);
    v14 = objc_msgSend(v9, "maxNumOfBins");
    self->_binCountsSize = 4 * v14 * objc_msgSend(v9, "maxNumOfBins");
    objc_storeStrong((id *)&self->_distanceCalculator, a5);
    v15 = (unsigned int *)malloc_type_calloc(4 * self->_binCountsSize, 1uLL, 0x6C8926EuLL);
    self->_binCounts = v15;
    if (v15)
    {
      v16 = -[RTVisitHyperParameter maxNumOfBins](self->_hyperParameter, "maxNumOfBins");
      self->_invalidBinIndex = 4 * -[RTVisitHyperParameter maxNumOfBins](self->_hyperParameter, "maxNumOfBins") * v16;
      objc_storeStrong((id *)&self->_locationManager, a4);
      goto LABEL_7;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: _binCounts";
      goto LABEL_16;
    }
LABEL_17:

    v17 = 0;
    goto LABEL_18;
  }
LABEL_7:
  self = self;
  v17 = self;
LABEL_18:

  return v17;
}

- (void)dealloc
{
  unsigned int *binCounts;
  objc_super v4;

  binCounts = self->_binCounts;
  if (binCounts)
    free(binCounts);
  v4.receiver = self;
  v4.super_class = (Class)RTVisitPipelineModuleVisitCentroidUpdater;
  -[RTVisitPipelineModuleVisitCentroidUpdater dealloc](&v4, sel_dealloc);
}

- (void)updateCountFromNorthing:(double)a3 easting:(double)a4
{
  int v7;
  int v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  double v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_binCounts)
  {
    v7 = -[RTVisitHyperParameter maxNumOfBins](self->_hyperParameter, "maxNumOfBins");
    v8 = (int)(a3 / (double)-[RTVisitHyperParameter binSize](self->_hyperParameter, "binSize") + 0.5) + v7;
    v9 = -[RTVisitHyperParameter binSize](self->_hyperParameter, "binSize");
    if ((v8 & 0x80000000) == 0)
    {
      v10 = 2 * v7;
      if (2 * v7 > v8)
      {
        v11 = (int)(a4 / (double)v9 + 0.5) + v7;
        if ((v11 & 0x80000000) == 0 && v10 > v11)
        {
          v12 = -[RTVisitHyperParameter maxNumOfBins](self->_hyperParameter, "maxNumOfBins");
          ++self->_binCounts[v11 + 2 * v8 * v12];
          return;
        }
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134218240;
      v15 = a3;
      v16 = 2048;
      v17 = a4;
      _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "out of range location detected, northing=%f, easting=%f", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _binCounts", (uint8_t *)&v14, 2u);
    }
  }

}

- (unint64_t)modeBinIndex
{
  unsigned int *binCounts;
  unint64_t result;
  unint64_t binCountsSize;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  binCounts = self->_binCounts;
  if (binCounts)
  {
    result = self->_invalidBinIndex;
    binCountsSize = self->_binCountsSize;
    if (binCountsSize)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = binCounts[v6];
        if (v7 < v8)
          result = v6;
        if (v7 <= v8)
          v7 = binCounts[v6];
        ++v6;
      }
      while (binCountsSize != v6);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _binCounts", v10, 2u);
    }

    return self->_invalidBinIndex;
  }
  return result;
}

- (id)modeWithReferenceLocation:(id)a3
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  unint64_t v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v24;
  uint8_t v25[8];
  double v26;
  _BYTE buf[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v9 = "Invalid parameter not satisfying: referenceLocation";
LABEL_20:
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, v9, buf, 2u);
    goto LABEL_12;
  }
  v6 = -[RTVisitPipelineModuleVisitCentroidUpdater modeBinIndex](self, "modeBinIndex");
  if (v6 == self->_invalidBinIndex)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, invalid bin index for the mode", buf, 0xCu);

    }
    goto LABEL_12;
  }
  v10 = v6;
  -[RTVisitHyperParameter maxNumOfBins](self->_hyperParameter, "maxNumOfBins");
  if (v10 < self->_invalidBinIndex)
  {
    -[RTVisitHyperParameter maxNumOfBins](self->_hyperParameter, "maxNumOfBins");
    -[RTVisitHyperParameter maxNumOfBins](self->_hyperParameter, "maxNumOfBins");
    -[RTVisitHyperParameter binSize](self->_hyperParameter, "binSize");
    -[RTVisitHyperParameter binSize](self->_hyperParameter, "binSize");
    v26 = 0.0;
    *(_QWORD *)buf = 0;
    objc_msgSend(v5, "latitude");
    objc_msgSend(v5, "longitude");
    if ((RTCommonConvertLocalFrameToGeodetic() & 1) != 0)
    {
      RTCommonIsCoordinateValid();
      if (v11 != 0.0)
      {
        v12 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend(v5, "horizontalUncertainty");
        v14 = v13;
        objc_msgSend(v5, "altitude");
        v16 = v15;
        objc_msgSend(v5, "verticalUncertainty");
        v18 = v17;
        objc_msgSend(v5, "date");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v5, "referenceFrame");
        objc_msgSend(v5, "speed");
        v22 = (void *)objc_msgSend(v12, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v19, v20, objc_msgSend(v5, "sourceAccuracy"), *(double *)buf, v26, v14, v16, v18, v21);
LABEL_18:

        goto LABEL_13;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
LABEL_17:
        v22 = 0;
        goto LABEL_18;
      }
      *(_WORD *)v25 = 0;
      v24 = "Invalid parameter not satisfying: RTCommonIsCoordinateValid(latitude, longitude)";
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_WORD *)v25 = 0;
      v24 = "Invalid parameter not satisfying: result";
    }
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, v24, v25, 2u);
    goto LABEL_17;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v9 = "Invalid parameter not satisfying: modeBinIndex < _invalidBinIndex";
    goto LABEL_20;
  }
LABEL_12:

  v22 = 0;
LABEL_13:

  return v22;
}

- (id)_updateVisitCentroidBasedOnMode:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  RTVisitCluster *v30;
  RTVisitLocationPoints *v31;
  void *v32;
  void *v33;
  RTVisitLocationPoints *v34;
  NSObject *v35;
  RTVisitCluster *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const char *aSelector;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE buf[12];
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "visit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    aSelector = a2;
    objc_msgSend(v5, "visit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v5, "points");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          *(_QWORD *)buf = 0;
          objc_msgSend(v8, "latitude");
          objc_msgSend(v8, "longitude");
          objc_msgSend(v15, "latitude");
          objc_msgSend(v15, "longitude");
          if (RTCommonConvertGeodeticToLocalFrame())
            -[RTVisitPipelineModuleVisitCentroidUpdater updateCountFromNorthing:easting:](self, "updateCountFromNorthing:easting:", *(double *)buf, 0.0);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v12);
    }

    -[RTVisitPipelineModuleVisitCentroidUpdater modeWithReferenceLocation:](self, "modeWithReferenceLocation:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x1E0D18578]);
      objc_msgSend(v5, "visit");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "date");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visit");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v45, "type");
      objc_msgSend(v5, "visit");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "entry");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visit");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "exit");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visit");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v20, "dataPointCount");
      objc_msgSend(v5, "visit");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "confidence");
      v23 = v22;
      objc_msgSend(v5, "visit");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "placeInference");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v17, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v42, v40, v16, v18, v19, v39, v23, v25);

      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(aSelector);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "visit");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "location");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v27;
        v53 = 2112;
        v54 = v29;
        v55 = 2112;
        v56 = v16;
        _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, visit centroid, %@, updated visit centroid, %@", buf, 0x20u);

      }
      v30 = [RTVisitCluster alloc];
      v31 = [RTVisitLocationPoints alloc];
      objc_msgSend(v5, "points");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "locations");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[RTVisitLocationPoints initWithLocations:](v31, "initWithLocations:", v33);
      v35 = v41;
      v36 = -[RTVisitCluster initWithPoints:visit:](v30, "initWithPoints:visit:", v34, v41);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(aSelector);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v37;
        _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_INFO, "%@， fail to update centroid", buf, 0xCu);

      }
      v36 = 0;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)_updateHorizontalUncertainty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  RTVisitCluster *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t i;
  void *v36;
  id v37;
  void *v38;
  char v39;
  void *v40;
  double v41;
  double v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  NSObject *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  RTVisitCluster *v82;
  void *v83;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  const char *aSelector;
  unint64_t v104;
  void *v105;
  void *v106;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t buf[4];
  void *v118;
  __int16 v119;
  unint64_t v120;
  __int16 v121;
  uint64_t v122;
  __int16 v123;
  double v124;
  __int16 v125;
  id v126;
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "visit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cluster.visit", buf, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v4, "visit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entry");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "visit");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v118 = v23;
      v119 = 2112;
      v120 = (unint64_t)v24;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, incomplete visit, %@", buf, 0x16u);

    }
LABEL_13:
    v22 = 0;
    goto LABEL_46;
  }
  v8 = (void *)v7;
  objc_msgSend(v4, "visit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_11;
  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "visit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateWithTimeInterval:sinceDate:", v13, 900.0);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "visit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "exit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateWithTimeInterval:sinceDate:", v17, -900.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v111 = v18;
  if (objc_msgSend(v18, "isBeforeDate:", v14))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "visit");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v118 = v20;
      v119 = 2112;
      v120 = (unint64_t)v21;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%@, skip horizontal uncertainty update for visit, %@, due to short duration", buf, 0x16u);

    }
    v22 = 0;
    goto LABEL_45;
  }
  objc_msgSend(v4, "visit");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "location");
  v19 = objc_claimAutoreleasedReturnValue();

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v100 = v4;
  objc_msgSend(v4, "points");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "locations");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
  if (!v28)
  {

    v47 = 0;
LABEL_38:
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v118 = v49;
      v119 = 2048;
      v120 = v47;
      _os_log_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_INFO, "%@, skip horizontal uncertainty update due to small number of locations, %lu", buf, 0x16u);

    }
    v22 = 0;
    goto LABEL_44;
  }
  v29 = v28;
  aSelector = a2;
  v104 = 0;
  v30 = *(_QWORD *)v114;
  v31 = 0.0;
  v32 = 0.0;
  v33 = 0.0;
  v34 = 0.0;
  do
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v114 != v30)
        objc_enumerationMutation(v27);
      v36 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
      objc_msgSend(v36, "date");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v37, "isBeforeDate:", v14) & 1) == 0)
      {
        objc_msgSend(v36, "date");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isAfterDate:", v111);

        if ((v39 & 1) != 0)
          continue;
        -[RTVisitPipelineModuleVisitCentroidUpdater distanceCalculator](self, "distanceCalculator");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = 0;
        objc_msgSend(v40, "distanceFromLocation:toLocation:error:", v19, v36, &v112);
        v42 = v41;
        v37 = v112;

        if (v37 || v42 > 250.0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(aSelector);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v118 = v45;
            v119 = 2112;
            v120 = (unint64_t)v36;
            v121 = 2112;
            v122 = (uint64_t)v19;
            v123 = 2048;
            v124 = v42;
            v125 = 2112;
            v126 = v37;
            _os_log_debug_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_DEBUG, "%@, outlier location, %@, reference location, %@, distance, %.2f meters, error, %@", buf, 0x34u);

          }
        }
        else
        {
          -[NSObject latitude](v19, "latitude");
          -[NSObject longitude](v19, "longitude");
          objc_msgSend(v36, "latitude");
          objc_msgSend(v36, "longitude");
          if ((RTCommonConvertGeodeticToLocalFrame() & 1) != 0)
          {
            v34 = v34 + 0.0;
            v33 = v33 + 0.0;
            v32 = v32 + 0.0 * 0.0;
            v31 = v31 + 0.0 * 0.0;
            ++v104;
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(aSelector);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v118 = v46;
              v119 = 2112;
              v120 = (unint64_t)v36;
              v121 = 2112;
              v122 = (uint64_t)v19;
              _os_log_debug_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_DEBUG, "%@, cannot convert to local frame for location, %@, with reference location, %@", buf, 0x20u);

            }
          }
          v37 = 0;
        }
      }

    }
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
  }
  while (v29);

  v47 = v104;
  if (v104 <= 0x3B)
  {
    v4 = v100;
    a2 = aSelector;
    goto LABEL_38;
  }
  v50 = sqrt(vabdd_f64(v32 / (double)v104, v34 / (double)v104 * (v34 / (double)v104)));
  v51 = sqrt(vabdd_f64(v31 / (double)v104, v33 / (double)v104 * (v33 / (double)v104)));
  v52 = sqrt(v51 * v51 + v50 * v50);
  v96 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v100, "visit");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "location");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "latitude");
  v54 = v53;
  objc_msgSend(v100, "visit");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "location");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "longitude");
  v56 = v55;
  objc_msgSend(v100, "visit");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "location");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "altitude");
  v58 = v57;
  objc_msgSend(v100, "visit");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "location");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "verticalUncertainty");
  v60 = v59;
  objc_msgSend(v100, "visit");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "location");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "date");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "visit");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "location");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "referenceFrame");
  objc_msgSend(v100, "visit");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "location");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "speed");
  v67 = v66;
  objc_msgSend(v100, "visit");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "location");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v61, v63, objc_msgSend(v69, "sourceAccuracy"), v54, v56, v52, v58, v60, v67);

  v109 = objc_alloc(MEMORY[0x1E0D18578]);
  objc_msgSend(v100, "visit");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "date");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "visit");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v102, "type");
  objc_msgSend(v100, "visit");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "entry");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "visit");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "exit");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "visit");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v72, "dataPointCount");
  objc_msgSend(v100, "visit");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "confidence");
  v75 = v74;
  objc_msgSend(v100, "visit");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "placeInference");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v97;
  v110 = (void *)objc_msgSend(v109, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v91, v93, v97, v70, v71, v89, v75, v77);

  v4 = v100;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v78 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(aSelector);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "visit");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "location");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v118 = v79;
    v119 = 2112;
    v120 = (unint64_t)v81;
    v121 = 2112;
    v122 = v97;
    _os_log_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_INFO, "%@, visit centroid, %@, updated visit centroid, %@", buf, 0x20u);

  }
  v82 = [RTVisitCluster alloc];
  objc_msgSend(v100, "points");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[RTVisitCluster initWithPoints:visit:](v82, "initWithPoints:visit:", v83, v110);

LABEL_44:
LABEL_45:

LABEL_46:
  return v22;
}

- (id)_updateVisitCentroidBasedOnFilteredLocations:(id)a3 maxHorizontalAccuracy:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  RTVisitCluster *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  char v25;
  double v26;
  double v27;
  dispatch_semaphore_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  dispatch_time_t v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  char v46;
  NSObject *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  id v61;
  double v62;
  double v63;
  NSObject *v64;
  unsigned int v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  int v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  double v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  RTVisitCluster *v110;
  RTVisitLocationPoints *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v116;
  void *v117;
  void *v118;
  NSObject *v119;
  uint64_t v120;
  uint64_t v121;
  id v123;
  uint64_t v124;
  NSObject *log;
  id v126;
  void *v127;
  id v128;
  void *v129;
  void *context;
  void *contexta;
  void *contextb;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  NSObject *dsema;
  dispatch_semaphore_t dsemaa;
  dispatch_semaphore_t dsemab;
  void *v142;
  void *v143;
  uint8_t v144[16];
  double v145;
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _QWORD v151[4];
  NSObject *v152;
  double *v153;
  double *v154;
  double v155;
  double *v156;
  uint64_t v157;
  uint64_t (*v158)(uint64_t, uint64_t);
  void (*v159)(uint64_t);
  id v160;
  double v161;
  id *v162;
  uint64_t v163;
  uint64_t (*v164)(uint64_t, uint64_t);
  void (*v165)(uint64_t);
  id v166;
  _BYTE buf[12];
  __int16 v168;
  void *v169;
  __int16 v170;
  uint64_t v171;
  __int16 v172;
  double v173;
  __int16 v174;
  id v175;
  _BYTE v176[128];
  _QWORD v177[4];

  v177[1] = *MEMORY[0x1E0C80C00];
  v133 = a3;
  objc_msgSend(v133, "visit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cluster.visit", buf, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v133, "visit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "visit");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v20;
      v168 = 2112;
      v169 = v21;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%@, incomplete visit, %@", buf, 0x16u);

    }
LABEL_13:
    v18 = 0;
    goto LABEL_78;
  }
  objc_msgSend(v133, "visit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_11;
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v133, "visit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateWithTimeInterval:sinceDate:", v12, 900.0);
  v119 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v133, "visit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateWithTimeInterval:sinceDate:", v15, -900.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v118, "isBeforeDate:", v119))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "visit");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      v168 = 2112;
      v169 = v17;
      _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_INFO, "%@, skip centroid update for visit, %@, due to short duration", buf, 0x16u);

    }
    v18 = 0;
    goto LABEL_77;
  }
  log = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v119, v118);
  objc_msgSend(v133, "visit");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 200);
  v24 = 0;
  v25 = 1;
  v120 = *MEMORY[0x1E0D18598];
  v121 = *MEMORY[0x1E0CB2D50];
  v26 = 0.0;
  v27 = 0.0;
  do
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:type:", log, 200, 0, 1, a4);
    v161 = 0.0;
    v162 = (id *)&v161;
    v163 = 0x3032000000;
    v164 = __Block_byref_object_copy_;
    v165 = __Block_byref_object_dispose_;
    v166 = 0;
    v155 = 0.0;
    v156 = &v155;
    v157 = 0x3032000000;
    v158 = __Block_byref_object_copy_;
    v159 = __Block_byref_object_dispose_;
    v160 = 0;
    v28 = dispatch_semaphore_create(0);
    -[RTVisitPipelineModuleVisitCentroidUpdater locationManager](self, "locationManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v151[0] = MEMORY[0x1E0C809B0];
    v151[1] = 3221225472;
    v151[2] = __112__RTVisitPipelineModuleVisitCentroidUpdater__updateVisitCentroidBasedOnFilteredLocations_maxHorizontalAccuracy___block_invoke;
    v151[3] = &unk_1E9296EE0;
    v153 = &v161;
    v154 = &v155;
    v30 = v28;
    v152 = v30;
    objc_msgSend(v29, "fetchStoredLocationsWithOptions:handler:", v134, v151);

    dsema = v30;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v32))
      goto LABEL_20;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeIntervalSinceDate:", v31);
    v35 = v34;
    v36 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_122);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "filteredArrayUsingPredicate:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "submitToCoreAnalytics:type:duration:", v40, 1, v35);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v42 = (void *)MEMORY[0x1E0CB35C8];
    v177[0] = v121;
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v177, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", v120, 15, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = objc_retainAutorelease(v44);

      v46 = 0;
    }
    else
    {
LABEL_20:
      v45 = 0;
      v46 = 1;
    }

    v126 = v45;
    if ((v46 & 1) == 0)
      objc_storeStrong(v162 + 5, v45);
    if (v162[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v48 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "visit");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v162[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v48;
        v168 = 2112;
        v169 = v49;
        v170 = 2112;
        v171 = (uint64_t)v50;
        _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "%@, skip centroid update for visit, %@, due to error, %@", buf, 0x20u);

      }
LABEL_56:
      v71 = 1;
      goto LABEL_57;
    }
    if ((v25 & 1) != 0 && (unint64_t)objc_msgSend(*((id *)v156 + 5), "count") <= 0x3B)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v47 = objc_claimAutoreleasedReturnValue();
      v25 = 1;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v51 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "visit");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(*((id *)v156 + 5), "count");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v51;
        v168 = 2112;
        v169 = v52;
        v170 = 2048;
        v171 = v53;
        _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "%@, skip centroid update for visit, %@, due to small number of GPS locations, %lu", buf, 0x20u);

        v25 = 1;
      }
      goto LABEL_56;
    }
    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    v47 = *((id *)v156 + 5);
    v54 = -[NSObject countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v147, v176, 16);
    if (v54)
    {
      v55 = *(_QWORD *)v148;
      while (2)
      {
        v56 = 0;
        do
        {
          if (*(_QWORD *)v148 != v55)
            objc_enumerationMutation(v47);
          v57 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * v56);
          -[RTVisitPipelineModuleVisitCentroidUpdater distanceCalculator](self, "distanceCalculator");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = 0;
          objc_msgSend(v58, "distanceFromLocation:toLocation:error:", v23, v57, &v146);
          v60 = v59;
          v61 = v146;

          if (v61 || v60 > 250.0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              *(_QWORD *)&buf[4] = v66;
              v168 = 2112;
              v169 = v57;
              v170 = 2112;
              v171 = (uint64_t)v23;
              v172 = 2048;
              v173 = v60;
              v174 = 2112;
              v175 = v61;
              _os_log_debug_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_DEBUG, "%@, outlier location, %@, reference location, %@, distance, %.2f meters, error, %@", buf, 0x34u);

            }
          }
          else
          {
            *(_QWORD *)buf = 0;
            v177[0] = 0;
            v145 = 0.0;
            objc_msgSend(v23, "latitude");
            objc_msgSend(v23, "longitude");
            objc_msgSend(v57, "latitude");
            objc_msgSend(v57, "longitude");
            ++v24;
            if ((RTCommonConvertGeodeticToLocalFrame() & 1) == 0)
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v144 = 0;
                _os_log_error_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: result", v144, 2u);
              }

              v25 = 0;
              goto LABEL_56;
            }
            v62 = *(double *)v177;
            v63 = v145;
            if (v24 > 0xC8)
            {
              v65 = RTCommonRandomInt();
              if (v65 <= 0xC7)
                objc_msgSend(v137, "replaceObjectAtIndex:withObject:", v65, v57);
            }
            else
            {
              objc_msgSend(v137, "addObject:", v57);
            }
            v27 = v27 + v62;
            v26 = v26 + v63;
          }
          ++v56;
        }
        while (v54 != v56);
        v54 = -[NSObject countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v147, v176, 16);
        if (v54)
          continue;
        break;
      }
    }

    objc_msgSend(*((id *)v156 + 5), "lastObject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "date");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "dateByAddingTimeInterval:", 1.0);
    v69 = objc_claimAutoreleasedReturnValue();

    -[NSObject endDate](log, "endDate");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*((id *)v156 + 5), "count") && !objc_msgSend(v70, "isBeforeDate:", v69))
    {
      v73 = objc_alloc(MEMORY[0x1E0CB3588]);
      -[NSObject earlierDate:](v69, "earlierDate:", v70);
      v47 = objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "initWithStartDate:endDate:", v47, v70);

      v25 = 0;
      v71 = 0;
      log = v74;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v75;
        _os_log_debug_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_DEBUG, "%@, no more locations to fetch.", buf, 0xCu);

      }
      v25 = 0;
      v71 = 6;
    }
    v118 = v70;
    v119 = v69;
LABEL_57:

    _Block_object_dispose(&v155, 8);
    _Block_object_dispose(&v161, 8);

    objc_autoreleasePoolPop(context);
  }
  while (!v71);
  if (v71 != 6)
  {
LABEL_75:
    v18 = 0;
    goto LABEL_76;
  }
  if (!v24)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v112 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "visit");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v113;
      v168 = 2112;
      v169 = v114;
      _os_log_impl(&dword_1D1A22000, v112, OS_LOG_TYPE_INFO, "%@, skip centroid update for visit, %@, due to no GPS location", buf, 0x16u);

    }
    goto LABEL_75;
  }
  v161 = 0.0;
  v155 = 0.0;
  objc_msgSend(v23, "latitude");
  objc_msgSend(v23, "longitude");
  if (!RTCommonConvertLocalFrameToGeodetic() || (RTCommonIsCoordinateValid(), v76 == 0.0))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "visit");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v116;
      v168 = 2112;
      v169 = v117;
      _os_log_error_impl(&dword_1D1A22000, v95, OS_LOG_TYPE_ERROR, "%@, skip centroid update for visit, %@, due to invalid coordinates", buf, 0x16u);

    }
    v18 = 0;
  }
  else
  {
    v123 = objc_alloc(MEMORY[0x1E0D183B0]);
    v77 = v161;
    v78 = v155;
    objc_msgSend(v133, "visit");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "location");
    dsemaa = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
    -[NSObject horizontalUncertainty](dsemaa, "horizontalUncertainty");
    v80 = v79;
    objc_msgSend(v133, "visit");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "location");
    contexta = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(contexta, "altitude");
    v82 = v81;
    objc_msgSend(v133, "visit");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "location");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "verticalUncertainty");
    v85 = v84;
    objc_msgSend(v133, "visit");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "location");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "date");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "visit");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "location");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "referenceFrame");
    objc_msgSend(v133, "visit");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "location");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "speed");
    v95 = objc_msgSend(v123, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v88, v91, 2, v77, v78, v80, v82, v85, v94);

    v128 = objc_alloc(MEMORY[0x1E0D18578]);
    objc_msgSend(v133, "visit");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "date");
    contextb = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "visit");
    dsemab = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
    v124 = -[NSObject type](dsemab, "type");
    objc_msgSend(v133, "visit");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "entry");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "visit");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "exit");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "visit");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "dataPointCount");
    objc_msgSend(v133, "visit");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "confidence");
    v103 = v102;
    objc_msgSend(v133, "visit");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "placeInference");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = (void *)objc_msgSend(v128, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", contextb, v124, v95, v96, v98, v100, v103, v105);

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "visit");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "location");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v107;
      v168 = 2112;
      v169 = v109;
      v170 = 2112;
      v171 = (uint64_t)v95;
      _os_log_impl(&dword_1D1A22000, v106, OS_LOG_TYPE_INFO, "%@, visit centroid, %@, updated visit centroid, %@", buf, 0x20u);

    }
    v110 = [RTVisitCluster alloc];
    v111 = -[RTVisitLocationPoints initWithLocations:]([RTVisitLocationPoints alloc], "initWithLocations:", v137);
    v18 = -[RTVisitCluster initWithPoints:visit:](v110, "initWithPoints:visit:", v111, v129);

  }
LABEL_76:

LABEL_77:
  v19 = v119;
LABEL_78:

  return v18;
}

void __112__RTVisitPipelineModuleVisitCentroidUpdater__updateVisitCentroidBasedOnFilteredLocations_maxHorizontalAccuracy___block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  _RTMap *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v11 = obj;
  v6 = a2;
  v7 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v6);

  -[_RTMap withBlock:](v7, "withBlock:", &__block_literal_global);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __112__RTVisitPipelineModuleVisitCentroidUpdater__updateVisitCentroidBasedOnFilteredLocations_maxHorizontalAccuracy___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D183B0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithCLLocation:", v3);

  return v4;
}

- (id)process:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int *binCounts;
  void *v37;
  const char *v38;
  void *v40;
  void *v41;
  NSObject *obj;
  RTVisitPipelineModuleVisitCentroidUpdater *v43;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  double v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_binCounts)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
LABEL_37:
      v6 = 0;
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: _binCounts";
LABEL_40:
    _os_log_error_impl(&dword_1D1A22000, obj, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_37;
  }
  if (!objc_msgSend(v4, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: inClusters.count";
    goto LABEL_40;
  }
  v6 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v5;
  v46 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
  if (v46)
  {
    v40 = v5;
    v45 = *(_QWORD *)v50;
    v43 = self;
    v41 = v6;
    while (1)
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v50 != v45)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v54 = v37;
          v55 = 2112;
          v56 = v8;
          _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, working on cluster, %@", buf, 0x16u);

        }
        -[RTVisitPipelineModuleVisitCentroidUpdater _updateHorizontalUncertainty:](self, "_updateHorizontalUncertainty:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (void *)v10;
        else
          v12 = v8;
        -[RTVisitPipelineModuleVisitCentroidUpdater _updateVisitCentroidBasedOnFilteredLocations:maxHorizontalAccuracy:](self, "_updateVisitCentroidBasedOnFilteredLocations:maxHorizontalAccuracy:", v12, 25.0, v40);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v14 = v13;
        else
          v14 = v8;
        -[RTVisitPipelineModuleVisitCentroidUpdater _updateVisitCentroidBasedOnMode:](self, "_updateVisitCentroidBasedOnMode:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[RTVisitPipelineModuleVisitCentroidUpdater distanceCalculator](self, "distanceCalculator");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "visit");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "location");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "visit");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "location");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0;
          objc_msgSend(v16, "distanceFromLocation:toLocation:error:", v18, v20, &v48);
          v22 = v21;
          v47 = v48;

          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "visit");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "location");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "visit");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "location");
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v28;
            *(_DWORD *)buf = 138413826;
            v30 = CFSTR("NO");
            if (v13)
              v30 = CFSTR("YES");
            v54 = v24;
            v55 = 2112;
            v56 = v26;
            v57 = 2112;
            v58 = v28;
            v59 = 2048;
            v60 = v22;
            v61 = 2112;
            v62 = v30;
            v63 = 2112;
            v64 = CFSTR("YES");
            v65 = 2112;
            v66 = v47;
            _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "%@, visit centroid, %@, updated visit centroid, %@, distance, %f, updateBasedOnHighAccurateLocations, %@, updateBasedOnMode, %@, error, %@", buf, 0x48u);

            v6 = v41;
          }

          self = v43;
          if (!v47 && v22 <= 1000.0)
          {
            v31 = v15;
            goto LABEL_28;
          }

        }
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v54 = v33;
          v55 = 2112;
          v56 = v8;
          _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@, did not update cluster, %@", buf, 0x16u);

        }
        v15 = 0;
        v31 = v8;
LABEL_28:
        objc_msgSend(v6, "addObject:", v31);
        objc_msgSend(v8, "visit");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "exit");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          binCounts = self->_binCounts;
          if (binCounts)
            bzero(binCounts, 4 * self->_binCountsSize);
        }

      }
      v46 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
      if (!v46)
      {
        v5 = v40;
        break;
      }
    }
  }
LABEL_38:

  return v6;
}

- (RTVisitHyperParameter)hyperParameter
{
  return self->_hyperParameter;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (unsigned)invalidBinIndex
{
  return self->_invalidBinIndex;
}

- (unsigned)binCounts
{
  return self->_binCounts;
}

- (unint64_t)binCountsSize
{
  return self->_binCountsSize;
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
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_hyperParameter, 0);
}

@end
