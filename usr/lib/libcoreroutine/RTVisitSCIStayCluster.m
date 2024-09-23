@implementation RTVisitSCIStayCluster

- (unint64_t)numOfResiduePoints
{
  return -[NSMutableArray count](self->_residuePoints, "count");
}

- (NSDate)lastProcessedSample
{
  return self->_lastProcessedSample;
}

- (RTLocation)centroid
{
  return self->_centroid;
}

- (unint64_t)numOfDataPoints
{
  return self->_numOfDataPoints;
}

- (double)getRadiusForDate:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_lastProcessedSampleDateForAdaption);
    if (v7 > 600.0)
    {
      ++self->_numOfAdaptionSample;
      objc_storeStrong((id *)&self->_lastProcessedSampleDateForAdaption, a3);
    }
    +[RTVisitSCIStayCluster evaluateClustThresFromClustThresSlv:motionInducedDev:adaptionBasis:adaptionSampleCnt:adaptionRate:](RTVisitSCIStayCluster, "evaluateClustThresFromClustThresSlv:motionInducedDev:adaptionBasis:adaptionSampleCnt:adaptionRate:", self->_numOfAdaptionSample, 200.0, self->_motionInducedDev_m, 1.4, 10.0);
    v9 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[RTVisitSCIStayCluster getRadiusForDate:]";
      v14 = 1024;
      v15 = 304;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }

    v9 = 200.0;
  }

  return v9;
}

- (void)addNewPoint:(id)a3 event:(unint64_t)a4 lcFSMState:(unint64_t)a5 fsmState:(unint64_t)a6
{
  id v10;
  NSObject *v11;
  NSMutableArray *v12;
  NSMutableArray *outliers;
  NSDate *v14;
  NSDate *lastProcessedSample;
  double v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSMutableArray *residuePoints;
  uint64_t v22;
  NSObject *v23;
  double v24;
  double v25;
  double numOfDataPoints;
  double meanOfSquaredLat_deg;
  double v28;
  double meanOfSquaredLon_deg;
  double v30;
  double v31;
  double v32;
  double v33;
  __complex_double v34;
  double v35;
  NSObject *v36;
  double v37;
  NSObject *v38;
  double v39;
  double v40;
  RTLocation *v41;
  RTLocation *centroid;
  double v43;
  double v44;
  double v45;
  NSObject *v46;
  const char *v47;
  const char *v48;
  RTLocation *v49;
  NSDate *potentialEntry;
  NSDate *potentialExit;
  int v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  uint64_t v62;
  __complex_double v63;
  __complex_double v64;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (self->_numOfDataPoints != -1)
    goto LABEL_5;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v52 = 136315394;
    v53 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
    v54 = 1024;
    LODWORD(v55) = 219;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "_numOfDataPoints hit max value? (in %s:%d)", (uint8_t *)&v52, 0x12u);
  }

  if (self->_numOfDataPoints != -1)
  {
LABEL_5:
    if (v10)
    {
      if (-[NSMutableArray count](self->_outliers, "count"))
      {
        -[NSMutableArray addObjectsFromArray:](self->_residuePoints, "addObjectsFromArray:", self->_outliers);
        v12 = (NSMutableArray *)objc_opt_new();
        outliers = self->_outliers;
        self->_outliers = v12;

      }
      objc_msgSend(v10, "date");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastProcessedSample = self->_lastProcessedSample;
      self->_lastProcessedSample = v14;

      if (self->_numOfDataPoints)
      {
        -[RTLocation latitude](self->_centroid, "latitude");
        v17 = v16;
      }
      else
      {
        if (self->_potentialEntry)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            potentialEntry = self->_potentialEntry;
            v52 = 138412802;
            v53 = (const char *)potentialEntry;
            v54 = 2080;
            v55 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
            v56 = 1024;
            LODWORD(v57) = 235;
            _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "when n_point = 0, _potentialEntry, %@ (in %s:%d)", (uint8_t *)&v52, 0x1Cu);
          }

        }
        if (self->_potentialExit)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            potentialExit = self->_potentialExit;
            v52 = 138412802;
            v53 = (const char *)potentialExit;
            v54 = 2080;
            v55 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
            v56 = 1024;
            LODWORD(v57) = 236;
            _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "when n_point = 0, _potentialExit, %@ (in %s:%d)", (uint8_t *)&v52, 0x1Cu);
          }

        }
        objc_storeStrong((id *)&self->_potentialEntry, self->_lastProcessedSample);
        v17 = 0.0;
      }
      objc_storeStrong((id *)&self->_potentialExit, self->_lastProcessedSample);
      residuePoints = self->_residuePoints;
      ++self->_numOfDataPoints;
      -[NSMutableArray addObject:](residuePoints, "addObject:", v10);
      v22 = -[NSMutableArray count](self->_residuePoints, "count") - 5000;
      if (v22 >= 0 && !(v22 % 0x64uLL))
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          v52 = 134218752;
          v53 = (const char *)v22;
          v54 = 2048;
          v55 = (const char *)a4;
          v56 = 2048;
          v57 = a6;
          v58 = 2048;
          v59 = (const char *)a5;
          _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Exceeded allowable cached locations count by %ld in SCI, event: %lu, fsmState: %lu, lcFSMState: %lu", (uint8_t *)&v52, 0x2Au);
        }

      }
      objc_msgSend(v10, "latitude");
      v25 = v24 - v17;
      numOfDataPoints = (double)self->_numOfDataPoints;
      meanOfSquaredLat_deg = self->_meanOfSquaredLat_deg;
      objc_msgSend(v10, "latitude");
      meanOfSquaredLon_deg = self->_meanOfSquaredLon_deg;
      self->_meanOfSquaredLat_deg = meanOfSquaredLat_deg
                                  + (v28 * v28 - self->_meanOfSquaredLat_deg) / (double)self->_numOfDataPoints;
      objc_msgSend(v10, "longitude");
      self->_meanOfSquaredLon_deg = meanOfSquaredLon_deg
                                  + (v30 * v30 - self->_meanOfSquaredLon_deg) / (double)self->_numOfDataPoints;
      objc_msgSend(v10, "longitude");
      v32 = v31 * 3.14159265 / 180.0;
      v63.c[0] = v32 * 0.0;
      v63.c[1] = v32 + 0.0;
      v33 = v25 / numOfDataPoints;
      v34 = cexp(v63);
      v64.c[0] = *(double *)self->_sumOfVectorLon + v34.c[0];
      v64.c[1] = v34.c[1] + *(double *)&self->_sumOfVectorLon[8];
      *(__complex_double *)self->_sumOfVectorLon = v64;
      v35 = carg(v64) * 180.0 / 3.14159265;
      if (v35 < -180.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v52 = 134218498;
          v53 = *(const char **)&v35;
          v54 = 2080;
          v55 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
          v56 = 1024;
          LODWORD(v57) = 260;
          _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "mean longitude is out of range, >=max, lon_deg, %.7f (in %s:%d)", (uint8_t *)&v52, 0x1Cu);
        }

      }
      v37 = v17 + v33;
      if (v35 > 180.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v52 = 134218498;
          v53 = *(const char **)&v35;
          v54 = 2080;
          v55 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
          v56 = 1024;
          LODWORD(v57) = 261;
          _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "mean longitude is out of range, <=min, lon_deg, %.7f (in %s:%d)", (uint8_t *)&v52, 0x1Cu);
        }

      }
      +[RTVisitSCIStayCluster evaluateMotionInducedDeviationFromMeanLat:meanOfSquaredLat_deg:meanLon_deg:meanOfSquaredLon_deg:](RTVisitSCIStayCluster, "evaluateMotionInducedDeviationFromMeanLat:meanOfSquaredLat_deg:meanLon_deg:meanOfSquaredLon_deg:", v37, self->_meanOfSquaredLat_deg, v35, self->_meanOfSquaredLon_deg);
      self->_motionInducedDev_m = fmin(v39, 100.0);
      +[RTVisitSCIStayCluster evalMaxUncFromMotionDevMotionInducedDev:andMeasInducedDev:](RTVisitSCIStayCluster, "evalMaxUncFromMotionDevMotionInducedDev:andMeasInducedDev:", 200.0 / sqrt((double)self->_numOfDataPoints));
      v41 = (RTLocation *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, objc_msgSend(v10, "referenceFrame"), v37, v35, v40);
      centroid = self->_centroid;
      self->_centroid = v41;

      if (self->_numOfDataPoints == 1)
        objc_storeStrong((id *)&self->_lastProcessedSampleDateForAdaption, self->_lastProcessedSample);
      objc_msgSend(v10, "latitude");
      objc_msgSend(v10, "longitude");
      -[RTLocation latitude](self->_centroid, "latitude");
      -[RTLocation longitude](self->_centroid, "longitude");
      RTCommonCalculateDistance();
      v44 = v43;
      +[RTVisitSCIStayCluster evaluateClustThresFromClustThresSlv:motionInducedDev:adaptionBasis:adaptionSampleCnt:adaptionRate:](RTVisitSCIStayCluster, "evaluateClustThresFromClustThresSlv:motionInducedDev:adaptionBasis:adaptionSampleCnt:adaptionRate:", self->_numOfAdaptionSample, 200.0, self->_motionInducedDev_m, 1.4, 10.0);
      if (v44 >= v45)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = *(const char **)self->_sumOfVectorLon;
          v48 = *(const char **)&self->_sumOfVectorLon[8];
          v49 = self->_centroid;
          v52 = 134219010;
          v53 = v47;
          v54 = 2048;
          v55 = v48;
          v56 = 2112;
          v57 = (unint64_t)v49;
          v58 = 2080;
          v59 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
          v60 = 1024;
          v61 = 281;
          _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "centroid computation is incorrect sum vector is, %f + %fi, centroid, %@ (in %s:%d)", (uint8_t *)&v52, 0x30u);
        }

      }
      -[RTVisitSCIStayCluster updateLastTrustedLocation:](self, "updateLastTrustedLocation:", v10);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v52 = 136315394;
        v53 = "-[RTVisitSCIStayCluster addNewPoint:event:lcFSMState:fsmState:]";
        v54 = 1024;
        LODWORD(v55) = 223;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: point (in %s:%d)", (uint8_t *)&v52, 0x12u);
      }

    }
  }

}

+ (double)evaluateClustThresFromClustThresSlv:(double)result motionInducedDev:(double)a4 adaptionBasis:(double)a5 adaptionSampleCnt:(int64_t)a6 adaptionRate:(double)a7
{
  double v7;
  double v8;
  long double v9;

  v7 = result;
  if (a7 > 0.0)
  {
    v8 = fmin(a4, 100.0);
    v9 = pow(a5, -(double)a6 / a7);
    return v8 * 1.65 * (1.0 - v9) + v7 * 0.5 * (v9 + 1.0);
  }
  return result;
}

- (void)updateLastTrustedLocation:(id)a3
{
  id v5;
  double v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "horizontalUncertainty");
    v5 = v7;
    if (v6 <= 250.0)
    {
      objc_storeStrong((id *)&self->_lastTrustedLocation, a3);
      v5 = v7;
    }
  }

}

+ (double)evaluateMotionInducedDeviationFromMeanLat:(double)a3 meanOfSquaredLat_deg:(double)a4 meanLon_deg:(double)a5 meanOfSquaredLon_deg:(double)a6
{
  double result;

  RTCommonCalculateDistance();
  return result;
}

+ (double)evalMaxUncFromMotionDevMotionInducedDev:(double)a3 andMeasInducedDev:(double)a4
{
  double result;

  result = a3 + a4;
  if (result > 200.0 || result < 0.0)
    return 200.0;
  return result;
}

- (unint64_t)numOfOutliers
{
  return -[NSMutableArray count](self->_outliers, "count");
}

- (id)createVisit:(int64_t)a3 confidence:(double)a4
{
  NSObject *v7;
  NSObject *v8;
  NSDate *potentialExit;
  NSDate *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  RTVisitLocationPoints *v15;
  NSMutableArray *v16;
  NSMutableArray *residuePoints;
  uint64_t v18;
  unint64_t v19;
  NSObject *v20;
  uint64_t v21;
  RTVisitCluster *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  RTVisitSCIStayCluster *v32;
  NSDate *v33;
  RTVisitSCIStayCluster *v35;
  NSDate *v36;
  RTVisitSCIStayCluster *v37;
  uint8_t buf[4];
  RTVisitSCIStayCluster *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!self->_numOfDataPoints)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = (RTVisitSCIStayCluster *)"-[RTVisitSCIStayCluster createVisit:confidence:]";
      v40 = 1024;
      LODWORD(v41) = 179;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "zero points (in %s:%d)", buf, 0x12u);
    }

    if (!self->_numOfDataPoints)
    {
      v22 = 0;
      return v22;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v39 = self;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "working hypothesis, %@", buf, 0xCu);
  }

  if (a3 == 3)
    potentialExit = self->_potentialExit;
  else
    potentialExit = 0;
  v10 = potentialExit;
  v11 = objc_alloc(MEMORY[0x1E0D18578]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitSCIStayCluster centroidForVisitType:confidence:](self, "centroidForVisitType:confidence:", a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v12, a3, v13, self->_potentialEntry, v10, self->_numOfDataPoints, a4, 0);

  if (-[NSMutableArray count](self->_residuePoints, "count"))
  {
    v15 = -[RTVisitLocationPoints initWithLocations:]([RTVisitLocationPoints alloc], "initWithLocations:", self->_residuePoints);
    v16 = (NSMutableArray *)objc_opt_new();
    residuePoints = self->_residuePoints;
    self->_residuePoints = v16;

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v14, "exit");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18 | (unint64_t)v15;

  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = (RTVisitSCIStayCluster *)"-[RTVisitSCIStayCluster createVisit:confidence:]";
      v40 = 1024;
      LODWORD(v41) = 198;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit.exit || points (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v14, "exit");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (RTVisitCluster *)(v21 | (unint64_t)v15);

  if (v22)
  {
    v22 = -[RTVisitCluster initWithPoints:visit:]([RTVisitCluster alloc], "initWithPoints:visit:", v15, v14);
    -[RTVisitCluster visit](v22, "visit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "entry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToDate:", self->_potentialEntry);

    if ((v25 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "entry");
        v35 = (RTVisitSCIStayCluster *)objc_claimAutoreleasedReturnValue();
        v36 = self->_potentialExit;
        *(_DWORD *)buf = 138413058;
        v39 = v35;
        v40 = 2112;
        v41 = (const char *)v36;
        v42 = 2080;
        v43 = "-[RTVisitSCIStayCluster createVisit:confidence:]";
        v44 = 1024;
        v45 = 204;
        _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "visit.entry, %@, not equal to _potentialEntry, %@ (in %s:%d)", buf, 0x26u);

      }
    }
    -[RTVisitCluster visit](v22, "visit");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "exit");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a3 == 3)
    {
      v30 = objc_msgSend(v28, "isEqualToDate:", self->_potentialExit);

      if ((v30 & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "exit");
          v32 = (RTVisitSCIStayCluster *)objc_claimAutoreleasedReturnValue();
          v33 = self->_potentialExit;
          *(_DWORD *)buf = 138413058;
          v39 = v32;
          v40 = 2112;
          v41 = (const char *)v33;
          v42 = 2080;
          v43 = "-[RTVisitSCIStayCluster createVisit:confidence:]";
          v44 = 1024;
          v45 = 207;
          _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "exit visit with visit.exit, %@, not equal to _potentialExit, %@ (in %s:%d)", buf, 0x26u);

        }
LABEL_29:

      }
    }
    else
    {

      if (v29)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          -[RTVisitCluster visit](v22, "visit");
          v37 = (RTVisitSCIStayCluster *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v39 = v37;
          v40 = 2080;
          v41 = "-[RTVisitSCIStayCluster createVisit:confidence:]";
          v42 = 1024;
          LODWORD(v43) = 209;
          _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "entry visit has valid exit, %@ (in %s:%d)", buf, 0x1Cu);

        }
        goto LABEL_29;
      }
    }
  }

  return v22;
}

- (id)centroidForVisitType:(int64_t)a3 confidence:(double)a4
{
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  RTLocation *v18;
  const __CFString *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unint64_t numOfDataPoints;
  RTLocation *centroid;
  RTLocation *lastTrustedLocation;
  uint64_t v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  RTLocation *v39;
  __int16 v40;
  RTLocation *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[RTLocation date](self->_lastTrustedLocation, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitSCIStayCluster dwellTimeIntervalWithDate:](self, "dwellTimeIntervalWithDate:", v8);
  v10 = v9;

  if (self->_lastTrustedLocation)
    v11 = v10 > 480.0;
  else
    v11 = 1;
  if (v11)
  {
    v18 = self->_centroid;
    v19 = CFSTR("Weighted Average");
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0D183B0]);
    -[RTLocation latitude](self->_lastTrustedLocation, "latitude");
    v14 = v13;
    -[RTLocation longitude](self->_lastTrustedLocation, "longitude");
    v16 = v15;
    -[RTLocation horizontalUncertainty](self->_lastTrustedLocation, "horizontalUncertainty");
    v18 = (RTLocation *)objc_msgSend(v12, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, -[RTLocation referenceFrame](self->_lastTrustedLocation, "referenceFrame"), v14, v16, v17);
    v19 = CFSTR("Last Trusted Location");
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D18578], "stringFromVisitIncidentType:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    numOfDataPoints = self->_numOfDataPoints;
    centroid = self->_centroid;
    lastTrustedLocation = self->_lastTrustedLocation;
    -[RTLocation distanceFromLocation:locationShifter:error:](lastTrustedLocation, "distanceFromLocation:locationShifter:error:", centroid, self->_locationShifter, 0);
    v28 = 138414338;
    v29 = v21;
    v30 = 2112;
    v31 = v22;
    v32 = 2048;
    v33 = a4;
    v34 = 2048;
    v35 = numOfDataPoints;
    v36 = 2048;
    v37 = v10;
    v38 = 2112;
    v39 = centroid;
    v40 = 2112;
    v41 = lastTrustedLocation;
    v42 = 2112;
    v43 = v19;
    v44 = 2048;
    v45 = v26;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, visitType, %@, confidence, %.2f, dataPointCount, %lu, dwellSinceEntry, %.2f, meanCentroid, %@, lastTrustedLocation, %@, algorithmUsedForCentroid, %@, distance between lastTrustedLocation to meanCentroid, %.2f", (uint8_t *)&v28, 0x5Cu);

  }
  return v18;
}

- (double)dwellTimeIntervalWithDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date", v10, 2u);
    }

    goto LABEL_7;
  }
  if (!self->_potentialEntry)
  {
LABEL_7:
    v7 = 0.0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "timeIntervalSinceDate:");
  v7 = v6;
LABEL_8:

  return v7;
}

- (NSDate)potentialEntry
{
  return self->_potentialEntry;
}

- (RTVisitSCIStayCluster)init
{
  RTVisitSCIStayCluster *v2;
  uint64_t v3;
  RTLocationShifter *locationShifter;
  uint64_t v5;
  NSMutableArray *outliers;
  uint64_t v7;
  NSMutableArray *residuePoints;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RTVisitSCIStayCluster;
  v2 = -[RTVisitSCIStayCluster init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    locationShifter = v2->_locationShifter;
    v2->_locationShifter = (RTLocationShifter *)v3;

    v5 = objc_opt_new();
    outliers = v2->_outliers;
    v2->_outliers = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    residuePoints = v2->_residuePoints;
    v2->_residuePoints = (NSMutableArray *)v7;

    v2->_numOfAdaptionSample = 1;
  }
  return v2;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = -[RTVisitSCIStayCluster numOfDataPoints](self, "numOfDataPoints");
  v5 = -[RTVisitSCIStayCluster numOfResiduePoints](self, "numOfResiduePoints");
  v6 = -[RTVisitSCIStayCluster numOfOutliers](self, "numOfOutliers");
  -[RTVisitSCIStayCluster lastTrustedLocation](self, "lastTrustedLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("n_point, %lu, n_residue, %lu, n_outlier, %lu, last_trusted_location, %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_numOfDataPoints)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[NSDate stringFromDate](self->_potentialEntry, "stringFromDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate stringFromDate](self->_potentialExit, "stringFromDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR(", entry, %@, exit, %@, mean, %@, "), v10, v11, self->_centroid);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v12);

  }
  return v8;
}

- (void)addOutlier:(id)a3
{
  id v4;
  void *v5;
  NSDate *v6;
  NSDate *lastProcessedSample;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastProcessedSample = self->_lastProcessedSample;
    self->_lastProcessedSample = v6;

    -[NSMutableArray addObject:](self->_outliers, "addObject:", v5);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[RTVisitSCIStayCluster addOutlier:]";
      v11 = 1024;
      v12 = 294;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: point (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }

  }
}

- (unint64_t)numOfAdaptionSample
{
  return self->_numOfAdaptionSample;
}

- (NSDate)potentialExit
{
  return self->_potentialExit;
}

- (NSMutableArray)outliers
{
  return self->_outliers;
}

- (RTLocation)lastTrustedLocation
{
  return self->_lastTrustedLocation;
}

- (RTLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_lastTrustedLocation, 0);
  objc_storeStrong((id *)&self->_centroid, 0);
  objc_storeStrong((id *)&self->_outliers, 0);
  objc_storeStrong((id *)&self->_lastProcessedSample, 0);
  objc_storeStrong((id *)&self->_potentialExit, 0);
  objc_storeStrong((id *)&self->_potentialEntry, 0);
  objc_storeStrong((id *)&self->_residuePoints, 0);
  objc_storeStrong((id *)&self->_lastProcessedSampleDateForAdaption, 0);
}

@end
