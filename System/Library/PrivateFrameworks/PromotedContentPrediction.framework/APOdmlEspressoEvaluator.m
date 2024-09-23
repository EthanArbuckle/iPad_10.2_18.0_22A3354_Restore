@implementation APOdmlEspressoEvaluator

- (APOdmlEspressoEvaluator)initWithTrainingRowBuilder:(id)a3 recipe:(id)a4 netURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  APOdmlEspressoEvaluator *v12;
  APOdmlEspressoEvaluator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)APOdmlEspressoEvaluator;
  v12 = -[APOdmlEspressoEvaluator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_builder, a3);
    objc_storeStrong((id *)&v13->_recipe, a4);
    objc_storeStrong((id *)&v13->_netURL, a5);
    v13->_trainingSetSize = 0;
  }

  return v13;
}

- (id)evaluate:(id *)a3
{
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  NSObject *v43;
  const char *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  int v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  OdmlLogForCategory(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v58 = 138412290;
    v59 = (id)objc_opt_class();
    v6 = v59;
    _os_log_impl(&dword_1B69D6000, v5, OS_LOG_TYPE_DEFAULT, "[%@]: Evaluation begins.", (uint8_t *)&v58, 0xCu);

  }
  objc_msgSend_netURL(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__evaluate_error_(self, v10, (uint64_t)v9, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB37E8];
    v18 = objc_msgSend_trainingSetSize(self, v16, v17);
    objc_msgSend_numberWithUnsignedInteger_(v15, v19, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v14, v21, (uint64_t)v20, CFSTR("NumRows"));

    objc_msgSend_recipe(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_batchSize(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v14, v28, (uint64_t)v27, CFSTR("BatchSize"));

    objc_msgSend_recipe(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localIterationsCount(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v14, v35, (uint64_t)v34, CFSTR("LocalIterationsCount"));

    objc_msgSend_recipe(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_learningRate(v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v14, v42, (uint64_t)v41, CFSTR("LearningRate"));

    OdmlLogForCategory(0xBuLL);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v58) = 0;
      _os_log_impl(&dword_1B69D6000, v43, OS_LOG_TYPE_DEFAULT, "Preparing to evaluate with the following inputs", (uint8_t *)&v58, 2u);
    }

    objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v44, (uint64_t)CFSTR("TrainingParameters"), v14, 11);
    objc_msgSend_objectForKey_(v11, v45, (uint64_t)CFSTR("Metrics"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recipe(self, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weightNames(v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v46, v53, (uint64_t)v52, CFSTR("UpdatedModelIndices"));

    v56 = (void *)objc_msgSend_copy(v11, v54, v55);
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

- (id)_evaluate:(id)a3 error:(id *)a4
{
  NSObject *v6;
  NSObject *v7;
  APOdmlEspressoFacade *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  unint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  NSObject *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  void *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  NSObject *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  unint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  const char *v76;
  const char *v77;
  NSObject *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  float v91;
  float v92;
  const char *v93;
  uint64_t v94;
  float v95;
  double v96;
  const char *v97;
  uint64_t v98;
  NSObject *v99;
  NSObject *v100;
  const char *v101;
  NSObject *v102;
  double v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  void *v111;
  const char *v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  const char *v118;
  void *v119;
  const char *v120;
  NSObject *v121;
  const char *v122;
  NSObject *v123;
  const char *v124;
  NSObject *v126;
  const char *v127;
  NSObject *v128;
  const char *v129;
  NSObject *v130;
  const char *v131;
  NSObject *v132;
  const char *v133;
  NSObject *v134;
  NSObject *v135;
  NSObject *v136;
  NSObject *v137;
  uint64_t v138;
  NSObject *v139;
  NSObject *v140;
  uint64_t v141;
  NSObject *obj;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  NSObject *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  uint64_t v153;
  NSObject *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  uint8_t v159[128];
  uint8_t buf[4];
  NSObject *v161;
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  OdmlLogForCategory(0xBuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v161 = v6;
    _os_log_impl(&dword_1B69D6000, v7, OS_LOG_TYPE_DEFAULT, "Evaluation in C begins with netpath: %@", buf, 0xCu);
  }

  v8 = [APOdmlEspressoFacade alloc];
  objc_msgSend_recipe(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_initWithEspressoNetURL_recipe_error_(v8, v12, (uint64_t)v6, v11, a4);

  if (v13)
  {
    objc_msgSend_builder(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requiredFeatures(v13, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addRequiredFeatures_(v16, v20, (uint64_t)v19);

    objc_msgSend_builder(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_generateTrainingSet_(v23, v24, (uint64_t)a4);
    v25 = objc_claimAutoreleasedReturnValue();

    if (v25 && objc_msgSend_count(v25, v26, v27))
    {
      OdmlLogForCategory(0xBuLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v161 = v25;
        _os_log_impl(&dword_1B69D6000, v28, OS_LOG_TYPE_DEFAULT, "Generated the following training rows: %@", buf, 0xCu);
      }

      v31 = objc_msgSend_count(v25, v29, v30);
      objc_msgSend_setTrainingSetSize_(self, v32, v31);
      objc_msgSend_recipe(self, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_batchSize(v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend_unsignedIntegerValue(v38, v39, v40);

      if (v41)
      {
        if (objc_msgSend_trainingSetSize(self, v42, v43) < v41)
          v41 = objc_msgSend_trainingSetSize(self, v44, v45);
        if ((objc_msgSend_changeEspressoBatchSize_error_(v13, v44, v41, a4) & 1) != 0)
        {
          if ((objc_msgSend_finalizeEspressoPipeline_(v13, v46, (uint64_t)a4) & 1) != 0)
          {
            OdmlLogForCategory(0xBuLL);
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B69D6000, v47, OS_LOG_TYPE_DEFAULT, "Weights after initialization:\n", buf, 2u);
            }

            objc_msgSend_retrieveWeights_(v13, v48, (uint64_t)a4);
            v153 = objc_claimAutoreleasedReturnValue();
            if (!v153)
            {
              OdmlLogForCategory(0xBuLL);
              v128 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B69D6000, v128, OS_LOG_TYPE_ERROR, "Failed to find any weights before training.", buf, 2u);
              }

              objc_msgSend__setError_errorCode_(self, v129, (uint64_t)a4, 8029);
              v116 = 0;
              goto LABEL_92;
            }
            objc_msgSend_retrieveWeights2D_(v13, v49, (uint64_t)a4);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v51)
            {
              OdmlLogForCategory(0xBuLL);
              v130 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B69D6000, v130, OS_LOG_TYPE_ERROR, "Failed to retrieve weights by preserving the shape.", buf, 2u);
              }

              objc_msgSend__setError_errorCode_(self, v131, (uint64_t)a4, 8029);
              v116 = 0;
              goto LABEL_91;
            }
            objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v50, (uint64_t)CFSTR("ModelWeightsBeforeTraining"), v51, 11);
            v148 = v51;
            objc_msgSend_computeAccuracyAndLoss_error_(v13, v52, (uint64_t)v25, a4);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            if (v149)
            {
              if ((objc_msgSend_trainWithTrainingSet_error_(v13, v53, (uint64_t)v25, a4) & 1) != 0)
              {
                objc_msgSend_computeAccuracyAndLoss_error_(v13, v54, (uint64_t)v25, a4);
                v141 = objc_claimAutoreleasedReturnValue();
                if (v141)
                {
                  OdmlLogForCategory(0xBuLL);
                  v55 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B69D6000, v55, OS_LOG_TYPE_DEFAULT, "Weights after training:\n", buf, 2u);
                  }

                  objc_msgSend_retrieveWeights_(v13, v56, (uint64_t)a4);
                  v58 = objc_claimAutoreleasedReturnValue();
                  v140 = v58;
                  if (v58)
                  {
                    objc_msgSend_retrieveWeights2D_(v13, v57, (uint64_t)a4);
                    v60 = objc_claimAutoreleasedReturnValue();
                    v139 = v60;
                    if (v60)
                    {
                      objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v59, (uint64_t)CFSTR("ModelWeightsAfterTraining"), v60, 11);
                      objc_msgSend__computeModelDeltas_weightsAfter_error_(self, v61, v153, v58, 0);
                      v138 = objc_claimAutoreleasedReturnValue();
                      v62 = 0x1E0C99000uLL;
                      objc_msgSend_array(MEMORY[0x1E0C99DE8], v63, v64);
                      v145 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_array(MEMORY[0x1E0C99DE8], v65, v66);
                      v146 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_array(MEMORY[0x1E0C99DE8], v67, v68);
                      v147 = objc_claimAutoreleasedReturnValue();
                      v157 = 0u;
                      v158 = 0u;
                      v155 = 0u;
                      v156 = 0u;
                      obj = v25;
                      v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v69, (uint64_t)&v155, v159, 16);
                      if (v72)
                      {
                        v144 = *(_QWORD *)v156;
                        while (2)
                        {
                          v73 = 0;
                          v143 = v72;
                          do
                          {
                            if (*(_QWORD *)v156 != v144)
                              objc_enumerationMutation(obj);
                            v150 = v73;
                            v74 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v73);
                            objc_msgSend_array(*(void **)(v62 + 3560), v70, v71);
                            v75 = (void *)objc_claimAutoreleasedReturnValue();
                            v151 = v75;
                            objc_msgSend_addObject_(v75, v76, (uint64_t)v74);
                            objc_msgSend_computeClientPttr_error_(v13, v77, (uint64_t)v75, a4);
                            v154 = objc_claimAutoreleasedReturnValue();
                            if (!v154)
                            {
                              OdmlLogForCategory(0xBuLL);
                              v136 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_impl(&dword_1B69D6000, v136, OS_LOG_TYPE_ERROR, "Failed to compute clientPttr after training.", buf, 2u);
                              }

                              v116 = 0;
                              v119 = obj;
                              goto LABEL_83;
                            }
                            OdmlLogForCategory(0xBuLL);
                            v78 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138412290;
                              v161 = v154;
                              _os_log_impl(&dword_1B69D6000, v78, OS_LOG_TYPE_DEFAULT, "clientPttr: %@", buf, 0xCu);
                            }

                            objc_msgSend_addObject_(v145, v79, (uint64_t)v154);
                            objc_msgSend_features(v74, v80, v81);
                            v82 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_objectForKeyedSubscript_(v82, v83, (uint64_t)CFSTR("pTTRLogit"));
                            v152 = (void *)objc_claimAutoreleasedReturnValue();

                            if (objc_msgSend_count(v152, v84, v85))
                            {
                              objc_msgSend_objectAtIndexedSubscript_(v152, v86, 0);
                              v87 = (void *)objc_claimAutoreleasedReturnValue();
                              v88 = (void *)MEMORY[0x1E0CB37E8];
                              objc_msgSend_floatValue(v154, v89, v90);
                              v92 = v91;
                              objc_msgSend_floatValue(v87, v93, v94);
                              *(float *)&v96 = v92 - v95;
                              objc_msgSend_numberWithFloat_(v88, v97, v98, v96);
                              v99 = objc_claimAutoreleasedReturnValue();
                              OdmlLogForCategory(0xBuLL);
                              v100 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138412290;
                                v161 = v99;
                                _os_log_impl(&dword_1B69D6000, v100, OS_LOG_TYPE_DEFAULT, "deltaPttr: %@", buf, 0xCu);
                              }

                              objc_msgSend_addObject_(v146, v101, (uint64_t)v99);
                            }
                            else
                            {
                              OdmlLogForCategory(0xBuLL);
                              v102 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_impl(&dword_1B69D6000, v102, OS_LOG_TYPE_ERROR, "server side PTTR does not exist for a trainingRow", buf, 2u);
                              }

                              LODWORD(v103) = 0;
                              objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v104, v105, v103);
                              v87 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_addObject_(v146, v106, (uint64_t)v87);
                            }

                            objc_msgSend_builder(self, v107, v108);
                            v109 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_metricsForTrainingRow_withClientPttr_(v109, v110, (uint64_t)v74, v154);
                            v111 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend_addObject_(v147, v112, (uint64_t)v111);
                            v73 = v150 + 1;
                            v62 = 0x1E0C99000;
                          }
                          while (v143 != v150 + 1);
                          v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v155, v159, 16);
                          if (v72)
                            continue;
                          break;
                        }
                      }

                      OdmlLogForCategory(0xBuLL);
                      v113 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v161 = v147;
                        _os_log_impl(&dword_1B69D6000, v113, OS_LOG_TYPE_DEFAULT, "tapAndImpressionMetrics: %@", buf, 0xCu);
                      }

                      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v114, v115);
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setValue_forKey_(v116, v117, v138, CFSTR("Deltas"));
                      objc_msgSend__generateMetrics_postTrainingMetrics_tapAndImpressionMetrics_deltaPttrMetrics_(self, v118, (uint64_t)v149, v141, v147, v146);
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setValue_forKey_(v116, v120, (uint64_t)v119, CFSTR("Metrics"));
LABEL_83:

                      v137 = v138;
                    }
                    else
                    {
                      OdmlLogForCategory(0xBuLL);
                      v137 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1B69D6000, v137, OS_LOG_TYPE_ERROR, "Failed to retrieve weights after training by preserving the shape.", buf, 2u);
                      }
                      v116 = 0;
                    }

                    v135 = v139;
                  }
                  else
                  {
                    OdmlLogForCategory(0xBuLL);
                    v135 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1B69D6000, v135, OS_LOG_TYPE_ERROR, "Failed to find any weight after training.", buf, 2u);
                    }
                    v116 = 0;
                  }

                  v134 = v140;
                }
                else
                {
                  OdmlLogForCategory(0xBuLL);
                  v134 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B69D6000, v134, OS_LOG_TYPE_ERROR, "Failed to compute accuracy and loss after training.", buf, 2u);
                  }
                  v116 = 0;
                }

                v132 = v141;
                goto LABEL_90;
              }
              OdmlLogForCategory(0xBuLL);
              v132 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v133 = "Failed to train the model";
                goto LABEL_72;
              }
            }
            else
            {
              OdmlLogForCategory(0xBuLL);
              v132 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v133 = "Failed to find preTrainingMetrics.";
LABEL_72:
                _os_log_impl(&dword_1B69D6000, v132, OS_LOG_TYPE_ERROR, v133, buf, 2u);
              }
            }
            v116 = 0;
LABEL_90:

            v51 = v148;
LABEL_91:

LABEL_92:
            v126 = v153;
            goto LABEL_93;
          }
          OdmlLogForCategory(0xBuLL);
          v126 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v127 = "Failed to finalize the Espresso pipeline.";
            goto LABEL_60;
          }
        }
        else
        {
          OdmlLogForCategory(0xBuLL);
          v126 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v127 = "Failed to change input shape.";
LABEL_60:
            _os_log_impl(&dword_1B69D6000, v126, OS_LOG_TYPE_ERROR, v127, buf, 2u);
          }
        }
        v116 = 0;
LABEL_93:

        goto LABEL_55;
      }
      OdmlLogForCategory(0xBuLL);
      v123 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B69D6000, v123, OS_LOG_TYPE_ERROR, "Batch size should not be zero.", buf, 2u);
      }

      objc_msgSend__setError_errorCode_(self, v124, (uint64_t)a4, 8037);
    }
    else
    {
      OdmlLogForCategory(0xBuLL);
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B69D6000, v121, OS_LOG_TYPE_ERROR, "Failed to find any training row.", buf, 2u);
      }

      if (a4 && !*a4)
        objc_msgSend__setError_errorCode_(self, v122, (uint64_t)a4, 8012);
    }
  }
  else
  {
    OdmlLogForCategory(0xBuLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B69D6000, v25, OS_LOG_TYPE_ERROR, "Failed to initialize the Espresso network.", buf, 2u);
    }
  }
  v116 = 0;
LABEL_55:

  return v116;
}

- (id)_computeModelDeltas:(id)a3 weightsAfter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  unint64_t i;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  float v26;
  float v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  float v32;
  float v33;
  double v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;

  v8 = a3;
  v9 = a4;
  v12 = objc_msgSend_count(v8, v10, v11);
  if (v12 != objc_msgSend_count(v9, v13, v14))
    objc_msgSend__setError_errorCode_(self, v15, (uint64_t)a5, 8029);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v15, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_count(v8, v17, v18); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v8, v21, i);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v23, v24, v25);
    v27 = v26;

    objc_msgSend_objectAtIndexedSubscript_(v9, v28, i);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v29, v30, v31);
    v33 = v32;

    *(float *)&v34 = v33 - v27;
    objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v35, v36, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v19, v38, (uint64_t)v37);

  }
  v39 = (void *)objc_msgSend_copy(v19, v21, v22);

  return v39;
}

- (id)_generateMetrics:(id)a3 postTrainingMetrics:(id)a4 tapAndImpressionMetrics:(id)a5 deltaPttrMetrics:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v9, v16, v17) == 2)
  {
    objc_msgSend_objectAtIndexedSubscript_(v9, v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v15, v21, (uint64_t)v20, CFSTR("PreTrainingAccuracy"));

    objc_msgSend_objectAtIndexedSubscript_(v9, v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v15, v24, (uint64_t)v23, CFSTR("PreTrainingLoss"));

  }
  if (objc_msgSend_count(v10, v18, v19) == 2)
  {
    objc_msgSend_objectAtIndexedSubscript_(v10, v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v15, v27, (uint64_t)v26, CFSTR("PostTrainingAccuracy"));

    objc_msgSend_objectAtIndexedSubscript_(v10, v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v15, v30, (uint64_t)v29, CFSTR("PostTrainingLoss"));

  }
  objc_msgSend_setValue_forKey_(v15, v25, (uint64_t)v11, CFSTR("AdditionalMetrics"));
  objc_msgSend_setValue_forKey_(v15, v31, (uint64_t)v12, CFSTR("delta_pTTR"));

  return v15;
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

- (NSURL)netURL
{
  return self->_netURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netURL, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
