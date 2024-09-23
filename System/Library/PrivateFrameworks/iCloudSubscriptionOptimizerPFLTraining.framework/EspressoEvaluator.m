@implementation EspressoEvaluator

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin", "EspressoEvaluator");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

- (id)evaluationMetrics:(id)a3 dataWrapper:(id)a4 outputName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[8];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D863000, v11, OS_LOG_TYPE_INFO, "Started model evaluation", buf, 2u);
  }
  v24[0] = CFSTR("cross_entropy");
  v24[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __62__EspressoEvaluator_evaluationMetrics_dataWrapper_outputName___block_invoke;
  v19[3] = &unk_24F957620;
  v13 = v9;
  v20 = v13;
  v14 = v8;
  v21 = v14;
  v15 = v10;
  v22 = v15;
  objc_msgSend(v7, "runInference:outputNames:batchCallback:", v14, v12, v19);

  v16 = v22;
  v17 = v15;

  return v17;
}

uint64_t __62__EspressoEvaluator_evaluationMetrics_dataWrapper_outputName___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t i;
  void *v8;
  void *v9;
  float *v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  _DWORD *v15;
  double v16;
  void *v17;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (id)sLog;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v19[0] = 67109376;
    v19[1] = a2;
    v20 = 1024;
    v21 = objc_msgSend(v5, "numberOfDataPoints");
    _os_log_impl(&dword_22D863000, v6, OS_LOG_TYPE_INFO, "fit: iter=%d outputs.numberOfDataPoints=%d", (uint8_t *)v19, 0xEu);
  }

  for (i = 0; (int)i < (int)objc_msgSend(v5, "numberOfDataPoints"); i = (i + 1))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataPointAtIndex:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (float *)objc_msgSend(v9, "bufferWithKey:", *(_QWORD *)(a1 + 32));

    v11 = expf(v10[1]);
    *(float *)&v12 = v11 / (float)(v11 + expf(*v10));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v13, CFSTR("probability"));

    objc_msgSend(*(id *)(a1 + 40), "dataPointAtIndex:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (_DWORD *)objc_msgSend(v14, "bufferWithKey:", CFSTR("label"));

    LODWORD(v16) = *v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(float *)v15 > 0.0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v17, CFSTR("label"));

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
  }

  return 0;
}

- (float)averageLossEvaluation:(id)a3 dataWrapper:(id)a4 batchSize:(int)a5
{
  id v7;
  id v8;
  int v9;
  float v10;
  _QWORD v12[6];
  uint64_t v13;
  float *v14;
  uint64_t v15;
  int v16;

  v7 = a3;
  v8 = a4;
  v13 = 0;
  v14 = (float *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = objc_msgSend(v8, "numberOfDataPoints");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__EspressoEvaluator_averageLossEvaluation_dataWrapper_batchSize___block_invoke;
  v12[3] = &unk_24F957648;
  v12[4] = &v13;
  v12[5] = v9 / a5;
  objc_msgSend(v7, "runInference:outputNames:batchCallback:", v8, &unk_24F959838, v12);
  v10 = v14[6];
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __65__EspressoEvaluator_averageLossEvaluation_dataWrapper_batchSize___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "dataPointAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (float)(*(float *)objc_msgSend(v5, "bufferWithKey:", CFSTR("cross_entropy"))/ (float)*(unint64_t *)(a1 + 40))+ *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

  return 0;
}

- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  NSObject *v7;
  float v8;
  float v9;
  void *v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  float v12;
  float v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  int v33;
  id v34;
  _OWORD *v35;
  std::__shared_weak_count *v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  _OWORD *v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  float v49;
  float v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v53;
  int v54;
  int v55;
  void *v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  id v61;
  _OWORD *v62;
  double v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  unint64_t *v71;
  unint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  id v76;
  _OWORD *v77;
  double v78;
  uint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  void *v85;
  unint64_t *v86;
  unint64_t v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  NSObject *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  float v95;
  float v96;
  NSObject *v97;
  double v98;
  void *v99;
  double v100;
  void *v101;
  double v102;
  void *v103;
  uint64_t v104;
  void *v105;
  NSObject *v106;
  void *v108;
  void *v109;
  id v110;
  id v112;
  EvaluationDataSourceEspressoWrapper *v113;
  void *v114;
  id v115;
  id v116;
  id obj;
  uint64_t v118;
  void *v119;
  void *v120;
  _OWORD *v121;
  std::__shared_weak_count *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[5];
  uint64_t v128;
  std::__shared_weak_count *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t *v134;
  _QWORD *v135[2];
  uint64_t *v136;
  _QWORD *v137[2];
  id v138;
  int v139;
  __int128 *p_p;
  _QWORD v141[7];
  _QWORD v142[7];
  __int128 __p;
  char v144;
  _BYTE v145[128];
  uint8_t v146[128];
  _BYTE buf[24];
  uint64_t (*v148)(uint64_t, uint64_t);
  __int128 v149;
  __int16 v150;
  void *v151;
  __int16 v152;
  void *v153;
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v112 = a3;
  v116 = a4;
  v7 = (id)sLog;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v116, "learningRate");
    v9 = v8;
    objc_msgSend(v116, "freezeComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "gradNormType");
    v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "gradNormFactor");
    v13 = v12;
    v14 = objc_msgSend(v116, "batchSize");
    objc_msgSend(v116, "objectiveFunction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "modelOutputName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219522;
    *(double *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v148 = v11;
    LOWORD(v149) = 2048;
    *(double *)((char *)&v149 + 2) = v13;
    WORD5(v149) = 1024;
    HIDWORD(v149) = v14;
    v150 = 2112;
    v151 = v15;
    v152 = 2112;
    v153 = v16;
    _os_log_impl(&dword_22D863000, v7, OS_LOG_TYPE_INFO, "Evaluation using Espresso with learning rate %f, freezing components %@ , gradient normtype %@ , gradient norm factor %f , batch size %d , objective function %@, model output name %@", buf, 0x44u);

  }
  v138 = 0;
  objc_msgSend(MEMORY[0x24BDBFFC8], "compileModelAtURL:error:", v112, &v138);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v17;
  v110 = v138;
  if (v17)
  {
    objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("model.espresso.net"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)sLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D863000, v18, OS_LOG_TYPE_INFO, "Setup espresso network", buf, 2u);
    }

    v19 = objc_alloc(MEMORY[0x24BE2F3B0]);
    objc_msgSend(v108, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithNetwork:", v20);

    objc_msgSend(v116, "layersToTrain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = objc_msgSend(v22, "count") == 0;

    if ((v19 & 1) == 0)
    {
      objc_msgSend(v116, "layersToTrain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "configureLayersToTrain:reinitializeVariables:", v23, 0);

    }
    v24 = (id)sLog;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D863000, v24, OS_LOG_TYPE_INFO, "Create optimizer", buf, 2u);
    }

    v115 = objc_alloc_init(MEMORY[0x24BE2F3C0]);
    objc_msgSend(v115, "setBatch_size:", objc_msgSend(v116, "batchSize"));
    objc_msgSend(v116, "learningRate");
    objc_msgSend(v115, "setLr:");
    objc_msgSend(v116, "learningRateDecay");
    objc_msgSend(v115, "setLr_decay_epoch:");
    v25 = (id)sLog;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D863000, v25, OS_LOG_TYPE_INFO, "Create classifier task", buf, 2u);
    }

    v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2F3C8]), "initWithModelDef:optimizerDef:extractor:needWeightsInitialization:", v21, v115, 0, 0);
    v137[0] = 0;
    v137[1] = 0;
    v135[1] = 0;
    v136 = (uint64_t *)v137;
    v134 = (uint64_t *)v135;
    v135[0] = 0;
    v26 = (id)sLog;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v116, "layersToTrain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v27;
      _os_log_impl(&dword_22D863000, v26, OS_LOG_TYPE_INFO, "Layers to train: %@", buf, 0xCu);

    }
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    objc_msgSend(v116, "layersToTrain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v131;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v131 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
          objc_msgSend(v21, "weightsForLayer:", v32);
          v33 = *(_DWORD *)(__p + 12);
          *(_DWORD *)buf = *(_DWORD *)(__p + 8);
          LODWORD(v121) = v33;
          LODWORD(p_p) = 1;
          v139 = 1;
          std::allocate_shared[abi:ne180100]<Espresso::blob<float,2>,std::allocator<Espresso::blob<float,2>>,int &,int &,int &,int &,void>((int *)buf, (int *)&v121, (int *)&p_p, &v139, &v128);
          memcpy(*(void **)(v128 + 16), *(const void **)(__p + 16), 4 * *(int *)(v128 + 8) * (uint64_t)*(int *)(v128 + 12));
          v34 = objc_retainAutorelease(v32);
          std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v34, "UTF8String"));
          v121 = buf;
          v35 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v136, (const void **)buf, (uint64_t)&std::piecewise_construct, &v121);
          std::shared_ptr<Espresso::blob<float,2>>::operator=[abi:ne180100]((_QWORD *)v35 + 7, &v128);
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);
          v36 = v129;
          if (v129)
          {
            p_shared_owners = (unint64_t *)&v129->__shared_owners_;
            do
              v38 = __ldaxr(p_shared_owners);
            while (__stlxr(v38 - 1, p_shared_owners));
            if (!v38)
            {
              ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
              std::__shared_weak_count::__release_weak(v36);
            }
          }
          v39 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
          if (*((_QWORD *)&__p + 1))
          {
            v40 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
            do
              v41 = __ldaxr(v40);
            while (__stlxr(v41 - 1, v40));
            if (!v41)
            {
              ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
              std::__shared_weak_count::__release_weak(v39);
            }
          }
          objc_msgSend(v21, "biasesForLayer:", v34);
          *(_DWORD *)buf = *(_DWORD *)(__p + 8);
          LODWORD(v121) = 1;
          LODWORD(p_p) = 1;
          v139 = 1;
          std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,int &,int &,int &,void>((int *)buf, (int *)&v121, (int *)&p_p, &v139, &v128);
          memcpy(*(void **)(v128 + 16), *(const void **)(__p + 16), 4 * *(int *)(v128 + 8));
          std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(objc_retainAutorelease(v34), "UTF8String"));
          v121 = buf;
          v42 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v134, (const void **)buf, (uint64_t)&std::piecewise_construct, &v121);
          std::shared_ptr<Espresso::blob<float,2>>::operator=[abi:ne180100]((_QWORD *)v42 + 7, &v128);
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);
          v43 = v129;
          if (v129)
          {
            v44 = (unint64_t *)&v129->__shared_owners_;
            do
              v45 = __ldaxr(v44);
            while (__stlxr(v45 - 1, v44));
            if (!v45)
            {
              ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
              std::__shared_weak_count::__release_weak(v43);
            }
          }
          v46 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
          if (*((_QWORD *)&__p + 1))
          {
            v47 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
            do
              v48 = __ldaxr(v47);
            while (__stlxr(v48 - 1, v47));
            if (!v48)
            {
              ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
              std::__shared_weak_count::__release_weak(v46);
            }
          }
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
      }
      while (v29);
    }

    v113 = -[EvaluationDataSourceEspressoWrapper initWithEvaluatorDataSource:]([EvaluationDataSourceEspressoWrapper alloc], "initWithEvaluatorDataSource:", v116);
    -[EspressoEvaluator averageLossEvaluation:dataWrapper:batchSize:](self, "averageLossEvaluation:dataWrapper:batchSize:", v114, v113, objc_msgSend(v116, "batchSize"));
    v50 = v49;
    v51 = (id)sLog;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v50;
      _os_log_impl(&dword_22D863000, v51, OS_LOG_TYPE_INFO, "loss before training: %f", buf, 0xCu);
    }

    v52 = (id)sLog;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D863000, v52, OS_LOG_TYPE_INFO, "Start training espresso network", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v148 = __Block_byref_object_copy_;
    *(_QWORD *)&v149 = __Block_byref_object_dispose_;
    *((_QWORD *)&v149 + 1) = MEMORY[0x24BDBD1B8];
    v53 = objc_msgSend(v116, "numLocalIterations");
    v127[0] = MEMORY[0x24BDAC760];
    v127[1] = 3221225472;
    v127[2] = __59__EspressoEvaluator_evaluateWithModelURL_dataSource_error___block_invoke;
    v127[3] = &unk_24F957670;
    v127[4] = buf;
    objc_msgSend(v114, "fit:numberOfEpochs:withProgress:", v113, v53, v127);
    v55 = v54;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    objc_msgSend(v116, "layersToTrain");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v56;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v123, v145, 16);
    if (v57)
    {
      v118 = *(_QWORD *)v124;
      do
      {
        for (j = 0; j != v57; ++j)
        {
          if (*(_QWORD *)v124 != v118)
            objc_enumerationMutation(obj);
          v59 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v21, "weightsForLayer:", v59);
          }
          else
          {
            v128 = 0;
            v129 = 0;
          }
          v61 = objc_retainAutorelease(v59);
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v61, "UTF8String"));
          p_p = &__p;
          v62 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v136, (const void **)&__p, (uint64_t)&std::piecewise_construct, &p_p);
          v64 = *((_QWORD *)v62 + 7);
          v65 = (std::__shared_weak_count *)*((_QWORD *)v62 + 8);
          v121 = (_OWORD *)v64;
          v122 = v65;
          if (v65)
          {
            v66 = (unint64_t *)&v65->__shared_owners_;
            do
              v67 = __ldxr(v66);
            while (__stxr(v67 + 1, v66));
          }
          if (v144 < 0)
            operator delete((void *)__p);
          v68 = v128;
          if (*(int *)(v128 + 12) * (uint64_t)*(int *)(v128 + 8))
          {
            v69 = 0;
            do
            {
              *(float *)&v63 = *(float *)(*(_QWORD *)(v68 + 16) + 4 * v69) - *(float *)(*(_QWORD *)(v64 + 16) + 4 * v69);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v63);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "addObject:", v70);

              ++v69;
              v68 = v128;
            }
            while (v69 < *(int *)(v128 + 12) * (uint64_t)*(int *)(v128 + 8));
          }
          if (v65)
          {
            v71 = (unint64_t *)&v65->__shared_owners_;
            do
              v72 = __ldaxr(v71);
            while (__stlxr(v72 - 1, v71));
            if (!v72)
            {
              ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
              std::__shared_weak_count::__release_weak(v65);
            }
          }
          v73 = v129;
          if (!v129)
            goto LABEL_74;
          v74 = (unint64_t *)&v129->__shared_owners_;
          do
            v75 = __ldaxr(v74);
          while (__stlxr(v75 - 1, v74));
          if (!v75)
          {
            ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
            std::__shared_weak_count::__release_weak(v73);
            if (v21)
            {
LABEL_75:
              objc_msgSend(v21, "biasesForLayer:", v61);
              goto LABEL_78;
            }
          }
          else
          {
LABEL_74:
            if (v21)
              goto LABEL_75;
          }
          v128 = 0;
          v129 = 0;
LABEL_78:
          v76 = objc_retainAutorelease(v61);
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v76, "UTF8String"));
          p_p = &__p;
          v77 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v134, (const void **)&__p, (uint64_t)&std::piecewise_construct, &p_p);
          v79 = *((_QWORD *)v77 + 7);
          v80 = (std::__shared_weak_count *)*((_QWORD *)v77 + 8);
          v121 = (_OWORD *)v79;
          v122 = v80;
          if (v80)
          {
            v81 = (unint64_t *)&v80->__shared_owners_;
            do
              v82 = __ldxr(v81);
            while (__stxr(v82 + 1, v81));
          }
          if (v144 < 0)
            operator delete((void *)__p);
          v83 = v128;
          if (*(_DWORD *)(v128 + 8))
          {
            v84 = 0;
            do
            {
              *(float *)&v78 = *(float *)(*(_QWORD *)(v83 + 16) + 4 * v84) - *(float *)(*(_QWORD *)(v79 + 16) + 4 * v84);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v78);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "addObject:", v85);

              ++v84;
              v83 = v128;
            }
            while (v84 < *(int *)(v128 + 8));
          }
          if (v80)
          {
            v86 = (unint64_t *)&v80->__shared_owners_;
            do
              v87 = __ldaxr(v86);
            while (__stlxr(v87 - 1, v86));
            if (!v87)
            {
              ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
              std::__shared_weak_count::__release_weak(v80);
            }
          }
          v88 = v129;
          if (v129)
          {
            v89 = (unint64_t *)&v129->__shared_owners_;
            do
              v90 = __ldaxr(v89);
            while (__stlxr(v90 - 1, v89));
            if (!v90)
            {
              ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
              std::__shared_weak_count::__release_weak(v88);
            }
          }
          objc_msgSend(v119, "addObject:", v60);
          objc_msgSend(v120, "addObject:", v76);

        }
        v56 = obj;
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v145, 16);
      }
      while (v57);
    }

    v91 = (id)sLog;
    if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_22D863000, v91, OS_LOG_TYPE_INFO, "Finished training espresso network", (uint8_t *)&__p, 2u);
    }

    objc_msgSend(v116, "modelOutputName");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[EspressoEvaluator evaluationMetrics:dataWrapper:outputName:](self, "evaluationMetrics:dataWrapper:outputName:", v114, v113, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (id)sLog;
    if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p) = 138412290;
      *(_QWORD *)((char *)&__p + 4) = v93;
      _os_log_impl(&dword_22D863000, v94, OS_LOG_TYPE_INFO, "Print out probs: %@", (uint8_t *)&__p, 0xCu);
    }

    -[EspressoEvaluator averageLossEvaluation:dataWrapper:batchSize:](self, "averageLossEvaluation:dataWrapper:batchSize:", v114, v113, objc_msgSend(v116, "batchSize"));
    v96 = v95;
    v97 = (id)sLog;
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p) = 134217984;
      *(double *)((char *)&__p + 4) = v96;
      _os_log_impl(&dword_22D863000, v97, OS_LOG_TYPE_INFO, "loss after training: %f", (uint8_t *)&__p, 0xCu);
    }

    v141[0] = CFSTR("LossBeforeTraining");
    *(float *)&v98 = v50;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v142[0] = v99;
    v141[1] = CFSTR("LossAfterTraining");
    *(float *)&v100 = v96;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v142[1] = v101;
    v141[2] = CFSTR("TrainingLoss");
    LODWORD(v102) = v55;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v141[3] = CFSTR("UpdatedModelIndices");
    v141[4] = CFSTR("ModelDeltas");
    v142[2] = v103;
    v142[3] = v120;
    v141[5] = CFSTR("TrainingLosses");
    v104 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v142[4] = v119;
    v142[5] = v104;
    v141[6] = CFSTR("OtherEvaluationMetric");
    v142[6] = v93;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v142, v141, 7);
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy((uint64_t)&v134, v135[0]);
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy((uint64_t)&v136, v137[0]);

  }
  else
  {
    v106 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[EspressoEvaluator evaluateWithModelURL:dataSource:error:].cold.1(v106);
    v105 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v110);
  }

  return v105;
}

void __59__EspressoEvaluator_evaluateWithModelURL_dataSource_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_22D863000, v7, OS_LOG_TYPE_INFO, "fit: iter=%d metrics=%@", (uint8_t *)v8, 0x12u);
  }
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);

}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
}

- (void)evaluateWithModelURL:(os_log_t)log dataSource:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D863000, log, OS_LOG_TYPE_ERROR, "Failed to compile espresso model", v1, 2u);
}

@end
