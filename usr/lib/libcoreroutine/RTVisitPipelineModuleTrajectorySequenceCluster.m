@implementation RTVisitPipelineModuleTrajectorySequenceCluster

+ (double)normalizeFeature:(double)a3 min:(double)a4 max:(double)a5
{
  if (a3 < a4)
    a3 = a4;
  if (a3 >= a5)
    a3 = a5;
  return -(a4 + a5 - a3 * 2.0) / (a5 - a4);
}

- (RTVisitPipelineModuleTrajectorySequenceCluster)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithVisitTrajectorySequenceClassifier_hyperParameter_);
}

- (RTVisitPipelineModuleTrajectorySequenceCluster)initWithVisitTrajectorySequenceClassifier:(id)a3 hyperParameter:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTVisitPipelineModuleTrajectorySequenceCluster *v10;
  RTVisitPipelineModuleTrajectorySequenceCluster *v11;
  RTVisitDecoder *v12;
  RTVisitDecoder *decoder;
  RTVisitPipelineModuleTrajectorySequenceCluster *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: trajectorySequenceClassifier";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: hyperParameter";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTVisitPipelineModuleTrajectorySequenceCluster;
  v10 = -[RTVisitPipelineModuleTrajectorySequenceCluster init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_trajectorySequenceClassifier, a3);
    objc_storeStrong((id *)&v11->_hyperParameter, a4);
    v12 = -[RTVisitDecoder initWithHyperParameter:]([RTVisitDecoder alloc], "initWithHyperParameter:", v9);
    decoder = v11->_decoder;
    v11->_decoder = v12;

  }
  self = v11;
  v14 = self;
LABEL_10:

  return v14;
}

- (unint64_t)numLocationsFrom:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if (!a3)
    return 0;
  v4 = a3 - 1;
  v5 = -[RTVisitHyperParameter stride](self->_hyperParameter, "stride");
  v6 = -[RTVisitHyperParameter referenceSize](self->_hyperParameter, "referenceSize") + v5 * v4;
  return v6 + -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize");
}

- (unint64_t)sequenceLengthFrom:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;

  v5 = -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize");
  v6 = -[RTVisitHyperParameter referenceSize](self->_hyperParameter, "referenceSize") + v5;
  v7 = a3 >= v6;
  v8 = a3 - v6;
  if (v7)
    return v8 / -[RTVisitHyperParameter stride](self->_hyperParameter, "stride") + 1;
  else
    return 0;
}

- (unint64_t)startLocationIndex:(unint64_t)a3
{
  unint64_t v5;

  v5 = -[RTVisitHyperParameter referenceSize](self->_hyperParameter, "referenceSize");
  return v5 + -[RTVisitHyperParameter stride](self->_hyperParameter, "stride") * a3;
}

- (unint64_t)sequenceIndexFromDate:(id)a3 firstTimeStepDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  unint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  __int16 v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v10 = 0;
      goto LABEL_8;
    }
    v16 = 0;
    v12 = "Invalid parameter not satisfying: firstTimeStepDate";
    v13 = (uint8_t *)&v16;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_7;
  }
  if ((objc_msgSend(v7, "isOnOrBefore:", v6) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v15 = 0;
    v12 = "Invalid parameter not satisfying: [firstTimeStepDate isOnOrBefore:date]";
    v13 = (uint8_t *)&v15;
    goto LABEL_10;
  }
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = (unint64_t)(v9 / (double)-[RTVisitHyperParameter windowInterval](self->_hyperParameter, "windowInterval"));
LABEL_8:

  return v10;
}

- (double)computeRadiusFromCumSumNorthings:(const double *)a3 cumSumEastings:(const double *)a4 cumSumSquaredNorthings:(const double *)a5 cumSumSuaredEastings:(const double *)a6 firstLocationIndex:(unint64_t)a7 lastLocationIndex:(unint64_t)a8
{
  unint64_t v8;
  double v9;
  NSObject *v11;
  uint8_t v12[16];

  if (a8 <= a7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: firstLocationIndex < lastLocationIndex", v12, 2u);
    }

    return 0.0;
  }
  else
  {
    v9 = a3[a8] - a3[a7];
    v8 = a8 - a7;
    return sqrt(vabdd_f64((a5[a8] - a5[a7] + a6[a8] - a6[a7]) / (double)v8, (v9 * v9 + (a4[a8] - a4[a7]) * (a4[a8] - a4[a7])) / ((double)v8 * (double)v8)));
  }
}

- (float)computeFeatureVectorFromLocalFramesNumOfLocations:(unint64_t)a3 northings:(const double *)a4 eastings:(const double *)a5 sequenceLength:(unint64_t)a6
{
  unint64_t v9;
  unint64_t v11;
  size_t v12;
  double *v13;
  double *v14;
  double *v15;
  double *v16;
  double *v17;
  void *v18;
  void *v19;
  double *v20;
  double *v21;
  double *v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v34;
  unint64_t v35;
  uint8_t v36[16];
  uint8_t v37[16];
  uint8_t buf[16];

  if (a6)
  {
    v9 = a3;
    v11 = a3 + 1;
    v12 = 8 * (a3 + 1);
    v13 = (double *)malloc_type_malloc(v12, 0x100004000313F17uLL);
    v14 = (double *)malloc_type_malloc(v12, 0x100004000313F17uLL);
    v15 = (double *)malloc_type_malloc(v12, 0x100004000313F17uLL);
    v16 = (double *)malloc_type_malloc(v12, 0x100004000313F17uLL);
    v17 = v16;
    if (v13 && v14 && v15 && v16)
    {
      v35 = v11;
      v18 = malloc_type_malloc(4 * a6 * -[RTVisitHyperParameter featureDimension](self->_hyperParameter, "featureDimension"), 0x100004052888210uLL);
      if (!v18)
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v36 = 0;
          _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "fail to allocate feature vector", v36, 2u);
        }

        goto LABEL_28;
      }
      v19 = v18;
      *v13 = 0.0;
      *v14 = 0.0;
      *v15 = 0.0;
      *v17 = 0.0;
      if (v9)
      {
        v20 = v17 + 1;
        v21 = v15 + 1;
        v22 = v14 + 1;
        v23 = v13 + 1;
        v24 = 0.0;
        v25 = 0.0;
        v26 = 0.0;
        v27 = 0.0;
        do
        {
          v28 = *a4++;
          v29 = v28;
          v27 = v27 + v28;
          v30 = *a5++;
          v26 = v26 + v30;
          v25 = v25 + v29 * v29;
          *v23++ = v27;
          *v22++ = v26;
          v24 = v24 + v30 * v30;
          *v21++ = v25;
          *v20++ = v24;
          --v9;
        }
        while (v9);
      }
      if (!-[RTVisitPipelineModuleTrajectorySequenceCluster computeFeatureVector:cumSumNumLocations:cumSumNorthings:cumSumEastings:cumSumSquaredNorthings:cumSumSquaredEastings:sequenceLength:](self, "computeFeatureVector:cumSumNumLocations:cumSumNorthings:cumSumEastings:cumSumSquaredNorthings:cumSumSquaredEastings:sequenceLength:", v18, v35, v13, v14, v15, v17, a6))
      {
        free(v19);
LABEL_28:
        v19 = 0;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v37 = 0;
        _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "fail to allocate cumsum arrays", v37, 2u);
      }

      v19 = 0;
      if (!v13)
      {
        if (!v14)
        {
LABEL_20:
          if (v15)
            free(v15);
          if (v17)
            free(v17);
          return (float *)v19;
        }
LABEL_19:
        free(v14);
        goto LABEL_20;
      }
    }
    free(v13);
    if (!v14)
      goto LABEL_20;
    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: 0<sequenceLength", buf, 2u);
  }

  return 0;
}

- (BOOL)computeFeatureVector:(float *)a3 cumSumNumLocations:(unint64_t)a4 cumSumNorthings:(double *)a5 cumSumEastings:(double *)a6 cumSumSquaredNorthings:(double *)a7 cumSumSquaredEastings:(double *)a8 sequenceLength:(unint64_t)a9
{
  double *v10;
  double *v11;
  NSObject *v13;
  const char *v14;
  BOOL v15;
  BOOL v16;
  float *v18;
  long double v20;
  double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  unint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  float v49;
  double v50;
  float v51;
  double v52;
  unint64_t v53;
  unint64_t v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  const char *v74;
  unint64_t v75;
  unint64_t v76;
  double v77;
  double v78;
  unint64_t v79;
  float *v80;
  uint64_t v81;
  double v82;
  unint64_t v83;
  unint64_t v84;
  double v85;
  unint64_t v86;
  unint64_t v87;
  double v88;
  unint64_t v89;
  double v90;
  double *v91;
  double *v92;
  uint8_t buf[16];

  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: featureVector";
      goto LABEL_19;
    }
LABEL_20:
    v15 = 0;
    goto LABEL_21;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: cumSumNorthings";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v10 = a6;
  if (!a6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: cumSumEastings";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v11 = a7;
  if (!a7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: cumSumSquaredNorthings";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (!a8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: cumSumSquaredEastings";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (a4 <= 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: 1<cumSumNumLocations";
LABEL_19:
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  v18 = a3;
  -[RTVisitHyperParameter featureDwellnessLogMin](self->_hyperParameter, "featureDwellnessLogMin");
  v82 = exp(v20);
  -[RTVisitHyperParameter featureDwellnessLogMax](self->_hyperParameter, "featureDwellnessLogMax");
  v22 = exp(-v21);
  v23 = -[RTVisitHyperParameter referenceSize](self->_hyperParameter, "referenceSize");
  v24 = -[RTVisitHyperParameter stride](self->_hyperParameter, "stride");
  if (!a9)
    return 1;
  v15 = 0;
  v25 = 0;
  v83 = v23 / v24;
  v91 = v10;
  v92 = v11;
  v80 = v18;
  while (1)
  {
    if (-[RTVisitHyperParameter numOfTimeStepForDistance](self->_hyperParameter, "numOfTimeStepForDistance") <= v25)
      v26 = -[RTVisitPipelineModuleTrajectorySequenceCluster startLocationIndex:](self, "startLocationIndex:", v25 - -[RTVisitHyperParameter numOfTimeStepForDistance](self->_hyperParameter, "numOfTimeStepForDistance"));
    else
      v26 = 0;
    v27 = -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize") + v26;
    v28 = a5[v27];
    v29 = a5[v26];
    v89 = -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize");
    v90 = v10[v27];
    v88 = v10[v26];
    v87 = -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize");
    v30 = -[RTVisitPipelineModuleTrajectorySequenceCluster startLocationIndex:](self, "startLocationIndex:", v25);
    v31 = -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize") + v30;
    v32 = a5[v31];
    v33 = a5[v30];
    v86 = -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize");
    v34 = v10[v31];
    v85 = v10[v30];
    v84 = -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize");
    v35 = 0.0;
    v36 = a8;
    if (v25 + v83 < -[RTVisitHyperParameter numOfTimeStepForDwellness](self->_hyperParameter, "numOfTimeStepForDwellness"))goto LABEL_40;
    v37 = -[RTVisitPipelineModuleTrajectorySequenceCluster startLocationIndex:](self, "startLocationIndex:", v25);
    v38 = -[RTVisitHyperParameter numOfTimeStepForDwellness](self->_hyperParameter, "numOfTimeStepForDwellness");
    if (v37 < -[RTVisitHyperParameter stride](self->_hyperParameter, "stride") * v38)
      break;
    v39 = -[RTVisitHyperParameter numOfTimeStepForDwellness](self->_hyperParameter, "numOfTimeStepForDwellness");
    v40 = -[RTVisitHyperParameter stride](self->_hyperParameter, "stride");
    if (-[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize"))
    {
      v41 = 0;
      v42 = v37 - v40 * v39;
      v43 = v37 + 1;
      v44 = v37 + 1;
      v79 = v25;
      v77 = v29;
      v78 = v28;
      v75 = v37 + 1;
      v76 = v42;
LABEL_32:
      v45 = 0;
      v46 = 0;
      v47 = v42 + v41;
      v81 = v41;
      v48 = v43 + v41;
      v49 = 0.0;
      while (1)
      {
        if (v44 == v46)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_21;
          *(_WORD *)buf = 0;
          v74 = "Invalid parameter not satisfying: 0<locationInterval";
          goto LABEL_50;
        }
        if (v48 >= a4)
          break;
        -[RTVisitPipelineModuleTrajectorySequenceCluster computeRadiusFromCumSumNorthings:cumSumEastings:cumSumSquaredNorthings:cumSumSuaredEastings:firstLocationIndex:lastLocationIndex:](self, "computeRadiusFromCumSumNorthings:cumSumEastings:cumSumSquaredNorthings:cumSumSuaredEastings:firstLocationIndex:lastLocationIndex:", a5, v91, v92, a8, v46, v48);
        v51 = v50;
        v52 = (double)(v44 + v45)
            / (v22 / (double)(v44 + v45)
             + (float)(v51 * (float)-[RTVisitHyperParameter stride](self->_hyperParameter, "stride")));
        if (v52 > v49)
          v49 = v52;
        ++v46;
        --v45;
        if (v46 > v47)
        {
          v35 = v35 + v49;
          ++v41;
          v53 = -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize");
          ++v44;
          v36 = a8;
          v25 = v79;
          v29 = v77;
          v28 = v78;
          v43 = v75;
          v42 = v76;
          if (v81 + 1 < v53)
            goto LABEL_32;
          goto LABEL_39;
        }
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v74 = "Invalid parameter not satisfying: lastLocationIndex<cumSumNumLocations";
      goto LABEL_50;
    }
LABEL_39:
    v35 = v35 / (double)-[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize");
    v10 = v91;
    v11 = v92;
    v18 = v80;
LABEL_40:
    if (-[RTVisitHyperParameter numOfTimeStepForRadius](self->_hyperParameter, "numOfTimeStepForRadius") <= v25)
      v54 = -[RTVisitPipelineModuleTrajectorySequenceCluster startLocationIndex:](self, "startLocationIndex:", v25 - -[RTVisitHyperParameter numOfTimeStepForRadius](self->_hyperParameter, "numOfTimeStepForRadius"));
    else
      v54 = 0;
    v55 = sqrt(((v32 - v33) / (double)v86 - (v28 - v29) / (double)v89)* ((v32 - v33) / (double)v86 - (v28 - v29) / (double)v89)+ ((v34 - v85) / (double)v84 - (v90 - v88) / (double)v87)* ((v34 - v85) / (double)v84 - (v90 - v88) / (double)v87));
    -[RTVisitPipelineModuleTrajectorySequenceCluster computeRadiusFromCumSumNorthings:cumSumEastings:cumSumSquaredNorthings:cumSumSuaredEastings:firstLocationIndex:lastLocationIndex:](self, "computeRadiusFromCumSumNorthings:cumSumEastings:cumSumSquaredNorthings:cumSumSuaredEastings:firstLocationIndex:lastLocationIndex:", a5, v10, v11, v36, v54, -[RTVisitPipelineModuleTrajectorySequenceCluster startLocationIndex:](self, "startLocationIndex:", v25));
    v57 = v56;
    v58 = (void *)objc_opt_class();
    -[RTVisitHyperParameter featureDistanceMin](self->_hyperParameter, "featureDistanceMin");
    v60 = v59;
    -[RTVisitHyperParameter featureDistanceMax](self->_hyperParameter, "featureDistanceMax");
    objc_msgSend(v58, "normalizeFeature:min:max:", v55, v60, v61);
    *(float *)&v62 = v62;
    v18[v25] = *(float *)&v62;
    v63 = (void *)objc_opt_class();
    v64 = log(v82 + v35);
    -[RTVisitHyperParameter featureDwellnessLogMin](self->_hyperParameter, "featureDwellnessLogMin");
    v66 = v65;
    -[RTVisitHyperParameter featureDwellnessLogMax](self->_hyperParameter, "featureDwellnessLogMax");
    objc_msgSend(v63, "normalizeFeature:min:max:", v64, v66, v67);
    *(float *)&v68 = v68;
    v18[v25 + a9] = *(float *)&v68;
    v69 = (void *)objc_opt_class();
    -[RTVisitHyperParameter featureRadiusMin](self->_hyperParameter, "featureRadiusMin");
    v71 = v70;
    -[RTVisitHyperParameter featureRadiusMax](self->_hyperParameter, "featureRadiusMax");
    objc_msgSend(v69, "normalizeFeature:min:max:", v57, v71, v72);
    *(float *)&v73 = v73;
    v18[2 * a9 + v25++] = *(float *)&v73;
    v16 = 1;
    v15 = v25 >= a9;
    if (v25 == a9)
      return v16;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v74 = "Invalid parameter not satisfying: startLocation >= _hyperParameter.numOfTimeStepForDwellness * _hyperParameter.stride";
LABEL_50:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v74, buf, 2u);
  }
LABEL_21:

  return v15;
}

- (float)computeFeatureVectorFromLocations:(id)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  id v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  float *v15;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint8_t buf[16];

  v8 = a3;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Invalid parameter not satisfying: locations";
      goto LABEL_10;
    }
LABEL_16:

    v15 = 0;
    goto LABEL_17;
  }
  v9 = a5 - a4;
  if (a5 <= a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Invalid parameter not satisfying: start < end";
      goto LABEL_10;
    }
    goto LABEL_16;
  }
  if (-[RTVisitHyperParameter minSequenceLength](self->_hyperParameter, "minSequenceLength") + a4 > a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Invalid parameter not satisfying: start + _hyperParameter.minSequenceLength <= end";
LABEL_10:
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v12 = -[RTVisitHyperParameter stride](self->_hyperParameter, "stride") * a4;
  v13 = -[RTVisitPipelineModuleTrajectorySequenceCluster numLocationsFrom:](self, "numLocationsFrom:", a5);
  v14 = v13 - v12;
  if (v13 <= v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v11 = "Invalid parameter not satisfying: startLocationIndex < endLocationIndex";
    goto LABEL_10;
  }
  if (v13 > objc_msgSend(v8, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v11 = "Invalid parameter not satisfying: endLocationIndex <= locations.count";
    goto LABEL_10;
  }
  v17 = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
  v18 = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
  v19 = v18;
  if (v17)
    v20 = v18 == 0;
  else
    v20 = 1;
  if (v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "fail to allocate memory for northings and eastings", buf, 2u);
    }

    v15 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "latitude");

    objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "longitude");

    v24 = 0;
    v27 = v14;
    if (v14 <= 1)
      v14 = 1;
    do
    {
      *(_QWORD *)buf = 0;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "latitude");
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "longitude");
      RTCommonConvertGeodeticToLocalFrame();

      v24 += 8;
      ++v12;
      --v14;
    }
    while (v14);
    v15 = -[RTVisitPipelineModuleTrajectorySequenceCluster computeFeatureVectorFromLocalFramesNumOfLocations:northings:eastings:sequenceLength:](self, "computeFeatureVectorFromLocalFramesNumOfLocations:northings:eastings:sequenceLength:", v27, v17, v19, v9);
  }
  if (v17)
    free(v17);
  if (v19)
    free(v19);
LABEL_17:

  return v15;
}

- (id)createVisitWithLocations:(id)a3 entryDate:(id)a4 exitDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  NSObject *v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  RTVisitCluster *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  uint8_t *v42;
  RTLocation *v43;
  RTLocation *referenceLocation;
  unint64_t v45;
  void *v46;
  void *v47;
  char v48;
  double sumOfNorthing;
  double sumOfSquaredEasting;
  double sumOfSquaredNorthing;
  double v52;
  double sumOfEasting;
  double v54;
  double numOfLocations;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  RTVisitLocationPoints *v63;
  void *v64;
  RTVisitLocationPoints *v65;
  NSObject *v66;
  objc_class *v68;
  void *v69;
  unint64_t v70;
  NSObject *v71;
  NSObject *v72;
  id v73;
  uint8_t v74[16];
  double v75;
  double v76;
  _BYTE buf[12];
  __int16 v78;
  RTVisitCluster *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    -[RTVisitCluster visit](self->_workingVisitCluster, "visit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "location");
    v12 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v13 = objc_alloc(MEMORY[0x1E0D183B0]);
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "latitude");
      v16 = v15;
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "longitude");
      v19 = objc_msgSend(v13, "initWithLatitude:longitude:horizontalUncertainty:date:", v9, v16, v18, 0.0);

      v20 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v19, 0, objc_msgSend(v8, "count"), 1280, &__block_literal_global_53);
      if (v20 >= objc_msgSend(v8, "count"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v41 = "Invalid parameter not satisfying: firstInsideVisitIndex < locations.count";
LABEL_24:
          v42 = buf;
LABEL_25:
          _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, v41, v42, 2u);
        }
LABEL_48:

        v33 = 0;
LABEL_49:

        goto LABEL_50;
      }
      v21 = objc_msgSend(v8, "count");
      v73 = v10;
      if (v10)
      {
        v71 = v12;
        v22 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "latitude");
        v25 = v24;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "longitude");
        v28 = objc_msgSend(v22, "initWithLatitude:longitude:horizontalUncertainty:date:", v10, v25, v27, 0.0);

        v29 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v28, v20, objc_msgSend(v8, "count") - v20, 1536, &__block_literal_global_53);
        if (v29 < objc_msgSend(v8, "count"))
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "date");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v10, "isEqualToDate:", v31);

          v29 += v32;
        }
        v19 = v28;
        v12 = v71;
      }
      else
      {
        v29 = v21;
      }
      if (v29 < v20)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v41 = "Invalid parameter not satisfying: firstOutsideVisitIndex >= firstInsideVisitIndex";
          goto LABEL_24;
        }
        goto LABEL_48;
      }
      self->_numOfLocations += v29 - v20;
      if (!self->_referenceLocation)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v20);
        v43 = (RTLocation *)objc_claimAutoreleasedReturnValue();
        referenceLocation = self->_referenceLocation;
        self->_referenceLocation = v43;

      }
      v70 = v29 - v20;
      v72 = v19;
      if (v29 > v20)
      {
        v45 = v20;
        while (1)
        {
          v76 = 0.0;
          *(_QWORD *)buf = 0;
          v75 = 0.0;
          -[RTLocation latitude](self->_referenceLocation, "latitude");
          -[RTLocation longitude](self->_referenceLocation, "longitude");
          objc_msgSend(v8, "objectAtIndexedSubscript:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "latitude");
          objc_msgSend(v8, "objectAtIndexedSubscript:", v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "longitude");
          v48 = RTCommonConvertGeodeticToLocalFrame();

          if ((v48 & 1) == 0)
            break;
          sumOfNorthing = v76 + self->_sumOfNorthing;
          sumOfSquaredEasting = self->_sumOfSquaredEasting;
          sumOfSquaredNorthing = v76 * v76 + self->_sumOfSquaredNorthing;
          v52 = v75;
          sumOfEasting = v75 + self->_sumOfEasting;
          self->_sumOfNorthing = sumOfNorthing;
          self->_sumOfEasting = sumOfEasting;
          v54 = v52 * v52 + sumOfSquaredEasting;
          self->_sumOfSquaredNorthing = sumOfSquaredNorthing;
          self->_sumOfSquaredEasting = v54;
          if (v29 == ++v45)
            goto LABEL_34;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v74 = 0;
          _os_log_error_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: result", v74, 2u);
        }

        v33 = 0;
        v19 = v72;
        v10 = v73;
        goto LABEL_49;
      }
      sumOfNorthing = self->_sumOfNorthing;
      sumOfEasting = self->_sumOfEasting;
      sumOfSquaredNorthing = self->_sumOfSquaredNorthing;
      v54 = self->_sumOfSquaredEasting;
LABEL_34:
      numOfLocations = (double)self->_numOfLocations;
      v56 = sumOfNorthing / numOfLocations;
      v76 = 0.0;
      *(_QWORD *)buf = 0;
      v57 = sumOfEasting / numOfLocations;
      -[RTLocation latitude](self->_referenceLocation, "latitude");
      -[RTLocation longitude](self->_referenceLocation, "longitude");
      v19 = v72;
      if ((RTCommonConvertLocalFrameToGeodetic() & 1) != 0)
      {
        RTCommonIsCoordinateValid();
        v10 = v73;
        if (v58 != 0.0)
        {
          v59 = sqrt(vabdd_f64(sumOfSquaredNorthing / numOfLocations, v56 * v56));
          v60 = sqrt(vabdd_f64(v54 / numOfLocations, v57 * v57));
          v61 = objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", 0, *(double *)buf, v76, sqrt(v59 * v59 + v60 * v60));

          v34 = 0;
          if (v29 != v20)
          {
            v62 = v61;
            v63 = [RTVisitLocationPoints alloc];
            objc_msgSend(v8, "subarrayWithRange:", v20, v70);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v63;
            v61 = v62;
            v34 = -[RTVisitLocationPoints initWithLocations:](v65, "initWithLocations:", v64);

          }
          v12 = v61;
          if (!v61)
            goto LABEL_39;
          goto LABEL_11;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v40 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          goto LABEL_48;
        LOWORD(v75) = 0;
        v41 = "Invalid parameter not satisfying: RTCommonIsCoordinateValid(meanLat, meanLon)";
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v40 = objc_claimAutoreleasedReturnValue();
        v10 = v73;
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          goto LABEL_48;
        LOWORD(v75) = 0;
        v41 = "Invalid parameter not satisfying: result";
      }
      v42 = (uint8_t *)&v75;
      goto LABEL_25;
    }
    v34 = 0;
    if (!v12)
    {
LABEL_39:
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: centroid", buf, 2u);
      }
      v33 = 0;
      v12 = v34;
      goto LABEL_49;
    }
LABEL_11:
    v35 = objc_alloc(MEMORY[0x1E0D18578]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v37 = 3;
    else
      v37 = 1;
    v38 = (void *)objc_msgSend(v35, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v36, v37, v12, v9, v10, self->_numOfLocations, *MEMORY[0x1E0D185C8], 0);

    v33 = -[RTVisitCluster initWithPoints:visit:]([RTVisitCluster alloc], "initWithPoints:visit:", v34, v38);
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v68 = (objc_class *)objc_opt_class();
      NSStringFromClass(v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v69;
      v78 = 2112;
      v79 = v33;
      _os_log_debug_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_DEBUG, "%@ add out cluster, %@", buf, 0x16u);

    }
    v19 = v34;
    goto LABEL_49;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entryDate", buf, 2u);
  }
  v33 = 0;
LABEL_50:

  return v33;
}

uint64_t __94__RTVisitPipelineModuleTrajectorySequenceCluster_createVisitWithLocations_entryDate_exitDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)clearWorkingVisitCluster
{
  RTVisitCluster *workingVisitCluster;
  RTLocation *referenceLocation;
  NSArray *residualLocations;

  -[RTVisitDecoder reset](self->_decoder, "reset");
  workingVisitCluster = self->_workingVisitCluster;
  self->_workingVisitCluster = 0;

  self->_numOfLocations = 0;
  *(_OWORD *)&self->_sumOfNorthing = 0u;
  *(_OWORD *)&self->_sumOfSquaredNorthing = 0u;
  referenceLocation = self->_referenceLocation;
  self->_referenceLocation = 0;

  residualLocations = self->_residualLocations;
  self->_residualLocations = 0;

}

- (id)performBatchInferenceWithFeatureVector:(const float *)a3 featureVectorLength:(unint64_t)a4 start:(unint64_t)a5 firstTimeStepDate:(id)a6
{
  id v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint8_t *v24;
  NSObject *v26;
  const char *v27;
  uint8_t *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint8_t v33[16];
  uint8_t v34[2];
  __int16 v35;
  __int16 v36;
  uint8_t buf[2];
  __int16 v38;
  __int16 v39;

  v10 = a6;
  v32 = v10;
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v39 = 0;
    v23 = "Invalid parameter not satisfying: featureVector";
    v24 = (uint8_t *)&v39;
LABEL_23:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v23, v24, 2u);
    goto LABEL_24;
  }
  v11 = a4 - a5;
  if (a4 <= a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v38 = 0;
    v23 = "Invalid parameter not satisfying: start < featureVectorLength";
    v24 = (uint8_t *)&v38;
    goto LABEL_23;
  }
  v12 = v10;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: firstTimeStepDate";
      v24 = buf;
      goto LABEL_23;
    }
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  v13 = -[RTVisitHyperParameter minSequenceLength](self->_hyperParameter, "minSequenceLength");
  v14 = -[RTVisitHyperParameter maxSequenceLength](self->_hyperParameter, "maxSequenceLength");
  if (v11 >= v14)
    v11 = v14;
  objc_msgSend(v12, "dateByAddingTimeInterval:", (double)(-[RTVisitHyperParameter windowInterval](self->_hyperParameter, "windowInterval") * (a5 + v13 - 1)));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = -[RTVisitHyperParameter onDeviceInferenceBatchSize](self->_hyperParameter, "onDeviceInferenceBatchSize");
  if (v13 > v11)
    goto LABEL_24;
  v17 = v16;
  v18 = v11;
  v30 = 0;
  v19 = v15;
  while (1)
  {
    if (v18 < v13
             + -[RTVisitHyperParameter visitInferenceResolution](self->_hyperParameter, "visitInferenceResolution", v30, v32)* (v17 - 1))
    {
      v20 = v18
          + ~v13
          + -[RTVisitHyperParameter visitInferenceResolution](self->_hyperParameter, "visitInferenceResolution");
      v17 = v20 / -[RTVisitHyperParameter visitInferenceResolution](self->_hyperParameter, "visitInferenceResolution")
          + 1;
    }
    if (!v17)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v36 = 0;
        v27 = "Invalid parameter not satisfying: 0 < batchSize";
        v28 = (uint8_t *)&v36;
        goto LABEL_37;
      }
LABEL_31:

      v29 = v31;
      goto LABEL_34;
    }
    if (v17 > -[RTVisitHyperParameter onDeviceInferenceBatchSize](self->_hyperParameter, "onDeviceInferenceBatchSize"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v35 = 0;
        v27 = "Invalid parameter not satisfying: batchSize <= _hyperParameter.onDeviceInferenceBatchSize";
        v28 = (uint8_t *)&v35;
        goto LABEL_37;
      }
      goto LABEL_31;
    }
    v21 = -[RTVisitModelController predictFromInput:featureVectorStride:firstSequenceIndex:firstSequenceLength:batchSize:](self->_trajectorySequenceClassifier, "predictFromInput:featureVectorStride:firstSequenceIndex:firstSequenceLength:batchSize:", a3, a4, a5, v13, v17);
    if (!v21)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_WORD *)v34 = 0;
      v27 = "Invalid parameter not satisfying: output";
      v28 = v34;
LABEL_37:
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, v27, v28, 2u);
      goto LABEL_31;
    }
    -[RTVisitDecoder decodeWithProbabilities:batchSize:firstTimeStepDate:](self->_decoder, "decodeWithProbabilities:batchSize:firstTimeStepDate:", v21, v17, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      break;
    if ((objc_msgSend(v22, "completeVisit") & 1) != 0)
      goto LABEL_35;
    v13 += -[RTVisitHyperParameter visitInferenceResolution](self->_hyperParameter, "visitInferenceResolution") * v17;
    -[NSObject dateByAddingTimeInterval:](v19, "dateByAddingTimeInterval:", (double)(-[RTVisitHyperParameter visitInferenceResolution](self->_hyperParameter, "visitInferenceResolution")* v17* -[RTVisitHyperParameter windowInterval](self->_hyperParameter, "windowInterval")));
    v15 = objc_claimAutoreleasedReturnValue();

    v30 = v22;
    v19 = v15;
    if (v13 > v18)
      goto LABEL_25;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v33 = 0;
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoded", v33, 2u);
  }
LABEL_34:

  v22 = 0;
LABEL_35:
  v15 = v19;
LABEL_25:

  return v22;
}

- (id)process:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  NSArray *residualLocations;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSObject *v28;
  NSArray *v29;
  NSObject *p_super;
  objc_class *v31;
  void *v32;
  unint64_t v33;
  float *v34;
  float *v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  const char *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  unint64_t v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  const char *v59;
  float *v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  unint64_t numOfLocations;
  RTVisitDecoder *decoder;
  objc_class *v67;
  void *v68;
  objc_class *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  BOOL v75;
  unint64_t v76;
  unint64_t v77;
  NSObject *v78;
  unint64_t v79;
  unint64_t v80;
  NSArray *v81;
  NSArray *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  id v96;
  NSObject *v97;
  id v98;
  NSObject *v99;
  id v100;
  NSObject *v101;
  id v102;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  id obj;
  os_log_t log;
  os_log_t logb;
  NSObject *loga;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  char *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint8_t buf[4];
  unint64_t v124;
  __int16 v125;
  const char *v126;
  __int16 v127;
  unint64_t v128;
  __int16 v129;
  unint64_t v130;
  __int16 v131;
  unint64_t v132;
  __int16 v133;
  NSObject *v134;
  __int16 v135;
  unint64_t v136;
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  obj = v4;
  v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
  if (!v116)
  {
LABEL_96:
    v95 = obj;

    v96 = v5;
    goto LABEL_109;
  }
  v115 = *(_QWORD *)v120;
  v109 = v5;
LABEL_3:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v120 != v115)
      objc_enumerationMutation(obj);
    v7 = *(char **)(*((_QWORD *)&v119 + 1) + 8 * v6);
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v124 = (unint64_t)v68;
      v125 = 2112;
      v126 = v7;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@ working on cluster, %@", buf, 0x16u);

    }
    objc_msgSend(v7, "points");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSArray count](self->_residualLocations, "count"))
    {
      objc_msgSend(v7, "points");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "locations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        -[NSArray lastObject](self->_residualLocations, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "date");
        v16 = v10;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v17);
        v19 = v18;
        v20 = (double)-[RTVisitHyperParameter timeIntervalBetweenSmoothedPoints](self->_hyperParameter, "timeIntervalBetweenSmoothedPoints")+ 1.0;

        if (v19 > v20)
        {
          v10 = v16;
          goto LABEL_15;
        }
        -[NSArray arrayByAddingObjectsFromArray:](self->_residualLocations, "arrayByAddingObjectsFromArray:", v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v16;
      }
      else
      {

      }
    }
LABEL_15:
    residualLocations = self->_residualLocations;
    self->_residualLocations = 0;

    objc_msgSend(v7, "points");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "locations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    v118 = v7;
    if (!v24)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v124 = (unint64_t)v32;
        _os_log_debug_impl(&dword_1D1A22000, p_super, OS_LOG_TYPE_DEBUG, "%@ early bail: receiving forced exit signal", buf, 0xCu);

      }
      goto LABEL_86;
    }
    v25 = objc_msgSend(v10, "count");
    v26 = -[RTVisitHyperParameter minSequenceLength](self->_hyperParameter, "minSequenceLength");
    v27 = -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize");
    if (v25 >= -[RTVisitHyperParameter referenceSize](self->_hyperParameter, "referenceSize") + v27 * v26)
      break;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v69 = (objc_class *)objc_opt_class();
      NSStringFromClass(v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138412546;
      v124 = (unint64_t)v70;
      v125 = 2048;
      v126 = (const char *)v71;
      _os_log_debug_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEBUG, "%@ early bail: insufficient number of locations, %lu", buf, 0x16u);

    }
    v29 = v10;
    p_super = &self->_residualLocations->super;
    self->_residualLocations = v29;
LABEL_86:

    objc_msgSend(v118, "visit");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "exit");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      -[RTVisitPipelineModuleTrajectorySequenceCluster workingVisitCluster](self, "workingVisitCluster");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (v85)
      {
        v86 = v10;
        objc_msgSend(v118, "points");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "locations");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitCluster visit](self->_workingVisitCluster, "visit");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "entry");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "visit");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "exit");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitPipelineModuleTrajectorySequenceCluster createVisitWithLocations:entryDate:exitDate:](self, "createVisitWithLocations:entryDate:exitDate:", v88, v90, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v94 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D1A22000, v94, OS_LOG_TYPE_DEBUG, "partial visit: use incoming visit to complete working visit", buf, 2u);
        }

        if (v93)
          objc_msgSend(v109, "addObject:", v93);

        v10 = v86;
      }
      -[RTVisitPipelineModuleTrajectorySequenceCluster clearWorkingVisitCluster](self, "clearWorkingVisitCluster");
    }

    if (++v6 == v116)
    {
      v5 = v109;
      v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
      if (!v116)
        goto LABEL_96;
      goto LABEL_3;
    }
  }
  v33 = -[RTVisitPipelineModuleTrajectorySequenceCluster sequenceLengthFrom:](self, "sequenceLengthFrom:", objc_msgSend(v10, "count"));
  v34 = -[RTVisitPipelineModuleTrajectorySequenceCluster computeFeatureVectorFromLocations:start:end:](self, "computeFeatureVectorFromLocations:start:end:", v10, 0, v33);
  if (!v34)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v99, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: featureVector", buf, 2u);
    }

    v5 = v109;
    v100 = v109;
LABEL_107:
    v95 = obj;
    goto LABEL_108;
  }
  v35 = v34;
  v36 = objc_msgSend(v10, "count");
  v117 = v10;
  objc_msgSend(v10, "objectAtIndexedSubscript:", -[RTVisitPipelineModuleTrajectorySequenceCluster startLocationIndex:](self, "startLocationIndex:", 0));
  log = (os_log_t)v33;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "date");
  p_super = objc_claimAutoreleasedReturnValue();

  v38 = (unint64_t)log;
  if (-[RTVisitHyperParameter minSequenceLength](self->_hyperParameter, "minSequenceLength") > (unint64_t)log)
  {
    v39 = 0;
    v40 = 0;
LABEL_80:
    v77 = -[RTVisitPipelineModuleTrajectorySequenceCluster startLocationIndex:](self, "startLocationIndex:", &v40[v36]);
    if (v77 < objc_msgSend(v117, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v124 = v39;
        v125 = 2048;
        v126 = (const char *)v38;
        _os_log_debug_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_DEBUG, "keeping residual locations for start, %lu, featureVectorSequenceLength, %lu", buf, 0x16u);
      }

      v10 = v117;
      v79 = objc_msgSend(v117, "count") - v77;
      v80 = -[RTVisitHyperParameter maxSequenceLength](self->_hyperParameter, "maxSequenceLength");
      if (v79 > -[RTVisitHyperParameter windowSize](self->_hyperParameter, "windowSize") * v80)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v97, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count - residualLocationIndex <= _hyperParameter.maxSequenceLength * _hyperParameter.windowSize", buf, 2u);
        }
        v5 = v109;
        v95 = obj;
        goto LABEL_100;
      }
      objc_msgSend(v117, "subarrayWithRange:", v77, objc_msgSend(v117, "count") - v77);
      v81 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v82 = self->_residualLocations;
      self->_residualLocations = v81;

    }
    free(v35);
    v10 = v117;
    goto LABEL_86;
  }
  v105 = v36;
  v108 = v6;
  v110 = 0;
  v39 = 0;
  while (2)
  {
    v41 = -[RTVisitHyperParameter maxSequenceLength](self->_hyperParameter, "maxSequenceLength");
    v42 = v41 + v39;
    if (v38 >= v41 + v39)
      v43 = v41 + v39;
    else
      v43 = v38;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      numOfLocations = self->_numOfLocations;
      *(_DWORD *)buf = 138413826;
      v124 = (unint64_t)v64;
      v125 = 2048;
      v126 = v110;
      v127 = 2048;
      v128 = v39;
      v129 = 2048;
      v130 = v43;
      v131 = 2048;
      v132 = v38;
      v133 = 2112;
      v134 = p_super;
      v135 = 2048;
      v136 = numOfLocations;
      _os_log_debug_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_DEBUG, "%@: featureVectorStart=%lu, predictionStart=%lu, maxPredictionStop=%lu, featureVectorLength=%lu, firstTimeStepDate=%@, _numOfLocations=%lu", buf, 0x48u);

    }
    -[RTVisitPipelineModuleTrajectorySequenceCluster performBatchInferenceWithFeatureVector:featureVectorLength:start:firstTimeStepDate:](self, "performBatchInferenceWithFeatureVector:featureVectorLength:start:firstTimeStepDate:", v35, v38, v39, p_super);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v124 = (unint64_t)v45;
      _os_log_debug_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_DEBUG, "decoded=%@", buf, 0xCu);
    }

    if (v45)
    {
      if (objc_msgSend(v45, "noVisit"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_DEBUG, "no visit detected", buf, 2u);
        }

        if (v38 <= v42)
          goto LABEL_78;
        v48 = -[RTVisitHyperParameter noVisitMargin](self->_hyperParameter, "noVisitMargin");
        goto LABEL_44;
      }
      if (objc_msgSend(v45, "partialVisit"))
      {
        if (v38 <= v42)
        {
          objc_msgSend(v45, "entryDate");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "visit");
          logb = (os_log_t)objc_claimAutoreleasedReturnValue();
          -[NSObject exit](logb, "exit");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTVisitPipelineModuleTrajectorySequenceCluster createVisitWithLocations:entryDate:exitDate:](self, "createVisitWithLocations:entryDate:exitDate:", v117, v106, v72);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55)
            objc_msgSend(v109, "addObject:", v55);
          objc_msgSend(v118, "visit");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "exit");
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          loga = objc_claimAutoreleasedReturnValue();
          v74 = os_log_type_enabled(loga, OS_LOG_TYPE_DEBUG);
          if (v107)
          {
            if (v74)
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D1A22000, loga, OS_LOG_TYPE_DEBUG, "partial visit: use incoming visit to complete", buf, 2u);
            }

            -[RTVisitPipelineModuleTrajectorySequenceCluster clearWorkingVisitCluster](self, "clearWorkingVisitCluster");
          }
          else
          {
            if (v74)
            {
              *(_DWORD *)buf = 138412290;
              v124 = (unint64_t)v55;
              _os_log_debug_impl(&dword_1D1A22000, loga, OS_LOG_TYPE_DEBUG, "partial visit: working visit: %@", buf, 0xCu);
            }

            objc_storeStrong((id *)&self->_workingVisitCluster, v55);
          }
          v105 = v43 - -[RTVisitHyperParameter partialVisitMargin](self->_hyperParameter, "partialVisitMargin");
LABEL_77:

LABEL_78:
LABEL_79:
          v40 = v110;
          v36 = v105;
          goto LABEL_80;
        }
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_DEBUG, "partial visit: continuing without yielding", buf, 2u);
        }

        v48 = -[RTVisitHyperParameter partialVisitMargin](self->_hyperParameter, "partialVisitMargin");
LABEL_44:
        v39 = v43 - v48;
      }
      else if (objc_msgSend(v45, "completeVisit"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_DEBUG, "complete visit", buf, 2u);
        }

        objc_msgSend(v45, "exitDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "isBeforeDate:", p_super);

        if (v52)
          objc_msgSend(v45, "setExitDate:", p_super);
        objc_msgSend(v45, "entryDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "exitDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitPipelineModuleTrajectorySequenceCluster createVisitWithLocations:entryDate:exitDate:](self, "createVisitWithLocations:entryDate:exitDate:", v117, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
          objc_msgSend(v109, "addObject:", v55);
        -[RTVisitPipelineModuleTrajectorySequenceCluster clearWorkingVisitCluster](self, "clearWorkingVisitCluster");
        objc_msgSend(v45, "exitDate");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[RTVisitPipelineModuleTrajectorySequenceCluster sequenceIndexFromDate:firstTimeStepDate:](self, "sequenceIndexFromDate:firstTimeStepDate:", v56, p_super);
        v39 = v57 + -[RTVisitHyperParameter completeVisitMargin](self->_hyperParameter, "completeVisitMargin") + 1;

        if (-[RTVisitHyperParameter minSequenceLength](self->_hyperParameter, "minSequenceLength") + v39 > v38)
        {
          v75 = v38 >= -[RTVisitHyperParameter minSequenceLength](self->_hyperParameter, "minSequenceLength") + v39
             || v39 >= v38;
          v76 = v105;
          v6 = v108;
          if (!v75)
            v76 = v39;
          v105 = v76;
          goto LABEL_77;
        }
        v58 = v55;
        v59 = &v110[v39];
        free(v35);
        v10 = v117;
        v60 = -[RTVisitPipelineModuleTrajectorySequenceCluster computeFeatureVectorFromLocations:start:end:](self, "computeFeatureVectorFromLocations:start:end:", v117, v59, log);
        if (!v60)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1A22000, v101, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: featureVector", buf, 2u);
          }

          v5 = v109;
          v102 = v109;

          goto LABEL_107;
        }
        v35 = v60;
        objc_msgSend(v117, "objectAtIndexedSubscript:", -[RTVisitPipelineModuleTrajectorySequenceCluster startLocationIndex:](self, "startLocationIndex:", v59));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "date");
        v62 = objc_claimAutoreleasedReturnValue();

        v110 = v59;
        v38 = (char *)log - v59;

        v39 = 0;
        p_super = v62;
        v6 = v108;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          decoder = self->_decoder;
          *(_DWORD *)buf = 138412802;
          v124 = (unint64_t)decoder;
          v125 = 2080;
          v126 = "-[RTVisitPipelineModuleTrajectorySequenceCluster process:]";
          v127 = 1024;
          LODWORD(v128) = 590;
          _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "decoded visit is not valid, decoder=%@ (in %s:%d)", buf, 0x1Cu);
        }

      }
      if (-[RTVisitHyperParameter minSequenceLength](self->_hyperParameter, "minSequenceLength") + v39 > v38)
        goto LABEL_79;
      continue;
    }
    break;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v97 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v97, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoded", buf, 2u);
  }
  v5 = v109;
  v95 = obj;
  v10 = v117;
LABEL_100:

  v98 = v5;
LABEL_108:

LABEL_109:
  return v5;
}

- (RTVisitModelController)trajectorySequenceClassifier
{
  return self->_trajectorySequenceClassifier;
}

- (RTVisitHyperParameter)hyperParameter
{
  return self->_hyperParameter;
}

- (RTVisitDecoder)decoder
{
  return self->_decoder;
}

- (RTVisitCluster)workingVisitCluster
{
  return self->_workingVisitCluster;
}

- (unint64_t)numOfLocations
{
  return self->_numOfLocations;
}

- (NSArray)residualLocations
{
  return self->_residualLocations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residualLocations, 0);
  objc_storeStrong((id *)&self->_workingVisitCluster, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_hyperParameter, 0);
  objc_storeStrong((id *)&self->_trajectorySequenceClassifier, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
}

@end
