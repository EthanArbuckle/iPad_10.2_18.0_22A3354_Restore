@implementation MOEventPatternManager

- (MOEventPatternManager)initWithUniverse:(id)a3
{
  id v5;
  MOEventPatternManager *v6;
  MOEventPatternManager *v7;
  MODaemonUniverse *universe;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  MOConfigurationManager *configurationManager;
  MODaemonUniverse *v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  MOEventStore *eventStore;
  dispatch_queue_attr_t v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *queue;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MOEventPatternManager;
  v6 = -[MOEventPatternManager init](&v27, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_universe, a3);
    universe = v7->_universe;
    v10 = (objc_class *)objc_opt_class(MOConfigurationManager, v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](universe, "getService:", v12));
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (MOConfigurationManager *)v13;

    v15 = v7->_universe;
    v17 = (objc_class *)objc_opt_class(MOEventStore, v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](v15, "getService:", v19));
    eventStore = v7->_eventStore;
    v7->_eventStore = (MOEventStore *)v20;

    v22 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = dispatch_queue_create("MOEventPatternManager", v23);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v24;

  }
  return v7;
}

- (id)_initializeBatchedTypeDetector
{
  id os_log;
  NSObject *v4;
  MOEventPatternDetector *v5;
  MOEventPatternDetectorTrendDetectorMannKendall *v6;
  MOEventPatternDetectorFeatureTransformerAggregateEvents *v7;
  MOEventPatternDetectorFeatureExtractorEventDuration *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  MOEventPatternDetectorPredicateFilterWorkouts *v19;
  MOEventPatternDetectorFeatureExtractorTimeDictionary *v20;
  MOEventPatternDetectorTimeOfDayRoutineDetector *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  MOEventPatternDetector *v37;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v38;
  MOEventPatternDetectorFeatureExtractorEventDuration *v39;
  MOEventPatternDetectorTrendDetectorMannKendall *v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  MOEventPatternDetector *v55;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v56;
  MOEventPatternDetectorFeatureExtractorContactFrequency *v57;
  MOEventPatternDetectorTrendDetectorMannKendall *v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  MOEventPatternDetector *v73;
  MOEventPatternDetectorPredicateFilterPOICategory *v74;
  MOEventPatternDetectorFeatureExtractorEventPresence *v75;
  MOEventPatternDetectorAnomalyDetectorExponentialDistribution *v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  double v85;
  void *v86;
  void *v87;
  MOEventPatternDetector *v88;
  MOEventPatternDetectorPredicateFilterByValenceClassification *v89;
  void *v90;
  MOEventPatternDetectorAnomalyDetectorExponentialDistribution *v91;
  double v92;
  void *v93;
  double v94;
  void *v95;
  double v96;
  void *v97;
  double v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  id v103;
  NSObject *v104;
  unsigned int v105;
  MOEventPatternDetectorPredicateFilterByValenceClassification *v107;
  MOEventPatternDetectorAnomalyDetectorExponentialDistribution *v108;
  MOEventPatternDetectorFeatureExtractorEventPresence *v109;
  MOEventPatternDetectorPredicateFilterPOICategory *v110;
  MOEventPatternDetectorTrendDetectorMannKendall *v111;
  MOEventPatternDetectorFeatureExtractorContactFrequency *v112;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v113;
  MOEventPatternDetector *v114;
  MOEventPatternDetectorTrendDetectorMannKendall *v115;
  void *v116;
  MOEventPatternDetectorFeatureExtractorEventDuration *v117;
  void *v118;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v119;
  void *v120;
  MOEventPatternDetector *v121;
  MOEventPatternDetectorTimeOfDayRoutineDetector *v122;
  MOEventPatternDetectorFeatureExtractorTimeDictionary *v123;
  MOEventPatternDetectorPredicateFilterWorkouts *v124;
  MOEventPatternDetectorPredicateFilterByWorkoutType *v125;
  MOEventPatternDetectorFeatureExtractorEventDuration *v126;
  MOEventPatternDetectorFeatureTransformerAggregateEvents *v127;
  MOEventPatternDetectorTrendDetectorMannKendall *v128;
  MOEventPatternDetector *v129;
  MOEventPatternDetector *v130;
  NSMutableArray *v131;
  uint8_t buf[4];
  unsigned int v133;
  _QWORD v134[6];
  _QWORD v135[6];
  _QWORD v136[6];
  _QWORD v137[6];
  _QWORD v138[8];
  _QWORD v139[8];
  _QWORD v140[8];
  _QWORD v141[8];
  _QWORD v142[11];
  _QWORD v143[11];
  _QWORD v144[6];
  _QWORD v145[6];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityBatchedPatternDetection);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Constructing batched pattern detectors", buf, 2u);
  }

  v131 = objc_opt_new(NSMutableArray);
  v5 = objc_opt_new(MOEventPatternDetector);
  v6 = objc_opt_new(MOEventPatternDetectorTrendDetectorMannKendall);
  v7 = objc_opt_new(MOEventPatternDetectorFeatureTransformerAggregateEvents);
  v8 = objc_opt_new(MOEventPatternDetectorFeatureExtractorEventDuration);
  v125 = objc_opt_new(MOEventPatternDetectorPredicateFilterByWorkoutType);
  -[MOEventPatternDetector setPredicate:](v5, "setPredicate:");
  v126 = v8;
  -[MOEventPatternDetector setFeatureExtractor:](v5, "setFeatureExtractor:", v8);
  v127 = v7;
  -[MOEventPatternDetector setFeatureTransformer:](v5, "setFeatureTransformer:", v7);
  v128 = v6;
  -[MOEventPatternDetector setTrendDetector:](v5, "setTrendDetector:", v6);
  v144[0] = CFSTR("MinimumFeatureNumberForTrend");
  LODWORD(v9) = 5.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_WDT_MinimumFeatureNumberForTrend"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v145[0] = v10;
  v144[1] = CFSTR("MinimumValueOfFeatureMaximum");
  LODWORD(v11) = 1133903872;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_WDT_MinimumValueOfFeatureMaximum"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v145[1] = v12;
  v144[2] = CFSTR("MinimumFeatureSlopeForTrend");
  LODWORD(v13) = 25.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_WDT_MinimumFeatureSlopeForTrend"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v145[2] = v14;
  v144[3] = CFSTR("AggregationWindow");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](self->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("PD_WDT_AggregationWindow"), 16)));
  v145[3] = v15;
  v144[4] = CFSTR("AggregationType");
  LODWORD(v16) = 0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_WDT_AggregationType"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v144[5] = CFSTR("TrendFeatureType");
  v145[4] = v17;
  v145[5] = &off_1002D8120;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v145, v144, 6));
  -[MOEventPatternDetector configure:](v5, "configure:", v18);

  -[MOEventPatternDetector setPatternDetectorName:](v5, "setPatternDetectorName:", CFSTR("durationWorkoutTrend"));
  v129 = v5;
  -[NSMutableArray addObject:](v131, "addObject:", v5);
  v130 = objc_opt_new(MOEventPatternDetector);
  v19 = objc_opt_new(MOEventPatternDetectorPredicateFilterWorkouts);
  v20 = objc_opt_new(MOEventPatternDetectorFeatureExtractorTimeDictionary);
  v21 = objc_opt_new(MOEventPatternDetectorTimeOfDayRoutineDetector);
  v124 = v19;
  -[MOEventPatternDetector setPredicate:](v130, "setPredicate:", v19);
  v123 = v20;
  -[MOEventPatternDetector setFeatureExtractor:](v130, "setFeatureExtractor:", v20);
  v122 = v21;
  -[MOEventPatternDetector setRoutineDetector:](v130, "setRoutineDetector:", v21);
  v142[0] = CFSTR("RoutineConsistencyThreshold");
  v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](self->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("PD_TODWR_ConsistencyThreshold"), 2)));
  v143[0] = v120;
  v142[1] = CFSTR("IntraWeekFreqThreshold");
  v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](self->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("PD_TODWR_IntraWeekFreqThreshold"), 3)));
  v143[1] = v118;
  v142[2] = CFSTR("RoutineStdThreshold");
  LODWORD(v22) = 1042983595;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TODWR_RoutineStdThreshold"), v22);
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v143[2] = v116;
  v142[3] = CFSTR("RoutineStdFilterMultiplier");
  LODWORD(v23) = 1.5;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TODWR_RoutineStdFilterMultiplier"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v143[3] = v24;
  v142[4] = CFSTR("RoutineEnvelope");
  LODWORD(v25) = 0.75;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TODWR_RoutineEnvelope"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v143[4] = v26;
  v142[5] = CFSTR("RoutineDetectionSlidingWinSize");
  LODWORD(v27) = 3.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TODWR_SlidingWinSize"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v143[5] = v28;
  v142[6] = CFSTR("RoutineDetectionSlidingWinStepSize");
  LODWORD(v29) = 1.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TODWR_SlidingWinStepSize"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v143[6] = v30;
  v142[7] = CFSTR("MaxNumDailyDetections");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](self->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("PD_TODWR_MaxNumDailyDetections"), 3)));
  v143[7] = v31;
  v142[8] = CFSTR("LastWindowEnd");
  LODWORD(v32) = 1103495168;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TODWR_LastWindowEnd"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v143[8] = v33;
  v142[9] = CFSTR("LastWindowStartThreshold");
  LODWORD(v34) = 1101135872;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TODWR_LastWindowStartThreshold"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v142[10] = CFSTR("RoutineFeatureType");
  v143[9] = v35;
  v143[10] = &off_1002D8138;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v143, v142, 11));
  -[MOEventPatternDetector configure:](v130, "configure:", v36);

  -[MOEventPatternDetector setPatternDetectorName:](v130, "setPatternDetectorName:", CFSTR("timeOfDayWorkoutRoutine"));
  -[NSMutableArray addObject:](v131, "addObject:", v130);
  v37 = objc_opt_new(MOEventPatternDetector);
  v38 = objc_opt_new(MOEventPatternDetectorPredicateFilterBySignificantContact);
  v39 = objc_opt_new(MOEventPatternDetectorFeatureExtractorEventDuration);
  v40 = objc_opt_new(MOEventPatternDetectorTrendDetectorMannKendall);
  v119 = v38;
  -[MOEventPatternDetector setPredicate:](v37, "setPredicate:", v38);
  v117 = v39;
  -[MOEventPatternDetector setFeatureExtractor:](v37, "setFeatureExtractor:", v39);
  v115 = v40;
  -[MOEventPatternDetector setTrendDetector:](v37, "setTrendDetector:", v40);
  v140[0] = CFSTR("ExcludeTextOnlyConversations");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("PD_SCDT_ExcludeTextOnlyConversations"), 1)));
  v141[0] = v41;
  v140[1] = CFSTR("MinimumTextCount");
  LODWORD(v42) = 1.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCDT_MinimumTextCount"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v141[1] = v43;
  v140[2] = CFSTR("MinimumTotalCallDuration");
  LODWORD(v44) = 1114636288;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCDT_MinimumTotalCallDuration"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v141[2] = v45;
  v140[3] = CFSTR("MaximumNumberOfContacts");
  LODWORD(v46) = 1.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCDT_MaximumNumberOfContacts"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v141[3] = v47;
  v140[4] = CFSTR("MinimumFeatureNumberForTrend");
  LODWORD(v48) = 5.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCDT_MinimumFeatureNumberForTrend"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v141[4] = v49;
  v140[5] = CFSTR("MinimumValueOfFeatureMaximum");
  LODWORD(v50) = 1133903872;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCDT_MinimumValueOfFeatureMaximum"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v141[5] = v51;
  v140[6] = CFSTR("MinimumFeatureSlopeForTrend");
  LODWORD(v52) = 25.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCDT_MinimumFeatureSlopeForTrend"), v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v140[7] = CFSTR("TrendFeatureType");
  v141[6] = v53;
  v141[7] = &off_1002D8120;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v141, v140, 8));
  -[MOEventPatternDetector configure:](v37, "configure:", v54);

  -[MOEventPatternDetector setPatternDetectorName:](v37, "setPatternDetectorName:", CFSTR("durationSigContactTrend"));
  v121 = v37;
  -[NSMutableArray addObject:](v131, "addObject:", v37);
  v55 = objc_opt_new(MOEventPatternDetector);
  v56 = objc_opt_new(MOEventPatternDetectorPredicateFilterBySignificantContact);
  v57 = objc_opt_new(MOEventPatternDetectorFeatureExtractorContactFrequency);
  v58 = objc_opt_new(MOEventPatternDetectorTrendDetectorMannKendall);
  v113 = v56;
  -[MOEventPatternDetector setPredicate:](v55, "setPredicate:", v56);
  v112 = v57;
  -[MOEventPatternDetector setFeatureExtractor:](v55, "setFeatureExtractor:", v57);
  v111 = v58;
  -[MOEventPatternDetector setTrendDetector:](v55, "setTrendDetector:", v58);
  v138[0] = CFSTR("ExcludeTextOnlyConversations");
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("PD_SCFT_ExcludeTextOnlyConversations"), 0)));
  v139[0] = v59;
  v138[1] = CFSTR("MinimumTextCount");
  LODWORD(v60) = 5.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCFT_MinimumTextCount"), v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v139[1] = v61;
  v138[2] = CFSTR("MinimumTotalCallDuration");
  LODWORD(v62) = 1114636288;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCFT_MinimumTotalCallDuration"), v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v139[2] = v63;
  v138[3] = CFSTR("MaximumNumberOfContacts");
  LODWORD(v64) = 1.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCFT_MaximumNumberOfContacts"), v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v139[3] = v65;
  v138[4] = CFSTR("MinimumFeatureNumberForTrend");
  LODWORD(v66) = 5.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCFT_MinimumFeatureNumberForTrend"), v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v139[4] = v67;
  v138[5] = CFSTR("MinimumValueOfFeatureMaximum");
  LODWORD(v68) = 10.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCFT_MinimumValueOfFeatureMaximum"), v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v139[5] = v69;
  v138[6] = CFSTR("MinimumFeatureSlopeForTrend");
  LODWORD(v70) = 1.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCFT_MinimumFeatureSlopeForTrend"), v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v138[7] = CFSTR("TrendFeatureType");
  v139[6] = v71;
  v139[7] = &off_1002D8150;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v139, v138, 8));
  -[MOEventPatternDetector configure:](v55, "configure:", v72);

  -[MOEventPatternDetector setPatternDetectorName:](v55, "setPatternDetectorName:", CFSTR("frequencySigContactTrend"));
  v114 = v55;
  -[NSMutableArray addObject:](v131, "addObject:", v55);
  v73 = objc_opt_new(MOEventPatternDetector);
  v74 = objc_opt_new(MOEventPatternDetectorPredicateFilterPOICategory);
  v75 = objc_opt_new(MOEventPatternDetectorFeatureExtractorEventPresence);
  v76 = objc_opt_new(MOEventPatternDetectorAnomalyDetectorExponentialDistribution);
  v110 = v74;
  -[MOEventPatternDetector setPredicate:](v73, "setPredicate:", v74);
  v109 = v75;
  -[MOEventPatternDetector setFeatureExtractor:](v73, "setFeatureExtractor:", v75);
  v108 = v76;
  -[MOEventPatternDetector setAnomalyDetector:](v73, "setAnomalyDetector:", v76);
  v136[0] = CFSTR("TukeyFactorForExponentialDistributionOutlier");
  LODWORD(v77) = 3.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_VS_TukeyFactorForExponentialDistributionOutlier"), v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v137[0] = v78;
  v136[1] = CFSTR("MinimumFeatureNumberForPersonalizedThreshold");
  LODWORD(v79) = 0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_VS_MinimumFeatureNumberForPersonalizedThreshold"), v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v137[1] = v80;
  v136[2] = CFSTR("MinimumFeatureSizeForPersonalizedThreshold");
  LODWORD(v81) = 0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_VS_MinimumFeatureSizeForPersonalizedThreshold"), v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v137[2] = v82;
  v136[3] = CFSTR("MaximumThreshold");
  LODWORD(v83) = 1.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_VS_MaximumThreshold"), v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v137[3] = v84;
  v136[4] = CFSTR("MinimumThreshold");
  LODWORD(v85) = 0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_VS_MinimumThreshold"), v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v136[5] = CFSTR("AnomalyFeatureType");
  v137[4] = v86;
  v137[5] = &off_1002D8168;
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v137, v136, 6));
  -[MOEventPatternDetector configure:](v73, "configure:", v87);

  -[MOEventPatternDetector setPatternDetectorName:](v73, "setPatternDetectorName:", CFSTR("scheduleVisitAnomaly"));
  -[NSMutableArray addObject:](v131, "addObject:", v73);
  v88 = objc_opt_new(MOEventPatternDetector);
  v89 = objc_opt_new(MOEventPatternDetectorPredicateFilterByValenceClassification);
  v90 = (void *)objc_opt_new(0x100304000);
  v91 = objc_opt_new(MOEventPatternDetectorAnomalyDetectorExponentialDistribution);
  v107 = v89;
  -[MOEventPatternDetector setPredicate:](v88, "setPredicate:", v89);
  -[MOEventPatternDetector setFeatureExtractor:](v88, "setFeatureExtractor:", v90);
  -[MOEventPatternDetector setAnomalyDetector:](v88, "setAnomalyDetector:", v91);
  v134[0] = CFSTR("TukeyFactorForExponentialDistributionOutlier");
  LODWORD(v92) = *(_DWORD *)"U0B@";
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSM_TukeyFactorForExponentialDistributionOutlier"), v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v135[0] = v93;
  v134[1] = CFSTR("MinimumFeatureNumberForPersonalizedThreshold");
  LODWORD(v94) = 1.0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSM_MinimumFeatureNumberForPersonalizedThreshold"), v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v135[1] = v95;
  v134[2] = CFSTR("MinimumFeatureSizeForPersonalizedThreshold");
  LODWORD(v96) = 0;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSM_MinimumFeatureSizeForPersonalizedThreshold"), v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v135[2] = v97;
  v134[3] = CFSTR("MaximumThreshold");
  LODWORD(v98) = *(_DWORD *)"";
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSM_MaximumThreshold"), v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v135[3] = v99;
  v134[4] = CFSTR("MinimumThreshold");
  LODWORD(v100) = 1221783552;
  -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](self->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSM_MinimumThreshold"), v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v134[5] = CFSTR("AnomalyFeatureType");
  v135[4] = v101;
  v135[5] = &off_1002D8180;
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v135, v134, 6));
  -[MOEventPatternDetector configure:](v88, "configure:", v102);

  -[MOEventPatternDetector setPatternDetectorName:](v88, "setPatternDetectorName:", CFSTR("timeSinceStateOfMindAnomaly"));
  -[NSMutableArray addObject:](v131, "addObject:", v88);
  v103 = _mo_log_facility_get_os_log(&MOLogFacilityBatchedPatternDetection);
  v104 = objc_claimAutoreleasedReturnValue(v103);
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    v105 = -[NSMutableArray count](v131, "count");
    *(_DWORD *)buf = 67109120;
    v133 = v105;
    _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Done constructing batched detectors [%i constructed]", buf, 8u);
  }

  return v131;
}

- (id)_initializeStreamingTypeDetector
{
  id os_log;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  MOEventPatternDetector *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  NSMutableDictionary *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *k;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  NSMutableDictionary *v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *m;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  double v89;
  void *v90;
  double v91;
  void *v92;
  double v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  void *n;
  void *v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  double v112;
  void *v113;
  double v114;
  void *v115;
  double v116;
  void *v117;
  double v118;
  void *v119;
  void *v120;
  NSMutableDictionary *v121;
  id v122;
  id v123;
  id v124;
  uint64_t v125;
  void *ii;
  void *v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  double v136;
  void *v137;
  double v138;
  void *v139;
  double v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  uint64_t v146;
  void *jj;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  void *v155;
  double v156;
  void *v157;
  double v158;
  void *v159;
  void *v160;
  void *v161;
  NSMutableDictionary *v162;
  id v163;
  id v164;
  id v165;
  uint64_t v166;
  void *kk;
  void *v168;
  void *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  void *v176;
  double v177;
  void *v178;
  void *v179;
  void *v180;
  id v181;
  NSObject *v182;
  unsigned int v183;
  NSObject *v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  NSMutableDictionary *v199;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v200;
  MOEventPatternDetector *v201;
  NSObject *v202;
  void *v203;
  MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *v204;
  void *v205;
  MOEventPatternDetectorFeatureTransformerAggregateEvents *v206;
  void *v207;
  MOEventPatternDetectorFeatureExtractorEventDuration *v208;
  void *v209;
  MOEventPatternDetectorPredicateFilterTimeAtHome *v210;
  void *v211;
  MOEventPatternDetector *v212;
  void *v213;
  MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *v214;
  void *v215;
  MOEventPatternDetectorFeatureTransformerAggregateEvents *v216;
  void *v217;
  MOEventPatternDetectorFeatureExtractorADPDCounts *v218;
  void *v219;
  MOEventPatternDetectorPredicateFilterByADPDCounts *v220;
  void *v221;
  MOEventPatternDetector *v222;
  void *v223;
  MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *v224;
  void *v225;
  MOEventPatternDetectorFeatureExtractorContactFrequency *v226;
  void *v227;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v228;
  void *v229;
  MOEventPatternDetector *v230;
  MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *v231;
  void *v232;
  MOEventPatternDetectorFeatureExtractorEventDuration *v233;
  void *v234;
  MOEventPatternDetector *v235;
  NSMutableDictionary *v236;
  MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *v237;
  void *v238;
  MOEventPatternDetectorPredicateFilterBySignificantContact *v239;
  MOEventPatternDetector *v240;
  NSMutableDictionary *v241;
  MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *v242;
  MOEventPatternDetectorFeatureExtractorEventDuration *v243;
  MOEventPatternDetectorPredicateFilterByPhoneActivityType *v244;
  MOEventPatternDetector *v245;
  MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *v246;
  MOEventPatternDetectorFeatureExtractorEventDuration *v247;
  MOEventPatternDetectorPredicateFilterByWorkoutType *v248;
  NSMutableDictionary *v249;
  MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA *v250;
  void *v251;
  MOEventPatternDetectorPredicateFilterByWorkoutType *v252;
  MOEventPatternDetector *v253;
  MOEventPatternManager *v254;
  NSMutableArray *v255;
  void *v256;
  NSMutableDictionary *v257;
  NSMutableDictionary *v258;
  void *v259;
  void *v260;
  void *v261;
  NSMutableDictionary *v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  uint8_t buf[4];
  unsigned int v296;
  _QWORD v297[10];
  _QWORD v298[10];
  _BYTE v299[128];
  _QWORD v300[10];
  _QWORD v301[10];
  _BYTE v302[128];
  _QWORD v303[12];
  _QWORD v304[12];
  _BYTE v305[128];
  _QWORD v306[12];
  _QWORD v307[12];
  _BYTE v308[128];
  _QWORD v309[12];
  _QWORD v310[12];
  _BYTE v311[128];
  _QWORD v312[8];
  _QWORD v313[8];
  _BYTE v314[128];
  _QWORD v315[8];
  _QWORD v316[8];
  _BYTE v317[128];
  _QWORD v318[8];
  _QWORD v319[8];
  _BYTE v320[128];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Constructing streaming pattern detectors", buf, 2u);
  }

  v255 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore getEWAPlistFileURL](self->_eventStore, "getEWAPlistFileURL"));
  if (v5
    && (v6 = objc_claimAutoreleasedReturnValue(-[MOEventStore readEWAPlistFile:](self->_eventStore, "readEWAPlistFile:", v5))) != 0)
  {
    v254 = self;
    v202 = v6;
    v203 = v5;
    v7 = -[NSObject mutableCopy](v6, "mutableCopy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Constructing streaming pattern detectors", buf, 2u);
    }

    v253 = objc_opt_new(MOEventPatternDetector);
    v252 = objc_opt_new(MOEventPatternDetectorPredicateFilterByWorkoutType);
    v251 = (void *)objc_opt_new(0x100304000);
    v250 = objc_opt_new(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA);
    v11 = objc_opt_new(NSMutableDictionary);
    v291 = 0u;
    v292 = 0u;
    v293 = 0u;
    v294 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v291, v320, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v292;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v292 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v17, "hasPrefix:", CFSTR("MOEventCategoryWorkout"))
            && objc_msgSend(v17, "hasSuffix:", CFSTR("TimeBetweenEvents")))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v17));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v18, v17);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v291, v320, 16);
      }
      while (v14);
    }

    v249 = v11;
    -[MOEventPatternDetector setPredicate:](v253, "setPredicate:", v252);
    -[MOEventPatternDetector setFeatureExtractor:](v253, "setFeatureExtractor:", v251);
    -[MOEventPatternDetector setAnomalyDetector:](v253, "setAnomalyDetector:", v250);
    v318[0] = CFSTR("TukeyFactorForExponentialDistributionOutlier");
    LODWORD(v19) = *(_DWORD *)"U0B@";
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLW_TukeyFactorForExponentialDistributionOutlier"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v319[0] = v20;
    v318[1] = CFSTR("MinimumFeatureNumberForPersonalizedThreshold");
    LODWORD(v21) = 2.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLW_MinimumFeatureNumberForPersonalizedThreshold"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v319[1] = v22;
    v318[2] = CFSTR("MinimumFeatureSizeForPersonalizedThreshold");
    LODWORD(v23) = 1185464320;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLW_MinimumFeatureSizeForPersonalizedThreshold"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v319[2] = v24;
    v318[3] = CFSTR("MaximumThreshold");
    LODWORD(v25) = 1242802176;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLW_MaximumThreshold"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v319[3] = v26;
    v318[4] = CFSTR("MinimumThreshold");
    LODWORD(v27) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLW_MinimumThreshold"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v319[4] = v28;
    v318[5] = CFSTR("BetaForEWAUpdate");
    LODWORD(v29) = 1064198944;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLW_BetaForEWAUpdate"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v319[5] = v30;
    v319[6] = &off_1002D8180;
    v318[6] = CFSTR("AnomalyFeatureType");
    v318[7] = CFSTR("AnomalyEWADictionariesForDetector");
    v319[7] = v11;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v319, v318, 8));
    -[MOEventPatternDetector configure:](v253, "configure:", v31);

    -[MOEventPatternDetector setPatternDetectorName:](v253, "setPatternDetectorName:", CFSTR("timeSinceWorkoutAnomaly"));
    -[NSMutableArray addObject:](v255, "addObject:", v253);
    v32 = objc_opt_new(MOEventPatternDetector);
    v248 = objc_opt_new(MOEventPatternDetectorPredicateFilterByWorkoutType);
    v247 = objc_opt_new(MOEventPatternDetectorFeatureExtractorEventDuration);
    v246 = objc_opt_new(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA);
    v258 = objc_opt_new(NSMutableDictionary);
    v287 = 0u;
    v288 = 0u;
    v289 = 0u;
    v290 = 0u;
    v33 = v12;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v287, v317, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v288;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(_QWORD *)v288 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v38, "hasPrefix:", CFSTR("MOEventCategoryWorkout"))
            && objc_msgSend(v38, "hasSuffix:", CFSTR("EventDuration")))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v38));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v258, "setObject:forKeyedSubscript:", v39, v38);

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v287, v317, 16);
      }
      while (v35);
    }

    -[MOEventPatternDetector setPredicate:](v32, "setPredicate:", v248);
    -[MOEventPatternDetector setFeatureExtractor:](v32, "setFeatureExtractor:", v247);
    -[MOEventPatternDetector setAnomalyDetector:](v32, "setAnomalyDetector:", v246);
    v315[0] = CFSTR("TukeyFactorForExponentialDistributionOutlier");
    LODWORD(v40) = *(_DWORD *)"U0B@";
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_WD_TukeyFactorForExponentialDistributionOutlier"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v316[0] = v41;
    v315[1] = CFSTR("MinimumFeatureNumberForPersonalizedThreshold");
    LODWORD(v42) = 2.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_WD_MinimumFeatureNumberForPersonalizedThreshold"), v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v316[1] = v43;
    v315[2] = CFSTR("MinimumFeatureSizeForPersonalizedThreshold");
    LODWORD(v44) = 1114636288;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_WD_MinimumFeatureSizeForPersonalizedThreshold"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v316[2] = v45;
    v315[3] = CFSTR("MaximumThreshold");
    LODWORD(v46) = 1172373504;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_WD_MaximumThreshold"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v316[3] = v47;
    v315[4] = CFSTR("MinimumThreshold");
    LODWORD(v48) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_WD_MinimumThreshold"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v316[4] = v49;
    v315[5] = CFSTR("BetaForEWAUpdate");
    LODWORD(v50) = 1064198944;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_WD_BetaForEWAUpdate"), v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v316[5] = v51;
    v316[6] = &off_1002D8120;
    v315[6] = CFSTR("AnomalyFeatureType");
    v315[7] = CFSTR("AnomalyEWADictionariesForDetector");
    v316[7] = v258;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v316, v315, 8));
    -[MOEventPatternDetector configure:](v32, "configure:", v52);

    -[MOEventPatternDetector setPatternDetectorName:](v32, "setPatternDetectorName:", CFSTR("durationWorkoutAnomaly"));
    v201 = v32;
    -[NSMutableArray addObject:](v255, "addObject:", v32);
    v245 = objc_opt_new(MOEventPatternDetector);
    v244 = objc_opt_new(MOEventPatternDetectorPredicateFilterByPhoneActivityType);
    v243 = objc_opt_new(MOEventPatternDetectorFeatureExtractorEventDuration);
    v242 = objc_opt_new(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA);
    v53 = objc_opt_new(NSMutableDictionary);
    v283 = 0u;
    v284 = 0u;
    v285 = 0u;
    v286 = 0u;
    v54 = v33;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v283, v314, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v284;
      do
      {
        for (k = 0; k != v56; k = (char *)k + 1)
        {
          if (*(_QWORD *)v284 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v283 + 1) + 8 * (_QWORD)k);
          if (objc_msgSend(v59, "hasPrefix:", CFSTR("MOEventCategoryMotionActivity"))
            && objc_msgSend(v59, "hasSuffix:", CFSTR("EventDuration")))
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v59));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v60, v59);

          }
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v283, v314, 16);
      }
      while (v56);
    }

    v241 = v53;
    -[MOEventPatternDetector setPredicate:](v245, "setPredicate:", v244);
    -[MOEventPatternDetector setFeatureExtractor:](v245, "setFeatureExtractor:", v243);
    -[MOEventPatternDetector setAnomalyDetector:](v245, "setAnomalyDetector:", v242);
    v312[0] = CFSTR("TukeyFactorForExponentialDistributionOutlier");
    LODWORD(v61) = *(_DWORD *)"U0B@";
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_PAD_TukeyFactorForExponentialDistributionOutlier"), v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v313[0] = v62;
    v312[1] = CFSTR("MinimumFeatureNumberForPersonalizedThreshold");
    LODWORD(v63) = 2.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_PAD_MinimumFeatureNumberForPersonalizedThreshold"), v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v313[1] = v64;
    v312[2] = CFSTR("MinimumFeatureSizeForPersonalizedThreshold");
    LODWORD(v65) = 1114636288;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_PAD_MinimumFeatureSizeForPersonalizedThreshold"), v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v313[2] = v66;
    v312[3] = CFSTR("MaximumThreshold");
    LODWORD(v67) = 1172373504;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_PAD_MaximumThreshold"), v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v313[3] = v68;
    v312[4] = CFSTR("MinimumThreshold");
    LODWORD(v69) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_PAD_MinimumThreshold"), v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v313[4] = v70;
    v312[5] = CFSTR("BetaForEWAUpdate");
    LODWORD(v71) = 1064198944;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_PAD_BetaForEWAUpdate"), v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v313[5] = v72;
    v313[6] = &off_1002D8120;
    v312[6] = CFSTR("AnomalyFeatureType");
    v312[7] = CFSTR("AnomalyEWADictionariesForDetector");
    v313[7] = v53;
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v313, v312, 8));
    -[MOEventPatternDetector configure:](v245, "configure:", v73);

    -[MOEventPatternDetector setPatternDetectorName:](v245, "setPatternDetectorName:", CFSTR("durationPhoneActivityAnomaly"));
    -[NSMutableArray addObject:](v255, "addObject:", v245);
    v240 = objc_opt_new(MOEventPatternDetector);
    v239 = objc_opt_new(MOEventPatternDetectorPredicateFilterBySignificantContact);
    v238 = (void *)objc_opt_new(0x100304000);
    v237 = objc_opt_new(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA);
    v74 = objc_opt_new(NSMutableDictionary);
    v279 = 0u;
    v280 = 0u;
    v281 = 0u;
    v282 = 0u;
    v75 = v54;
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v279, v311, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v280;
      do
      {
        for (m = 0; m != v77; m = (char *)m + 1)
        {
          if (*(_QWORD *)v280 != v78)
            objc_enumerationMutation(v75);
          v80 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * (_QWORD)m);
          if (objc_msgSend(v80, "hasPrefix:", CFSTR("MOEventCategorySignificantContact"))
            && objc_msgSend(v80, "hasSuffix:", CFSTR("TimeBetweenEvents")))
          {
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v80));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v74, "setObject:forKeyedSubscript:", v81, v80);

          }
        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v279, v311, 16);
      }
      while (v77);
    }

    v236 = v74;
    -[MOEventPatternDetector setPredicate:](v240, "setPredicate:", v239);
    -[MOEventPatternDetector setFeatureExtractor:](v240, "setFeatureExtractor:", v238);
    -[MOEventPatternDetector setAnomalyDetector:](v240, "setAnomalyDetector:", v237);
    v309[0] = CFSTR("ExcludeTextOnlyConversations");
    v259 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](v254->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("PD_TSLSC_ExcludeTextOnlyConversations"), 0)));
    v310[0] = v259;
    v309[1] = CFSTR("MinimumTextCount");
    LODWORD(v82) = 1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSC_MinimumTextCount"), v82);
    v256 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v310[1] = v256;
    v309[2] = CFSTR("MinimumTotalCallDuration");
    LODWORD(v83) = 1133903872;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSC_MinimumTotalCallDuration"), v83);
    v234 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v310[2] = v234;
    v309[3] = CFSTR("MaximumNumberOfContacts");
    LODWORD(v84) = 1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSC_MaximumNumberOfContacts"), v84);
    v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v310[3] = v232;
    v309[4] = CFSTR("TukeyFactorForExponentialDistributionOutlier");
    LODWORD(v85) = *(_DWORD *)"U0B@";
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSC_TukeyFactorForExponentialDistributionOutlier"), v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v310[4] = v86;
    v309[5] = CFSTR("MinimumFeatureNumberForPersonalizedThreshold");
    LODWORD(v87) = 1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSC_MinimumFeatureNumberForPersonalizedThreshold"), v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v310[5] = v88;
    v309[6] = CFSTR("MinimumFeatureSizeForPersonalizedThreshold");
    LODWORD(v89) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSC_MinimumFeatureSizeForPersonalizedThreshold"), v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v310[6] = v90;
    v309[7] = CFSTR("MaximumThreshold");
    LODWORD(v91) = 1242802176;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSC_MaximumThreshold"), v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v310[7] = v92;
    v309[8] = CFSTR("MinimumThreshold");
    LODWORD(v93) = 1221783552;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSC_MinimumThreshold"), v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v310[8] = v94;
    v309[9] = CFSTR("BetaForEWAUpdate");
    LODWORD(v95) = 1064198944;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TSLSC_BetaForEWAUpdate"), v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v310[9] = v96;
    v310[10] = &off_1002D8180;
    v309[10] = CFSTR("AnomalyFeatureType");
    v309[11] = CFSTR("AnomalyEWADictionariesForDetector");
    v310[11] = v74;
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v310, v309, 12));
    -[MOEventPatternDetector configure:](v240, "configure:", v97);

    -[MOEventPatternDetector setPatternDetectorName:](v240, "setPatternDetectorName:", CFSTR("timeSinceSigContactAnomaly"));
    -[NSMutableArray addObject:](v255, "addObject:", v240);
    v235 = objc_opt_new(MOEventPatternDetector);
    v98 = objc_opt_new(MOEventPatternDetectorPredicateFilterBySignificantContact);
    v233 = objc_opt_new(MOEventPatternDetectorFeatureExtractorEventDuration);
    v231 = objc_opt_new(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA);
    v257 = objc_opt_new(NSMutableDictionary);
    v275 = 0u;
    v276 = 0u;
    v277 = 0u;
    v278 = 0u;
    v99 = v75;
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v275, v308, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v276;
      do
      {
        for (n = 0; n != v101; n = (char *)n + 1)
        {
          if (*(_QWORD *)v276 != v102)
            objc_enumerationMutation(v99);
          v104 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * (_QWORD)n);
          if (objc_msgSend(v104, "hasPrefix:", CFSTR("MOEventCategorySignificantContact"))
            && objc_msgSend(v104, "hasSuffix:", CFSTR("EventDuration")))
          {
            v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v104));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v257, "setObject:forKeyedSubscript:", v105, v104);

          }
        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v275, v308, 16);
      }
      while (v101);
    }

    v200 = v98;
    -[MOEventPatternDetector setPredicate:](v235, "setPredicate:", v98);
    -[MOEventPatternDetector setFeatureExtractor:](v235, "setFeatureExtractor:", v233);
    -[MOEventPatternDetector setAnomalyDetector:](v235, "setAnomalyDetector:", v231);
    v306[0] = CFSTR("ExcludeTextOnlyConversations");
    v260 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](v254->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("PD_SCD_ExcludeTextOnlyConversations"), 1)));
    v307[0] = v260;
    v306[1] = CFSTR("MinimumTextCount");
    LODWORD(v106) = 1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCD_MinimumTextCount"), v106);
    v229 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v307[1] = v229;
    v306[2] = CFSTR("MinimumTotalCallDuration");
    LODWORD(v107) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCD_MinimumTotalCallDuration"), v107);
    v227 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v307[2] = v227;
    v306[3] = CFSTR("MaximumNumberOfContacts");
    LODWORD(v108) = 1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCD_MaximumNumberOfContacts"), v108);
    v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v307[3] = v225;
    v306[4] = CFSTR("TukeyFactorForExponentialDistributionOutlier");
    LODWORD(v109) = 2.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCD_TukeyFactorForExponentialDistributionOutlier"), v109);
    v223 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v307[4] = v223;
    v306[5] = CFSTR("MinimumFeatureNumberForPersonalizedThreshold");
    LODWORD(v110) = 1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCD_MinimumFeatureNumberForPersonalizedThreshold"), v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v307[5] = v111;
    v306[6] = CFSTR("MinimumFeatureSizeForPersonalizedThreshold");
    LODWORD(v112) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCD_MinimumFeatureSizeForPersonalizedThreshold"), v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v307[6] = v113;
    v306[7] = CFSTR("MaximumThreshold");
    LODWORD(v114) = 1172373504;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCD_MaximumThreshold"), v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v307[7] = v115;
    v306[8] = CFSTR("MinimumThreshold");
    LODWORD(v116) = 1147207680;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCD_MinimumThreshold"), v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v307[8] = v117;
    v306[9] = CFSTR("BetaForEWAUpdate");
    LODWORD(v118) = 1064198944;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCD_BetaForEWAUpdate"), v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v307[9] = v119;
    v307[10] = &off_1002D8120;
    v306[10] = CFSTR("AnomalyFeatureType");
    v306[11] = CFSTR("AnomalyEWADictionariesForDetector");
    v307[11] = v257;
    v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v307, v306, 12));
    -[MOEventPatternDetector configure:](v235, "configure:", v120);

    -[MOEventPatternDetector setPatternDetectorName:](v235, "setPatternDetectorName:", CFSTR("durationSigContactAnomaly"));
    -[NSMutableArray addObject:](v255, "addObject:", v235);
    v230 = objc_opt_new(MOEventPatternDetector);
    v228 = objc_opt_new(MOEventPatternDetectorPredicateFilterBySignificantContact);
    v226 = objc_opt_new(MOEventPatternDetectorFeatureExtractorContactFrequency);
    v224 = objc_opt_new(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA);
    v121 = objc_opt_new(NSMutableDictionary);
    v271 = 0u;
    v272 = 0u;
    v273 = 0u;
    v274 = 0u;
    v122 = v99;
    v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v271, v305, 16);
    if (v123)
    {
      v124 = v123;
      v125 = *(_QWORD *)v272;
      do
      {
        for (ii = 0; ii != v124; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v272 != v125)
            objc_enumerationMutation(v122);
          v127 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * (_QWORD)ii);
          if (objc_msgSend(v127, "hasPrefix:", CFSTR("MOEventCategorySignificantContact"))
            && objc_msgSend(v127, "hasSuffix:", CFSTR("ContactFrequency")))
          {
            v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v127));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v121, "setObject:forKeyedSubscript:", v128, v127);

          }
        }
        v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v271, v305, 16);
      }
      while (v124);
    }

    -[MOEventPatternDetector setPredicate:](v230, "setPredicate:", v228);
    -[MOEventPatternDetector setFeatureExtractor:](v230, "setFeatureExtractor:", v226);
    -[MOEventPatternDetector setAnomalyDetector:](v230, "setAnomalyDetector:", v224);
    v303[0] = CFSTR("ExcludeTextOnlyConversations");
    v261 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](v254->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("PD_SCF_ExcludeTextOnlyConversations"), 0)));
    v304[0] = v261;
    v303[1] = CFSTR("MinimumTextCount");
    LODWORD(v129) = 1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCF_MinimumTextCount"), v129);
    v221 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v304[1] = v221;
    v303[2] = CFSTR("MinimumTotalCallDuration");
    LODWORD(v130) = 1133903872;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCF_MinimumTotalCallDuration"), v130);
    v219 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v304[2] = v219;
    v303[3] = CFSTR("MaximumNumberOfContacts");
    LODWORD(v131) = 1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCF_MaximumNumberOfContacts"), v131);
    v217 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v304[3] = v217;
    v303[4] = CFSTR("TukeyFactorForExponentialDistributionOutlier");
    LODWORD(v132) = *(_DWORD *)"U0B@";
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCF_TukeyFactorForExponentialDistributionOutlier"), v132);
    v215 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v304[4] = v215;
    v303[5] = CFSTR("MinimumFeatureNumberForPersonalizedThreshold");
    LODWORD(v133) = 1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCF_MinimumFeatureNumberForPersonalizedThreshold"), v133);
    v213 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v304[5] = v213;
    v303[6] = CFSTR("MinimumFeatureSizeForPersonalizedThreshold");
    LODWORD(v134) = 2.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCF_MinimumFeatureSizeForPersonalizedThreshold"), v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v304[6] = v135;
    v303[7] = CFSTR("MaximumThreshold");
    LODWORD(v136) = 1125515264;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCF_MaximumThreshold"), v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v304[7] = v137;
    v303[8] = CFSTR("MinimumThreshold");
    LODWORD(v138) = 5.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCF_MinimumThreshold"), v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v304[8] = v139;
    v303[9] = CFSTR("BetaForEWAUpdate");
    LODWORD(v140) = 1064198944;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_SCF_BetaForEWAUpdate"), v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v304[9] = v141;
    v304[10] = &off_1002D8150;
    v303[10] = CFSTR("AnomalyFeatureType");
    v303[11] = CFSTR("AnomalyEWADictionariesForDetector");
    v199 = v121;
    v304[11] = v121;
    v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v304, v303, 12));
    -[MOEventPatternDetector configure:](v230, "configure:", v142);

    -[MOEventPatternDetector setPatternDetectorName:](v230, "setPatternDetectorName:", CFSTR("frequencySigContactAnomaly"));
    -[NSMutableArray addObject:](v255, "addObject:", v230);
    v222 = objc_opt_new(MOEventPatternDetector);
    v220 = objc_opt_new(MOEventPatternDetectorPredicateFilterByADPDCounts);
    v218 = objc_opt_new(MOEventPatternDetectorFeatureExtractorADPDCounts);
    v216 = objc_opt_new(MOEventPatternDetectorFeatureTransformerAggregateEvents);
    v214 = objc_opt_new(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA);
    v262 = objc_opt_new(NSMutableDictionary);
    v267 = 0u;
    v268 = 0u;
    v269 = 0u;
    v270 = 0u;
    v143 = v122;
    v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v267, v302, 16);
    if (v144)
    {
      v145 = v144;
      v146 = *(_QWORD *)v268;
      do
      {
        for (jj = 0; jj != v145; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v268 != v146)
            objc_enumerationMutation(v143);
          v148 = *(void **)(*((_QWORD *)&v267 + 1) + 8 * (_QWORD)jj);
          if (objc_msgSend(v148, "hasPrefix:", CFSTR("MOEventCategorySocialContextEvent"))
            && (objc_msgSend(v148, "hasSuffix:", CFSTR("HostingAtHomeAnomaly")) & 1) != 0
            || objc_msgSend(v148, "hasPrefix:", CFSTR("MOEventCategoryPeopleDensityEvent"))
            && objc_msgSend(v148, "hasSuffix:", CFSTR("HostingAtHomeAnomaly")))
          {
            v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v148));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v262, "setObject:forKeyedSubscript:", v149, v148);

          }
        }
        v145 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v267, v302, 16);
      }
      while (v145);
    }

    -[MOEventPatternDetector setPredicate:](v222, "setPredicate:", v220);
    -[MOEventPatternDetector setFeatureExtractor:](v222, "setFeatureExtractor:", v218);
    -[MOEventPatternDetector setFeatureTransformer:](v222, "setFeatureTransformer:", v216);
    -[MOEventPatternDetector setAnomalyDetector:](v222, "setAnomalyDetector:", v214);
    v300[0] = CFSTR("TukeyFactorForExponentialDistributionOutlier");
    LODWORD(v150) = 2.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_HAH_TukeyFactorForExponentialDistributionOutlier"), v150);
    v211 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v301[0] = v211;
    v300[1] = CFSTR("MinimumFeatureNumberForPersonalizedThreshold");
    LODWORD(v151) = 5.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_HAH_MinimumFeatureNumberForPersonalizedThreshold"), v151);
    v209 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v301[1] = v209;
    v300[2] = CFSTR("MinimumFeatureSizeForPersonalizedThreshold");
    LODWORD(v152) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_HAH_MinimumFeatureSizeForPersonalizedThreshold"), v152);
    v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v301[2] = v207;
    v300[3] = CFSTR("MaximumThreshold");
    LODWORD(v153) = 20.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_HAH_MaximumThreshold"), v153);
    v205 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v301[3] = v205;
    v300[4] = CFSTR("MinimumThreshold");
    LODWORD(v154) = 3.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_HAH_MinimumThreshold"), v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v301[4] = v155;
    v300[5] = CFSTR("BetaForEWAUpdate");
    LODWORD(v156) = 1064198944;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_HAH_BetaForEWAUpdate"), v156);
    v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v301[5] = v157;
    v300[6] = CFSTR("AggregationType");
    LODWORD(v158) = 1.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_HAH_AggregationType"), v158);
    v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v301[6] = v159;
    v300[7] = CFSTR("AggregationWindow");
    v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v254->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("PD_HAH_AggregationWindow"), 16)));
    v301[7] = v160;
    v301[8] = &off_1002D8198;
    v300[8] = CFSTR("AnomalyFeatureType");
    v300[9] = CFSTR("AnomalyEWADictionariesForDetector");
    v301[9] = v262;
    v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v301, v300, 10));
    -[MOEventPatternDetector configure:](v222, "configure:", v161);

    -[MOEventPatternDetector setPatternDetectorName:](v222, "setPatternDetectorName:", CFSTR("hostingAtHomeAnomaly"));
    -[NSMutableArray addObject:](v255, "addObject:", v222);
    v212 = objc_opt_new(MOEventPatternDetector);
    v210 = objc_opt_new(MOEventPatternDetectorPredicateFilterTimeAtHome);
    v208 = objc_opt_new(MOEventPatternDetectorFeatureExtractorEventDuration);
    v206 = objc_opt_new(MOEventPatternDetectorFeatureTransformerAggregateEvents);
    v204 = objc_opt_new(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA);
    v162 = objc_opt_new(NSMutableDictionary);
    v263 = 0u;
    v264 = 0u;
    v265 = 0u;
    v266 = 0u;
    v163 = v143;
    v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v263, v299, 16);
    if (v164)
    {
      v165 = v164;
      v166 = *(_QWORD *)v264;
      do
      {
        for (kk = 0; kk != v165; kk = (char *)kk + 1)
        {
          if (*(_QWORD *)v264 != v166)
            objc_enumerationMutation(v163);
          v168 = *(void **)(*((_QWORD *)&v263 + 1) + 8 * (_QWORD)kk);
          if (objc_msgSend(v168, "hasPrefix:", CFSTR("MOEventTimeAtHomeAnomaly"))
            && objc_msgSend(v168, "hasSuffix:", CFSTR("TimeAtHomeAnomaly")))
          {
            v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v168));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v162, "setObject:forKeyedSubscript:", v169, v168);

          }
        }
        v165 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v263, v299, 16);
      }
      while (v165);
    }

    -[MOEventPatternDetector setPredicate:](v212, "setPredicate:", v210);
    -[MOEventPatternDetector setFeatureExtractor:](v212, "setFeatureExtractor:", v208);
    -[MOEventPatternDetector setFeatureTransformer:](v212, "setFeatureTransformer:", v206);
    -[MOEventPatternDetector setAnomalyDetector:](v212, "setAnomalyDetector:", v204);
    v297[0] = CFSTR("TukeyFactorForExponentialDistributionOutlier");
    LODWORD(v170) = 1068708659;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TAH_TukeyFactorForExponentialDistributionOutlier"), v170);
    v198 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v298[0] = v198;
    v297[1] = CFSTR("MinimumFeatureNumberForPersonalizedThreshold");
    LODWORD(v171) = 3.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TAH_MinimumFeatureNumberForPersonalizedThreshold"), v171);
    v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v298[1] = v197;
    v297[2] = CFSTR("MinimumFeatureSizeForPersonalizedThreshold");
    LODWORD(v172) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TAH_MinimumFeatureSizeForPersonalizedThreshold"), v172);
    v196 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v298[2] = v196;
    v297[3] = CFSTR("MaximumThreshold");
    LODWORD(v173) = 1200398336;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TAH_MaximumThreshold"), v173);
    v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v298[3] = v195;
    v297[4] = CFSTR("MinimumThreshold");
    LODWORD(v174) = 1193852928;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TAH_MinimumThreshold"), v174);
    v194 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v298[4] = v194;
    v297[5] = CFSTR("BetaForEWAUpdate");
    LODWORD(v175) = 1064198944;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TAH_BetaForEWAUpdate"), v175);
    v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v298[5] = v176;
    v297[6] = CFSTR("AggregationType");
    LODWORD(v177) = 0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v254->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("PD_TAH_AggregationType"), v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v298[6] = v178;
    v297[7] = CFSTR("AggregationWindow");
    v179 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v254->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("PD_TAH_AggregationWindow"), 16)));
    v298[7] = v179;
    v298[8] = &off_1002D81B0;
    v297[8] = CFSTR("AnomalyFeatureType");
    v297[9] = CFSTR("AnomalyEWADictionariesForDetector");
    v298[9] = v162;
    v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v298, v297, 10));
    -[MOEventPatternDetector configure:](v212, "configure:", v180);

    -[MOEventPatternDetector setPatternDetectorName:](v212, "setPatternDetectorName:", CFSTR("tahAnomaly"));
    -[NSMutableArray addObject:](v255, "addObject:", v212);
    v181 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
    v182 = objc_claimAutoreleasedReturnValue(v181);
    if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
    {
      v183 = -[NSMutableArray count](v255, "count");
      *(_DWORD *)buf = 67109120;
      v296 = v183;
      _os_log_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_DEFAULT, "Done constructing streaming detectors [%i constructed]", buf, 8u);
    }

    v184 = v202;
    v5 = v203;
  }
  else
  {
    v185 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
    v184 = objc_claimAutoreleasedReturnValue(v185);
    if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
      -[MOEventPatternManager _initializeStreamingTypeDetector].cold.1(v184, v186, v187, v188, v189, v190, v191, v192);
  }

  return v255;
}

- (id)_processEvents:(id)a3 forDetector:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  MOPerformanceMeasurement *v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  id os_log;
  NSObject *v24;
  id v25;
  NSMutableDictionary *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  id v39;
  NSObject *v40;
  _BOOL4 v41;
  const char *v42;
  MOPerformanceMeasurement *v44;
  MOEventPatternManager *v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD block[4];
  id v57;
  id v58;
  id v59;
  uint8_t v60[128];
  uint8_t buf[4];
  id v62;
  _BYTE v63[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
    if (objc_msgSend(v7, "count"))
    {
      v10 = 0;
      do
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v9, "addObject:", v11);

        ++v10;
      }
      while (v10 < (unint64_t)objc_msgSend(v7, "count"));
    }
    v12 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("MOEventPatternManager"), 1);
    -[MOPerformanceMeasurement startSession](v12, "startSession");
    v13 = objc_msgSend(v7, "count");
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __52__MOEventPatternManager__processEvents_forDetector___block_invoke;
    block[3] = &unk_1002AE810;
    v46 = v7;
    v15 = v7;
    v57 = v15;
    v58 = v6;
    v16 = v9;
    v59 = v16;
    dispatch_apply((size_t)v13, queue, block);
    v44 = v12;
    -[MOPerformanceMeasurement endSession](v12, "endSession");
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
          if (v22 && objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i), "count"))
            -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      }
      while (v19);
    }
    v45 = self;
    v47 = v6;

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = -[NSMutableArray count](v8, "count");
      *(_DWORD *)buf = 134217984;
      v62 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Finished running pattern detectors and generated %lu results", buf, 0xCu);
    }

    v26 = objc_opt_new(NSMutableDictionary);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v27 = v15;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(_QWORD *)v49 != v30)
            objc_enumerationMutation(v27);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j), "getAnomalyDetector"));
          if (v33)
          {
            v34 = objc_opt_class(MOEventPatternDetectorAnomalyDetectorExponentialDistributionWithEWA, v32);
            if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "getAnomalyDetectorDict"));
              v36 = v35;
              if (v35 && objc_msgSend(v35, "count"))
                -[NSMutableDictionary addEntriesFromDictionary:](v26, "addEntriesFromDictionary:", v36);

            }
          }

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      }
      while (v29);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventStore getEWAPlistFileURL](v45->_eventStore, "getEWAPlistFileURL"));
    v6 = v47;
    if (!v37)
      goto LABEL_38;
    v38 = -[MOEventStore persistEWAMetrics:withData:](v45->_eventStore, "persistEWAMetrics:withData:", v37, v26);
    v39 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
    if (v38)
    {
      if (v41)
      {
        *(_WORD *)buf = 0;
        v42 = "Writing to EWA pList successful";
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, v42, buf, 2u);
      }
    }
    else if (v41)
    {
      *(_WORD *)buf = 0;
      v42 = "Writing to EWA pList failed";
      goto LABEL_36;
    }

LABEL_38:
    v7 = v46;
  }

  return v8;
}

void __52__MOEventPatternManager__processEvents_forDetector___block_invoke(uint64_t a1, uint64_t a2)
{
  double Current;
  void *v5;
  void *v6;
  double v7;
  id os_log;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  double v14;

  Current = CFAbsoluteTimeGetCurrent();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processEvents:", *(_QWORD *)(a1 + 40)));
  if (v6)
    objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v6, a2);
  v7 = CFAbsoluteTimeGetCurrent();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "patternDetectorName"));
    v11 = 138412546;
    v12 = v10;
    v13 = 2048;
    v14 = v7 - Current;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PatternDetector for %@ took %f secs to complete", (uint8_t *)&v11, 0x16u);

  }
}

- (id)processEvents:(id)a3 withRefreshVariant:(unint64_t)a4 forDateInterval:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  NSMutableArray *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id os_log;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  int v31;
  uint64_t v32;
  __int16 v33;
  unint64_t v34;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  v11 = &__NSArray0__struct;
  switch(__ROR8__(a4, 8))
  {
    case 0:
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(&v14->super.super, OS_LOG_TYPE_ERROR))
        -[MOEventPatternManager processEvents:withRefreshVariant:forDateInterval:].cold.1(&v14->super.super, v21, v22, v23, v24, v25, v26, v27);
      goto LABEL_13;
    case 1:
    case 3:
    case 5:
      objc_msgSend(v9, "duration");
      if (v12 >= 2419200.0)
      {
        v14 = objc_opt_new(NSMutableArray);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternManager _initializeBatchedTypeDetector](self, "_initializeBatchedTypeDetector"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternManager _initializeStreamingTypeDetector](self, "_initializeStreamingTypeDetector"));
        -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v17);
        -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v16);
        v18 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Running streaming and batched pattern detectors", (uint8_t *)&v31, 2u);
        }

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternManager _processEvents:forDetector:](self, "_processEvents:forDetector:", v8, v14));
      }
      else
      {
        v13 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
        v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(&v14->super.super, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "duration");
          v31 = 134218240;
          v32 = v15;
          v33 = 2048;
          v34 = a4;
          _os_log_impl((void *)&_mh_execute_header, &v14->super.super, OS_LOG_TYPE_INFO, "Have only %f days of data, not running batched detectors for variant %lu", (uint8_t *)&v31, 0x16u);
        }
      }
      goto LABEL_13;
    case 2:
      v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MOEventPatternManager _initializeStreamingTypeDetector](self, "_initializeStreamingTypeDetector"));
      v28 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Running streaming pattern detectors", (uint8_t *)&v31, 2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventPatternManager _processEvents:forDetector:](self, "_processEvents:forDetector:", v8, v14));
LABEL_13:

      break;
    default:
      break;
  }

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_universe, 0);
}

- (void)_initializeStreamingTypeDetector
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "EWA persistence plist read error, so returning empty array of streaming type pattern detectors", a5, a6, a7, a8, 0);
}

- (void)processEvents:(uint64_t)a3 withRefreshVariant:(uint64_t)a4 forDateInterval:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Refresh variant Unknown", a5, a6, a7, a8, 0);
}

@end
