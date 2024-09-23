@implementation RTVisitMetrics

- (RTVisitMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_learnedLocationStore_locationStore_motionActivityManager_visitManager_);
}

- (RTVisitMetrics)initWithDistanceCalculator:(id)a3 learnedLocationStore:(id)a4 locationStore:(id)a5 motionActivityManager:(id)a6 visitManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  RTVisitMetrics *v18;
  id *p_isa;
  RTVisitMetrics *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v25;
  id v26;
  objc_super v27;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_18;
  }
  if (!v14)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_17;
  }
  if (!v15)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: locationStore";
    goto LABEL_17;
  }
  if (!v16)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: motionActivityManager";
      goto LABEL_17;
    }
LABEL_18:

    v20 = 0;
    goto LABEL_19;
  }
  v26 = v17;
  if (v17)
  {
    v27.receiver = self;
    v27.super_class = (Class)RTVisitMetrics;
    v18 = -[RTVisitMetrics init](&v27, sel_init);
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_distanceCalculator, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitManager", buf, 2u);
    }

    v20 = 0;
  }
  v21 = v26;
LABEL_19:

  return v20;
}

- (id)metricForPipelineConfiguration:(unint64_t)a3 previousVisit:(id)a4 visit:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  RTDistanceCalculator *distanceCalculator;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  RTDistanceCalculator *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
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
  void *v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  RTDistanceCalculator *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  RTDistanceCalculator *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  id v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  int v140;
  double v141;
  double v142;
  double v143;
  void *v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  _BOOL8 v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  const __CFString *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  id v206;
  void *v207;
  void *v208;
  void *v209;
  uint8_t buf[4];
  id v211;
  uint64_t v212;

  v212 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "entry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_opt_new();
    objc_msgSend(v9, "exit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v9, "date");
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "entry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "isBeforeDate:", v16);

    if (v17)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v211 = v9;
        _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "end date is before entry date for visit, %@", buf, 0xCu);
      }

      v15 = 0;
      goto LABEL_105;
    }
    v209 = v8;
    v19 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v9, "entry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithStartDate:endDate:", v20, v14);

    v207 = (void *)v21;
    -[RTVisitMetrics locationStoreMetricsForInterval:](self, "locationStoreMetricsForInterval:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "signalEnvironment"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v23, CFSTR("signal_environment_type"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "firstFixType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v24, CFSTR("entry_fix_type"));

    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "firstFixHorizontalUncertainty");
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v26, CFSTR("entry_fix_horizontal_uncertainty"));

    v27 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v14, "dateByAddingTimeInterval:", 60.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithStartDate:endDate:", v14, v28);

    v205 = (void *)v29;
    -[RTVisitMetrics locationStoreMetricsForInterval:](self, "locationStoreMetricsForInterval:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v30, "firstFixType"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v31, CFSTR("exit_fix_type"));

    v32 = (void *)MEMORY[0x1E0CB37E8];
    v204 = v30;
    objc_msgSend(v30, "firstFixHorizontalUncertainty");
    objc_msgSend(v32, "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v33, CFSTR("exit_fix_horizontal_uncertainty"));

    -[RTVisitMetrics predominantMotionMetricsForVisit:isPreviousVisit:](self, "predominantMotionMetricsForVisit:isPreviousVisit:", v9, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v34);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v35, CFSTR("pipelineConfiguration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "type"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v36, CFSTR("type"));

    v37 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "location");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "horizontalUncertainty");
    objc_msgSend(v37, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v39, CFSTR("uncertainty"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v40, CFSTR("dataPointCount"));

    v41 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "maxIntervalBetweenLocations");
    objc_msgSend(v41, "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v42, CFSTR("maxIntervalBetweenLocations"));

    v43 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "spread");
    objc_msgSend(v43, "numberWithDouble:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v44, CFSTR("2dSpread"));

    v45 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "confidence");
    objc_msgSend(v45, "numberWithDouble:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v46, CFSTR("confidence"));

    objc_msgSend(v9, "entry");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = v14;
    if (v47)
    {
      objc_msgSend(v9, "exit");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        objc_msgSend(v9, "exit");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "entry");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "timeIntervalSinceDate:", v50);
        v52 = v51;

      }
      else
      {
        v52 = 1.79769313e308;
      }

    }
    else
    {
      v52 = 1.79769313e308;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v53, CFSTR("dwellInterval"));

    v54 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "date");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exit");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (!v56)
    {
      objc_msgSend(v9, "entry");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v55, "timeIntervalSinceDate:", v57);
    objc_msgSend(v54, "numberWithDouble:");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v58, CFSTR("detectionLatency"));

    if (!v56)
    -[RTVisitMetrics motionMetricsForDateInterval:](self, "motionMetricsForDateInterval:", v207);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v59);

    -[RTVisitMetrics _nearbyLoisFromVisit:](self, "_nearbyLoisFromVisit:", v9);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v60, "count"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v61, CFSTR("nearbyLoiCount"));

    v203 = v60;
    if (objc_msgSend(v60, "count"))
    {
      objc_msgSend(v9, "location");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitMetrics _closestLoi:location:](self, "_closestLoi:location:", v60, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = (void *)MEMORY[0x1E0CB37E8];
      distanceCalculator = self->_distanceCalculator;
      objc_msgSend(v9, "location");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "location");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "location");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v66, v68, 0);
      objc_msgSend(v64, "numberWithDouble:");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v69, CFSTR("distanceFromClosestLoi"));

      v70 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v63, "visits");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "numberWithUnsignedInteger:", objc_msgSend(v71, "count"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v72, CFSTR("visitCountOfClosestLoi"));

      v73 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v63, "place");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "numberWithUnsignedInteger:", objc_msgSend(v74, "type"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v75, CFSTR("closestLoiType"));

    }
    else
    {
      v63 = 0;
    }
    -[RTVisitMetrics _associatedLoiFromVisit:](self, "_associatedLoiFromVisit:", v9);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v209;
    v202 = v63;
    v208 = v76;
    if (v76)
    {
      v78 = self->_distanceCalculator;
      objc_msgSend(v9, "location");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "location");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "location");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDistanceCalculator distanceFromLocation:toLocation:error:](v78, "distanceFromLocation:toLocation:error:", v79, v81, 0);
      v83 = v82;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v84, CFSTR("distanceFromAssociatedLoi"));

      v85 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v76, "visits");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "numberWithUnsignedInteger:", objc_msgSend(v86, "count"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v87, CFSTR("visitCountOfAssociatedLoi"));

      v88 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v76, "place");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "numberWithUnsignedInteger:", objc_msgSend(v89, "type"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v90, CFSTR("associatedLoiType"));

      v91 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v76, "location");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "location");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "horizontalUncertainty");
      objc_msgSend(v91, "numberWithDouble:");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v94, CFSTR("horizontalUncertaintyOfAssociatedLoi"));

      objc_msgSend(v76, "location");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "location");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "horizontalUncertainty");
      v98 = v97;

      if (v98 != 0.0)
      {
        v99 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v76, "location");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "location");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "horizontalUncertainty");
        objc_msgSend(v99, "numberWithDouble:", v83 / v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v103, CFSTR("ratioBetweenDistanceAndHorizontalUncertainty"));

      }
      v77 = v209;
      if (v63)
      {
        v104 = (void *)MEMORY[0x1E0CB37E8];
        v105 = self->_distanceCalculator;
        objc_msgSend(v63, "location");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "location");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "location");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "location");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTDistanceCalculator distanceFromLocation:toLocation:error:](v105, "distanceFromLocation:toLocation:error:", v107, v109, 0);
        objc_msgSend(v104, "numberWithDouble:");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v110, CFSTR("distanceBetweenAssociatedLoiAndClosestLoi"));

        v76 = v208;
        v77 = v209;

      }
    }
    v111 = MEMORY[0x1E0C9AAB0];
    v112 = MEMORY[0x1E0C9AAA0];
    if (v77)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v77, "type"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v113, CFSTR("previousVisitType"));

      v114 = (void *)MEMORY[0x1E0CB37E8];
      v115 = self->_distanceCalculator;
      objc_msgSend(v9, "location");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "location");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTDistanceCalculator distanceFromLocation:toLocation:error:](v115, "distanceFromLocation:toLocation:error:", v116, v117, 0);
      objc_msgSend(v114, "numberWithDouble:");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v118, CFSTR("distanceFromPreviousVisit"));

      v119 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "entry");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v120;
      if (!v120)
      {
        objc_msgSend(v9, "exit");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v77, "exit");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = v122;
      if (!v122)
      {
        objc_msgSend(v209, "entry");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v121, "timeIntervalSinceDate:", v123);
      objc_msgSend(v119, "numberWithDouble:");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v124, CFSTR("timeIntervalSincePreviousVisit"));

      if (!v122)
      if (!v120)

      -[RTVisitMetrics _associatedLoiFromVisit:](self, "_associatedLoiFromVisit:", v209);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = (void *)MEMORY[0x1E0CB37E8];
      v200 = v125;
      objc_msgSend(v125, "place");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "numberWithUnsignedInteger:", objc_msgSend(v127, "type"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v128, CFSTR("previousVisit_associated_loi_type"));

      objc_msgSend(v9, "exit");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = v129;
      if (v129)
      {
        v131 = v129;
      }
      else
      {
        objc_msgSend(v9, "entry");
        v131 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v209, "exit");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = v132;
      if (v132)
      {
        v134 = v132;
      }
      else
      {
        objc_msgSend(v209, "entry");
        v134 = (id)objc_claimAutoreleasedReturnValue();

      }
      v198 = v134;
      v199 = v131;
      objc_msgSend(v131, "timeIntervalSinceDate:", v134);
      v136 = v135;
      objc_msgSend(v9, "placeInference");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "loiIdentifier");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "placeInference");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "loiIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v138, "isEqual:", v77);

      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("is_reentry"));
      v76 = v208;
      if (v208)
      {
        if (v200)
        {
          if (v140)
          {
            objc_msgSend(v9, "confidence");
            v141 = *MEMORY[0x1E0D185C8];
            if (v142 == *MEMORY[0x1E0D185C8] && objc_msgSend(v9, "type") == 1)
            {
              objc_msgSend(v209, "confidence");
              if (v143 == v141 && objc_msgSend(v209, "type") == 3 && v136 < 240.0)
                -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("is_reentry"));
            }
          }
        }
      }
      objc_msgSend(v209, "exit");
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      if (v144)
      {
        v145 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v209, "entry");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "exit");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = (void *)objc_msgSend(v145, "initWithStartDate:endDate:", v146, v147);

        -[RTVisitMetrics locationStoreMetricsForInterval:](self, "locationStoreMetricsForInterval:", v197);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v148, "firstFixType"));
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v149, CFSTR("previousVisit_entry_fix_type"));

        v150 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v148, "firstFixHorizontalUncertainty");
        objc_msgSend(v150, "numberWithDouble:");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v151, CFSTR("previousVisit_entry_fix_horizontal_uncertainty"));

        v152 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v209, "exit");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "exit");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "dateByAddingTimeInterval:", 60.0);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)objc_msgSend(v152, "initWithStartDate:endDate:", v153, v155);

        -[RTVisitMetrics locationStoreMetricsForInterval:](self, "locationStoreMetricsForInterval:", v77);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v156, "firstFixType"));
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v157, CFSTR("previousVisit_exit_fix_type"));

        v158 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v156, "firstFixHorizontalUncertainty");
        objc_msgSend(v158, "numberWithDouble:");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v159, CFSTR("previousVisit_exit_fix_horizontal_uncertainty"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v148, "signalEnvironment"));
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v160, CFSTR("previousVisit_signal_environment_type"));

        -[RTVisitMetrics predominantMotionMetricsForVisit:isPreviousVisit:](self, "predominantMotionMetricsForVisit:isPreviousVisit:", v209, 1);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v161);

        v76 = v208;
        -[RTVisitMetrics predominantMotionMetricsForTransitionForVisit:previousVisit:](self, "predominantMotionMetricsForTransitionForVisit:previousVisit:", v9, v209);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v162);

      }
      v111 = MEMORY[0x1E0C9AAB0];
      v112 = MEMORY[0x1E0C9AAA0];
    }
    objc_msgSend(v9, "placeInference");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    if (v163)
      v164 = v111;
    else
      v164 = v112;
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v164, CFSTR("hasPlaceInference"));

    v165 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v9, "entry");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("entryDate"), v166);
    v167 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v76, "visits");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = (void *)v167;
    objc_msgSend(v168, "filteredArrayUsingPredicate:", v167);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v169, "count"))
      v170 = v111;
    else
      v170 = v112;
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v170, CFSTR("previouslyVisited"));

    v171 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "placeInference");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "confidence");
    objc_msgSend(v171, "numberWithDouble:");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v173, CFSTR("place_confidence"));

    objc_msgSend(v9, "placeInference");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "mapItem");
    v175 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v175, "validMUID"));
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v176, CFSTR("place_hasMuid"));

    v177 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v175, "address");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "thoroughfare");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    if (v179)
    {
      v180 = 1;
    }
    else
    {
      objc_msgSend(v175, "address");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "mergedThoroughfare");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = v172 != 0;
    }
    objc_msgSend(v177, "numberWithInt:", v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v181, CFSTR("place_hasStreetAddress"));

    if (!v179)
    {

    }
    v182 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v175, "address");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "iso3166SubdivisionCode");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "numberWithInt:", v184 != 0);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v185, CFSTR("place_hasSubdivision"));

    v186 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v175, "address");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "iso3166CountryCode");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "numberWithInt:", v188 != 0);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v189, CFSTR("place_hasTerritory"));

    v190 = MEMORY[0x1E0C9AAA0];
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("place_source_BluePOI"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_Contacts"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_EventKit"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_ForwardGeocode"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_LearnedPlace"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_LocalSearch"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_MapItemHandle"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_MapItemURL"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_MapsSupportFavorite"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_MapsSupportHistoryEntryPlaceDisplay"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_MapsSupportHistoryEntryRoute"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_Portrait"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_ProactiveExperts"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_ReverseGeocode"));
    v191 = CFSTR("place_source_Unknown");
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_Unknown"));
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v190, CFSTR("place_source_User"));
    v8 = v209;
    if (objc_msgSend(v175, "source"))
    {
      v192 = v207;
      if ((objc_msgSend(v175, "source") & 1) != 0 || (objc_msgSend(v175, "source") & 0x40000) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_ReverseGeocode"));
      if ((objc_msgSend(v175, "source") & 2) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_ForwardGeocode"));
      if ((objc_msgSend(v175, "source") & 4) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_Contacts"));
      if ((objc_msgSend(v175, "source") & 8) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_User"));
      if ((objc_msgSend(v175, "source") & 0x10) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_MapsSupportFavorite"));
      if ((objc_msgSend(v175, "source") & 0x40) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_MapsSupportHistoryEntryRoute"));
      if ((objc_msgSend(v175, "source") & 0x80) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_MapsSupportHistoryEntryPlaceDisplay"));
      if ((objc_msgSend(v175, "source") & 0x100) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_EventKit"));
      if ((objc_msgSend(v175, "source") & 0x200) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_LocalSearch"));
      if ((objc_msgSend(v175, "source") & 0x400) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_MapItemHandle"));
      if ((objc_msgSend(v175, "source") & 0x800) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_ProactiveExperts"));
      if ((objc_msgSend(v175, "source") & 0x1000) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_Portrait"));
      if ((objc_msgSend(v175, "source") & 0x2000) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_LearnedPlace"));
      if ((objc_msgSend(v175, "source") & 0x4000) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_BluePOI"));
      if ((objc_msgSend(v175, "source") & 0x8000) != 0)
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("place_source_MapItemURL"));
      if ((objc_msgSend(v175, "source") & 0x80000) == 0)
        goto LABEL_104;
      v191 = CFSTR("place_source_POIHistory");
    }
    else
    {
      v192 = v207;
    }
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v191);
LABEL_104:
    v193 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "location");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "numberWithUnsignedInteger:", objc_msgSend(v194, "sourceAccuracy"));
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v195, CFSTR("sourceAccuracy"));

    v15 = v11;
    v14 = v206;
LABEL_105:

    goto LABEL_106;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit.entry", buf, 2u);
  }
  v15 = 0;
LABEL_106:

  return v15;
}

- (id)locationStoreMetricsForInterval:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  RTLocationStoreMetricOptions *v6;
  RTLocationStore *locationStore;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  NSObject *v31;
  uint8_t *v32;
  uint8_t v33[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint8_t buf[8];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    *(_QWORD *)v33 = 0;
    v34 = v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__30;
    v37 = __Block_byref_object_dispose__30;
    v38 = 0;
    v5 = dispatch_semaphore_create(0);
    v6 = -[RTLocationStoreMetricOptions initWithDateInterval:uncertaintyThreshold:includeFixMetrics:includeSignalEnvironment:]([RTLocationStoreMetricOptions alloc], "initWithDateInterval:uncertaintyThreshold:includeFixMetrics:includeSignalEnvironment:", v4, 1, 1, 235.0);
    locationStore = self->_locationStore;
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __50__RTVisitMetrics_locationStoreMetricsForInterval___block_invoke;
    v30 = &unk_1E929A6B8;
    v32 = v33;
    v8 = v5;
    v31 = v8;
    -[RTLocationStore fetchMetricsWithOptions:handler:](locationStore, "fetchMetricsWithOptions:handler:", v6, &v27);
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now", v27, v28, v29, v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v9, v11))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v10);
      v14 = v13;
      v15 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filteredArrayUsingPredicate:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "submitToCoreAnalytics:type:duration:", v19, 1, v14);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v21 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v39, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
    }

    v24 = *((id *)v34 + 5);
    _Block_object_dispose(v33, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v33 = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", v33, 2u);
    }

    v24 = (id)objc_opt_new();
  }

  return v24;
}

void __50__RTVisitMetrics_locationStoreMetricsForInterval___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)predominantMotionMetricsForVisit:(id)a3 isPreviousVisit:(BOOL)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  void *v10;
  RTMotionActivityManager *motionActivityManager;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  char v30;
  NSObject *v31;
  id v32;
  dispatch_semaphore_t v33;
  void *v34;
  void *v35;
  RTMotionActivityManager *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  dispatch_time_t v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  char v54;
  id v55;
  _QWORD *v56;
  NSObject *v57;
  NSObject *v58;
  void *v60;
  void *v61;
  _QWORD v62[4];
  NSObject *v63;
  uint8_t *v64;
  BOOL v65;
  _QWORD v66[4];
  NSObject *v67;
  uint8_t *v68;
  BOOL v69;
  uint8_t buf[8];
  uint8_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint8_t v77[16];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v71 = buf;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__30;
    v74 = __Block_byref_object_dispose__30;
    v75 = (id)objc_opt_new();
    v7 = dispatch_semaphore_create(0);
    if (objc_msgSend(v6, "type") == 1)
    {
      objc_msgSend(v6, "entry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateByAddingTimeInterval:", -60.0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "entry");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateByAddingTimeInterval:", 1800.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      motionActivityManager = self->_motionActivityManager;
      objc_msgSend(v6, "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "earlierDate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __67__RTVisitMetrics_predominantMotionMetricsForVisit_isPreviousVisit___block_invoke;
      v66[3] = &unk_1E929A6E0;
      v69 = a4;
      v68 = buf;
      v14 = v7;
      v67 = v14;
      -[RTMotionActivityManager fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:](motionActivityManager, "fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:", v61, v13, v66);

      v7 = v14;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v7, v16))
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", v15);
      v19 = v18;
      v20 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v77, 2u);
      }

      v26 = (void *)MEMORY[0x1E0CB35C8];
      v76 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v77 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = objc_retainAutorelease(v28);

        v30 = 0;
      }
      else
      {
LABEL_17:
        v29 = 0;
        v30 = 1;
      }

      v55 = v29;
      if ((v30 & 1) != 0)
      {
        v56 = v66;
LABEL_27:

        goto LABEL_28;
      }
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v77 = 0;
        _os_log_error_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_ERROR, "Could not collect entry time interval of motion metrics", v77, 2u);
      }

    }
    else
    {
      if (objc_msgSend(v6, "type") != 3)
      {
        v55 = 0;
LABEL_28:
        v32 = *((id *)v71 + 5);
LABEL_33:

        _Block_object_dispose(buf, 8);
        goto LABEL_34;
      }
      v33 = dispatch_semaphore_create(0);

      objc_msgSend(v6, "exit");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "dateByAddingTimeInterval:", -60.0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "exit");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dateByAddingTimeInterval:", 1800.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = self->_motionActivityManager;
      objc_msgSend(v6, "date");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "earlierDate:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __67__RTVisitMetrics_predominantMotionMetricsForVisit_isPreviousVisit___block_invoke_144;
      v62[3] = &unk_1E929A6E0;
      v65 = a4;
      v64 = buf;
      v39 = v33;
      v63 = v39;
      -[RTMotionActivityManager fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:](v36, "fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:", v61, v38, v62);

      v7 = v39;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v7, v41))
        goto LABEL_24;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "timeIntervalSinceDate:", v40);
      v43 = v42;
      v44 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "filteredArrayUsingPredicate:", v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "firstObject");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "submitToCoreAnalytics:type:duration:", v48, 1, v43);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v77, 2u);
      }

      v50 = (void *)MEMORY[0x1E0CB35C8];
      v76 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v77 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        v53 = objc_retainAutorelease(v52);

        v54 = 0;
      }
      else
      {
LABEL_24:
        v53 = 0;
        v54 = 1;
      }

      v55 = v53;
      if ((v54 & 1) != 0)
      {
        v56 = v62;
        goto LABEL_27;
      }
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v77 = 0;
        _os_log_error_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_ERROR, "Could not collect exit time interval of motion metrics", v77, 2u);
      }

    }
    v32 = 0;
    goto LABEL_33;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
  }

  v32 = (id)objc_opt_new();
LABEL_34:

  return v32;
}

intptr_t __67__RTVisitMetrics_predominantMotionMetricsForVisit_isPreviousVisit___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  void *v4;
  const __CFString *v5;

  v3 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = CFSTR("previousVisit_motion_state_entry");
  else
    v5 = CFSTR("motion_state_entry");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v4, v5);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __67__RTVisitMetrics_predominantMotionMetricsForVisit_isPreviousVisit___block_invoke_144(uint64_t a1, uint64_t a2)
{
  int v3;
  void *v4;
  const __CFString *v5;

  v3 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = CFSTR("previousVisit_motion_state_exit");
  else
    v5 = CFSTR("motion_state_exit");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v4, v5);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)predominantMotionMetricsForTransitionForVisit:(id)a3 previousVisit:(id)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  RTMotionActivityManager *motionActivityManager;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  char v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v36;
  const char *aSelector;
  id v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[24];
  _QWORD v49[3];

  aSelector = a2;
  v49[1] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v6 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__30;
  v46 = __Block_byref_object_dispose__30;
  v47 = (id)objc_opt_new();
  v7 = dispatch_semaphore_create(0);
  objc_msgSend(v6, "exit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 1800.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  motionActivityManager = self->_motionActivityManager;
  objc_msgSend(v6, "exit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "entry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "earlierDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __78__RTVisitMetrics_predominantMotionMetricsForTransitionForVisit_previousVisit___block_invoke;
  v39[3] = &unk_1E929A708;
  v41 = &v42;
  v14 = v7;
  v40 = v14;
  -[RTMotionActivityManager fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:](motionActivityManager, "fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:", v11, v13, v39);

  v15 = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v15, v17))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v16);
  v20 = v19;
  v21 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filteredArrayUsingPredicate:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "submitToCoreAnalytics:type:duration:", v25, 1, v20);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v27 = (void *)MEMORY[0x1E0CB35C8];
  v49[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v49, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_retainAutorelease(v29);

    v31 = 0;
  }
  else
  {
LABEL_6:
    v30 = 0;
    v31 = 1;
  }

  v32 = v30;
  if ((v31 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v36;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@ timed out", buf, 0xCu);

    }
  }
  v34 = (id)v43[5];

  _Block_object_dispose(&v42, 8);
  return v34;
}

intptr_t __78__RTVisitMetrics_predominantMotionMetricsForTransitionForVisit_previousVisit___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v3, CFSTR("motion_state_transition"));

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)motionMetricsForDateInterval:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  RTMotionActivityManager *motionActivityManager;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  RTMotionActivityHistogram *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  RTMotionActivityHistogram *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  unint64_t v37;
  __CFString *v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  unint64_t v45;
  void *v46;
  id v48;
  void *v49;
  NSObject *dsema;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  NSObject *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _BYTE v73[128];
  uint64_t v74;
  uint8_t buf[16];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52 = (id)objc_opt_new();
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__30;
  v71 = __Block_byref_object_dispose__30;
  v72 = 0;
  v61 = 0;
  v62 = (id *)&v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__30;
  v65 = __Block_byref_object_dispose__30;
  v66 = 0;
  v5 = dispatch_semaphore_create(0);
  v51 = v4;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", 3600.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  motionActivityManager = self->_motionActivityManager;
  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "earlierDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __47__RTVisitMetrics_motionMetricsForDateInterval___block_invoke;
  v57[3] = &unk_1E9296EE0;
  v59 = &v67;
  v60 = &v61;
  v11 = v5;
  v58 = v11;
  -[RTMotionActivityManager fetchMotionActivitiesFromStartDate:endDate:handler:](motionActivityManager, "fetchMotionActivitiesFromStartDate:endDate:handler:", v8, v10, v57);

  dsema = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v13))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v12);
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v23 = (void *)MEMORY[0x1E0CB35C8];
  v74 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v74, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_retainAutorelease(v25);

    v27 = 0;
  }
  else
  {
LABEL_6:
    v26 = 0;
    v27 = 1;
  }

  v48 = v26;
  if ((v27 & 1) == 0)
    objc_storeStrong(v62 + 5, v26);
  v28 = [RTMotionActivityHistogram alloc];
  v29 = v68[5];
  objc_msgSend(v51, "startDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "endDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[RTMotionActivityHistogram initWithActivites:betweenDate:andDate:](v28, "initWithActivites:betweenDate:andDate:", v29, v30, v31);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v33 = objc_msgSend(&unk_1E932C130, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v54 != v34)
          objc_enumerationMutation(&unk_1E932C130);
        v36 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v37 = objc_msgSend(v36, "unsignedIntegerValue");
        if (v37 < 7)
        {
          v38 = off_1E929A748[v37];
          -[RTMotionActivityHistogram totalInterval](v32, "totalInterval");
          if (v39 <= 0.0)
          {
            v45 = 0;
          }
          else
          {
            -[RTMotionActivityHistogram binForType:](v32, "binForType:", objc_msgSend(v36, "unsignedIntegerValue"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "interval");
            v42 = v41;
            -[RTMotionActivityHistogram totalInterval](v32, "totalInterval");
            v44 = v43;

            v45 = (unint64_t)(v42 / v44 * 100.0 + 0.5);
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setObject:forKeyedSubscript:", v46, v38);

        }
      }
      v33 = objc_msgSend(&unk_1E932C130, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    }
    while (v33);
  }

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  return v52;
}

void __47__RTVisitMetrics_motionMetricsForDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)metricsForConfiguration:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  id v8;
  id *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a3 - 3 < 2)
  {
    -[RTVisitMetrics batchedMetricsForConfiguration:dateInterval:error:](self, "batchedMetricsForConfiguration:dateInterval:error:", a3, v8, a5);
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 - 1 <= 1)
  {
    -[RTVisitMetrics realtimeMetricsForConfiguration:dateInterval:error:](self, "realtimeMetricsForConfiguration:dateInterval:error:", a3, v8, a5);
    v9 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a5 = v9;
    goto LABEL_6;
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D18598];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("unsupported configuration");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_6:

  return a5;
}

- (id)batchedMetricsForConfiguration:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  dispatch_semaphore_t v8;
  RTLearnedLocationStore *learnedLocationStore;
  void *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  NSObject *v28;
  id v29;
  id v30;
  dispatch_semaphore_t v31;
  RTLearnedLocationStore *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  dispatch_time_t v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  char v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v68;
  void *v69;
  id v70;
  NSObject *dsema;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  NSObject *v78;
  uint8_t *v79;
  uint64_t *v80;
  _QWORD v81[4];
  NSObject *v82;
  uint8_t *v83;
  uint64_t *v84;
  uint64_t v85;
  id *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint8_t buf[8];
  uint8_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  _BYTE v97[128];
  uint64_t v98;
  id *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  uint8_t v104[8];
  uint8_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint64_t v110;
  uint8_t v111[16];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v70 = a4;
  if (a3 == 4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v92 = buf;
    v93 = 0x3032000000;
    v94 = __Block_byref_object_copy__30;
    v95 = __Block_byref_object_dispose__30;
    v96 = 0;
    v85 = 0;
    v86 = (id *)&v85;
    v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__30;
    v89 = __Block_byref_object_dispose__30;
    v90 = 0;
    v8 = dispatch_semaphore_create(0);
    learnedLocationStore = self->_learnedLocationStore;
    -[RTLearnedLocationStore predicateForObjectsFromCurrentDevice](learnedLocationStore, "predicateForObjectsFromCurrentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __68__RTVisitMetrics_batchedMetricsForConfiguration_dateInterval_error___block_invoke;
    v81[3] = &unk_1E9296EE0;
    v83 = buf;
    v84 = &v85;
    v11 = v8;
    v82 = v11;
    -[RTLearnedLocationStore fetchVisitsWithPredicate:ascending:dateInterval:limit:handler:](learnedLocationStore, "fetchVisitsWithPredicate:ascending:dateInterval:limit:handler:", v10, 1, v70, 0, v81);

    dsema = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v13))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v104 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v104, 2u);
    }

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v98 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v104 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, &v98, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = objc_retainAutorelease(v25);

      v27 = 0;
    }
    else
    {
LABEL_11:
      v26 = 0;
      v27 = 1;
    }

    v30 = v26;
    if ((v27 & 1) == 0)
      objc_storeStrong(v86 + 5, v26);
    if (objc_msgSend(*((id *)v92 + 5), "count"))
    {
      *(_QWORD *)v104 = 0;
      v105 = v104;
      v106 = 0x3032000000;
      v107 = __Block_byref_object_copy__30;
      v108 = __Block_byref_object_dispose__30;
      v109 = 0;
      v98 = 0;
      v99 = (id *)&v98;
      v100 = 0x3032000000;
      v101 = __Block_byref_object_copy__30;
      v102 = __Block_byref_object_dispose__30;
      v103 = 0;
      v31 = dispatch_semaphore_create(0);

      v32 = self->_learnedLocationStore;
      -[RTLearnedLocationStore predicateForObjectsFromCurrentDevice](v32, "predicateForObjectsFromCurrentDevice");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v92 + 5), "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "entryDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v34, "initWithStartDate:endDate:", v35, v37);
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __68__RTVisitMetrics_batchedMetricsForConfiguration_dateInterval_error___block_invoke_184;
      v77[3] = &unk_1E9296EE0;
      v79 = v104;
      v80 = &v98;
      v39 = v31;
      v78 = v39;
      -[RTLearnedLocationStore fetchVisitsWithPredicate:ascending:dateInterval:limit:handler:](v32, "fetchVisitsWithPredicate:ascending:dateInterval:limit:handler:", v33, 0, v38, &unk_1E9327140, v77);

      dsema = v39;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v41))
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "timeIntervalSinceDate:", v40);
      v44 = v43;
      v45 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "filteredArrayUsingPredicate:", v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "submitToCoreAnalytics:type:duration:", v49, 1, v44);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v111 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v111, 2u);
      }

      v51 = (void *)MEMORY[0x1E0CB35C8];
      v110 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v111 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, &v110, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        v54 = objc_retainAutorelease(v53);

        v55 = 0;
      }
      else
      {
LABEL_20:
        v55 = 1;
        v54 = v30;
      }

      v68 = v54;
      if ((v55 & 1) == 0)
        objc_storeStrong(v99 + 5, v54);
      if (objc_msgSend(*((id *)v105 + 5), "count", v68))
      {
        v56 = objc_alloc(MEMORY[0x1E0D18578]);
        objc_msgSend(*((id *)v105 + 5), "firstObject");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (void *)objc_msgSend(v56, "initWithLearnedVisit:", v57);

      }
      else
      {
        v58 = 0;
      }
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v59 = *((id *)v92 + 5);
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
      if (v60)
      {
        v61 = *(_QWORD *)v74;
        do
        {
          v62 = 0;
          v63 = v58;
          do
          {
            if (*(_QWORD *)v74 != v61)
              objc_enumerationMutation(v59);
            v64 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v62);
            v65 = (void *)MEMORY[0x1D8231EA8]();
            v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18578]), "initWithLearnedVisit:", v64);
            -[RTVisitMetrics metricForPipelineConfiguration:previousVisit:visit:](self, "metricForPipelineConfiguration:previousVisit:visit:", 4, v63, v58);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (v66)
              objc_msgSend(v72, "addObject:", v66);

            objc_autoreleasePoolPop(v65);
            ++v62;
            v63 = v58;
          }
          while (v60 != v62);
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
        }
        while (v60);
      }

      v29 = v72;
      _Block_object_dispose(&v98, 8);

      _Block_object_dispose(v104, 8);
      v30 = v69;
    }
    else
    {
      v29 = 0;
    }

    _Block_object_dispose(&v85, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration == RTVisitMetricsPipelineConfigurationBatchedHighConfidence", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("configuration == RTVisitMetricsPipelineConfigurationBatchedHighConfidence"));
      v29 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
  }

  return v29;
}

void __68__RTVisitMetrics_batchedMetricsForConfiguration_dateInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __68__RTVisitMetrics_batchedMetricsForConfiguration_dateInterval_error___block_invoke_184(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)realtimeMetricsForConfiguration:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  double *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  RTVisitManager *visitManager;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  char v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  dispatch_semaphore_t v38;
  RTVisitManager *v39;
  NSObject *v40;
  void *v41;
  dispatch_time_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  char v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *dsema;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  NSObject *v79;
  uint8_t *v80;
  uint64_t *v81;
  _QWORD v82[4];
  NSObject *v83;
  __int128 *p_buf;
  uint64_t *v85;
  uint64_t v86;
  id *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _BYTE v92[128];
  uint64_t v93;
  id *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint8_t v99[8];
  uint8_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  __int128 buf;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint64_t v110;
  uint8_t v111[8];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v71 = a4;
  if (a3 - 1 < 2)
  {
    if (a3 == 1)
    {
      v7 = (double *)MEMORY[0x1E0D185D0];
    }
    else
    {
      if (a3 != 2)
      {
        v70 = 0;
        goto LABEL_13;
      }
      v7 = (double *)MEMORY[0x1E0D185C8];
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v7);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18508]), "initWithAscending:confidence:dateInterval:labelVisit:limit:", 1, v70, v71, 1, 0);
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v69;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "visit metrics submission, realtime options, %@", (uint8_t *)&buf, 0xCu);
    }

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v71;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "visit metrics submission, dateinterval, %@", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v106 = 0x3032000000;
    v107 = __Block_byref_object_copy__30;
    v108 = __Block_byref_object_dispose__30;
    v109 = 0;
    v86 = 0;
    v87 = (id *)&v86;
    v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__30;
    v90 = __Block_byref_object_dispose__30;
    v91 = 0;
    v12 = dispatch_semaphore_create(0);
    visitManager = self->_visitManager;
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __69__RTVisitMetrics_realtimeMetricsForConfiguration_dateInterval_error___block_invoke;
    v82[3] = &unk_1E9296EE0;
    p_buf = &buf;
    v85 = &v86;
    v14 = v12;
    v83 = v14;
    -[RTVisitManager fetchStoredVisitsWithOptions:handler:](visitManager, "fetchStoredVisitsWithOptions:handler:", v69, v82);
    dsema = v14;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v16))
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v15);
    v19 = v18;
    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v99 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v99, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v93 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v99 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, &v93, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = objc_retainAutorelease(v28);

      v30 = 0;
    }
    else
    {
LABEL_22:
      v29 = 0;
      v30 = 1;
    }

    v31 = v29;
    if ((v30 & 1) == 0)
      objc_storeStrong(v87 + 5, v29);
    if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
    {
      v32 = objc_alloc(MEMORY[0x1E0D18508]);
      v33 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "entry");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v33, "initWithStartDate:endDate:", v34, v36);
      v68 = (void *)objc_msgSend(v32, "initWithAscending:confidence:dateInterval:labelVisit:limit:", 0, v70, v37, 1, &unk_1E9327140);

      *(_QWORD *)v99 = 0;
      v100 = v99;
      v101 = 0x3032000000;
      v102 = __Block_byref_object_copy__30;
      v103 = __Block_byref_object_dispose__30;
      v104 = 0;
      v93 = 0;
      v94 = (id *)&v93;
      v95 = 0x3032000000;
      v96 = __Block_byref_object_copy__30;
      v97 = __Block_byref_object_dispose__30;
      v98 = 0;
      v38 = dispatch_semaphore_create(0);

      v39 = self->_visitManager;
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __69__RTVisitMetrics_realtimeMetricsForConfiguration_dateInterval_error___block_invoke_2;
      v78[3] = &unk_1E9296EE0;
      v80 = v99;
      v81 = &v93;
      v40 = v38;
      v79 = v40;
      -[RTVisitManager fetchStoredVisitsWithOptions:handler:](v39, "fetchStoredVisitsWithOptions:handler:", v68, v78);
      dsema = v40;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v42))
        goto LABEL_31;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "timeIntervalSinceDate:", v41);
      v45 = v44;
      v46 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "filteredArrayUsingPredicate:", v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "firstObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "submitToCoreAnalytics:type:duration:", v50, 1, v45);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v111 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v111, 2u);
      }

      v52 = (void *)MEMORY[0x1E0CB35C8];
      v110 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v111 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, &v110, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        v55 = objc_retainAutorelease(v54);

        v56 = 0;
      }
      else
      {
LABEL_31:
        v56 = 1;
        v55 = v31;
      }

      v67 = v55;
      if ((v56 & 1) == 0)
        objc_storeStrong(v94 + 5, v55);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v100 + 5), "firstObject");
      v57 = (id)objc_claimAutoreleasedReturnValue();
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v58 = *(id *)(*((_QWORD *)&buf + 1) + 40);
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
      if (v59)
      {
        v60 = *(_QWORD *)v75;
        do
        {
          v61 = 0;
          v62 = v57;
          do
          {
            if (*(_QWORD *)v75 != v60)
              objc_enumerationMutation(v58);
            v63 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v61);
            v64 = (void *)MEMORY[0x1D8231EA8]();
            -[RTVisitMetrics metricForPipelineConfiguration:previousVisit:visit:](self, "metricForPipelineConfiguration:previousVisit:visit:", a3, v62, v63);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if (v65)
              objc_msgSend(v9, "addObject:", v65);
            v57 = v63;

            objc_autoreleasePoolPop(v64);
            ++v61;
            v62 = v57;
          }
          while (v59 != v61);
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
        }
        while (v59);
      }

      _Block_object_dispose(&v93, 8);
      _Block_object_dispose(v99, 8);

      v31 = v67;
    }
    else
    {
      v9 = 0;
    }

    _Block_object_dispose(&v86, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_46;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration == RTVisitMetricsPipelineConfigurationRealtimeLowConfidence || configuration == RTVisitMetricsPipelineConfigurationRealtimeHighConfidence", (uint8_t *)&buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("configuration == RTVisitMetricsPipelineConfigurationRealtimeLowConfidence || configuration == RTVisitMetricsPipelineConfigurationRealtimeHighConfidence"));
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_46:

  return v9;
}

void __69__RTVisitMetrics_realtimeMetricsForConfiguration_dateInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__RTVisitMetrics_realtimeMetricsForConfiguration_dateInterval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)collectRealtimeMetricsForDateInterval:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v12, 0xCu);

  }
  v10 = -[RTVisitMetrics collectMetricsForDateInterval:configurations:error:](self, "collectMetricsForDateInterval:configurations:error:", v7, &unk_1E932C148, a4);

  return v10;
}

- (BOOL)collectBatchedMetricsForDateInterval:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v12, 0xCu);

  }
  v10 = -[RTVisitMetrics collectMetricsForDateInterval:configurations:error:](self, "collectMetricsForDateInterval:configurations:error:", v7, &unk_1E932C160, a4);

  return v10;
}

- (BOOL)collectMetricsForDateInterval:(id)a3 configurations:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  void *v33;
  uint64_t v34;
  id v36;
  uint64_t v37;
  void *v38;
  void *context;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v36, "startDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringFromDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "endDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringFromDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v52 = (uint64_t)v28;
    v53 = 2112;
    v54 = v30;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "collecting metrics, startDate, %@, endDate, %@", buf, 0x16u);

  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v6;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v37)
  {
    v34 = *(_QWORD *)v47;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v47 != v34)
          objc_enumerationMutation(obj);
        v40 = v8;
        v9 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v8);
        context = (void *)MEMORY[0x1D8231EA8]();
        v10 = objc_msgSend(v9, "unsignedIntegerValue");
        v45 = 0;
        -[RTVisitMetrics metricsForConfiguration:dateInterval:error:](self, "metricsForConfiguration:dateInterval:error:", v10, v36, &v45);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v45;
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v23 = objc_msgSend(v11, "count");
          *(_DWORD *)buf = 134218498;
          v52 = v23;
          v53 = 2112;
          v54 = v9;
          v55 = 2112;
          v56 = v12;
          _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "collected %lu metrics for configuration, %@, error, %@", buf, 0x20u);
        }
        v38 = v12;

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v14 = v11;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v42 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              v20 = objc_alloc(MEMORY[0x1E0CB3940]);
              v21 = (void *)objc_msgSend(v20, "initWithCString:encoding:", RTAnalyticsEventVisitDetails, 1);
              log_analytics_submission(v21, v19);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              AnalyticsSendEvent();

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          }
          while (v16);
        }

        if (v38)
          objc_msgSend(v33, "addObject:", v38);

        objc_autoreleasePoolPop(context);
        v8 = v40 + 1;
      }
      while (v40 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v37);
  }

  v24 = objc_msgSend(v33, "count");
  if (a5 && v24)
  {
    _RTSafeArray();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 1;
}

- (id)_nearbyLoisFromVisit:(id)a3
{
  id v5;
  dispatch_semaphore_t v6;
  RTLearnedLocationStore *learnedLocationStore;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  uint8_t *v36;
  uint64_t *v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t v44[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE buf[12];
  __int16 v51;
  id v52;
  _QWORD v53[4];

  v53[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    *(_QWORD *)v44 = 0;
    v45 = v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__30;
    v48 = __Block_byref_object_dispose__30;
    v49 = 0;
    v38 = 0;
    v39 = (id *)&v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__30;
    v42 = __Block_byref_object_dispose__30;
    v43 = 0;
    v6 = dispatch_semaphore_create(0);
    learnedLocationStore = self->_learnedLocationStore;
    objc_msgSend(v5, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __39__RTVisitMetrics__nearbyLoisFromVisit___block_invoke;
    v34[3] = &unk_1E9296EE0;
    v36 = v44;
    v37 = &v38;
    v9 = v6;
    v35 = v9;
    -[RTLearnedLocationStore fetchLocationsOfInterestWithVisitsWithinDistance:location:handler:](learnedLocationStore, "fetchLocationsOfInterestWithVisitsWithinDistance:location:handler:", v8, v34, 1000.0);

    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v10, v12))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v11);
    v15 = v14;
    v16 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v22 = (void *)MEMORY[0x1E0CB35C8];
    v53[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v53, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_retainAutorelease(v24);

      v26 = 0;
    }
    else
    {
LABEL_7:
      v25 = 0;
      v26 = 1;
    }

    v27 = v25;
    if ((v26 & 1) == 0)
      objc_storeStrong(v39 + 5, v25);
    if (v39[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v39[5];
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v32;
        v51 = 2112;
        v52 = v33;
        _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
    }
    v29 = *((id *)v45 + 5);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(v44, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v44 = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", v44, 2u);
    }

    v29 = 0;
  }

  return v29;
}

void __39__RTVisitMetrics__nearbyLoisFromVisit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_closestLoi:(id)a3 location:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  const char *v21;
  id v23;
  NSObject *obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: lois.count > 0";
LABEL_19:
    _os_log_error_impl(&dword_1D1A22000, obj, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_16;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: location";
    goto LABEL_19;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (!v7)
  {
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  v23 = v5;
  v9 = 0;
  v10 = *(_QWORD *)v26;
  v11 = INFINITY;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v26 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v6, "latitude", v23);
      objc_msgSend(v6, "longitude");
      objc_msgSend(v13, "location");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "latitude");
      objc_msgSend(v13, "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "longitude");
      RTCommonCalculateDistanceHighPrecision();
      v19 = v18;

      if (v19 < v11)
      {
        v20 = v13;

        v9 = v20;
        v11 = v19;
      }
    }
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  }
  while (v8);
  v5 = v23;
LABEL_17:

  return v9;
}

- (id)_associatedLoiFromVisit:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  RTLearnedLocationStore *learnedLocationStore;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  char v30;
  NSObject *v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v36;
  id v37;
  _QWORD v38[4];
  NSObject *v39;
  uint8_t *v40;
  uint64_t *v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[8];
  uint8_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[12];
  __int16 v55;
  id v56;
  _QWORD v57[4];

  v57[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    goto LABEL_11;
  }
  objc_msgSend(v5, "placeInference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_11:
    v32 = 0;
    goto LABEL_20;
  }
  *(_QWORD *)buf = 0;
  v49 = buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__30;
  v52 = __Block_byref_object_dispose__30;
  v53 = 0;
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__30;
  v46 = __Block_byref_object_dispose__30;
  v47 = 0;
  v9 = dispatch_semaphore_create(0);
  learnedLocationStore = self->_learnedLocationStore;
  objc_msgSend(v6, "placeInference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __42__RTVisitMetrics__associatedLoiFromVisit___block_invoke;
  v38[3] = &unk_1E9297478;
  v40 = buf;
  v41 = &v42;
  v13 = v9;
  v39 = v13;
  -[RTLearnedLocationStore fetchLocationOfInterestWithMapItem:handler:](learnedLocationStore, "fetchLocationOfInterestWithMapItem:handler:", v12, v38);

  v14 = v13;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16))
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v15);
  v19 = v18;
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v54 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v54, 2u);
  }

  v26 = (void *)MEMORY[0x1E0CB35C8];
  v57[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v54 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v57, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_retainAutorelease(v28);

    v30 = 0;
  }
  else
  {
LABEL_12:
    v29 = 0;
    v30 = 1;
  }

  v33 = v29;
  if ((v30 & 1) == 0)
    objc_storeStrong(v43 + 5, v29);
  if (v43[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v43[5];
      *(_DWORD *)v54 = 138412546;
      *(_QWORD *)&v54[4] = v36;
      v55 = 2112;
      v56 = v37;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "%@, error, %@", v54, 0x16u);

    }
  }
  v32 = *((id *)v49 + 5);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(buf, 8);

LABEL_20:
  return v32;
}

void __42__RTVisitMetrics__associatedLoiFromVisit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end
