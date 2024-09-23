@implementation PLAggregateSummarizationService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAggregateSummarizationService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLAggregateSummarizationService)init
{
  PLAggregateSummarizationService *v3;
  NSMutableArray *v4;
  NSMutableArray *metrics;
  PLAggregateSummarizationService *v6;
  objc_super v8;

  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v8.receiver = self;
    v8.super_class = (Class)PLAggregateSummarizationService;
    v3 = -[PLOperator init](&v8, sel_init);
    if (v3)
    {
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      metrics = v3->_metrics;
      v3->_metrics = v4;

    }
    self = v3;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)initOperatorDependancies
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0D80098]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PLAggregateSummarizationService_initOperatorDependancies__block_invoke;
  v5[3] = &unk_1EA16D1A8;
  v5[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D7658, v5);
  -[PLAggregateSummarizationService setAggregationResponder:](self, "setAggregationResponder:", v4);

}

uint64_t __59__PLAggregateSummarizationService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAggregationQueryWithPayload:", a5);
}

- (id)preformatMetricsForFormatter:(id)a3
{
  id v4;
  NSArray *appList;
  NSMutableDictionary *v6;
  NSMutableDictionary **p_summarizedData;
  NSMutableDictionary *summarizedData;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  NSObject *v32;
  id v34;
  uint64_t v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAggregateSummarizationService getAppList:](self, "getAppList:", v4);
  appList = self->_appList;
  if (appList && -[NSArray count](appList, "count"))
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    p_summarizedData = &self->_summarizedData;
    summarizedData = self->_summarizedData;
    self->_summarizedData = v6;

    -[PLAggregateSummarizationService getAppMetadata](self, "getAppMetadata");
    PLLogAggregateSummarizationService();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PLAggregateSummarizationService preformatMetricsForFormatter:].cold.2((uint64_t)p_summarizedData, v9, v10, v11, v12, v13, v14, v15);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v34 = v4;
    obj = v4;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        v19 = 0;
        v35 = v17;
        do
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v19);
          objc_msgSend(v20, "objectForKey:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21
            || (-[NSMutableDictionary objectForKeyedSubscript:](*p_summarizedData, "objectForKeyedSubscript:", v21),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v22,
                !v22))
          {
            PLLogAggregateSummarizationService();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v21;
              _os_log_error_impl(&dword_1DA9D6000, v28, OS_LOG_TYPE_ERROR, "Bundle id error : %@", buf, 0xCu);
            }
            goto LABEL_18;
          }
          objc_msgSend(v20, "objectForKey:", &unk_1EA1BFED0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](*p_summarizedData, "objectForKeyedSubscript:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", &unk_1EA1BFED0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", &unk_1EA1BFED0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addEntriesFromDictionary:", v26);

            v17 = v35;
          }
          objc_msgSend(v20, "objectForKey:", &unk_1EA1BFEE8);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](*p_summarizedData, "objectForKeyedSubscript:", v21);
            v28 = objc_claimAutoreleasedReturnValue();
            -[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", &unk_1EA1BFEE8);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", &unk_1EA1BFEE8);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addEntriesFromDictionary:", v30);

LABEL_18:
          }

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v17);
    }

    v31 = *p_summarizedData;
    v4 = v34;
  }
  else
  {
    PLLogAggregateSummarizationService();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[PLAggregateSummarizationService preformatMetricsForFormatter:].cold.1(v32);

    v31 = 0;
  }

  return v31;
}

- (id)handleAggregationQueryWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  double v41;
  void *v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  NSObject *v50;
  void *v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  int v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  double v106;
  NSObject *v107;
  double v108;
  double v109;
  double v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  NSObject *v117;
  SignpostReaderHelper *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  PLMetricsFormatterJSON *v129;
  uint64_t v130;
  NSObject *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  PLMetricsFormatterMetricKit *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  NSObject *v154;
  double v155;
  double v156;
  void *v157;
  void *v158;
  int v159;
  void *v160;
  unsigned int v161;
  PLAggregateSummarizationService *v162;
  PLBatteryBreakdownService *v163;
  void *v164;
  void *v165;
  void *v166;
  id obj;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  double v173;
  double v174;
  void *v175;
  unsigned int v176;
  int v177;
  int v178;
  void *v179;
  unsigned int v180;
  void *v181;
  int v182;
  void *v183;
  int v184;
  void *v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _QWORD v190[5];
  uint8_t buf[4];
  double v192;
  __int16 v193;
  _BYTE v194[14];
  __int16 v195;
  double v196;
  __int16 v197;
  double v198;
  __int16 v199;
  double v200;
  __int16 v201;
  double v202;
  __int16 v203;
  double v204;
  _BYTE v205[128];
  uint64_t v206;

  v206 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogAggregateSummarizationService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLAggregateSummarizationService handleAggregationQueryWithPayload:].cold.5((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems"))
  {
    v190[0] = MEMORY[0x1E0C809B0];
    v190[1] = 3221225472;
    v190[2] = __69__PLAggregateSummarizationService_handleAggregationQueryWithPayload___block_invoke;
    v190[3] = &unk_1EA16E568;
    v190[4] = self;
    objc_msgSend(MEMORY[0x1E0D116A0], "getGMOptInToggleWithCompletion:", v190);
  }
  v162 = self;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTypeKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("today"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("last24hrs"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("last1hr"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppAnalyticsEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = objc_msgSend(v20, "BOOLValue");

  v164 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MetrickitClientsAvailable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = objc_msgSend(v21, "BOOLValue");

  PLLogAggregateSummarizationService();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[PLAggregateSummarizationService handleAggregationQueryWithPayload:].cold.4(v15, v13, v22);

  v163 = objc_alloc_init(PLBatteryBreakdownService);
  -[PLOperator initOperatorDependancies](v163, "initOperatorDependancies");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightBeforeDate:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    PLLogAggregateSummarizationService();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v24, OS_LOG_TYPE_INFO, "Aggregating today", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightAfterDate:", v165);
    v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v27 = v25;
    v28 = 86400.0;
    goto LABEL_16;
  }
  if (v17)
  {
    PLLogAggregateSummarizationService();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v26, OS_LOG_TYPE_DEFAULT, "Aggregating last 24hrs", buf, 2u);
    }

    v25 = v165;
    goto LABEL_15;
  }
  if (!v19)
  {
    v28 = 86400.0;
    goto LABEL_17;
  }
  PLLogAggregateSummarizationService();
  v154 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v154, OS_LOG_TYPE_DEFAULT, "Aggregating last hour", buf, 2u);
  }

  v27 = v165;
  v28 = 3600.0;
LABEL_16:

  v23 = v27;
LABEL_17:
  objc_msgSend(v4, "objectForKey:", CFSTR("off1"));
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29
    && (v30 = (void *)v29,
        objc_msgSend(v4, "objectForKey:", CFSTR("off2")),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v31,
        v30,
        v31))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("off1"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v34 = v33;

    objc_msgSend(v4, "objectForKey:", CFSTR("off2"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    v28 = v36;

    objc_msgSend(v165, "dateByAddingTimeInterval:", -v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogAggregateSummarizationService();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v192 = v34;
      v193 = 2048;
      *(double *)v194 = v28;
      _os_log_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_DEFAULT, "Overriding offsets: %f %f", buf, 0x16u);
    }

    PLLogAggregateSummarizationService();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v192 = v28;
      v193 = 2112;
      *(_QWORD *)v194 = v37;
      _os_log_impl(&dword_1DA9D6000, v39, OS_LOG_TYPE_DEFAULT, "New range: %f seconds before %@", buf, 0x16u);
    }

  }
  else
  {
    v37 = v23;
  }
  objc_msgSend(v37, "convertFromSystemToMonotonic");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -v28;
  objc_msgSend(v40, "dateByAddingTimeInterval:", -v28);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v40;
  objc_msgSend(v42, "timeIntervalSince1970");
  v45 = v44;
  objc_msgSend(v43, "timeIntervalSince1970");
  v47 = v46;

  v48 = v47 - v45;
  v158 = v43;
  objc_msgSend(v43, "timeIntervalSince1970");
  v162->_maxTimestamp = v49;
  v166 = v37;
  objc_msgSend(v37, "dateByAddingTimeInterval:", v41);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogAggregateSummarizationService();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v192 = v45;
    v193 = 2048;
    *(double *)v194 = v45 + v48;
    _os_log_impl(&dword_1DA9D6000, v50, OS_LOG_TYPE_DEFAULT, "aggregation range: %f %f", buf, 0x16u);
  }

  v155 = v48;
  v156 = v45;
  -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:](v163, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:", 4, v45, v48, v45, v48, 3600.0, 0.0);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "objectForKey:", CFSTR("PLBatteryUIAppArrayKey"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = (void *)objc_opt_new();
  v186 = 0u;
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  obj = v51;
  v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v186, v205, 16);
  if (v170)
  {
    v169 = *(_QWORD *)v187;
    do
    {
      for (i = 0; i != v170; ++i)
      {
        if (*(_QWORD *)v187 != v169)
          objc_enumerationMutation(obj);
        v53 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * i);
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          v172 = i;
          v55 = (void *)objc_opt_new();
          v56 = (void *)objc_opt_new();
          v171 = v55;
          v175 = v54;
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v54, CFSTR("PLBatteryUIAppBundleIDKey"));
          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "intValue");

          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "intValue");

          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundAudioRuntimeKey"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v180 = objc_msgSend(v61, "intValue");

          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundLocationRuntimeKey"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = objc_msgSend(v62, "intValue");

          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundLocationAudioRuntimeKey"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "intValue");

          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v63) = objc_msgSend(v65, "intValue");

          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "intValue");

          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundAudioPluggedInRuntimeKey"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "intValue");

          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundLocationPluggedInRuntimeKey"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v55) = objc_msgSend(v70, "intValue");

          v179 = v53;
          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundLocationAudioPluggedInRuntimeKey"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "intValue");

          v178 = v60 - v67;
          v73 = ((_DWORD)v60 - v67) & ~(((int)v60 - v67) >> 31);
          v182 = (v176 - (_DWORD)v55) & ~((int)(v176 - (_DWORD)v55) >> 31);
          v184 = (v64 - v72) & ~(((int)v64 - v72) >> 31);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v58);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v74, CFSTR("fgTime_Total"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v60);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v75, CFSTR("bgTime_Total"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v180);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v76, CFSTR("bgTime_Audio"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v176);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v77, CFSTR("bgTime_Location"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v64);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v78, CFSTR("bgLocationAudioTime"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ((_DWORD)v58 - (_DWORD)v63) & ~(((int)v58 - (int)v63) >> 31));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v79, CFSTR("fgTime_Unplugged"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v73);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v80, CFSTR("bgTime_Unplugged"));

          LODWORD(v63) = (v180 - v69) & ~((int)(v180 - v69) >> 31);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v63);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v81, CFSTR("bgAudioTime_Unplugged"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v182);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v82, CFSTR("bgLocationTime_Unplugged"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v184);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v181 = v56;
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v83, CFSTR("bgLocationAudioTime_Unplugged"));

          v177 = (v60 - v67) & ~(((int)v60 - v67) >> 31);
          v84 = (double)v184;
          v173 = (double)v182;
          v174 = (double)(int)v63;
          v85 = (double)(int)v63 / (double)(int)v73;
          v86 = (double)v184 / ((double)(int)v73 + (double)(int)v73);
          v87 = 1;
          v88 = (double)v182 / (double)(int)v73;
          do
          {
            v89 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v87);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "stringWithFormat:", CFSTR("%@"), v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("fg"), v91);
            v92 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("bg"), v91);
            v93 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("bgAudio"), v91);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("bgLocation"), v91);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v179, "objectForKeyedSubscript:", v91);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = objc_msgSend(v96, "intValue");

            v185 = (void *)v92;
            objc_msgSend(v179, "objectForKeyedSubscript:", v92);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = objc_msgSend(v98, "intValue");

            v183 = (void *)v93;
            objc_msgSend(v179, "objectForKeyedSubscript:", v93);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = objc_msgSend(v100, "intValue");

            objc_msgSend(v179, "objectForKeyedSubscript:", v94);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = objc_msgSend(v102, "intValue");

            objc_msgSend(v179, "objectForKeyedSubscript:", v95);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = objc_msgSend(v104, "intValue");

            if (v178 <= 0)
            {
              PLLogAggregateSummarizationService();
              v111 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v192) = v177;
                _os_log_impl(&dword_1DA9D6000, v111, OS_LOG_TYPE_INFO, "Can't reweigh based on BG time: %d", buf, 8u);
              }
            }
            else
            {
              v106 = (double)(int)v101;
              PLLogAggregateSummarizationService();
              v107 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v192 = *(double *)&v175;
                v193 = 1024;
                *(_DWORD *)v194 = v87;
                *(_WORD *)&v194[4] = 2048;
                *(double *)&v194[6] = (double)(int)v101;
                _os_log_debug_impl(&dword_1DA9D6000, v107, OS_LOG_TYPE_DEBUG, "%@: bucket:%d BEFORE E_B:%f", buf, 0x1Cu);
              }

              v108 = v86 * v106 + v106 * v85;
              v109 = v86 * v106 + v106 * v88;
              if (v106 - v108 - v109 >= 0.0)
                v110 = v106 - v108 - v109;
              else
                v110 = 0.0;
              v101 = (int)v110;
              v103 = (int)v108;
              v105 = (int)v109;
              PLLogAggregateSummarizationService();
              v111 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138414082;
                v192 = *(double *)&v175;
                v193 = 1024;
                *(_DWORD *)v194 = v87;
                *(_WORD *)&v194[4] = 2048;
                *(double *)&v194[6] = v110;
                v195 = 2048;
                v196 = v108;
                v197 = 2048;
                v198 = v109;
                v199 = 2048;
                v200 = v174;
                v201 = 2048;
                v202 = v173;
                v203 = 2048;
                v204 = v84;
                _os_log_debug_impl(&dword_1DA9D6000, v111, OS_LOG_TYPE_DEBUG, "%@: bucket:%d AFTER E_B:%f E_BA:%f E_BL:%f T_BA:%f T_BL:%f T_BABL:%f", buf, 0x4Eu);
              }
            }

            if ((int)v97 >= 1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v97);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "setObject:forKeyedSubscript:", v112, v91);

            }
            if ((int)v99 >= 1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v99);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "setObject:forKeyedSubscript:", v113, v185);

            }
            if ((int)v101 >= 1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v101);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "setObject:forKeyedSubscript:", v114, v183);

            }
            if ((int)v103 >= 1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v103);
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "setObject:forKeyedSubscript:", v115, v94);

            }
            if ((int)v105 >= 1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v105);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "setObject:forKeyedSubscript:", v116, v95);

            }
            ++v87;
          }
          while (v87 != 18);
          objc_msgSend(v171, "setObject:forKey:", v181, &unk_1EA1BFED0);
          PLLogAggregateSummarizationService();
          v117 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v192 = *(double *)&v171;
            _os_log_debug_impl(&dword_1DA9D6000, v117, OS_LOG_TYPE_DEBUG, "Adding to newApps: %@", buf, 0xCu);
          }

          objc_msgSend(v168, "addObject:", v171);
          i = v172;
          v54 = v175;
        }

      }
      v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v186, v205, 16);
    }
    while (v170);
  }

  v118 = objc_alloc_init(SignpostReaderHelper);
  -[SignpostReaderHelper getSignpostMetricsWithStartDate:withEndDate:processMXSignpost:](v118, "getSignpostMetricsWithStartDate:withEndDate:processMXSignpost:", v160, v166, v161);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService preformatMetricsForFormatter:](v162, "preformatMetricsForFormatter:", v168);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogAggregateSummarizationService();
  v121 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
    -[PLAggregateSummarizationService handleAggregationQueryWithPayload:].cold.3((uint64_t)v120, v121, v122, v123, v124, v125, v126, v127);

  -[PLAggregateSummarizationService setupMetrics](v162, "setupMetrics");
  -[PLAggregateSummarizationService aggregateMetrics](v162, "aggregateMetrics");
  if (v159)
  {
    -[PLAggregateSummarizationService getDeviceMetadataInRange:withSignpostData:](v162, "getDeviceMetadataInRange:withSignpostData:", v119, v156, v155);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_alloc_init(PLMetricsFormatterJSON);
    -[PLMetricsFormatterJSON addGlobalMetaData:](v129, "addGlobalMetaData:", v128);
    -[PLMetricsFormatterJSON addAllMetrics:signpostData:](v129, "addAllMetrics:signpostData:", v120, v119);
    v130 = -[PLMetricsFormatterJSON writeSessionFile](v129, "writeSessionFile");
    PLLogAggregateSummarizationService();
    v131 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
      -[PLAggregateSummarizationService handleAggregationQueryWithPayload:].cold.2(v131, v132, v133, v134, v135, v136, v137, v138);

  }
  else
  {
    v130 = 1;
  }
  if (v161)
  {
    PLLogAggregateSummarizationService();
    v139 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG))
      -[PLAggregateSummarizationService handleAggregationQueryWithPayload:].cold.1(v139, v140, v141, v142, v143, v144, v145, v146);

    v147 = objc_alloc_init(PLMetricsFormatterMetricKit);
    objc_msgSend(v166, "dateByAddingTimeInterval:", -86400.0);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMetricsFormatterMetricKit publishMetrics:andSignpostData:forDate:](v147, "publishMetrics:andSignpostData:forDate:", v120, v119, v148);

  }
  v149 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v130);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "setObject:forKeyedSubscript:", v150, CFSTR("success"));

  objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("launchesTimeSeries"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  if (v151)
  {
    objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("launchesTimeSeries"));
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "setObject:forKeyedSubscript:", v152, CFSTR("launchesTimeSeries"));

  }
  return v149;
}

void __69__PLAggregateSummarizationService_handleAggregationQueryWithPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLLogAggregateSummarizationService();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1DA9D6000, v6, OS_LOG_TYPE_INFO, "Error retrieving opt-in state, %@", (uint8_t *)&v8, 0xCu);
    }
    a2 = 0;
  }
  else if (v7)
  {
    v8 = 67109120;
    LODWORD(v9) = a2;
    _os_log_impl(&dword_1DA9D6000, v6, OS_LOG_TYPE_INFO, "GMS opt in state: %d", (uint8_t *)&v8, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setGmsOptInState:", a2);
}

- (void)setupMetrics
{
  void *v3;
  PLASMetric *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  PLASMetric *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  PLASMetric *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  PLASMetric *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  PLASMetric *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  PLASMetric *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  PLASMetric *v34;
  void *v35;
  void *v36;
  id v37;
  PLASMetric *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;

  -[PLAggregateSummarizationService metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PLASMetric alloc];
  -[PLAggregateSummarizationService getQueryForNetworkIOData](self, "getQueryForNetworkIOData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getGenericSummarizer](self, "getGenericSummarizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLASMetric initMetric:withType:withProperties:withQuery:andSummarizerBlock:](v4, "initMetric:withType:withProperties:withQuery:andSummarizerBlock:", CFSTR("NetworkIOStats"), 1, &unk_1EA1DBB48, v5, v6);
  objc_msgSend(v3, "addObject:", v7);

  -[PLAggregateSummarizationService metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PLASMetric alloc];
  -[PLAggregateSummarizationService getQueryForCoalitionPowerData](self, "getQueryForCoalitionPowerData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getGenericSummarizer](self, "getGenericSummarizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PLASMetric initMetric:withType:withProperties:withQuery:andSummarizerBlock:](v9, "initMetric:withType:withProperties:withQuery:andSummarizerBlock:", CFSTR("CoalitionPowerStats"), 1, &unk_1EA1DBB60, v10, v11);
  objc_msgSend(v8, "addObject:", v12);

  -[PLAggregateSummarizationService metrics](self, "metrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PLASMetric alloc];
  -[PLAggregateSummarizationService getQueryForAverageMemory](self, "getQueryForAverageMemory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getGenericSummarizer](self, "getGenericSummarizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PLASMetric initMetric:withType:withProperties:withQuery:andSummarizerBlock:](v14, "initMetric:withType:withProperties:withQuery:andSummarizerBlock:", CFSTR("AverageMemory"), 2, &unk_1EA1DBB78, v15, v16);
  objc_msgSend(v13, "addObject:", v17);

  -[PLAggregateSummarizationService metrics](self, "metrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [PLASMetric alloc];
  -[PLAggregateSummarizationService getQueryForPeakMemory](self, "getQueryForPeakMemory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getGenericSummarizer](self, "getGenericSummarizer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PLASMetric initMetric:withType:withProperties:withQuery:andSummarizerBlock:](v19, "initMetric:withType:withProperties:withQuery:andSummarizerBlock:", CFSTR("PeakMemory"), 2, &unk_1EA1DBB90, v20, v21);
  objc_msgSend(v18, "addObject:", v22);

  -[PLAggregateSummarizationService metrics](self, "metrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = [PLASMetric alloc];
  -[PLAggregateSummarizationService getQueryForDiskIO](self, "getQueryForDiskIO");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getGenericSummarizer](self, "getGenericSummarizer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PLASMetric initMetric:withType:withProperties:withQuery:andSummarizerBlock:](v24, "initMetric:withType:withProperties:withQuery:andSummarizerBlock:", CFSTR("DiskIO"), 2, &unk_1EA1DBBA8, v25, v26);
  objc_msgSend(v23, "addObject:", v27);

  -[PLAggregateSummarizationService metrics](self, "metrics");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = [PLASMetric alloc];
  -[PLAggregateSummarizationService getQueryForLocationActivity](self, "getQueryForLocationActivity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getLocationActivitySummarizer](self, "getLocationActivitySummarizer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[PLASMetric initMetric:withType:withProperties:withQuery:andSummarizerBlock:](v29, "initMetric:withType:withProperties:withQuery:andSummarizerBlock:", CFSTR("LocationActivity"), 1, &unk_1EA1DBBC0, v30, v31);
  objc_msgSend(v28, "addObject:", v32);

  -[PLAggregateSummarizationService metrics](self, "metrics");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = [PLASMetric alloc];
  -[PLAggregateSummarizationService getQueryForDisplayAPL](self, "getQueryForDisplayAPL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getGenericSummarizer](self, "getGenericSummarizer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[PLASMetric initMetric:withType:withProperties:withQuery:andSummarizerBlock:](v34, "initMetric:withType:withProperties:withQuery:andSummarizerBlock:", CFSTR("DisplayAPL"), 1, &unk_1EA1DBBD8, v35, v36);
  objc_msgSend(v33, "addObject:", v37);

  -[PLAggregateSummarizationService metrics](self, "metrics");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v38 = [PLASMetric alloc];
  -[PLAggregateSummarizationService getQueryForCellularCondition](self, "getQueryForCellularCondition");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getCellularConditionSummarizer](self, "getCellularConditionSummarizer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[PLASMetric initMetric:withType:withProperties:withQuery:andSummarizerBlock:](v38, "initMetric:withType:withProperties:withQuery:andSummarizerBlock:", CFSTR("CellularCondition"), 1, &unk_1EA1DBBF0, v39, v40);
  objc_msgSend(v42, "addObject:", v41);

}

- (void)aggregateMetrics
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(double);
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PLAggregateSummarizationService metrics](self, "metrics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    v6 = 0x1F0285000uLL;
    do
    {
      v7 = 0;
      v17 = v4;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1DF0A47AC]();
        objc_msgSend(v8, "query");
        v10 = (void (**)(double))objc_claimAutoreleasedReturnValue();
        v10[2](*(double *)((char *)&self->super.super.super.isa + *(int *)(v6 + 3284)));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && objc_msgSend(v11, "count"))
        {
          objc_msgSend(v8, "summarizer");
          v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "metricProperties");
          v13 = v6;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v12)[2](v12, v11, v14);
          v15 = v5;
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v13;
          -[PLAggregateSummarizationService addMetrics:withType:](self, "addMetrics:withType:", v16, objc_msgSend(v8, "metricType"));

          v5 = v15;
          v4 = v17;
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

}

- (void)addMetrics:(id)a3 withType:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_summarizedData, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addEntriesFromDictionary:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)getAppList:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *appList;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "objectForKey:", CFSTR("PLBatteryUIAppBundleIDKey"), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          -[NSArray addObject:](v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  appList = self->_appList;
  self->_appList = v5;

}

- (id)getDeviceMetadataInRange:(_PLTimeIntervalRange)a3 withSignpostData:(id)a4
{
  double length;
  double location;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[12];
  _QWORD v36[14];

  length = a3.length;
  location = a3.location;
  v36[12] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), CFSTR("Apple Global Domain"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("<unknown>");
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  v28 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("<unknown>");
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hangtracer_enabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v7;
  if (v12)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hangtracer_enabled"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = &unk_1EA1BFF00;
  }

  -[PLAggregateSummarizationService getPluggedInDurationInRange:](self, "getPluggedInDurationInRange:", location, length);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getDrainInfoInRange:](self, "getDrainInfoInRange:", location, length);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getInitCountInRange:](self, "getInitCountInRange:", location, length);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLAggregateSummarizationService gmsOptInState](self, "gmsOptInState"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[0] = CFSTR("log_version");
  v35[1] = CFSTR("region_format");
  v17 = CFSTR("<none>");
  if (v11)
    v18 = v11;
  else
    v18 = CFSTR("<none>");
  v36[0] = &unk_1EA1BFF18;
  v36[1] = v18;
  v29 = (__CFString *)v9;
  if (v9)
    v17 = v9;
  v36[2] = v17;
  v35[2] = CFSTR("language");
  v35[3] = CFSTR("os_version");
  objc_msgSend((id)objc_opt_class(), "osVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v11;
  if (v19)
  {
    objc_msgSend((id)objc_opt_class(), "osVersion", v11, v28, v29, v30, v31);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("<unknown>");
  }
  v36[3] = v20;
  v35[4] = CFSTR("machine_config");
  objc_msgSend((id)objc_opt_class(), "modelIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v21;
  v35[5] = CFSTR("os_variant");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend((id)objc_opt_class(), "buildType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v22;
  v36[6] = v34;
  v35[6] = CFSTR("hangtracer_enabled");
  v35[7] = CFSTR("plugged_in_duration");
  v35[8] = CFSTR("total_drain");
  v35[9] = CFSTR("energy_consumed");
  v36[7] = v33;
  v36[8] = v32;
  v36[9] = v14;
  v35[10] = CFSTR("init_count");
  v35[11] = CFSTR("gms_opt_in");
  v23 = v16;
  v36[10] = v15;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLAggregateSummarizationService gmsOptInState](self, "gmsOptInState"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[11] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 12, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)

  if (v19)
  return v24;
}

- (id)getDrainInfoInRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  length = a3.length;
  location = a3.location;
  v31 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("UILevel"));
  v6 = objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v6;
  objc_msgSend(v7, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v6, 3600.0, location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    LODWORD(v11) = 0;
    LODWORD(v12) = 0;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Level"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "intValue");

        v12 = (v17 + v12);
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("energyConsumed"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v18, "intValue");

        v11 = ((_DWORD)v16 + v11);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)getPluggedInDurationInRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  length = a3.length;
  location = a3.location;
  v24 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("UsageTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v6, 3600.0, location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    LODWORD(v12) = 0;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PluggedIn"), (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "intValue");

        v12 = (v16 + v12);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)getInitCountInRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0D80048], "entryKeyForType:andName:", *MEMORY[0x1E0D80378], *MEMORY[0x1E0D803D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entriesForKey:inTimeRange:withFilters:", v6, 0, location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getQueryForAppMultipleVersions
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PLAggregateSummarizationService_getQueryForAppMultipleVersions__block_invoke;
  v5[3] = &unk_1EA16E590;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __65__PLAggregateSummarizationService_getQueryForAppMultipleVersions__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("                           SELECT AppBundleId AS %@, COUNT(DISTINCT AppBundleVersion) > 1 AS %@                           FROM PLApplicationAgent_EventNone_AllApps                           WHERE timestamp >= %f AND timestamp < %f GROUP BY %@;"),
    CFSTR("BundleId"),
    CFSTR("app_multiple_versions"),
    a2 + -86400.0,
    *(_QWORD *)&a2,
    CFSTR("BundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performQuery:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getQueryForNetworkIOData
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PLAggregateSummarizationService_getQueryForNetworkIOData__block_invoke;
  v5[3] = &unk_1EA16E590;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __59__PLAggregateSummarizationService_getQueryForNetworkIOData__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("                             SELECT BundleName AS %@, SUM(CellIn) %@, SUM(CellOut) %@, SUM(WifiIn) %@, SUM(WifiOut) %@                             FROM PLProcessNetworkAgent_EventInterval_UsageDiff                             WHERE timestamp >= %f AND timestamp < %f GROUP BY %@;"),
    CFSTR("BundleId"),
    CFSTR("bytesCellularIn"),
    CFSTR("bytesCellularOut"),
    CFSTR("bytesWifiIn"),
    CFSTR("bytesWifiOut"),
    a2 + -86400.0,
    *(_QWORD *)&a2,
    CFSTR("BundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performQuery:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getQueryForCoalitionPowerData
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PLAggregateSummarizationService_getQueryForCoalitionPowerData__block_invoke;
  v5[3] = &unk_1EA16E590;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __64__PLAggregateSummarizationService_getQueryForCoalitionPowerData__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("                             SELECT BundleID AS %@, SUM(cpu_time) %@, SUM(gpu_time) %@, SUM(cpu_instructions) %@                             FROM PLCoalitionAgent_EventInterval_CoalitionInterval                             WHERE timestamp >= %f AND timestamp < %f GROUP BY %@;"),
    CFSTR("BundleId"),
    CFSTR("CPUTime"),
    CFSTR("GPUTime"),
    CFSTR("CPUInstructions"),
    a2 + -86400.0,
    *(_QWORD *)&a2,
    CFSTR("BundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performQuery:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getQueryForDiskIO
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PLAggregateSummarizationService_getQueryForDiskIO__block_invoke;
  v5[3] = &unk_1EA16E590;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __52__PLAggregateSummarizationService_getQueryForDiskIO__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -86400.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  objc_msgSend(v3, "timeIntervalSince1970");
  v6 = v5;
  objc_msgSend(v4, "timeIntervalSince1970");
  v8 = v7;

  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("Metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v9, 3600.0, v6, v8 - v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FFB0], "summarizeAggregateEntries:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)getQueryForAverageMemory
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PLAggregateSummarizationService_getQueryForAverageMemory__block_invoke;
  v5[3] = &unk_1EA16E590;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __59__PLAggregateSummarizationService_getQueryForAverageMemory__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("                           SELECT Q.A %@, Q.B %@, Q.C %@, AVG((SuspendedMemory - Q.B)*(SuspendedMemory - Q.B)) %@ from PLApplicationAgent_EventBackward_ApplicationMemory as T,                            (SELECT AppBundleId AS A, AVG(SuspendedMemory) AS B, COUNT(SuspendedMemory) AS C from PLApplicationAgent_EventBackward_ApplicationMemory                              WHERE timestamp >= %f AND timestamp < %f GROUP BY AppBundleId                            ) AS Q WHERE Q.A = T.AppBundleId AND timestamp >= %f AND timestamp < %f GROUP BY %@;"),
    CFSTR("BundleId"),
    CFSTR("AverageMemory"),
    CFSTR("AverageMemoryCount"),
    CFSTR("AverageMemoryVariance"),
    a2 + -86400.0,
    *(_QWORD *)&a2,
    a2 + -86400.0,
    *(_QWORD *)&a2,
    CFSTR("BundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performQuery:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getQueryForPeakMemory
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PLAggregateSummarizationService_getQueryForPeakMemory__block_invoke;
  v5[3] = &unk_1EA16E590;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __56__PLAggregateSummarizationService_getQueryForPeakMemory__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("                           SELECT AppBundleId AS %@, MAX(PeakMemory) %@ from PLApplicationAgent_EventBackward_ApplicationMemory WHERE timestamp >= %f AND timestamp < %f                           GROUP BY %@;"),
    CFSTR("BundleId"),
    CFSTR("PeakMemory"),
    a2 + -86400.0,
    *(_QWORD *)&a2,
    CFSTR("BundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performQuery:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getQueryForLocationActivity
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__PLAggregateSummarizationService_getQueryForLocationActivity__block_invoke;
  v5[3] = &unk_1EA16E590;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __62__PLAggregateSummarizationService_getQueryForLocationActivity__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("                           SELECT Q.A %@, Q.B LocationDesiredAccuracy, SUM(tE - t) TotalTime FROM                             (SELECT BundleID AS A, LocationDesiredAccuracy AS B,                                    CASE WHEN (timestampEnd > %f OR timestampEnd is NULL) THEN %f ELSE timestampEnd END as tE,                                    CASE WHEN timestamp < %f THEN %f ELSE timestamp END as t                             FROM PLLocationAgent_EventForward_ClientStatus WHERE Type='Location' AND tE >= %f AND t < %f AND tE > t                           ) AS Q GROUP BY %@, LocationDesiredAccuracy;"),
    CFSTR("BundleId"),
    *(_QWORD *)&a2,
    *(_QWORD *)&a2,
    a2 + -86400.0,
    a2 + -86400.0,
    a2 + -86400.0,
    *(_QWORD *)&a2,
    CFSTR("BundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performQuery:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getQueryForDisplayAPL
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PLAggregateSummarizationService_getQueryForDisplayAPL__block_invoke;
  v5[3] = &unk_1EA16E590;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __56__PLAggregateSummarizationService_getQueryForDisplayAPL__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("                           SELECT bundleID AS %@, SUM(%f * Frames * (%f*AvgRed + %f*AvgGreen + %f*AvgBlue))/SUM(Frames) %@, SUM(Frames) %@ FROM PLDisplayAgent_EventBackward_APLStats                           WHERE timestamp >= %f AND timestamp < %f                           GROUP BY %@;"),
    CFSTR("BundleId"),
    0x3FD9191919191919,
    0x3FD3D70A3D70A3D7,
    0x3FD0000000000000,
    0x3FDC28F5C28F5C29,
    CFSTR("AveragePictureLevel"),
    CFSTR("TotalFrameCount"),
    a2 + -86400.0,
    *(_QWORD *)&a2,
    CFSTR("BundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performQuery:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getQueryForCellularCondition
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PLAggregateSummarizationService_getQueryForCellularCondition__block_invoke;
  v5[3] = &unk_1EA16E590;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __63__PLAggregateSummarizationService_getQueryForCellularCondition__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("                           SELECT BundleID AS %@, SignalBars, SUM(CellUsageTime) AS TotalTime FROM PLAppTimeService_Aggregate_CellularCondition                           WHERE timestamp >= %f AND timestamp < %f                           GROUP BY %@, SignalBars;"),
    CFSTR("BundleId"),
    a2 + -86400.0,
    *(_QWORD *)&a2,
    CFSTR("BundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performQuery:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)getAppMetadata
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  NSMutableDictionary *summarizedData;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id obj;
  uint64_t v38;
  PLAggregateSummarizationService *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[13];
  _QWORD v67[13];
  uint64_t v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  -[PLAggregateSummarizationService getAppMultipleVersionsData](self, "getAppMultipleVersionsData");
  v39 = self;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[PLAggregateSummarizationService appList](self, "appList");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v41)
  {
    v38 = *(_QWORD *)v63;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v63 != v38)
          objc_enumerationMutation(obj);
        v61 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v3);
        v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppBundleId"), v4, 0);
        objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "storage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)v5;
        v68 = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("PLApplicationAgent_EventNone_AllApps"), v8, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v67[0] = v4;
        v66[0] = CFSTR("app_bundleid");
        v66[1] = CFSTR("app_is_clip");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppIsClip"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "BOOLValue"))
          v10 = CFSTR("true");
        else
          v10 = CFSTR("false");
        v67[1] = v10;
        v66[2] = CFSTR("app_build_version");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppBuildVersion"));
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppBuildVersion"));
          v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = v52;
        }
        else
        {
          v12 = &stru_1EA174678;
        }
        v67[2] = v12;
        v66[3] = CFSTR("app_version");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppBundleVersion"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppBundleVersion"));
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v13 = v51;
        }
        else
        {
          v13 = &stru_1EA174678;
        }
        v67[3] = v13;
        v66[4] = CFSTR("app_sessionreporter_key");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppVendorID"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppVendorID"));
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v14 = v50;
        }
        else
        {
          v14 = &stru_1EA174678;
        }
        v67[4] = v14;
        v66[5] = CFSTR("app_adamid");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppItemID"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppItemID"));
          v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = v49;
        }
        else
        {
          v15 = &stru_1EA174678;
        }
        v67[5] = v15;
        v66[6] = CFSTR("app_cohort");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppCohort"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppCohort"));
          v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v16 = v48;
        }
        else
        {
          v16 = &stru_1EA174678;
        }
        v67[6] = v16;
        v66[7] = CFSTR("app_storefront");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppStoreFront"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppStoreFront"));
          v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v18 = v47;
        }
        else
        {
          v18 = &stru_1EA174678;
        }
        v67[7] = v18;
        v66[8] = CFSTR("app_is_beta");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppIsBeta"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "BOOLValue"))
          v20 = CFSTR("true");
        else
          v20 = CFSTR("false");
        v67[8] = v20;
        v66[9] = CFSTR("app_arch");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppArchitecture"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)v11;
        if (v21)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppArchitecture"));
          v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v22 = v46;
        }
        else
        {
          v22 = &stru_1EA174678;
        }
        v67[9] = v22;
        v66[10] = CFSTR("slice_uuid");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppUUID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppUUID"));
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v24 = v45;
        }
        else
        {
          v24 = &stru_1EA174678;
        }
        v67[10] = v24;
        v66[11] = CFSTR("app_multiple_versions");
        objc_msgSend(v40, "objectForKeyedSubscript:", v4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v53;
        if (v25)
        {
          objc_msgSend(v40, "objectForKeyedSubscript:", v4);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("app_multiple_versions"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v42;
        }
        else
        {
          v27 = &unk_1EA1BFF30;
        }
        v67[11] = v27;
        v66[12] = CFSTR("app_distributorid");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppDistributorID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppDistributorID"));
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v29 = v43;
        }
        else
        {
          v29 = &stru_1EA174678;
        }
        v67[12] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 13);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)

        if (v25)
        {

        }
        if (v23)

        if (v21)
        if (v17)

        if (v55)
        if (v56)

        if (v57)
        if (v58)

        if (v59)
        summarizedData = v39->_summarizedData;
        v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[NSMutableDictionary setObject:forKey:](summarizedData, "setObject:forKey:", v31, v4);

        -[NSMutableDictionary objectForKeyedSubscript:](v39->_summarizedData, "objectForKeyedSubscript:", v4);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v32, "setObject:forKey:", v33, &unk_1EA1BFED0);

        -[NSMutableDictionary objectForKeyedSubscript:](v39->_summarizedData, "objectForKeyedSubscript:", v4);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v34, "setObject:forKey:", v35, &unk_1EA1BFEE8);

        -[NSMutableDictionary objectForKeyedSubscript:](v39->_summarizedData, "objectForKeyedSubscript:", v4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKey:", v54, &unk_1EA1BFF48);

        v3 = v61 + 1;
      }
      while (v41 != v61 + 1);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v41);
  }

}

- (id)getAppMultipleVersionsData
{
  PLASMetric *v3;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(double);
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;

  v3 = [PLASMetric alloc];
  -[PLAggregateSummarizationService getQueryForAppMultipleVersions](self, "getQueryForAppMultipleVersions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateSummarizationService getGenericSummarizer](self, "getGenericSummarizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLASMetric initMetric:withType:withProperties:withQuery:andSummarizerBlock:](v3, "initMetric:withType:withProperties:withQuery:andSummarizerBlock:", CFSTR("app_multiple_versions"), 0, &unk_1EA1DBC08, v4, v5);

  objc_msgSend(v6, "query");
  v7 = (void (**)(double))objc_claimAutoreleasedReturnValue();
  v7[2](self->_maxTimestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "summarizer");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metricProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v9)[2](v9, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)getGenericSummarizer
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PLAggregateSummarizationService_getGenericSummarizer__block_invoke;
  v5[3] = &unk_1EA16E5B8;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __55__PLAggregateSummarizationService_getGenericSummarizer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  id obj;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v31 = a3;
  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    v29 = *(_QWORD *)v42;
    v30 = a1;
    do
    {
      v9 = 0;
      v33 = v7;
      do
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v9);
        if (v10)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v9), "objectForKey:", CFSTR("BundleId"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "appList");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObject:", v11);

          if (v13)
          {
            v35 = v11;
            v36 = v9;
            v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v15 = v31;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v38;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v38 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
                  objc_msgSend(v10, "objectForKeyedSubscript:", v20, v29, v30);
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (v21)
                  {
                    v22 = (void *)v21;
                    objc_msgSend(v10, "objectForKeyedSubscript:", v20);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v23 != v24)
                    {
                      v25 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v10, "objectForKeyedSubscript:", v20);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "unsignedIntegerValue"));
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "setObject:forKey:", v27, v20);

                    }
                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              }
              while (v17);
            }

            v11 = v35;
            objc_msgSend(v32, "setObject:forKey:", v14, v35);

            v8 = v29;
            a1 = v30;
            v7 = v33;
            v9 = v36;
          }

        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v7);
  }

  return v32;
}

- (id)getLocationActivitySummarizer
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PLAggregateSummarizationService_getLocationActivitySummarizer__block_invoke;
  v5[3] = &unk_1EA16E5B8;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __64__PLAggregateSummarizationService_getLocationActivitySummarizer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v46 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v57;
    v10 = *MEMORY[0x1E0C9E490];
    v11 = *MEMORY[0x1E0C9E498];
    v12 = *MEMORY[0x1E0C9E4D0];
    v13 = *MEMORY[0x1E0C9E4A8];
    v14 = *MEMORY[0x1E0C9E4B8];
    v15 = *MEMORY[0x1E0C9E4F8];
    v50 = a1;
    v48 = *(_QWORD *)v57;
    do
    {
      v16 = 0;
      v49 = v8;
      do
      {
        if (*(_QWORD *)v57 != v9)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v16);
        if (v17)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v16), "objectForKey:", CFSTR("BundleId"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "appList");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsObject:", v18);

          if (v20)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("LocationDesiredAccuracy"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v22 = objc_claimAutoreleasedReturnValue();
            if (v21 == (void *)v22)
            {
              v41 = v21;
              a1 = v50;
              goto LABEL_33;
            }
            v23 = (void *)v22;
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TotalTime"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = v24 == v25;
            v9 = v48;
            v8 = v49;
            a1 = v50;
            if (!v26)
            {
              objc_msgSend(v6, "objectForKey:", v18);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v27)
              {
                v47 = v17;
                v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(v6, "setObject:forKey:", v28, v18);

                v54 = 0u;
                v55 = 0u;
                v52 = 0u;
                v53 = 0u;
                v29 = v46;
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
                if (v30)
                {
                  v31 = v30;
                  v32 = *(_QWORD *)v53;
                  do
                  {
                    v33 = 0;
                    do
                    {
                      if (*(_QWORD *)v53 != v32)
                        objc_enumerationMutation(v29);
                      v34 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v33);
                      objc_msgSend(v6, "objectForKeyedSubscript:", v18, v46);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "setObject:forKey:", &unk_1EA1BFF30, v34);

                      ++v33;
                    }
                    while (v31 != v33);
                    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
                  }
                  while (v31);
                }

                a1 = v50;
                v17 = v47;
              }
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("LocationDesiredAccuracy"), v46);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "doubleValue");
              v38 = v37;

              v39 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TotalTime"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "numberWithUnsignedInteger:", objc_msgSend(v40, "unsignedIntegerValue"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38 == v10)
              {
                objc_msgSend(v6, "objectForKeyedSubscript:", v18);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKey:", v41, CFSTR("BestAccuracy"));
                v9 = v48;
                v8 = v49;
                goto LABEL_33;
              }
              v9 = v48;
              v8 = v49;
              if (v38 == v11)
              {
                objc_msgSend(v6, "objectForKeyedSubscript:", v18);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v42;
                v43 = v41;
                v44 = CFSTR("BestAccuracyForNavigation");
                goto LABEL_32;
              }
              if (v38 == v12)
              {
                objc_msgSend(v6, "objectForKeyedSubscript:", v18);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v42;
                v43 = v41;
                v44 = CFSTR("NearestTenMetersAccuracy");
                goto LABEL_32;
              }
              if (v38 == v13)
              {
                objc_msgSend(v6, "objectForKeyedSubscript:", v18);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v42;
                v43 = v41;
                v44 = CFSTR("HundredMetersAccuracy");
                goto LABEL_32;
              }
              if (v38 == v14)
              {
                objc_msgSend(v6, "objectForKeyedSubscript:", v18);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v42;
                v43 = v41;
                v44 = CFSTR("KilometerAccuracy");
                goto LABEL_32;
              }
              if (v38 == v15)
              {
                objc_msgSend(v6, "objectForKeyedSubscript:", v18);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v42;
                v43 = v41;
                v44 = CFSTR("ThreeKilometersAccuracy");
LABEL_32:
                objc_msgSend(v42, "setObject:forKey:", v43, v44);
LABEL_33:

              }
            }
          }

        }
        ++v16;
      }
      while (v16 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)getCellularConditionSummarizer
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PLAggregateSummarizationService_getCellularConditionSummarizer__block_invoke;
  v5[3] = &unk_1EA16E5B8;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1DF0A4968](v5, a2);
  v3 = (void *)MEMORY[0x1DF0A4968]();

  return v3;
}

id __65__PLAggregateSummarizationService_getCellularConditionSummarizer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  NSObject *v39;
  __int128 v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v42 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v53;
    *(_QWORD *)&v8 = 134218242;
    v41 = v8;
    v46 = a1;
    v44 = *(_QWORD *)v53;
    do
    {
      v11 = 0;
      v45 = v9;
      do
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v11);
        if (v12)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v11), "objectForKey:", CFSTR("BundleId"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "appList");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v13);

          if (v15)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SignalBars"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v17 = objc_claimAutoreleasedReturnValue();
            if (v16 == (void *)v17)
            {
              v35 = v16;
              a1 = v46;
              goto LABEL_30;
            }
            v18 = (void *)v17;
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TotalTime"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = v19 == v20;
            v10 = v44;
            v9 = v45;
            a1 = v46;
            if (!v21)
            {
              objc_msgSend(v6, "objectForKey:", v13);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v22)
              {
                v43 = v12;
                v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(v6, "setObject:forKey:", v23, v13);

                v50 = 0u;
                v51 = 0u;
                v48 = 0u;
                v49 = 0u;
                v24 = v42;
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
                if (v25)
                {
                  v26 = v25;
                  v27 = *(_QWORD *)v49;
                  do
                  {
                    for (i = 0; i != v26; ++i)
                    {
                      if (*(_QWORD *)v49 != v27)
                        objc_enumerationMutation(v24);
                      v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
                      objc_msgSend(v6, "objectForKeyedSubscript:", v13, v41);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "setObject:forKey:", &unk_1EA1BFF30, v29);

                    }
                    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
                  }
                  while (v26);
                }

                a1 = v46;
                v12 = v43;
              }
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SignalBars"), v41);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "integerValue");

              v33 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TotalTime"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v34, "unsignedIntegerValue"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              switch(v32)
              {
                case 0:
                  objc_msgSend(v6, "objectForKeyedSubscript:", v13);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = v36;
                  v37 = v35;
                  v38 = CFSTR("SignalBar0");
                  break;
                case 1:
                  objc_msgSend(v6, "objectForKeyedSubscript:", v13);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = v36;
                  v37 = v35;
                  v38 = CFSTR("SignalBar1");
                  break;
                case 2:
                  objc_msgSend(v6, "objectForKeyedSubscript:", v13);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = v36;
                  v37 = v35;
                  v38 = CFSTR("SignalBar2");
                  break;
                case 3:
                  objc_msgSend(v6, "objectForKeyedSubscript:", v13);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = v36;
                  v37 = v35;
                  v38 = CFSTR("SignalBar3");
                  break;
                case 4:
                  objc_msgSend(v6, "objectForKeyedSubscript:", v13);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = v36;
                  v37 = v35;
                  v38 = CFSTR("SignalBar4");
                  break;
                default:
                  PLLogAggregateSummarizationService();
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v41;
                    v57 = v32;
                    v58 = 2112;
                    v59 = v13;
                    _os_log_error_impl(&dword_1DA9D6000, v39, OS_LOG_TYPE_ERROR, "Invalid signal bar: %ld for bundleID: %@", buf, 0x16u);
                  }

                  objc_msgSend(v6, "objectForKeyedSubscript:", v13);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = v36;
                  v37 = v35;
                  v38 = CFSTR("SignalBarUnknown");
                  break;
              }
              objc_msgSend(v36, "setObject:forKey:", v37, v38);
              v10 = v44;
              v9 = v45;
LABEL_30:

            }
          }

        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)osVersion
{
  if (osVersion_onceToken != -1)
    dispatch_once(&osVersion_onceToken, &__block_literal_global_369);
  return (id)osVersion_osVersion;
}

void __44__PLAggregateSummarizationService_osVersion__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)_CFCopySupplementalVersionDictionary();
  if (v6)
  {
    v0 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductName"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductVersion"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v0, "initWithFormat:", CFSTR("%@ %@ (%@)"), v1, v2, v3);
    v5 = (void *)osVersion_osVersion;
    osVersion_osVersion = v4;

  }
  else
  {
    v1 = (void *)osVersion_osVersion;
    osVersion_osVersion = 0;
  }

}

+ (id)modelIdentifier
{
  if (modelIdentifier_onceToken != -1)
    dispatch_once(&modelIdentifier_onceToken, &__block_literal_global_378);
  return (id)modelIdentifier_modelIdentifier;
}

void __50__PLAggregateSummarizationService_modelIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  size_t v2;
  _OWORD v3[4];
  int v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v4 = 0x100000006;
  memset(v3, 0, sizeof(v3));
  v2 = 64;
  sysctl(v4, 2u, v3, &v2, 0, 0);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v3, 1);
  v1 = (void *)modelIdentifier_modelIdentifier;
  modelIdentifier_modelIdentifier = v0;

}

+ (signed)buildType
{
  return objc_msgSend(MEMORY[0x1E0D80020], "internalBuild");
}

- (NSMutableDictionary)summarizedData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSummarizedData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableArray)metrics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)appList
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (double)maxTimestamp
{
  return self->_maxTimestamp;
}

- (void)setMaxTimestamp:(double)a3
{
  self->_maxTimestamp = a3;
}

- (BOOL)gmsOptInState
{
  return self->_gmsOptInState;
}

- (void)setGmsOptInState:(BOOL)a3
{
  self->_gmsOptInState = a3;
}

- (PLXPCResponderOperatorComposition)aggregationResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAggregationResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregationResponder, 0);
  objc_storeStrong((id *)&self->_appList, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_summarizedData, 0);
}

- (void)preformatMetricsForFormatter:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA9D6000, log, OS_LOG_TYPE_ERROR, "app list error", v1, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)preformatMetricsForFormatter:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "App metadata: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleAggregationQueryWithPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, a1, a3, "Sending metrics to MetricKit", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)handleAggregationQueryWithPayload:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, a1, a3, "Session File Writing Complete", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)handleAggregationQueryWithPayload:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "Summarized Metric Data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleAggregationQueryWithPayload:(os_log_t)log .cold.4(char a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a2;
  v4 = 1024;
  v5 = a1 & 1;
  _os_log_debug_impl(&dword_1DA9D6000, log, OS_LOG_TYPE_DEBUG, "handleAggregationQuery with queryType:%d today:%d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_1();
}

- (void)handleAggregationQueryWithPayload:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "aggregationQuery payload %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
