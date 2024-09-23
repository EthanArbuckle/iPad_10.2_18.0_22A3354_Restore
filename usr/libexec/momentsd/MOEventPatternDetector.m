@implementation MOEventPatternDetector

- (MOEventPatternDetector)init
{
  MOEventPatternDetector *v2;
  NSDictionary *v3;
  NSDictionary *configuration;
  MOEventPatternDetectorPredicate *predicate;
  MOEventPatternDetectorFeatureExtractor *featureExtractor;
  MOEventPatternDetectorFeatureTransformer *featureTransformer;
  MOEventPatternDetectorAnomalyDetector *anomalyDetector;
  MOEventPatternDetectorRoutineDetector *routineDetector;
  MOEventPatternDetectorTrendDetector *trendDetector;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MOEventPatternDetector;
  v2 = -[MOEventPatternDetector init](&v12, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSDictionary);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    predicate = v2->_predicate;
    v2->_predicate = 0;

    featureExtractor = v2->_featureExtractor;
    v2->_featureExtractor = 0;

    featureTransformer = v2->_featureTransformer;
    v2->_featureTransformer = 0;

    anomalyDetector = v2->_anomalyDetector;
    v2->_anomalyDetector = 0;

    routineDetector = v2->_routineDetector;
    v2->_routineDetector = 0;

    trendDetector = v2->_trendDetector;
    v2->_trendDetector = 0;

  }
  return v2;
}

- (MOEventPatternDetector)initWithPredicate:(id)a3 andFeatureExtractor:(id)a4 andFeatureTransformer:(id)a5 andAnomalyDetector:(id)a6 andRoutineDetector:(id)a7 andTrendDetector:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MOEventPatternDetector *v20;
  NSDictionary *v21;
  NSDictionary *configuration;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MOEventPatternDetector;
  v20 = -[MOEventPatternDetector init](&v24, "init");
  if (v20)
  {
    v21 = objc_opt_new(NSDictionary);
    configuration = v20->_configuration;
    v20->_configuration = v21;

    -[MOEventPatternDetector setPredicate:](v20, "setPredicate:", v14);
    -[MOEventPatternDetector setFeatureExtractor:](v20, "setFeatureExtractor:", v15);
    -[MOEventPatternDetector setFeatureTransformer:](v20, "setFeatureTransformer:", v16);
    -[MOEventPatternDetector setAnomalyDetector:](v20, "setAnomalyDetector:", v17);
    -[MOEventPatternDetector setRoutineDetector:](v20, "setRoutineDetector:", v18);
    -[MOEventPatternDetector setTrendDetector:](v20, "setTrendDetector:", v19);
  }

  return v20;
}

- (void)setPredicate:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_predicate, a3);
  v5 = a3;
  -[MOEventPatternDetectorPredicate configure:](self->_predicate, "configure:", self->_configuration);

}

- (void)setFeatureExtractor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_featureExtractor, a3);
  v5 = a3;
  -[MOEventPatternDetectorFeatureExtractor configure:](self->_featureExtractor, "configure:", self->_configuration);

}

- (void)setFeatureTransformer:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_featureTransformer, a3);
  v5 = a3;
  -[MOEventPatternDetectorFeatureTransformer configure:](self->_featureTransformer, "configure:", self->_configuration);

}

- (void)setAnomalyDetector:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_anomalyDetector, a3);
  v5 = a3;
  -[MOEventPatternDetectorAnomalyDetector configure:](self->_anomalyDetector, "configure:", self->_configuration);

}

- (void)setRoutineDetector:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_routineDetector, a3);
  v5 = a3;
  -[MOEventPatternDetectorRoutineDetector configure:](self->_routineDetector, "configure:", self->_configuration);

}

- (void)setTrendDetector:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_trendDetector, a3);
  v5 = a3;
  -[MOEventPatternDetectorTrendDetector configure:](self->_trendDetector, "configure:", self->_configuration);

}

- (BOOL)configure:(id)a3
{
  NSDictionary *v4;
  NSDictionary *configuration;
  unsigned __int8 v6;
  char v7;
  unsigned __int8 v8;
  char v9;
  unsigned __int8 v10;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  configuration = self->_configuration;
  self->_configuration = v4;

  v6 = -[MOEventPatternDetectorPredicate configure:](self->_predicate, "configure:", self->_configuration);
  v7 = v6 & -[MOEventPatternDetectorFeatureExtractor configure:](self->_featureExtractor, "configure:", self->_configuration);
  v8 = -[MOEventPatternDetectorFeatureTransformer configure:](self->_featureTransformer, "configure:", self->_configuration);
  v9 = v7 & v8 & -[MOEventPatternDetectorAnomalyDetector configure:](self->_anomalyDetector, "configure:", self->_configuration);
  v10 = -[MOEventPatternDetectorRoutineDetector configure:](self->_routineDetector, "configure:", self->_configuration);
  return v9 & v10 & -[MOEventPatternDetectorTrendDetector configure:](self->_trendDetector, "configure:", self->_configuration);
}

- (id)processEvents:(id)a3
{
  id v5;
  id os_log;
  NSObject *v7;
  NSString *patternDetectorName;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  NSString *v35;
  void *v36;
  id v37;
  NSObject *v38;
  NSString *v39;
  void *v40;
  id v41;
  NSObject *v42;
  NSString *v43;
  MOEventPatternDetectorFeatureTransformer *featureTransformer;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  char isKindOfClass;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  id v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  NSObject *v75;
  void *v76;
  id v77;
  NSObject *v78;
  NSString *v79;
  void *v80;
  id v81;
  NSObject *v82;
  NSString *v83;
  void *v84;
  id v85;
  NSObject *v86;
  NSString *v87;
  void *v88;
  NSMutableArray *v89;
  NSMutableArray *v90;
  id v91;
  NSObject *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  NSString *v97;
  const char *v98;
  NSObject *v99;
  uint32_t v100;
  id v101;
  NSString *v102;
  NSMutableArray *v103;
  id v105;
  NSString *v106;
  uint8_t buf[4];
  NSString *v108;
  __int16 v109;
  id v110;
  __int16 v111;
  id v112;
  __int16 v113;
  id v114;
  __int16 v115;
  NSString *v116;

  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    patternDetectorName = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v108 = patternDetectorName;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Analyzing events for anomalies for %@...", buf, 0xCu);
  }

  if (!self->_predicate)
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOEventPatternDetector processEvents:].cold.9();

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventPatternDetector.m"), 136, CFSTR("No predicate was strategy defined %@ (in %s:%d)"), self->_patternDetectorName, "-[MOEventPatternDetector processEvents:]", 136);

  }
  if (!self->_featureExtractor)
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MOEventPatternDetector processEvents:].cold.8();

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventPatternDetector.m"), 137, CFSTR("No feature extractor strategy was defined for %@ (in %s:%d)"), self->_patternDetectorName, "-[MOEventPatternDetector processEvents:]", 137);

  }
  if (!self->_anomalyDetector && !self->_routineDetector && !self->_trendDetector)
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MOEventPatternDetector processEvents:].cold.7();

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventPatternDetector.m"), 138, CFSTR("No anomaly/routine/trend strategy was defined for %@ (in %s:%d)"), self->_patternDetectorName, "-[MOEventPatternDetector processEvents:]", 138);

  }
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v108 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Preparing for process for %@", buf, 0xCu);
  }

  v22 = objc_opt_class(self->_predicate, v21);
  if ((objc_opt_respondsToSelector(v22, "reset") & 1) != 0)
    -[MOEventPatternDetectorPredicate reset](self->_predicate, "reset");
  v24 = objc_opt_class(self->_featureExtractor, v23);
  if ((objc_opt_respondsToSelector(v24, "reset") & 1) != 0)
    -[MOEventPatternDetectorFeatureExtractor reset](self->_featureExtractor, "reset");
  v26 = objc_opt_class(self->_featureTransformer, v25);
  if ((objc_opt_respondsToSelector(v26, "reset") & 1) != 0)
    -[MOEventPatternDetectorFeatureTransformer reset](self->_featureTransformer, "reset");
  v28 = objc_opt_class(self->_anomalyDetector, v27);
  if ((objc_opt_respondsToSelector(v28, "reset") & 1) != 0)
    -[MOEventPatternDetectorAnomalyDetector reset](self->_anomalyDetector, "reset");
  v30 = objc_opt_class(self->_routineDetector, v29);
  if ((objc_opt_respondsToSelector(v30, "reset") & 1) != 0)
    -[MOEventPatternDetectorRoutineDetector reset](self->_routineDetector, "reset");
  v32 = objc_opt_class(self->_trendDetector, v31);
  if ((objc_opt_respondsToSelector(v32, "reset") & 1) != 0)
    -[MOEventPatternDetectorTrendDetector reset](self->_trendDetector, "reset");
  v33 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v108 = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Filtering relevant event subsets for %@", buf, 0xCu);
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorPredicate filterEvents:](self->_predicate, "filterEvents:", v5));
  v37 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v108 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Extracting event features for %@", buf, 0xCu);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorFeatureExtractor extractFeaturesFromEvents:](self->_featureExtractor, "extractFeaturesFromEvents:", v36));
  v41 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v108 = v43;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Aggregating events with featureTransformer for %@", buf, 0xCu);
  }

  featureTransformer = self->_featureTransformer;
  if (featureTransformer)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorFeatureTransformer transformFeaturesFromEvents:withFeatures:](featureTransformer, "transformFeaturesFromEvents:withFeatures:", v36, v40));
    if (objc_msgSend(v45, "count") != (id)2)
    {
      v46 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetector processEvents:].cold.6();

      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventPatternDetector.m"), 172, CFSTR("Wrong NSArray length resulting from transformFeaturesFromEvents:withFeatures:. (in %s:%d)"), "-[MOEventPatternDetector processEvents:]", 172);

    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));

    if (!v49)
    {
      v50 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetector processEvents:].cold.5();

      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventPatternDetector.m"), 173, CFSTR("eventsSubset undefined after transformFeaturesFromEvents:withFeatures:. (in %s:%d)"), "-[MOEventPatternDetector processEvents:]", 173);

    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));
    v55 = objc_opt_class(NSArray, v54);
    isKindOfClass = objc_opt_isKindOfClass(v53, v55);

    if ((isKindOfClass & 1) == 0)
    {
      v57 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetector processEvents:].cold.4();

      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventPatternDetector.m"), 174, CFSTR("eventsSubset is not an NSArray after transformFeaturesFromEvents:withFeatures:. (in %s:%d)"), "-[MOEventPatternDetector processEvents:]", 174);

    }
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastObject"));

    if (!v60)
    {
      v61 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetector processEvents:].cold.3();

      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventPatternDetector.m"), 175, CFSTR("features undefined after transformFeaturesFromEvents:withFeatures:. (in %s:%d)"), "-[MOEventPatternDetector processEvents:]", 175);

    }
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastObject"));
    v66 = objc_opt_class(NSArray, v65);
    v67 = objc_opt_isKindOfClass(v64, v66);

    if ((v67 & 1) == 0)
    {
      v68 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v69 = objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetector processEvents:].cold.2();

      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventPatternDetector.m"), 176, CFSTR("features is not an NSArray after transformFeaturesFromEvents:withFeatures:. (in %s:%d)"), "-[MOEventPatternDetector processEvents:]", 176);

    }
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));

    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastObject"));
    v73 = objc_msgSend(v71, "count");
    if (v73 != objc_msgSend(v72, "count"))
    {
      v74 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v75 = objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetector processEvents:].cold.1();

      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventPatternDetector.m"), 179, CFSTR("Mismatch between number of features and number of events after transformFeaturesFromEvents:withFeatures:. (in %s:%d)"), "-[MOEventPatternDetector processEvents:]", 179);

    }
    v40 = v72;
    v36 = v71;
  }
  v77 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v78 = objc_claimAutoreleasedReturnValue(v77);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    v79 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v108 = v79;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "Detecting anomalies for %@", buf, 0xCu);
  }

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorAnomalyDetector extractAnomalyEventsFrom:withFeatures:](self->_anomalyDetector, "extractAnomalyEventsFrom:withFeatures:", v36, v40));
  v81 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v82 = objc_claimAutoreleasedReturnValue(v81);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
  {
    v83 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v108 = v83;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Detecting routines for %@", buf, 0xCu);
  }

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorRoutineDetector extractRoutineEventsFrom:withFeatures:](self->_routineDetector, "extractRoutineEventsFrom:withFeatures:", v36, v40));
  v85 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v86 = objc_claimAutoreleasedReturnValue(v85);
  if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
  {
    v87 = self->_patternDetectorName;
    *(_DWORD *)buf = 138412290;
    v108 = v87;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "Detecting trends for %@", buf, 0xCu);
  }

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternDetectorTrendDetector extractTrendEventsFrom:withFeatures:](self->_trendDetector, "extractTrendEventsFrom:withFeatures:", v36, v40));
  v89 = objc_opt_new(NSMutableArray);
  v90 = v89;
  if (v80)
    -[NSMutableArray addObjectsFromArray:](v89, "addObjectsFromArray:", v80);
  if (v84)
    -[NSMutableArray addObjectsFromArray:](v90, "addObjectsFromArray:", v84);
  if (v88)
    -[NSMutableArray addObjectsFromArray:](v90, "addObjectsFromArray:", v88);
  if (v90 && -[NSMutableArray count](v90, "count"))
  {
    v91 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    v92 = objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      v106 = (NSString *)-[NSMutableArray count](v90, "count");
      v105 = objc_msgSend(v80, "count");
      v93 = v40;
      v94 = v5;
      v95 = objc_msgSend(v84, "count");
      v96 = objc_msgSend(v88, "count");
      v97 = self->_patternDetectorName;
      *(_DWORD *)buf = 134219010;
      v108 = v106;
      v109 = 2048;
      v110 = v105;
      v111 = 2048;
      v112 = v95;
      v5 = v94;
      v40 = v93;
      v113 = 2048;
      v114 = v96;
      v115 = 2112;
      v116 = v97;
      v98 = "Detected %lu patterns (a=%lu,r=%lu,t=%lu) for %@";
      v99 = v92;
      v100 = 52;
LABEL_81:
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, v98, buf, v100);
    }
  }
  else
  {
    v101 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    v92 = objc_claimAutoreleasedReturnValue(v101);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      v102 = self->_patternDetectorName;
      *(_DWORD *)buf = 138412290;
      v108 = v102;
      v98 = "No patterns detected for %@";
      v99 = v92;
      v100 = 12;
      goto LABEL_81;
    }
  }

  v103 = v90;
  return v103;
}

- (id)getAnomalyDetector
{
  return self->_anomalyDetector;
}

- (id)getTrendDetector
{
  return self->_trendDetector;
}

- (id)getRoutineDetector
{
  return self->_routineDetector;
}

- (NSString)patternDetectorName
{
  return self->_patternDetectorName;
}

- (void)setPatternDetectorName:(id)a3
{
  objc_storeStrong((id *)&self->_patternDetectorName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternDetectorName, 0);
  objc_storeStrong((id *)&self->_trendDetector, 0);
  objc_storeStrong((id *)&self->_routineDetector, 0);
  objc_storeStrong((id *)&self->_anomalyDetector, 0);
  objc_storeStrong((id *)&self->_featureTransformer, 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)processEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Mismatch between number of features and number of events after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processEvents:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "features is not an NSArray after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processEvents:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "features undefined after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processEvents:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "eventsSubset is not an NSArray after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processEvents:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "eventsSubset undefined after transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processEvents:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Wrong NSArray length resulting from transformFeaturesFromEvents:withFeatures:. (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processEvents:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "No anomaly/routine/trend strategy was defined for %@ (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)processEvents:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "No feature extractor strategy was defined for %@ (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)processEvents:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "No predicate was strategy defined %@ (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

@end
