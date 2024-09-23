@implementation APOdmlEvaluator

- (APOdmlEvaluator)initWithTrainingRowBuilder:(id)a3 recipe:(id)a4 modelURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  APOdmlEvaluator *v12;
  APOdmlEvaluator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)APOdmlEvaluator;
  v12 = -[APOdmlEvaluator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_builder, a3);
    objc_storeStrong((id *)&v13->_recipe, a4);
    objc_storeStrong((id *)&v13->_modelURL, a5);
    v13->_trainingSetSize = 0;
  }

  return v13;
}

- (id)evaluate:(id *)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  unint64_t v69;
  const char *v70;
  uint64_t v71;
  unint64_t v72;
  NSObject *v73;
  id v74;
  const char *v75;
  void *v76;
  const char *v77;
  void *v78;
  id v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  void *v92;
  id v93;
  const char *v94;
  NSObject *v95;
  void *v96;
  void *i;
  NSObject *v98;
  const char *v99;
  uint64_t *v100;
  NSObject *v101;
  id v102;
  const char *v103;
  uint64_t v104;
  NSObject *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  int v112;
  const char *v113;
  int *v114;
  unint64_t v115;
  int v116;
  id v117;
  id v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  id v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  id v142;
  NSObject *v143;
  const char *v144;
  uint64_t v145;
  id v146;
  const char *v147;
  uint64_t v148;
  unint64_t v149;
  void *v150;
  id v151;
  const char *v152;
  void *v153;
  const char *v154;
  void *v155;
  const char *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  const char *v162;
  NSObject *v163;
  const char *v164;
  void *v165;
  NSObject *v166;
  NSObject *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  void *v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  double v193;
  double v194;
  const char *v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  double v199;
  double v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  NSObject *v205;
  const char *v206;
  const char *v207;
  const char *v208;
  uint64_t v209;
  NSObject *v210;
  const char *v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  double v217;
  int v218;
  void *v219;
  const char *v220;
  APOdmlEvaluator *v221;
  const char *v222;
  NSObject *v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  const char *v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  void *v232;
  NSObject *v234;
  void *v235;
  void *v236;
  uint64_t v237;
  id obj;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  void *v242;
  void *v243;
  uint64_t v244;
  NSObject *v245;
  void *v246;
  void *v247;
  void *v248;
  id v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  id v254;
  id v255;
  id v256;
  id v257;
  void *v258;
  uint8_t v259[128];
  uint8_t buf[4];
  _BYTE v261[10];
  __int16 v262;
  id v263;
  void *v264;
  _QWORD v265[4];

  v265[1] = *MEMORY[0x1E0C80C00];
  OdmlLogForCategory(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v261 = objc_opt_class();
    v6 = *(id *)v261;
    _os_log_impl(&dword_1B69D6000, v5, OS_LOG_TYPE_DEBUG, "[%@] Evaluation begins.", buf, 0xCu);

  }
  v7 = (void *)MEMORY[0x1E0C9E940];
  objc_msgSend_modelURL(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modelFromCompiledURL_isCPUOnly_(v7, v11, (uint64_t)v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recipe(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coreMLRecipe(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_outputNames(v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v19, v23, (uint64_t)v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recipe(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shouldShuffle(v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_BOOLValue(v30, v31, v32);

  if (v33)
  {
    objc_msgSend_configuration(v12, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shuffle(MEMORY[0x1E0C9E9A0], v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v264 = v39;
    v265[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v40, (uint64_t)v265, &v264, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParameters_(v36, v42, (uint64_t)v41);

    objc_msgSend_setConfiguration_(v12, v43, (uint64_t)v36);
  }
  objc_msgSend_inputNames(v18, v34, v35);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_builder(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addRequiredFeatures_(v47, v48, (uint64_t)v44);

  objc_msgSend_builder(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_generateTrainingSet_(v51, v52, (uint64_t)a3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v53 || !objc_msgSend_count(v53, v54, v55))
  {
    OdmlLogForCategory(0xBuLL);
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B69D6000, v98, OS_LOG_TYPE_ERROR, "Failed to find any training rows.", buf, 2u);
    }

    if (!a3 || *a3)
      goto LABEL_27;
    v100 = &kAPODMLDESPluginNoDataToEvaluate;
LABEL_26:
    objc_msgSend__setError_errorCode_(self, v99, (uint64_t)a3, *v100);
LABEL_27:
    v96 = 0;
    goto LABEL_85;
  }
  OdmlLogForCategory(0xBuLL);
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v261 = v53;
    _os_log_impl(&dword_1B69D6000, v56, OS_LOG_TYPE_DEBUG, "Generated the following training rows: %@", buf, 0xCu);
  }

  v59 = objc_msgSend_count(v53, v57, v58);
  objc_msgSend_setTrainingSetSize_(self, v60, v59);
  objc_msgSend_recipe(self, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_batchSize(v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend_unsignedIntegerValue(v66, v67, v68);

  if (!v69)
  {
    OdmlLogForCategory(0xBuLL);
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B69D6000, v101, OS_LOG_TYPE_ERROR, "Batch size should not be zero.", buf, 2u);
    }

    v100 = &kAPODMLDESPluginBatchSizeZero;
    goto LABEL_26;
  }
  v246 = v44;
  v72 = objc_msgSend_trainingSetSize(self, v70, v71);
  if (v72 < v69)
    v69 = v72;
  OdmlLogForCategory(0xBuLL);
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v261 = v69;
    _os_log_impl(&dword_1B69D6000, v73, OS_LOG_TYPE_DEBUG, "Batch size required: %ld", buf, 0xCu);
  }

  v74 = objc_alloc(MEMORY[0x1E0C9E8E0]);
  v248 = v53;
  objc_msgSend_subarrayWithRange_(v53, v75, 0, v69);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend_initWithFeatureProviderArray_(v74, v77, (uint64_t)v76);

  v79 = objc_alloc(MEMORY[0x1E0C9E9B8]);
  objc_msgSend_program(v12, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recipe(self, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_learningRate(v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v88, v89, v90);
  v257 = 0;
  v92 = (void *)objc_msgSend_initWithProgram_learningRate_error_(v79, v91, (uint64_t)v82, &v257);
  v93 = v257;

  if (v93)
  {
    OdmlLogForCategory(0xBuLL);
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v261 = v93;
      _os_log_impl(&dword_1B69D6000, v95, OS_LOG_TYPE_ERROR, "Failed to init trainer. Reason: %@", buf, 0xCu);
    }
    v96 = 0;
    i = v92;
    goto LABEL_84;
  }
  v256 = 0;
  objc_msgSend_evaluateUsingTestData_evaluationMetricNames_error_(v92, v94, (uint64_t)v78, v24, &v256);
  v237 = objc_claimAutoreleasedReturnValue();
  v102 = v256;
  i = v92;
  if (v102)
  {
    v93 = v102;
    OdmlLogForCategory(0xBuLL);
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v261 = v93;
      _os_log_impl(&dword_1B69D6000, v105, OS_LOG_TYPE_ERROR, "Failed to compute pre training results. Reason: %@", buf, 0xCu);
    }
    v96 = 0;
    goto LABEL_32;
  }
  v247 = v92;
  v244 = (uint64_t)v78;
  v235 = v18;
  v236 = v12;
  objc_msgSend_recipe(self, v103, v104);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localIterationsCount(v106, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend_intValue(v109, v110, v111);

  if (v112 < 1)
  {
    v115 = 0;
    v114 = 0;
    v138 = v248;
LABEL_46:
    v254 = 0;
    objc_msgSend_evaluateUsingTestData_evaluationMetricNames_error_(v247, v113, v244, v24, &v254);
    v139 = objc_claimAutoreleasedReturnValue();
    v142 = v254;
    if (v142)
    {
      OdmlLogForCategory(0xBuLL);
      v143 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v261 = v142;
        _os_log_impl(&dword_1B69D6000, v143, OS_LOG_TYPE_ERROR, "Failed to compute post training results. Reason: %@", buf, 0xCu);
      }

    }
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v140, v141);
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v144, v145);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v250 = 0u;
    v251 = 0u;
    v252 = 0u;
    v253 = 0u;
    v146 = v138;
    v240 = objc_msgSend_countByEnumeratingWithState_objects_count_(v146, v147, (uint64_t)&v250, v259, 16);
    v234 = v139;
    if (v240)
    {
      v239 = *(_QWORD *)v251;
      v243 = v24;
      obj = v146;
      while (2)
      {
        v148 = 0;
        v149 = 0x1E0C9E000uLL;
        do
        {
          if (*(_QWORD *)v251 != v239)
            objc_enumerationMutation(obj);
          v150 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * v148);
          v151 = objc_alloc(*(Class *)(v149 + 2272));
          v258 = v150;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v152, (uint64_t)&v258, 1);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = (void *)objc_msgSend_initWithFeatureProviderArray_(v151, v154, (uint64_t)v153);
          v249 = v142;
          objc_msgSend_evaluateUsingTestData_evaluationMetricNames_error_(v247, v156, (uint64_t)v155, v243, &v249);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v249;

          if (v93)
          {
            OdmlLogForCategory(0xBuLL);
            v223 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v261 = v93;
              _os_log_impl(&dword_1B69D6000, v223, OS_LOG_TYPE_ERROR, "Failed to evaluate row. Reason: %@", buf, 0xCu);
            }
            v96 = 0;
            v18 = v235;
            v12 = v236;
            v24 = v243;
            i = v247;
            v95 = v237;
            v232 = v241;
            goto LABEL_82;
          }
          v160 = v157;
          objc_msgSend_evaluationMetrics(v157, v158, v159);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_featuresAtIndex_(v161, v162, 0);
          v163 = objc_claimAutoreleasedReturnValue();

          v245 = v163;
          objc_msgSend_featureValueForName_(v163, v164, (uint64_t)CFSTR("Identity"));
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          OdmlLogForCategory(0xBuLL);
          v166 = objc_claimAutoreleasedReturnValue();
          v167 = v166;
          if (!v165)
          {
            if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B69D6000, v167, OS_LOG_TYPE_ERROR, "Failed to compute clientPttr after training.", buf, 2u);
            }

            v96 = 0;
            v18 = v235;
            v12 = v236;
            v24 = v243;
            i = v247;
            v95 = v237;
            v232 = v241;
            v223 = v245;
            goto LABEL_82;
          }
          if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_multiArrayValue(v165, v168, v169);
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v170, v171, 0);
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v261 = v172;
            _os_log_impl(&dword_1B69D6000, v167, OS_LOG_TYPE_DEBUG, "Client pTTR: %@", buf, 0xCu);

          }
          objc_msgSend_multiArrayValue(v165, v173, v174);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v175, v176, 0);
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v242, v178, (uint64_t)v177);

          objc_msgSend_features(v150, v179, v180);
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v181, v182, (uint64_t)CFSTR("pTTRLogit"));
          v183 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_count(v183, v184, v185))
          {
            objc_msgSend_multiArrayValue(v165, v186, v187);
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v188, v189, 0);
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v190, v191, v192);
            v194 = v193;
            objc_msgSend_objectAtIndexedSubscript_(v183, v195, 0);
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v196, v197, v198);
            v200 = v194 - v199;

            objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v201, v202, v200);
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v241, v204, (uint64_t)v203);

          }
          else
          {
            OdmlLogForCategory(0xBuLL);
            v205 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v205, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B69D6000, v205, OS_LOG_TYPE_ERROR, "server side PTTR does not exist for a trainingRow", buf, 2u);
            }

            objc_msgSend_addObject_(v241, v206, (uint64_t)&unk_1E6A33C60);
          }
          v149 = 0x1E0C9E000;

          v142 = 0;
          ++v148;
        }
        while (v240 != v148);
        v146 = obj;
        v142 = 0;
        v93 = 0;
        v24 = v243;
        v240 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v207, (uint64_t)&v250, v259, 16);
        if (v240)
          continue;
        break;
      }
    }
    else
    {
      v93 = v142;
    }

    objc_msgSend_array(MEMORY[0x1E0C99D20], v208, v209);
    obj = (id)objc_claimAutoreleasedReturnValue();
    OdmlLogForCategory(0xBuLL);
    v210 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v261 = obj;
      _os_log_impl(&dword_1B69D6000, v210, OS_LOG_TYPE_DEBUG, "tapAndImpressionMetrics: %@", buf, 0xCu);
    }

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v211, v212);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v213, v214);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = v247; v115; --v115)
    {
      v218 = *v114++;
      LODWORD(v217) = v218;
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v215, v216, v217);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v157, v220, (uint64_t)v219);

    }
    objc_msgSend_setValue_forKey_(v96, v215, (uint64_t)v157, CFSTR("Deltas"));
    v221 = self;
    v95 = v237;
    objc_msgSend__generateMetricsForBatch_preTraining_postTraining_tapAndImpressions_pttrDeltas_(v221, v222, v244, v237, v234, obj, v241);
    v223 = objc_claimAutoreleasedReturnValue();
    v18 = v235;
    objc_msgSend_weightNames(v235, v224, v225);
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v223, v227, (uint64_t)v226, CFSTR("UpdatedModelIndices"));

    v230 = (void *)objc_msgSend_copy(v223, v228, v229);
    objc_msgSend_setValue_forKey_(v96, v231, (uint64_t)v230, CFSTR("Metrics"));

    v232 = v241;
    v12 = v236;
LABEL_82:

    v105 = v234;
    v78 = (void *)v244;
    goto LABEL_83;
  }
  v114 = 0;
  v115 = 0;
  v116 = 0;
  while (1)
  {
    v255 = 0;
    i = v247;
    v117 = (id)objc_msgSend_trainUsingTrainingData_error_(v247, v113, v244, &v255);
    v118 = v255;
    if (v118)
      break;
    v121 = v24;
    v122 = (void *)objc_msgSend_copyCurrentTrainingDelta(v247, v119, v120);
    objc_msgSend_flattenedModelUpdate(v122, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();

    v128 = (void *)objc_msgSend_copyCurrentTrainingDelta(v247, v126, v127);
    objc_msgSend_flattenedModelUpdate(v128, v129, v130);
    v131 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v134 = objc_msgSend_bytes(v131, v132, v133);

    if (v114)
    {
      v24 = v121;
      if (v115)
      {
        v137 = 0;
        v138 = v248;
        do
        {
          *(float *)&v114[v137] = *(float *)(v134 + 4 * v137) + *(float *)&v114[v137];
          ++v137;
        }
        while (v115 != v137);
        goto LABEL_43;
      }
    }
    else
    {
      v115 = (unint64_t)objc_msgSend_length(v125, v135, v136) >> 2;
      v114 = (int *)v134;
      v24 = v121;
    }
    v138 = v248;
LABEL_43:

    if (++v116 == v112)
      goto LABEL_46;
  }
  v93 = v118;
  OdmlLogForCategory(0xBuLL);
  v105 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v261 = v116;
    *(_WORD *)&v261[4] = 1024;
    *(_DWORD *)&v261[6] = v112;
    v262 = 2112;
    v263 = v93;
    _os_log_impl(&dword_1B69D6000, v105, OS_LOG_TYPE_ERROR, "Failed to train model at epoch %d/%d. Reason: %@", buf, 0x18u);
  }
  v96 = 0;
  v18 = v235;
  v12 = v236;
  v78 = (void *)v244;
LABEL_32:
  v95 = v237;
LABEL_83:

LABEL_84:
  v44 = v246;
  v53 = v248;
LABEL_85:

  return v96;
}

- (id)_generateMetricsForBatch:(id)a3 preTraining:(id)a4 postTraining:(id)a5 tapAndImpressions:(id)a6 pttrDeltas:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;

  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend_dictionary(v11, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_averageLoss(v15, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v19, v23, (uint64_t)v22, CFSTR("PreTrainingLoss"));

  objc_msgSend_averageAccuracy_(v15, v24, (uint64_t)v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setValue_forKey_(v19, v26, (uint64_t)v25, CFSTR("PreTrainingAccuracy"));
  objc_msgSend_averageLoss(v14, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v19, v30, (uint64_t)v29, CFSTR("PostTrainingLoss"));

  objc_msgSend_averageAccuracy_(v14, v31, (uint64_t)v16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setValue_forKey_(v19, v33, (uint64_t)v32, CFSTR("PostTrainingAccuracy"));
  objc_msgSend_setValue_forKey_(v19, v34, (uint64_t)v13, CFSTR("AdditionalMetrics"));

  objc_msgSend_setValue_forKey_(v19, v35, (uint64_t)v12, CFSTR("delta_pTTR"));
  return v19;
}

- (BOOL)_setError:(id *)a3 errorCode:(int64_t)a4
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (unint64_t)trainingSetSize
{
  return self->_trainingSetSize;
}

- (void)setTrainingSetSize:(unint64_t)a3
{
  self->_trainingSetSize = a3;
}

- (APOdmlTrainingSetBuilder)builder
{
  return self->_builder;
}

- (APOdmlRecipe)recipe
{
  return self->_recipe;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
