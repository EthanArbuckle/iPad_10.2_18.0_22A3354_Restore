@implementation RERelevanceEngine

- (RERelevanceEngine)initWithName:(id)a3 configuration:(id)a4
{
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *name;
  _REEngineDefaults *v32;
  _REEngineDefaults *defaults;
  uint64_t v34;
  RERelevanceEngineConfiguration *configuration;
  uint64_t v36;
  NSMutableArray *subsystems;
  uint64_t v38;
  NSMutableDictionary *addedElementsByIdentifier;
  uint64_t v40;
  RERelevanceEngineLogger *logger;
  REActivityTracker *v42;
  REActivityTracker *v43;
  REActivityTracker *activityTracker;
  const __CFString *v45;
  void *v46;
  const char *v47;
  dispatch_queue_t v48;
  OS_dispatch_queue *queue;
  void *v50;
  void *v51;
  id v52;
  RERelevanceEnginePreferencesController *v53;
  void *v54;
  uint64_t v55;
  RERelevanceEnginePreferencesController *preferenceController;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  _RESectionDescriptor *v70;
  uint64_t v71;
  NSArray *sectionDescriptors;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  void *v77;
  _RESectionDescriptor *v78;
  uint64_t v79;
  NSArray *historicSectionDescriptors;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t n;
  void *v85;
  NSObject *v86;
  uint64_t v87;
  REFeatureSet *mlFeatures;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t ii;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t jj;
  void *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t kk;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t mm;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t nn;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  REFeatureSet *rootFeatures;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t i1;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *i2;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t i3;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  NSDictionary *inflectionFeatureValues;
  void *v167;
  REMLModelManager *v168;
  REMLModelManager *modelManager;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  REFeatureMapGenerator *v175;
  void *v176;
  uint64_t v177;
  REFeatureMapGenerator *inputFeatureMapGenerator;
  REFeatureMapGenerator *v179;
  REFeatureMapGenerator *outputFeatureMapGenerator;
  REFeatureTransmuter *v181;
  REFeatureTransmuter *featureTransmuter;
  RELiveElementCoordinator *v183;
  RELiveElementCoordinator *coordinator;
  REDataSourceManager *v185;
  void *v186;
  uint64_t v187;
  REDataSourceManager *dataSourceManager;
  RETrainingManager *v189;
  RETrainingManager *trainingManager;
  REEngineLocationManager *v191;
  void *v192;
  uint64_t v193;
  REEngineLocationManager *locationManager;
  REDataSourceCatalog *v195;
  REDataSourceCatalog *dataSourceCatalog;
  void *v197;
  void *v198;
  int v199;
  void *v200;
  OS_dispatch_queue *callbackQueue;
  double v202;
  uint64_t v203;
  REUpNextScheduler *loadingScheduler;
  RERelevanceEngine *v205;
  uint64_t v207;
  void *v208;
  id v209;
  NSObject *attr;
  NSObject *v211;
  void *v212;
  void *v213;
  RERelevanceEngineConfiguration *v214;
  id v215;
  RERelevanceEngine *val;
  void *v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id obj;
  void *v224;
  __CFString *v225;
  void *v226;
  _QWORD v227[4];
  id v228;
  objc_super v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
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
  _BYTE v282[128];
  _BYTE v283[128];
  _BYTE v284[128];
  _BYTE v285[128];
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[5];
  uint8_t v289[128];
  uint8_t buf[4];
  void *v291;
  _BYTE v292[128];
  _BYTE v293[128];
  _BYTE v294[128];
  id location[19];

  location[16] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v215 = a4;
  v225 = v6;
  if (!v6)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Relevance engine name must be non-nil"), v7, v8, v9, v10, v11, v12, v207);
  v232 = 0u;
  v233 = 0u;
  v230 = 0u;
  v231 = 0u;
  +[RESingleton sharedInstance](RERelevanceEngineDebugger, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "availableEngines");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v230, v282, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v231;
    v17 = (void *)*MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v231 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v230 + 1) + 8 * i), "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v225;
        v21 = v19;
        if (v21 == v20)
        {

LABEL_12:
          RERaiseInternalException(v17, CFSTR("Relevance engine with name %@ already exists"), v24, v25, v26, v27, v28, v29, (uint64_t)v20);
          continue;
        }
        v22 = v21;
        v23 = -[__CFString isEqual:](v20, "isEqual:", v21);

        if (v23)
          goto LABEL_12;
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v230, v282, 16);
    }
    while (v15);
  }

  v229.receiver = self;
  v229.super_class = (Class)RERelevanceEngine;
  val = -[RERelevanceEngine init](&v229, sel_init);

  if (val)
  {
    v30 = -[__CFString copy](v225, "copy");
    name = val->_name;
    val->_name = (NSString *)v30;

    val->_running = 0;
    val->_automaticallyResumeEngine = 1;
    val->_activityTrackerLock._os_unfair_lock_opaque = 0;
    objc_msgSend(v215, "preferenceDomain");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    if (v212)
    {
      v32 = -[_REEngineDefaults initWithDomain:]([_REEngineDefaults alloc], "initWithDomain:", v212);
      defaults = val->_defaults;
      val->_defaults = v32;

    }
    +[RESingleton _incrementSingletonCache](RESingleton, "_incrementSingletonCache");
    v34 = objc_msgSend(v215, "copy");
    configuration = val->_configuration;
    val->_configuration = (RERelevanceEngineConfiguration *)v34;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v36 = objc_claimAutoreleasedReturnValue();
    subsystems = val->_subsystems;
    val->_subsystems = (NSMutableArray *)v36;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v38 = objc_claimAutoreleasedReturnValue();
    addedElementsByIdentifier = val->_addedElementsByIdentifier;
    val->_addedElementsByIdentifier = (NSMutableDictionary *)v38;

    v40 = objc_opt_new();
    logger = val->_logger;
    val->_logger = (RERelevanceEngineLogger *)v40;

    v42 = -[REActivityTracker initWithDelegate:]([REActivityTracker alloc], "initWithDelegate:", val);
    -[REActivityTracker trackObject:](v42, "trackObject:", val);
    v43 = v42;

    activityTracker = val->_activityTracker;
    val->_activityTracker = v43;

    v45 = CFSTR("engine");
    if (v225)
      v45 = v225;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.relevanceengine.%@"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    attr = objc_claimAutoreleasedReturnValue();
    -[RERelevanceEngineConfiguration engineQueue](val->_configuration, "engineQueue");
    v211 = objc_claimAutoreleasedReturnValue();
    v209 = objc_retainAutorelease(v46);
    v47 = (const char *)objc_msgSend(v209, "UTF8String");
    if (v211)
      v48 = dispatch_queue_create_with_target_V2(v47, attr, v211);
    else
      v48 = dispatch_queue_create(v47, attr);
    queue = val->_queue;
    val->_queue = (OS_dispatch_queue *)v48;

    objc_msgSend(v215, "observerQueue");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_storeStrong((id *)&val->_callbackQueue, v50);
    }
    else
    {
      v51 = (void *)MEMORY[0x24BDAC9B8];
      v52 = MEMORY[0x24BDAC9B8];
      objc_storeStrong((id *)&val->_callbackQueue, v51);

    }
    v53 = [RERelevanceEnginePreferencesController alloc];
    -[RERelevanceEngineConfiguration observerQueue](val->_configuration, "observerQueue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[RERelevanceEnginePreferencesController initWithQueue:](v53, "initWithQueue:", v54);
    preferenceController = val->_preferenceController;
    val->_preferenceController = (RERelevanceEnginePreferencesController *)v55;

    v214 = val->_configuration;
    -[RERelevanceEngineConfiguration sectionDescriptors](v214, "sectionDescriptors");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v57, "copy");

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v280 = 0u;
    v281 = 0u;
    v278 = 0u;
    v279 = 0u;
    v59 = v58;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v278, location, 16);
    if (v60)
    {
      v61 = *(_QWORD *)v279;
      v62 = *MEMORY[0x24BDBCAB8];
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v279 != v61)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * j), "name");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v224, "containsObject:", v64))
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v62, CFSTR("Section with name \"%@\" already exists. Please choose a unique name"), v64);
          else
            objc_msgSend(v224, "addObject:", v64);

        }
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v278, location, 16);
      }
      while (v60);
    }

    objc_storeStrong((id *)&val->_configurationSectionDescriptors, v58);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v59, "count"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v276 = 0u;
    v277 = 0u;
    v274 = 0u;
    v275 = 0u;
    v66 = v59;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v274, v294, 16);
    if (v67)
    {
      v68 = *(_QWORD *)v275;
      do
      {
        for (k = 0; k != v67; ++k)
        {
          if (*(_QWORD *)v275 != v68)
            objc_enumerationMutation(v66);
          v70 = -[_RESectionDescriptor initWithSectionDescriptor:]([_RESectionDescriptor alloc], "initWithSectionDescriptor:", *(_QWORD *)(*((_QWORD *)&v274 + 1) + 8 * k));
          objc_msgSend(v65, "addObject:", v70);

        }
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v274, v294, 16);
      }
      while (v67);
    }

    v71 = objc_msgSend(v65, "copy");
    sectionDescriptors = val->_sectionDescriptors;
    val->_sectionDescriptors = (NSArray *)v71;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v65, "count"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v272 = 0u;
    v273 = 0u;
    v270 = 0u;
    v271 = 0u;
    obj = v66;
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v270, v293, 16);
    if (v74)
    {
      v75 = *(_QWORD *)v271;
      do
      {
        for (m = 0; m != v74; ++m)
        {
          if (*(_QWORD *)v271 != v75)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v270 + 1) + 8 * m), "historicSectionDescriptor");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77)
          {
            v78 = -[_RESectionDescriptor initWithHistoricSectionDescriptor:]([_RESectionDescriptor alloc], "initWithHistoricSectionDescriptor:", v77);
            objc_msgSend(v73, "addObject:", v78);

          }
        }
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v270, v293, 16);
      }
      while (v74);
    }

    v79 = objc_msgSend(v73, "copy");
    historicSectionDescriptors = val->_historicSectionDescriptors;
    val->_historicSectionDescriptors = (NSArray *)v79;

    +[REFeatureSet featureSet](REMutableFeatureSet, "featureSet");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = 0u;
    v269 = 0u;
    v266 = 0u;
    v267 = 0u;
    -[RERelevanceEngineConfiguration primaryFeatures](v214, "primaryFeatures");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v266, v292, 16);
    if (v82)
    {
      v83 = *(_QWORD *)v267;
      do
      {
        for (n = 0; n != v82; ++n)
        {
          if (*(_QWORD *)v267 != v83)
            objc_enumerationMutation(v81);
          v85 = *(void **)(*((_QWORD *)&v266 + 1) + 8 * n);
          if (objc_msgSend(v85, "featureType") == 2)
          {
            RELogForDomain(0);
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v291 = v85;
              _os_log_impl(&dword_2132F7000, v86, OS_LOG_TYPE_DEFAULT, "Skipping loading primary feature %@ from configuration since it isn't a categorcial feature", buf, 0xCu);
            }

          }
          else
          {
            objc_msgSend(v217, "addFeature:", v85);
          }
        }
        v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v266, v292, 16);
      }
      while (v82);
    }

    v87 = objc_msgSend(v217, "copy");
    mlFeatures = val->_mlFeatures;
    val->_mlFeatures = (REFeatureSet *)v87;

    -[RERelevanceEngineConfiguration primaryFeatures](v214, "primaryFeatures");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = (void *)objc_msgSend(v89, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v264 = 0u;
    v265 = 0u;
    v262 = 0u;
    v263 = 0u;
    v222 = v65;
    v92 = objc_msgSend(v222, "countByEnumeratingWithState:objects:count:", &v262, buf, 16);
    if (v92)
    {
      v93 = *(_QWORD *)v263;
      do
      {
        for (ii = 0; ii != v92; ++ii)
        {
          if (*(_QWORD *)v263 != v93)
            objc_enumerationMutation(v222);
          objc_msgSend(*(id *)(*((_QWORD *)&v262 + 1) + 8 * ii), "rules");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          REExtractRules(v95, v90, v91);

        }
        v92 = objc_msgSend(v222, "countByEnumeratingWithState:objects:count:", &v262, buf, 16);
      }
      while (v92);
    }

    v260 = 0u;
    v261 = 0u;
    v258 = 0u;
    v259 = 0u;
    v221 = v73;
    v96 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v258, v289, 16);
    if (v96)
    {
      v97 = *(_QWORD *)v259;
      do
      {
        for (jj = 0; jj != v96; ++jj)
        {
          if (*(_QWORD *)v259 != v97)
            objc_enumerationMutation(v221);
          objc_msgSend(*(id *)(*((_QWORD *)&v258 + 1) + 8 * jj), "rules");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          REExtractRules(v99, v90, v91);

        }
        v96 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v258, v289, 16);
      }
      while (v96);
    }

    v256 = 0u;
    v257 = 0u;
    v254 = 0u;
    v255 = 0u;
    v100 = v90;
    v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v254, v288, 16);
    if (v101)
    {
      v102 = *(_QWORD *)v255;
      do
      {
        for (kk = 0; kk != v101; ++kk)
        {
          if (*(_QWORD *)v255 != v102)
            objc_enumerationMutation(v100);
          v104 = *(void **)(*((_QWORD *)&v254 + 1) + 8 * kk);
          objc_msgSend(v104, "condition");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "_dependentFeatures");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v226, "unionFeatureSet:", v106);

          v107 = (id)objc_msgSend(v104, "conditionEvaluator");
        }
        v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v254, v288, 16);
      }
      while (v101);
    }

    v252 = 0u;
    v253 = 0u;
    v250 = 0u;
    v251 = 0u;
    v108 = v91;
    v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v250, v287, 16);
    if (v109)
    {
      v110 = *(_QWORD *)v251;
      do
      {
        for (mm = 0; mm != v109; ++mm)
        {
          if (*(_QWORD *)v251 != v110)
            objc_enumerationMutation(v108);
          v112 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * mm);
          objc_msgSend(v112, "leftCondition");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "_dependentFeatures");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v226, "unionFeatureSet:", v114);

          objc_msgSend(v112, "rightCondition");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "_dependentFeatures");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v226, "unionFeatureSet:", v116);

          objc_msgSend(v112, "comparison");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "_dependentFeatures");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v226, "unionFeatureSet:", v118);

          v119 = (id)objc_msgSend(v112, "leftConditionEvaluator");
          v120 = (id)objc_msgSend(v112, "rightConditionEvaluator");
          v121 = (id)objc_msgSend(v112, "comparisonConditionEvaluator");
        }
        v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v250, v287, 16);
      }
      while (v109);
    }

    REIntrinsicFeatureSet();
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "unionFeatureSet:", v122);

    v248 = 0u;
    v249 = 0u;
    v246 = 0u;
    v247 = 0u;
    -[RERelevanceEngineConfiguration interactionDescriptors](v214, "interactionDescriptors");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v246, v286, 16);
    if (v124)
    {
      v125 = *(_QWORD *)v247;
      do
      {
        for (nn = 0; nn != v124; ++nn)
        {
          if (*(_QWORD *)v247 != v125)
            objc_enumerationMutation(v123);
          v127 = *(void **)(*((_QWORD *)&v246 + 1) + 8 * nn);
          objc_msgSend(v127, "selectionFeature");
          v128 = (void *)objc_claimAutoreleasedReturnValue();

          if (v128)
          {
            objc_msgSend(v127, "selectionFeature");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v226, "addFeature:", v129);

          }
          objc_msgSend(v127, "identificationFeature");
          v130 = (void *)objc_claimAutoreleasedReturnValue();

          if (v130)
          {
            objc_msgSend(v127, "identificationFeature");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v226, "addFeature:", v131);

          }
          objc_msgSend(v127, "biasFeature");
          v132 = (void *)objc_claimAutoreleasedReturnValue();

          if (v132)
          {
            objc_msgSend(v127, "biasFeature");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v226, "addFeature:", v133);

          }
        }
        v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v246, v286, 16);
      }
      while (v124);
    }

    RERootFeatureSetForFeatures(v226);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = (void *)objc_msgSend(v134, "mutableCopy");

    REIntrinsicFeatureSet();
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "unionFeatureSet:", v135);

    v136 = objc_msgSend(v213, "copy");
    rootFeatures = val->_rootFeatures;
    val->_rootFeatures = (REFeatureSet *)v136;

    v208 = (void *)objc_msgSend(v226, "copy");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = 0u;
    v245 = 0u;
    v242 = 0u;
    v243 = 0u;
    v220 = v100;
    v139 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v242, v285, 16);
    if (v139)
    {
      v140 = *(_QWORD *)v243;
      do
      {
        for (i1 = 0; i1 != v139; ++i1)
        {
          if (*(_QWORD *)v243 != v140)
            objc_enumerationMutation(v220);
          objc_msgSend(*(id *)(*((_QWORD *)&v242 + 1) + 8 * i1), "condition");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "_inflectionFeatureValuePairs");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "unionSet:", v143);

        }
        v139 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v242, v285, 16);
      }
      while (v139);
    }

    v240 = 0u;
    v241 = 0u;
    v238 = 0u;
    v239 = 0u;
    v219 = v108;
    v144 = (void *)objc_msgSend(v219, "countByEnumeratingWithState:objects:count:", &v238, v284, 16);
    if (v144)
    {
      v145 = *(_QWORD *)v239;
      do
      {
        for (i2 = 0; i2 != v144; i2 = (char *)i2 + 1)
        {
          if (*(_QWORD *)v239 != v145)
            objc_enumerationMutation(v219);
          v147 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * (_QWORD)i2);
          objc_msgSend(v147, "leftCondition");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "_inflectionFeatureValuePairs");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "unionSet:", v149);

          objc_msgSend(v147, "rightCondition");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "_inflectionFeatureValuePairs");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "unionSet:", v151);

          objc_msgSend(v147, "comparison");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "_inflectionFeatureValuePairs");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "unionSet:", v153);

        }
        v144 = (void *)objc_msgSend(v219, "countByEnumeratingWithState:objects:count:", &v238, v284, 16);
      }
      while (v144);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = 0u;
    v237 = 0u;
    v235 = 0u;
    v234 = 0u;
    v218 = v138;
    v155 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v234, v283, 16);
    if (v155)
    {
      v156 = *(_QWORD *)v235;
      do
      {
        for (i3 = 0; i3 != v155; ++i3)
        {
          if (*(_QWORD *)v235 != v156)
            objc_enumerationMutation(v218);
          v158 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * i3);
          objc_msgSend(v158, "feature");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "objectForKeyedSubscript:", v159);
          v160 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v160)
          {
            objc_msgSend(MEMORY[0x24BDBCF20], "set");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
          }
          REFeatureValueForTaggedPointer((void *)objc_msgSend(v158, "value"));
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v162 = v161;
          if (!v161)
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            v162 = v144;
          }
          objc_msgSend(v160, "setByAddingObject:", v162);
          v163 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v161)
          objc_msgSend(v158, "feature");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "setObject:forKeyedSubscript:", v163, v164);

        }
        v155 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v234, v283, 16);
      }
      while (v155);
    }

    v165 = objc_msgSend(v154, "copy");
    inflectionFeatureValues = val->_inflectionFeatureValues;
    val->_inflectionFeatureValues = (NSDictionary *)v165;

    v167 = (void *)objc_msgSend(v208, "mutableCopy");
    v168 = -[REMLModelManager initWithRelevanceEngine:]([REMLModelManager alloc], "initWithRelevanceEngine:", val);
    modelManager = val->_modelManager;
    val->_modelManager = v168;

    -[REMLModelManager _orderedModelFeatures](val->_modelManager, "_orderedModelFeatures");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = (void *)objc_msgSend(v170, "mutableCopy");

    +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "minusFeatureSet:", v172);

    objc_msgSend(v167, "allFeatures");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "addObjectsFromArray:", v173);

    +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v171);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "unionFeatureSet:", v174);

    v175 = [REFeatureMapGenerator alloc];
    -[REFeatureSet allFeatures](val->_rootFeatures, "allFeatures");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = -[REFeatureMapGenerator initWithFeatureList:](v175, "initWithFeatureList:", v176);
    inputFeatureMapGenerator = val->_inputFeatureMapGenerator;
    val->_inputFeatureMapGenerator = (REFeatureMapGenerator *)v177;

    v179 = -[REFeatureMapGenerator initWithFeatureList:]([REFeatureMapGenerator alloc], "initWithFeatureList:", v171);
    outputFeatureMapGenerator = val->_outputFeatureMapGenerator;
    val->_outputFeatureMapGenerator = v179;

    v181 = -[REFeatureTransmuter initWithInputFeatures:outputFeatures:outputFeatureMapGenerator:]([REFeatureTransmuter alloc], "initWithInputFeatures:outputFeatures:outputFeatureMapGenerator:", val->_rootFeatures, v167, val->_outputFeatureMapGenerator);
    featureTransmuter = val->_featureTransmuter;
    val->_featureTransmuter = v181;

    -[RERelevanceEngineLogger addLoggable:](val->_logger, "addLoggable:", val->_featureTransmuter);
    v183 = -[RELiveElementCoordinator initWithRelevanceEngine:]([RELiveElementCoordinator alloc], "initWithRelevanceEngine:", val);
    coordinator = val->_coordinator;
    val->_coordinator = v183;

    v185 = [REDataSourceManager alloc];
    objc_msgSend(v215, "dataSourceLoader");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = -[REDataSourceManager initWithRelevanceEngine:dataSourceLoader:withDelegate:](v185, "initWithRelevanceEngine:dataSourceLoader:withDelegate:", val, v186, val->_coordinator);
    dataSourceManager = val->_dataSourceManager;
    val->_dataSourceManager = (REDataSourceManager *)v187;

    v189 = -[RETrainingManager initWithRelevanceEngine:]([RETrainingManager alloc], "initWithRelevanceEngine:", val);
    trainingManager = val->_trainingManager;
    val->_trainingManager = v189;

    v191 = [REEngineLocationManager alloc];
    objc_msgSend(v215, "locationManager");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = -[REEngineLocationManager initWithRelevanceEngine:locationManager:](v191, "initWithRelevanceEngine:locationManager:", val, v192);
    locationManager = val->_locationManager;
    val->_locationManager = (REEngineLocationManager *)v193;

    v195 = -[REDataSourceCatalog initWithDataSourceManager:]([REDataSourceCatalog alloc], "initWithDataSourceManager:", val->_dataSourceManager);
    dataSourceCatalog = val->_dataSourceCatalog;
    val->_dataSourceCatalog = v195;

    +[RESingleton sharedInstance](RERelevanceEngineDebugger, "sharedInstance");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "_registerEngine:", val);

    if (_fetchedInternalBuildOnceToken_0 != -1)
      dispatch_once(&_fetchedInternalBuildOnceToken_0, &__block_literal_global_31);
    if (_isInternalDevice_0)
      +[RETrainingSimulationCoordinator prewarm](RETrainingSimulationCoordinator, "prewarm");
    -[RERelevanceEngineLogger addLoggable:](val->_logger, "addLoggable:");
    -[RERelevanceEngine configuration](val, "configuration");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = objc_msgSend(v198, "allowsDiagnosticExtension");

    if (v199)
    {
      +[RESingleton sharedInstance](RERelevanceEngineDiagnosticRegistration, "sharedInstance");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "checkinEngine:", val);

    }
    objc_initWeak(location, val);
    callbackQueue = val->_callbackQueue;
    if (objc_msgSend(v215, "wantsImmutableContent"))
      v202 = 0.0;
    else
      v202 = 0.05;
    v227[0] = MEMORY[0x24BDAC760];
    v227[1] = 3221225472;
    v227[2] = __48__RERelevanceEngine_initWithName_configuration___block_invoke_2;
    v227[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v228, location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", callbackQueue, v227, v202);
    v203 = objc_claimAutoreleasedReturnValue();
    loadingScheduler = val->_loadingScheduler;
    val->_loadingScheduler = (REUpNextScheduler *)v203;

    objc_destroyWeak(&v228);
    objc_destroyWeak(location);

  }
  v205 = val;

  return v205;
}

- (NSString)name
{
  return self->_name;
}

uint64_t __116__RERelevanceEngine_RERelevanceEngineProperties__enumerateSectionDescriptorsWithOptions_includeHistoric_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__RERelevanceEngine_RESubsystems___addSubsystem___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2[200])
    return objc_msgSend(v2, "_queue_resumeSubsystem:", v3);
  else
    return objc_msgSend(v2, "_queue_pauseSubsystem:", v3);
}

- (RERelevanceEngineLogger)logger
{
  return self->_logger;
}

- (NSDictionary)inflectionFeatureValues
{
  return self->_inflectionFeatureValues;
}

- (REFeatureSet)rootFeatures
{
  return self->_rootFeatures;
}

uint64_t __52__RERelevanceEngine_activityTracker_didEndActivity___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 201) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "schedule");
}

uint64_t __54__RERelevanceEngine_activityTracker_didBeginActivity___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 201) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "schedule");
}

void __48__RERelevanceEngine_initWithName_configuration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_callbackQueue_notifyLoadingState");

}

- (void)_callbackQueue_notifyLoadingState
{
  _BOOL4 updatedLoading;
  NSObject *v4;
  _BOOL4 v5;
  RELiveElementCoordinator *coordinator;
  RELiveElementCoordinator *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];

  updatedLoading = self->_updatedLoading;
  if (updatedLoading == self->_loading)
  {
    if (!self->_updatedLoading)
      -[RERelevanceEngine _notifyResumeCompleted](self, "_notifyResumeCompleted");
  }
  else
  {
    self->_loading = updatedLoading;
    RELogForDomain(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (updatedLoading)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2132F7000, v4, OS_LOG_TYPE_DEFAULT, "Engine started loading new data", buf, 2u);
      }

      coordinator = self->_coordinator;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __54__RERelevanceEngine__callbackQueue_notifyLoadingState__block_invoke;
      v9[3] = &unk_24CF8CC38;
      v9[4] = self;
      -[REElementCoordinator enumerateObservers:](coordinator, "enumerateObservers:", v9);
    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2132F7000, v4, OS_LOG_TYPE_DEFAULT, "Engine finished loading new data", buf, 2u);
      }

      v7 = self->_coordinator;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __54__RERelevanceEngine__callbackQueue_notifyLoadingState__block_invoke_46;
      v8[3] = &unk_24CF8CC38;
      v8[4] = self;
      -[REElementCoordinator enumerateObservers:](v7, "enumerateObservers:", v8);
      -[RERelevanceEngine _notifyResumeCompleted](self, "_notifyResumeCompleted");
    }
  }
}

- (void)_notifyResumeCompleted
{
  os_unfair_lock_s *p_activityTrackerLock;
  id resumeCompletionBlock;
  id v5;

  p_activityTrackerLock = &self->_activityTrackerLock;
  os_unfair_lock_lock(&self->_activityTrackerLock);
  resumeCompletionBlock = self->_resumeCompletionBlock;
  if (resumeCompletionBlock)
  {
    dispatch_async((dispatch_queue_t)self->_callbackQueue, resumeCompletionBlock);
    v5 = self->_resumeCompletionBlock;
    self->_resumeCompletionBlock = 0;

  }
  os_unfair_lock_unlock(p_activityTrackerLock);
}

- (void)endActivity:(id)a3 forObject:(id)a4
{
  os_unfair_lock_s *p_activityTrackerLock;
  id v7;
  id v8;

  p_activityTrackerLock = &self->_activityTrackerLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_activityTrackerLock);
  -[REActivityTracker endActivity:forObject:](self->_activityTracker, "endActivity:forObject:", v8, v7);

  os_unfair_lock_unlock(p_activityTrackerLock);
}

- (void)beginActivity:(id)a3 forObject:(id)a4
{
  os_unfair_lock_s *p_activityTrackerLock;
  id v7;
  id v8;

  p_activityTrackerLock = &self->_activityTrackerLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_activityTrackerLock);
  -[REActivityTracker beginActivity:forObject:](self->_activityTracker, "beginActivity:forObject:", v8, v7);

  os_unfair_lock_unlock(p_activityTrackerLock);
}

- (void)activityTracker:(id)a3 didEndActivity:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  RELogForDomain(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_DEFAULT, "Engine finished tracking %{public}@.", buf, 0xCu);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__RERelevanceEngine_activityTracker_didEndActivity___block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(callbackQueue, block);

}

- (void)activityTracker:(id)a3 didBeginActivity:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *callbackQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  RELogForDomain(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_DEFAULT, "Engine started tracking %{public}@.", buf, 0xCu);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__RERelevanceEngine_activityTracker_didBeginActivity___block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(callbackQueue, block);

}

- (void)_queue_pauseSubsystem:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v4, "isRunning"))
  {
    objc_msgSend(v4, "setRunning:", 0);
    objc_msgSend(v4, "pause");
  }

}

- (OS_dispatch_queue)subsystemQueue
{
  return self->_queue;
}

- (void)_addSubsystem:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSMutableArray addObject:](self->_subsystems, "addObject:", v4);
  os_unfair_lock_lock(&self->_activityTrackerLock);
  -[REActivityTracker trackObject:](self->_activityTracker, "trackObject:", v4);
  os_unfair_lock_unlock(&self->_activityTrackerLock);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__RERelevanceEngine_RESubsystems___addSubsystem___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (REMLModelManager)modelManager
{
  return self->_modelManager;
}

- (REFeatureTransmuter)featureTransmuter
{
  return self->_featureTransmuter;
}

- (RERelevanceEngineConfiguration)configuration
{
  return self->_configuration;
}

- (REFeatureSet)mlFeatures
{
  return self->_mlFeatures;
}

- (void)enumerateSectionDescriptorsWithOptions:(unint64_t)a3 includeHistoric:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __116__RERelevanceEngine_RERelevanceEngineProperties__enumerateSectionDescriptorsWithOptions_includeHistoric_usingBlock___block_invoke;
    v13[3] = &unk_24CF8CC60;
    v14 = v8;
    v10 = (void *)MEMORY[0x2199B2434](v13);
    if (v5)
    {
      if ((a3 & 2) != 0)
        v11 = 184;
      else
        v11 = 176;
      if ((a3 & 2) != 0)
        v12 = 176;
      else
        v12 = 184;
      objc_msgSend(*(id *)((char *)&self->super.isa + v11), "enumerateObjectsWithOptions:usingBlock:", a3, v10);
    }
    else
    {
      v12 = 176;
    }
    objc_msgSend(*(id *)((char *)&self->super.isa + v12), "enumerateObjectsWithOptions:usingBlock:", a3, v10);

  }
}

- (RELiveElementCoordinator)coordinator
{
  return self->_coordinator;
}

- (BOOL)wantsImmutableContent
{
  return -[RERelevanceEngineConfiguration wantsImmutableContent](self->_configuration, "wantsImmutableContent");
}

- (RERelevanceEnginePreferences)effectivePreferences
{
  return -[RERelevanceEnginePreferencesController effectivePreferences](self->_preferenceController, "effectivePreferences");
}

+ (void)prewarmWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  _RESectionDescriptor *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  _RESectionDescriptor *v25;
  void *v26;
  uint64_t n;
  uint64_t v28;
  uint64_t m;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t ii;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t jj;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t kk;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t mm;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t nn;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i1;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  id v102;
  dispatch_time_t v103;
  NSObject *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id obj;
  void *v115;
  void *v116;
  _QWORD block[5];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[5];
  uint8_t v172[128];
  uint8_t buf[4];
  void *v174;
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _QWORD v178[5];
  id v179;
  uint64_t v180;

  v180 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "dataSourceLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prewarm");

  objc_msgSend(v3, "relevanceProviderManagerLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prewarm");

  REApplicationCachePrewarm();
  v107 = v3;
  objc_msgSend(v107, "sectionDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v162, v178, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v163;
    v11 = *MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v163 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v162 + 1) + 8 * i), "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v115, "containsObject:", v13))
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v11, CFSTR("Section with name \"%@\" already exists. Please choose a unique name"), v13);
        else
          objc_msgSend(v115, "addObject:", v13);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v162, v178, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v158, v177, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v159;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v159 != v17)
          objc_enumerationMutation(v15);
        v19 = -[_RESectionDescriptor initWithSectionDescriptor:]([_RESectionDescriptor alloc], "initWithSectionDescriptor:", *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * j));
        objc_msgSend(v14, "addObject:", v19);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v158, v177, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  obj = v15;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v176, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v155;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v155 != v22)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v154 + 1) + 8 * k), "historicSectionDescriptor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = -[_RESectionDescriptor initWithHistoricSectionDescriptor:]([_RESectionDescriptor alloc], "initWithHistoricSectionDescriptor:", v24);
          objc_msgSend(v20, "addObject:", v25);

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v176, 16);
    }
    while (v21);
  }

  +[REFeatureSet featureSet](REMutableFeatureSet, "featureSet");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  objc_msgSend(v107, "primaryFeatures");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  n = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v150, v175, 16);
  if (n)
  {
    v28 = *(_QWORD *)v151;
    do
    {
      for (m = 0; m != n; ++m)
      {
        if (*(_QWORD *)v151 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * m);
        if (objc_msgSend(v30, "featureType") == 2)
        {
          RELogForDomain(0);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v174 = v30;
            _os_log_impl(&dword_2132F7000, v31, OS_LOG_TYPE_DEFAULT, "Skipping loading primary feature %@ from configuration since it isn't a categorcial feature", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(v108, "addFeature:", v30);
        }
      }
      n = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v150, v175, 16);
    }
    while (n);
  }

  objc_msgSend(v107, "primaryFeatures");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)objc_msgSend(v32, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v113 = v14;
  v35 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v146, buf, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v147;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v147 != v36)
          objc_enumerationMutation(v113);
        objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * n), "rules");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        REExtractRules(v37, v33, v34);

      }
      v35 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v146, buf, 16);
    }
    while (v35);
  }

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v112 = v20;
  v38 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v142, v172, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v143;
    do
    {
      for (n = 0; n != v38; ++n)
      {
        if (*(_QWORD *)v143 != v39)
          objc_enumerationMutation(v112);
        objc_msgSend(*(id *)(*((_QWORD *)&v142 + 1) + 8 * n), "rules");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        REExtractRules(v40, v33, v34);

      }
      v38 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v142, v172, 16);
    }
    while (v38);
  }

  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v41 = v33;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v138, v171, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v139;
    do
    {
      for (ii = 0; ii != v42; ++ii)
      {
        if (*(_QWORD *)v139 != v43)
          objc_enumerationMutation(v41);
        v45 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * ii);
        objc_msgSend(v45, "condition");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "_dependentFeatures");
        n = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "unionFeatureSet:", n);

        v47 = (id)objc_msgSend(v45, "conditionEvaluator");
      }
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v138, v171, 16);
    }
    while (v42);
  }

  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v48 = v34;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v134, v170, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v135;
    do
    {
      for (jj = 0; jj != v49; ++jj)
      {
        if (*(_QWORD *)v135 != v50)
          objc_enumerationMutation(v48);
        v52 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * jj);
        objc_msgSend(v52, "leftCondition");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "_dependentFeatures");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "unionFeatureSet:", v54);

        objc_msgSend(v52, "rightCondition");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "_dependentFeatures");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "unionFeatureSet:", v56);

        objc_msgSend(v52, "comparison");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "_dependentFeatures");
        n = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "unionFeatureSet:", n);

        v58 = (id)objc_msgSend(v52, "leftConditionEvaluator");
        v59 = (id)objc_msgSend(v52, "rightConditionEvaluator");
        v60 = (id)objc_msgSend(v52, "comparisonConditionEvaluator");
      }
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v134, v170, 16);
    }
    while (v49);
  }

  REIntrinsicFeatureSet();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "unionFeatureSet:", v61);

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  objc_msgSend(v107, "interactionDescriptors");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v130, v169, 16);
  if (v63)
  {
    v64 = *(_QWORD *)v131;
    do
    {
      for (kk = 0; kk != v63; ++kk)
      {
        if (*(_QWORD *)v131 != v64)
          objc_enumerationMutation(v62);
        n = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * kk);
        objc_msgSend((id)n, "selectionFeature");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (v66)
        {
          objc_msgSend((id)n, "selectionFeature");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "addFeature:", v67);

        }
        objc_msgSend((id)n, "identificationFeature");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          objc_msgSend((id)n, "identificationFeature");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "addFeature:", v69);

        }
        objc_msgSend((id)n, "biasFeature");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        if (v70)
        {
          objc_msgSend((id)n, "biasFeature");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "addFeature:", v71);

        }
      }
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v130, v169, 16);
    }
    while (v63);
  }

  RERootFeatureSetForFeatures(v116);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)objc_msgSend(v72, "mutableCopy");

  REIntrinsicFeatureSet();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "unionFeatureSet:", v73);

  v105 = (void *)objc_msgSend(v106, "copy");
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v111 = v41;
  v75 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v126, v168, 16);
  if (v75)
  {
    n = *(_QWORD *)v127;
    do
    {
      for (mm = 0; mm != v75; ++mm)
      {
        if (*(_QWORD *)v127 != n)
          objc_enumerationMutation(v111);
        objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * mm), "condition");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "_inflectionFeatureValuePairs");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "unionSet:", v78);

      }
      v75 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v126, v168, 16);
    }
    while (v75);
  }

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v110 = v48;
  v79 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v122, v167, 16);
  if (v79)
  {
    v80 = *(_QWORD *)v123;
    do
    {
      for (nn = 0; nn != v79; ++nn)
      {
        if (*(_QWORD *)v123 != v80)
          objc_enumerationMutation(v110);
        v82 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * nn);
        objc_msgSend(v82, "leftCondition");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "_inflectionFeatureValuePairs");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "unionSet:", v84);

        objc_msgSend(v82, "rightCondition");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "_inflectionFeatureValuePairs");
        n = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "unionSet:", n);

        objc_msgSend(v82, "comparison");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "_inflectionFeatureValuePairs");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "unionSet:", v87);

      }
      v79 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v122, v167, 16);
    }
    while (v79);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v109 = v74;
  v89 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v118, v166, 16);
  if (v89)
  {
    v90 = *(_QWORD *)v119;
    do
    {
      for (i1 = 0; i1 != v89; ++i1)
      {
        if (*(_QWORD *)v119 != v90)
          objc_enumerationMutation(v109);
        v92 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i1);
        objc_msgSend(v92, "feature");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "objectForKeyedSubscript:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v94)
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
        }
        REFeatureValueForTaggedPointer((void *)objc_msgSend(v92, "value"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = v95;
        if (!v95)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          n = objc_claimAutoreleasedReturnValue();
          v96 = (void *)n;
        }
        objc_msgSend(v94, "setByAddingObject:", v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v95)
        objc_msgSend(v92, "feature");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setObject:forKeyedSubscript:", v97, v98);

      }
      v89 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v118, v166, 16);
    }
    while (v89);
  }

  +[REContentRelevanceProviderManager _features](REContentRelevanceProviderManager, "_features");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v105, "intersectsFeatureSet:", v100);

  if (v101)
    RETokenizeStringPrewarm();
  v102 = +[RERelevanceProviderManager providerManagerClasses](RERelevanceProviderManager, "providerManagerClasses");
  +[RESingleton _incrementSingletonCache](RESingleton, "_incrementSingletonCache");
  v178[0] = 0;
  v178[1] = v178;
  v178[2] = 0x3032000000;
  v178[3] = __Block_byref_object_copy__7;
  v178[4] = __Block_byref_object_dispose__7;
  +[REPredictor systemPredictorsSupportingFeatureSet:relevanceEngine:](REPredictor, "systemPredictorsSupportingFeatureSet:relevanceEngine:", v105, 0);
  v179 = (id)objc_claimAutoreleasedReturnValue();
  v103 = dispatch_time(0, 500000000);
  objc_msgSend(v107, "observerQueue");
  v104 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__RERelevanceEngine_prewarmWithConfiguration___block_invoke;
  block[3] = &unk_24CF8AC38;
  block[4] = v178;
  dispatch_after(v103, v104, block);

  _Block_object_dispose(v178, 8);
}

uint64_t __46__RERelevanceEngine_prewarmWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

  return +[RESingleton _decrementSingletonCache](RESingleton, "_decrementSingletonCache");
}

- (RERelevanceEngine)initWithConfiguration:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  RERelevanceEngine *v8;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RERelevanceEngine initWithName:configuration:](self, "initWithName:configuration:", v7, v5);

  return v8;
}

uint64_t __48__RERelevanceEngine_initWithName_configuration___block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_0 = result;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[RESingleton sharedInstance](RERelevanceEngineDebugger, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_unregisterEngine:", self);

  +[RESingleton _decrementSingletonCache](RESingleton, "_decrementSingletonCache");
  -[RERelevanceEngineLogger removeLoggable:](self->_logger, "removeLoggable:", self);
  -[RERelevanceEngineLogger removeLoggable:](self->_logger, "removeLoggable:", self->_featureTransmuter);
  v4.receiver = self;
  v4.super_class = (Class)RERelevanceEngine;
  -[RERelevanceEngine dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[RERelevanceEngine name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (REDataSourceCatalog)dataSourceCatalog
{
  return self->_dataSourceCatalog;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD block[5];

  v4 = a3;
  -[RERelevanceEngine beginActivity:forObject:](self, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);
  -[REElementCoordinator addObserver:](self->_coordinator, "addObserver:", v4);

  if (self->_automaticallyResumeEngine
    && -[REElementCoordinator numberOfObservers](self->_coordinator, "numberOfObservers"))
  {
    -[RERelevanceEngine resume](self, "resume");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__RERelevanceEngine_addObserver___block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __33__RERelevanceEngine_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), *(_QWORD *)(a1 + 32));
}

- (void)removeObserver:(id)a3
{
  -[REElementCoordinator removeObserver:](self->_coordinator, "removeObserver:", a3);
  if (self->_automaticallyResumeEngine
    && !-[REElementCoordinator numberOfObservers](self->_coordinator, "numberOfObservers"))
  {
    -[RERelevanceEngine pause](self, "pause");
  }
}

- (void)addTrainingContext:(id)a3
{
  -[RETrainingManager addTrainingContext:](self->_trainingManager, "addTrainingContext:", a3);
}

- (void)removeTrainingContext:(id)a3
{
  -[RETrainingManager removeTrainingContext:](self->_trainingManager, "removeTrainingContext:", a3);
}

- (void)trainWithPendingEvents
{
  -[RERelevanceEngine trainPendingEventsWithCompletion:](self, "trainPendingEventsWithCompletion:", 0);
}

- (void)trainPendingEventsWithCompletion:(id)a3
{
  -[RETrainingManager manuallyPerformTrainingWithCompletion:](self->_trainingManager, "manuallyPerformTrainingWithCompletion:", a3);
}

- (void)saveModelFile
{
  -[REMLModelManager manuallySaveModel](self->_modelManager, "manuallySaveModel");
}

- (id)elementAtPath:(id)a3
{
  return -[REElementCoordinator elementAtPath:](self->_coordinator, "elementAtPath:", a3);
}

- (unint64_t)numberOfElementsInSection:(id)a3
{
  return -[REElementCoordinator numberOfElementsInSection:](self->_coordinator, "numberOfElementsInSection:", a3);
}

- (id)pathForElement:(id)a3
{
  return -[REElementCoordinator pathForElement:](self->_coordinator, "pathForElement:", a3);
}

- (void)enumerateRankedContent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __44__RERelevanceEngine_enumerateRankedContent___block_invoke;
    v6[3] = &unk_24CF8CBC0;
    v6[4] = self;
    v5 = v4;
    v6[0] = MEMORY[0x24BDAC760];
    v7 = v4;
    -[RERelevanceEngine enumerateSectionDescriptorsWithOptions:includeHistoric:usingBlock:](self, "enumerateSectionDescriptorsWithOptions:includeHistoric:usingBlock:", 0, 1, v6);

    v4 = v5;
  }

}

void __44__RERelevanceEngine_enumerateRankedContent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__RERelevanceEngine_enumerateRankedContent___block_invoke_2;
  v6[3] = &unk_24CF8CB98;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateRankedContentInSection:usingBlock:", v5, v6);

}

void __44__RERelevanceEngine_enumerateRankedContent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  RESectionPath *v6;

  v5 = a3;
  v6 = -[RESectionPath initWithSectionName:element:]([RESectionPath alloc], "initWithSectionName:element:", *(_QWORD *)(a1 + 32), a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)enumerateRankedContentInSection:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  RESectionPath *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (v6)
  {
    v7 = -[RERelevanceEngine numberOfElementsInSection:](self, "numberOfElementsInSection:", v12);
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        v10 = -[RESectionPath initWithSectionName:element:]([RESectionPath alloc], "initWithSectionName:element:", v12, i);
        -[RERelevanceEngine elementAtPath:](self, "elementAtPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          v6[2](v6, i, v11);

      }
    }
  }

}

- (void)addElement:(id)a3 section:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  RERelevanceEngine *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[RERelevanceEngineSubsystem beginActivity:forObject:](self->_coordinator, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__RERelevanceEngine_addElement_section___block_invoke;
  block[3] = &unk_24CF8C580;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __40__RERelevanceEngine_addElement_section___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const __CFString *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 40) + 160);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEqualToString:", v2, (_QWORD)v9) & 1) != 0)
          {

            goto LABEL_15;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v2);
    if (*(_QWORD *)(a1 + 48))
      v8 = *(const __CFString **)(a1 + 48);
    else
      v8 = CFSTR("defaultSectionIdentifier");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "addElement:toSection:", *(_QWORD *)(a1 + 32), v8, (_QWORD)v9);
  }
LABEL_15:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"));

}

- (void)removeElement:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  RERelevanceEngine *v9;

  v4 = a3;
  -[RERelevanceEngineSubsystem beginActivity:forObject:](self->_coordinator, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__RERelevanceEngine_removeElement___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __35__RERelevanceEngine_removeElement___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 40) + 160);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEqualToString:", v2, (_QWORD)v9) & 1) != 0)
          {
            v8 = *(id *)(a1 + 32);

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "setObject:forKeyedSubscript:", 0, v2);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeElement:", v8);
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }

    v8 = 0;
LABEL_12:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), (_QWORD)v9);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"));
  }

}

- (BOOL)isRunning
{
  RERelevanceEngine *v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__RERelevanceEngine_isRunning__block_invoke;
  v5[3] = &unk_24CF8C1C8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __30__RERelevanceEngine_isRunning__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 200);
  return result;
}

- (void)_queue_resumeWithTimeout:(double)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  id resumeCompletionBlock;
  double v11;
  dispatch_time_t v12;
  NSObject *queue;
  NSMutableArray *v14;
  NSObject *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[5];
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a4;
  v7 = v6;
  if (self->_running)
  {
    RELogForDomain(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2132F7000, v8, OS_LOG_TYPE_DEFAULT, "Engine is already running!", buf, 2u);
    }

    if (v7)
      v7[2](v7);
  }
  else
  {
    if (v6)
    {
      os_unfair_lock_lock(&self->_activityTrackerLock);
      v9 = (void *)objc_msgSend(v7, "copy");
      resumeCompletionBlock = self->_resumeCompletionBlock;
      self->_resumeCompletionBlock = v9;

      v11 = a3 * 1000000000.0;
      if (a3 < 10.0)
        v11 = 1.0e10;
      v12 = dispatch_time(0, (uint64_t)v11);
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__RERelevanceEngine__queue_resumeWithTimeout_completion___block_invoke;
      block[3] = &unk_24CF8AAF0;
      block[4] = self;
      dispatch_after(v12, queue, block);
      os_unfair_lock_unlock(&self->_activityTrackerLock);
    }
    -[RERelevanceEngineSubsystem beginActivity:forObject:](self->_coordinator, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);
    v14 = self->_subsystems;
    RELogForDomain(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableArray componentsJoinedByString:](v14, "componentsJoinedByString:", CFSTR(", "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_impl(&dword_2132F7000, v15, OS_LOG_TYPE_DEFAULT, "Resuming engine and subsystems: %{public}@", buf, 0xCu);

    }
    self->_running = 1;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v14;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          -[RERelevanceEngine _queue_resumeSubsystem:](self, "_queue_resumeSubsystem:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21++), (_QWORD)v22);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v19);
    }

    -[RERelevanceEngineSubsystem endActivity:forObject:](self->_coordinator, "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);
  }

}

uint64_t __57__RERelevanceEngine__queue_resumeWithTimeout_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyResumeCompleted");
}

- (void)resumeWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__RERelevanceEngine_resumeWithTimeout_completion___block_invoke;
  block[3] = &unk_24CF8CBE8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __50__RERelevanceEngine_resumeWithTimeout_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resumeWithTimeout:completion:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)updateSectionsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke;
  block[3] = &unk_24CF8AA00;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  dispatch_group_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;

  v2 = dispatch_group_create();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_2;
  v11[3] = &unk_24CF8CC10;
  v12 = v2;
  v13 = *(id *)(a1 + 40);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_4;
  v7[3] = &unk_24CF8AA00;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v12;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v6 = v12;
  objc_msgSend(v3, "enumerateElementDataSourceControllers:completion:", v11, v7);

}

void __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_3;
  v6[3] = &unk_24CF8AAF0;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "invalidateElementsInSections:completion:", v5, v6);

}

void __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v2 = *(NSObject **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_5;
  v4[3] = &unk_24CF8AA78;
  v4[4] = v1;
  v5 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v3, v4);

}

void __62__RERelevanceEngine_updateSectionsWithIdentifiers_completion___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"));
  v2 = *(void **)(a1 + 40);
  if (v2)
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), v2);
}

- (void)resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__RERelevanceEngine_resume__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__RERelevanceEngine_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resumeWithTimeout:completion:", 0, 0.0);
}

- (void)pause
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__RERelevanceEngine_pause__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __26__RERelevanceEngine_pause__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 200))
  {
    v3 = *(id *)(v1 + 24);
    RELogForDomain(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_2132F7000, v4, OS_LOG_TYPE_DEFAULT, "Pausing engine and subsystems: %{public}@", buf, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 32), "_queue_pauseSubsystem:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_queue_resumeSubsystem:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((objc_msgSend(v4, "isRunning") & 1) == 0)
  {
    objc_msgSend(v4, "setRunning:", 1);
    objc_msgSend(v4, "resume");
  }

}

uint64_t __54__RERelevanceEngine__callbackQueue_notifyLoadingState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "relevanceEngineDidBeginUpdatingRelevance:", *(_QWORD *)(a1 + 32));
}

uint64_t __54__RERelevanceEngine__callbackQueue_notifyLoadingState__block_invoke_46(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "relevanceEngineDidFinishUpdatingRelevance:", *(_QWORD *)(a1 + 32));
}

- (void)setPreferences:(id)a3 forObject:(id)a4
{
  -[RERelevanceEnginePreferencesController setPreferences:forObject:](self->_preferenceController, "setPreferences:forObject:", a3, a4);
}

- (void)removePreferencesForObject:(id)a3
{
  -[RERelevanceEnginePreferencesController removePreferencesForObject:](self->_preferenceController, "removePreferencesForObject:", a3);
}

- (BOOL)automaticallyResumeEngine
{
  return self->_automaticallyResumeEngine;
}

- (void)setAutomaticallyResumeEngine:(BOOL)a3
{
  self->_automaticallyResumeEngine = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_resumeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_loadingScheduler, 0);
  objc_storeStrong((id *)&self->_inflectionFeatureValues, 0);
  objc_storeStrong((id *)&self->_historicSectionDescriptors, 0);
  objc_storeStrong((id *)&self->_sectionDescriptors, 0);
  objc_storeStrong((id *)&self->_configurationSectionDescriptors, 0);
  objc_storeStrong((id *)&self->_addedElementsByIdentifier, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_activityTracker, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_preferenceController, 0);
  objc_storeStrong((id *)&self->_dataSourceCatalog, 0);
  objc_storeStrong((id *)&self->_trainingManager, 0);
  objc_storeStrong((id *)&self->_featureTransmuter, 0);
  objc_storeStrong((id *)&self->_outputFeatureMapGenerator, 0);
  objc_storeStrong((id *)&self->_inputFeatureMapGenerator, 0);
  objc_storeStrong((id *)&self->_modelManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mlFeatures, 0);
  objc_storeStrong((id *)&self->_rootFeatures, 0);
  objc_storeStrong((id *)&self->_subsystems, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (REDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (RETrainingManager)trainingManager
{
  return self->_trainingManager;
}

- (REEngineLocationManager)locationManager
{
  return self->_locationManager;
}

- (NSArray)sectionDescriptors
{
  return self->_sectionDescriptors;
}

- (NSArray)historicSectionDescriptors
{
  return self->_historicSectionDescriptors;
}

- (id)newInputFeatureMap
{
  -[REFeatureMapGenerator createFeatureMap](self->_inputFeatureMapGenerator, "createFeatureMap");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newOutputFeatureMap
{
  -[REFeatureMapGenerator createFeatureMap](self->_outputFeatureMapGenerator, "createFeatureMap");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_REEngineDefaults)defaults
{
  return self->_defaults;
}

- (id)elementFromDictionary:(id)a3
{
  RELiveElementCoordinator *coordinator;
  id v4;
  void *v5;
  void *v6;
  REElement *v7;

  coordinator = self->_coordinator;
  v4 = a3;
  -[RELiveElementCoordinator elementRelevanceEngine](coordinator, "elementRelevanceEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relevanceProviderEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[REElement initWithDictionary:relevanceProviderGenerator:]([REElement alloc], "initWithDictionary:relevanceProviderGenerator:", v4, v6);
  return v7;
}

- (id)dictionaryFromElement:(id)a3
{
  RELiveElementCoordinator *coordinator;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  coordinator = self->_coordinator;
  v4 = a3;
  -[RELiveElementCoordinator elementRelevanceEngine](coordinator, "elementRelevanceEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relevanceProviderEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dictionaryEncodingWithRelevanceProviderGenerator:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x24BDBD1B8];
  v9 = v8;

  return v9;
}

- (NSArray)subsystems
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_subsystems, "copy");
}

- (BOOL)isSectionWithNameHistoric:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_historicSectionDescriptors;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "name", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)historicSectionForSection:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_configurationSectionDescriptors;
  v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "historicSectionDescriptor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "name");
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)sectionForHistoricSection:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_configurationSectionDescriptors;
  v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "historicSectionDescriptor", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v9, "name");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)elementRankerForSection:(id)a3
{
  return -[RELiveElementCoordinator elementRankerForSection:](self->_coordinator, "elementRankerForSection:", a3);
}

- (void)_removeSubsystem:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSMutableArray removeObject:](self->_subsystems, "removeObject:", v4);
  os_unfair_lock_lock(&self->_activityTrackerLock);
  -[REActivityTracker withdrawObject:](self->_activityTracker, "withdrawObject:", v4);
  os_unfair_lock_unlock(&self->_activityTrackerLock);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__RERelevanceEngine_RESubsystems___removeSubsystem___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __52__RERelevanceEngine_RESubsystems___removeSubsystem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pauseSubsystem:", *(_QWORD *)(a1 + 40));
}

- (void)storeDiagnosticLogs:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__RERelevanceEngine_RELogging__storeDiagnosticLogs___block_invoke;
    v6[3] = &unk_24CF8CC88;
    v7 = v4;
    -[RERelevanceEngine _captureAndStoreDiagnosticLogs:](self, "_captureAndStoreDiagnosticLogs:", v6);

  }
}

uint64_t __52__RERelevanceEngine_RELogging__storeDiagnosticLogs___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeDiagnosticLogsToFile:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__RERelevanceEngine_RELogging__storeDiagnosticLogsToFile___block_invoke;
    v6[3] = &unk_24CF8CC88;
    v7 = v4;
    -[RERelevanceEngine _captureAndStoreDiagnosticLogs:](self, "_captureAndStoreDiagnosticLogs:", v6);

  }
}

uint64_t __58__RERelevanceEngine_RELogging__storeDiagnosticLogsToFile___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_captureAndStoreDiagnosticLogs:(id)a3
{
  id v4;
  void *v5;
  RERelevanceEngineLogger *logger;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  RERelevanceEngine *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    logger = self->_logger;
    v7 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __63__RERelevanceEngine_RELogging___captureAndStoreDiagnosticLogs___block_invoke;
    v13[3] = &unk_24CF8CCB0;
    v14 = v5;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __63__RERelevanceEngine_RELogging___captureAndStoreDiagnosticLogs___block_invoke_2;
    v9[3] = &unk_24CF8AA00;
    v10 = v14;
    v11 = self;
    v12 = v4;
    v8 = v14;
    -[RERelevanceEngineLogger collectLogs:completion:](logger, "collectLogs:completion:", v13, v9);

  }
}

void __63__RERelevanceEngine_RELogging___captureAndStoreDiagnosticLogs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __63__RERelevanceEngine_RELogging___captureAndStoreDiagnosticLogs___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", 0);
    objc_msgSend(v4, "appendString:", v2);

  }
  RENewLogFilePathForTask(*(void **)(*(_QWORD *)(a1 + 40) + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToFile:atomically:encoding:error:", v3, 1, 4, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)predictionForElementAtPath:(id)a3
{
  return -[RELiveElementCoordinator predictionForElementAtPath:](self->_coordinator, "predictionForElementAtPath:", a3);
}

- (id)predictionForElement:(id)a3
{
  return -[RELiveElementCoordinator predictionForElement:](self->_coordinator, "predictionForElement:", a3);
}

- (id)featureProviderForElement:(id)a3
{
  return -[RELiveElementCoordinator featureProviderForElement:](self->_coordinator, "featureProviderForElement:", a3);
}

- (id)featureProviderForElementAtPath:(id)a3
{
  return -[RELiveElementCoordinator featureProviderForElementAtPath:](self->_coordinator, "featureProviderForElementAtPath:", a3);
}

- (void)pauseForSimulation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__RERelevanceEngine_RESimulation__pauseForSimulation__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__RERelevanceEngine_RESimulation__pauseForSimulation__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "pause");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "enumerateElementDataSourceControllers:", &__block_literal_global_324);
}

void __53__RERelevanceEngine_RESimulation__pauseForSimulation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  objc_msgSend(v2, "elementOperationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__RERelevanceEngine_RESimulation__pauseForSimulation__block_invoke_3;
  block[3] = &unk_24CF8AAF0;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

void __53__RERelevanceEngine_RESimulation__pauseForSimulation__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allElements", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "identifier");
          v9 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v9;
        }
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeElementsWithIds:", v2);
}

- (void)resumeFromSimulation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__RERelevanceEngine_RESimulation__resumeFromSimulation__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __55__RERelevanceEngine_RESimulation__resumeFromSimulation__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 200))
  {
    objc_msgSend(*(id *)(v1 + 64), "resume");
    v1 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v1 + 64), "enumerateElementDataSourceControllers:", &__block_literal_global_326);
}

uint64_t __55__RERelevanceEngine_RESimulation__resumeFromSimulation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateElements");
}

- (void)resetModelWithCompletion:(id)a3
{
  -[REMLModelManager performModelClearWithCompletion:](self->_modelManager, "performModelClearWithCompletion:", a3);
}

- (void)gatherMetrics
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("REDidCollectMetrics"), 0);

}

@end
