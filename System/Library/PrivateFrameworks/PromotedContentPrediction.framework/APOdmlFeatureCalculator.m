@implementation APOdmlFeatureCalculator

- (APOdmlFeatureCalculator)initWithPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  APOdmlFeatureCalculator *v8;
  uint64_t v9;
  NSDate *creationTime;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  APOdmlAssetManager *assetManager;
  const char *v17;
  uint64_t v18;
  NSURL *assetPath;
  void *v20;
  APOdmlSettings *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSString *version;
  NSObject *v30;
  void *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)APOdmlFeatureCalculator;
  v8 = -[APOdmlFeatureCalculator init](&v37, sel_init);
  if (v8)
  {
    objc_msgSend_now(MEMORY[0x1E0C99D68], v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    creationTime = v8->_creationTime;
    v8->_creationTime = (NSDate *)v9;

    v8->_assetManagerType = a4;
    v8->_placementType = a3;
    objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetManagerForPlacementType_assetManagerType_(v13, v14, a3, a4);
    v15 = objc_claimAutoreleasedReturnValue();
    assetManager = v8->_assetManager;
    v8->_assetManager = (APOdmlAssetManager *)v15;

    objc_msgSend_pathForFactor_isDirectory_(v8->_assetManager, v17, (uint64_t)CFSTR("AppVectors"), 0);
    v18 = objc_claimAutoreleasedReturnValue();
    assetPath = v8->_assetPath;
    v8->_assetPath = (NSURL *)v18;

    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = [APOdmlSettings alloc];
    v23 = (void *)objc_msgSend_initWithPlacementType_assetManagerType_(v21, v22, a3, a4);
    v26 = objc_msgSend_odmlVersion(v23, v24, v25);
    objc_msgSend_stringWithFormat_(v20, v27, (uint64_t)CFSTR("%d"), v26);
    v28 = objc_claimAutoreleasedReturnValue();
    version = v8->_version;
    v8->_version = (NSString *)v28;

  }
  OdmlLogForCategory(3uLL);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (void *)objc_opt_class();
    v32 = v31;
    objc_msgSend_assetPath(v8, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v39 = v31;
    v40 = 2112;
    v41 = v35;
    _os_log_impl(&dword_1B69D6000, v30, OS_LOG_TYPE_DEFAULT, "[%@]: Asset Path: %@", buf, 0x16u);

  }
  return v8;
}

- (APOdmlFeatureCalculator)initWithActivity:(id)a3 placementType:(unint64_t)a4 assetManagerType:(unint64_t)a5
{
  id v8;
  const char *v9;
  APOdmlFeatureCalculator *v10;
  APOdmlXpcLifecycleHandler *v11;
  const char *v12;
  uint64_t v13;
  APOdmlXpcLifecycleHandler *task;
  NSObject *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v10 = (APOdmlFeatureCalculator *)objc_msgSend_initWithPlacementType_assetManagerType_(self, v9, a4, a5);
  if (v10)
  {
    v11 = [APOdmlXpcLifecycleHandler alloc];
    v13 = objc_msgSend_initWithActivity_(v11, v12, (uint64_t)v8);
    task = v10->_task;
    v10->_task = (APOdmlXpcLifecycleHandler *)v13;

  }
  OdmlLogForCategory(3uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_opt_class();
    v17 = v16;
    objc_msgSend_assetPath(v10, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412546;
    v23 = v16;
    v24 = 2112;
    v25 = v20;
    _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_DEFAULT, "[%@]: Asset Path: %@", (uint8_t *)&v22, 0x16u);

  }
  return v10;
}

- (id)createAndSaveVector:(unint64_t)a3
{
  void *v5;
  const char *v6;
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
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *isCounterfactual;
  const char *v34;
  void *v35;
  BOOL v37;

  objc_msgSend_assetManager(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValueForFactor_(v5, v6, (uint64_t)CFSTR("LookbackWindow"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_assetManager(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_longValueForFactor_(v10, v11, (uint64_t)CFSTR("MaxQueryElements"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_assetManager(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValueForFactor_(v15, v16, (uint64_t)CFSTR("ExponentialDecayConstant"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_assetManager(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BOOLeanValueForFactor_(v20, v21, (uint64_t)CFSTR("WeightByDuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_version(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_task(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_assetManagerType(self, v30, v31) == 1;
  isCounterfactual = (void *)objc_msgSend_initWithVersion_lookbackPeriod_maxQueryElements_task_exponentialDecayConstant_weightByDuration_isCounterfactual_(v23, v32, (uint64_t)v26, v7, v12, v29, v17, v22, v37);

  objc_msgSend_createAndSaveVectorWithBuilder_vectorType_(self, v34, (uint64_t)isCounterfactual, a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)createAndSaveVectorWithBuilder:(id)a3 vectorType:(unint64_t)a4
{
  id v6;
  const char *v7;
  void *v8;
  APOdmlAppVectorsFile *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  _BOOL8 v32;
  const char *v33;
  id v34;
  NSObject *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  APOdmlAppVectorsFile *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  unsigned int i;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  int shouldDefer;
  void *v64;
  const char *v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  void *v85;
  const char *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  _BOOL8 v96;
  NSObject *v97;
  void *v98;
  id v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  _BOOL8 v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  NSObject *v114;
  void *v115;
  id v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  _BOOL8 v126;
  const char *v127;
  NSObject *v128;
  void *v129;
  id v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  void *v135;
  const char *v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  _BOOL8 v140;
  const char *v141;
  unint64_t v143;
  uint64_t v144;
  id v145;
  id v146;
  id v147;
  id v148;
  uint8_t buf[4];
  _BYTE v150[18];
  __int16 v151;
  void *v152;
  __int16 v153;
  void *v154;
  __int16 v155;
  void *v156;
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend__vectorKeyForType_(self, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [APOdmlAppVectorsFile alloc];
  objc_msgSend_assetPath(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initForReadingContentsOfURL_version_(v9, v16, (uint64_t)v12, v15);

  if (v17)
  {
    if (objc_msgSend_numberOfVectors(v17, v18, v19))
    {
      v20 = v17;
    }
    else
    {
      OdmlLogForCategory(3uLL);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v150 = objc_opt_class();
        v36 = *(id *)v150;
        _os_log_impl(&dword_1B69D6000, v35, OS_LOG_TYPE_DEFAULT, "[%@]: Default AppVectors empty; attempting to fall back to SRP default file.",
          buf,
          0xCu);

      }
      objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_assetManagerType(self, v40, v41);
      objc_msgSend_assetManagerForPlacementType_assetManagerType_(v39, v43, 0, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pathForFactor_isDirectory_(v44, v45, (uint64_t)CFSTR("AppVectors"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = [APOdmlAppVectorsFile alloc];
      objc_msgSend_version(self, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend_initForReadingContentsOfURL_version_(v46, v50, (uint64_t)v20, v49);

      if (!v51)
      {
        OdmlLogForCategory(3uLL);
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          v115 = (void *)objc_opt_class();
          v116 = v115;
          objc_msgSend_creationTime(self, v117, v118);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v150 = v115;
          *(_WORD *)&v150[8] = 2112;
          *(_QWORD *)&v150[10] = v119;
          _os_log_impl(&dword_1B69D6000, v114, OS_LOG_TYPE_ERROR, "[%@ %@] ERROR: Could not open default app vectors file.", buf, 0x16u);

        }
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v120, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 1001, 0);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E0C99D80], v122, (uint64_t)v8, CFSTR("featureName"));
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = objc_msgSend_assetManagerType(self, v124, v125) == 1;
        objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v127, (uint64_t)v121, v123, v126);
        v34 = v121;

        goto LABEL_38;
      }

      v20 = (void *)v51;
    }
    v147 = v6;
    if (v147)
    {
      v143 = a4;
      v144 = (uint64_t)v8;
      v52 = v20;
      v145 = v6;
      v53 = 0;
      v54 = -1;
      for (i = 1; ; ++i)
      {
        v56 = (void *)MEMORY[0x1BCC9B1A4]();
        objc_msgSend_task(self, v57, v58);
        v59 = objc_claimAutoreleasedReturnValue();
        if (v59)
        {
          v62 = (void *)v59;
          shouldDefer = objc_msgSend_shouldDefer(self->_task, v60, v61);

          if (shouldDefer)
          {
            if (objc_msgSend_deferTask(self->_task, v60, v61))
              break;
          }
        }
        objc_msgSend_nextVector(v20, v60, v61);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v64)
        {
          objc_autoreleasePoolPop(v56);
          v148 = 0;
          objc_msgSend_retrieveVector_(v147, v70, (uint64_t)&v148);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v148;
          OdmlLogForCategory(3uLL);
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            v73 = (void *)objc_opt_class();
            v74 = (void *)MEMORY[0x1E0CB3940];
            v146 = v73;
            v77 = objc_msgSend_assetManagerType(self, v75, v76);
            objc_msgSend_descriptionForAssetManagerType_(v74, v78, v77);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = (void *)MEMORY[0x1E0CB3940];
            v83 = objc_msgSend_placementType(self, v81, v82);
            objc_msgSend_descriptionForPlacementType_(v80, v84, v83);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_descriptionForVectorBuilderType_(MEMORY[0x1E0CB3940], v86, v143);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_arrayOfNumbers(v53, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)v150 = v73;
            *(_WORD *)&v150[8] = 2112;
            *(_QWORD *)&v150[10] = v79;
            v151 = 2112;
            v152 = v85;
            v153 = 2112;
            v154 = v87;
            v155 = 2112;
            v156 = v90;
            _os_log_impl(&dword_1B69D6000, v72, OS_LOG_TYPE_DEFAULT, "[%@] Final %@ %@ %@: %@", buf, 0x34u);

          }
          v8 = (void *)v144;
          objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E0C99D80], v91, v144, CFSTR("featureName"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend_assetManagerType(self, v93, v94) == 1;
          if (v71)
          {
            objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v95, (uint64_t)v71, v92, v96);
          }
          else
          {
            objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v95, 0, v92, v96);
            objc_msgSend_assetManager(self, v110, v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_saveFeatureFromObject_withName_(v112, v113, (uint64_t)v53, v144);
            v71 = (id)objc_claimAutoreleasedReturnValue();

          }
          v6 = v145;
          v20 = v52;
          v34 = v71;

          goto LABEL_37;
        }
        if (!(v54 + 100 * (i / 0x64)))
        {
          OdmlLogForCategory(3uLL);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            v69 = objc_msgSend_adamID(v64, v67, v68);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v150 = i;
            *(_WORD *)&v150[4] = 2048;
            *(_QWORD *)&v150[6] = v69;
            _os_log_impl(&dword_1B69D6000, v66, OS_LOG_TYPE_DEFAULT, "Processing element %d: %llu", buf, 0x12u);
          }

        }
        objc_msgSend_addAppVector_(v147, v65, (uint64_t)v64);
        objc_autoreleasePoolPop(v56);
        --v54;
        v53 = v64;
      }
      OdmlLogForCategory(3uLL);
      v128 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
      {
        v129 = (void *)objc_opt_class();
        v130 = v129;
        objc_msgSend_creationTime(self, v131, v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v150 = v129;
        *(_WORD *)&v150[8] = 2112;
        *(_QWORD *)&v150[10] = v133;
        _os_log_impl(&dword_1B69D6000, v128, OS_LOG_TYPE_DEFAULT, "[%@ %@] We are no longer in an acceptable state to continue processing. Deferring task...", buf, 0x16u);

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v134, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 1003, 0);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E0C99D80], v136, (uint64_t)v8, CFSTR("featureName"));
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend_assetManagerType(self, v138, v139) == 1;
      objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v141, (uint64_t)v135, v137, v140);
      v34 = v135;

      objc_autoreleasePoolPop(v56);
      v6 = v145;
    }
    else
    {
      OdmlLogForCategory(3uLL);
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        v98 = (void *)objc_opt_class();
        v99 = v98;
        objc_msgSend_creationTime(self, v100, v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v150 = v98;
        *(_WORD *)&v150[8] = 2112;
        *(_QWORD *)&v150[10] = v102;
        _os_log_impl(&dword_1B69D6000, v97, OS_LOG_TYPE_ERROR, "[%@ %@] ERROR: Unable to create a vector builder.", buf, 0x16u);

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v103, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 1002, 0);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E0C99D80], v105, (uint64_t)v8, CFSTR("featureName"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend_assetManagerType(self, v106, v107) == 1;
      objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v109, (uint64_t)v104, v53, v108);
      v34 = v104;
    }
LABEL_37:

  }
  else
  {
    OdmlLogForCategory(3uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_opt_class();
      v23 = v22;
      objc_msgSend_creationTime(self, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v150 = v22;
      *(_WORD *)&v150[8] = 2112;
      *(_QWORD *)&v150[10] = v26;
      _os_log_impl(&dword_1B69D6000, v21, OS_LOG_TYPE_ERROR, "[%@ %@] ERROR: Could not open app vectors file.", buf, 0x16u);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v27, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 1001, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E0C99D80], v29, (uint64_t)v8, CFSTR("featureName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_assetManagerType(self, v30, v31) == 1;
    objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v33, (uint64_t)v28, v20, v32);
    v34 = v28;
  }
LABEL_38:

  return v34;
}

- (id)_vectorKeyForType:(unint64_t)a3
{
  id *v3;
  __CFString **v4;

  v3 = (id *)kAPOdmlFeatureTypeInstalledAppVectorKey;
  v4 = kAPOdmlFeatureTypeAppDownloadVectorKey;
  if (a3 != 1)
    v4 = kAPOdmlFeatureTypeAppUsageVectorKey;
  if (a3 != 2)
    v3 = (id *)v4;
  return *v3;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSURL)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
  objc_storeStrong((id *)&self->_assetPath, a3);
}

- (unint64_t)assetManagerType
{
  return self->_assetManagerType;
}

- (unint64_t)placementType
{
  return self->_placementType;
}

- (APOdmlXpcLifecycleHandler)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NSDate)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(id)a3
{
  objc_storeStrong((id *)&self->_creationTime, a3);
}

- (APOdmlAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_creationTime, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
